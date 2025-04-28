create or replace PROCEDURE prc_exporta_versao_apex (
    p_workspace_id   IN NUMBER,
    p_application_id IN NUMBER,
    p_app_user       IN VARCHAR2
)
IS
    l_app_files    apex_t_export_files;
    l_ws_files     apex_t_export_files;
    l_stat_files   apex_t_export_files;
    l_extra_files  apex_t_export_files;
    l_all_files    apex_t_export_files;

    v_workspace_name VARCHAR2(1000);
    v_data           VARCHAR2(8) := TO_CHAR(SYSDATE, 'YYYYMMDD');
    v_blob           BLOB;
    v_nome           VARCHAR2(255);
BEGIN
    -- Obtem nome do workspace
    SELECT REPLACE(UPPER(workspace), ' ', '_')
      INTO v_workspace_name
      FROM apex_workspaces
     WHERE workspace_id = p_workspace_id;

    -- Exporta aplicação
    -- https://docs.oracle.com/en/database/oracle/application-express/21.2/aeapi/GET_APPLICATION_Function.html#GUID-A8E626D6-D7DE-4E59-8F90-3666A7A41A87
    l_app_files := apex_export.get_application(
  p_application_id          => p_application_id,
  p_split                   => true,
  p_with_ir_public_reports  => true,
  p_with_ir_private_reports => true,
  p_with_ir_notifications   => true,
  p_with_supporting_objects => 'I'
  -- p_with_original_ids       IN BOOLEAN             DEFAULT FALSE,
);

    FOR i IN 1 .. l_app_files.COUNT LOOP
        l_app_files(i).name := 'applications/' || v_workspace_name || '/app_' || p_application_id || '/' || l_app_files(i).name;
    END LOOP;

    -- Exporta workspace
    -- https://docs.oracle.com/en/database/oracle/application-express/21.2/aeapi/GET_WORKSPACE_Function.html
    l_ws_files := apex_export.get_workspace(p_workspace_id => p_workspace_id);
    FOR i IN 1 .. l_ws_files.COUNT LOOP
        l_ws_files(i).name := 'workspaces/' || v_workspace_name || '/' || l_ws_files(i).name;
    END LOOP;

    -- Exporta arquivos estáticos do workspace
    -- https://docs.oracle.com/en/database/oracle/application-express/21.2/aeapi/GET_WORKSPACE.html
    l_stat_files := apex_export.get_workspace_files(p_workspace_id => p_workspace_id);
    FOR i IN 1 .. l_stat_files.COUNT LOOP
        l_stat_files(i).name := 'files/' || v_workspace_name || '/' || l_stat_files(i).name;
    END LOOP;

    -- Arquivo extra com info da versão
    l_extra_files := apex_t_export_files(
        apex_t_export_file(
            name => 'VERSAO_' || v_data || '.txt',
            contents => 'Exportação realizada em ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') ||
                       ' por ' || p_app_user || ' para aplicação ' || p_application_id
        )
    );

    -- Junta todos os arquivos
    l_all_files := l_app_files MULTISET UNION ALL l_ws_files MULTISET UNION ALL l_stat_files;

    -- Gera o zip
    v_blob := apex_export.zip(
        p_source_files => l_all_files,
        p_extra_files  => l_extra_files
    );

    -- Define nome do zip final
    v_nome := v_workspace_name || '_APP_' || p_application_id || '_' || v_data || '_' || p_app_user || '.zip';

    -- Grava na Tabela
    INSERT INTO TEMP_ZIP_EXPORT (
        app_user, file_name, file_blob, mime_type, created_at
    ) VALUES (
        v('APP_USER'), v_nome, v_blob, 'application/zip', SYSDATE
    );


END prc_exporta_versao_apex;