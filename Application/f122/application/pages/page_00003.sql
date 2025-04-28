prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.4'
,p_default_workspace_id=>100000
,p_default_application_id=>122
,p_default_id_offset=>62303545685654718
,p_default_owner=>'HLG'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>unistr('Backup de Aplica\00E7\00F5es')
,p_alias=>unistr('BACKUP-DE-APLICA\00C7\00D5ES')
,p_step_title=>unistr('Backup de Aplica\00E7\00F5es')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(244988958717344085)
,p_name=>'Download'
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,app_user,',
'       FILE_NAME,',
'       sys.dbms_lob.getlength("FILE_BLOB")FILE_BLOB,',
'       MIME_TYPE,',
'       CREATED_AT',
'  from TEMP_ZIP_EXPORT',
'where app_user=:APP_USER'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124408017823229892)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(60305005648599503)
,p_query_column_id=>2
,p_column_alias=>'APP_USER'
,p_column_display_sequence=>20
,p_column_heading=>'App User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124408717772229894)
,p_query_column_id=>3
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Arquivo'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124409140440229895)
,p_query_column_id=>4
,p_column_alias=>'FILE_BLOB'
,p_column_display_sequence=>40
,p_column_heading=>'Download'
,p_column_format=>'DOWNLOAD:TEMP_ZIP_EXPORT:FILE_BLOB:ID::MIME_TYPE:FILE_NAME:::attachment::'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124409470711229895)
,p_query_column_id=>5
,p_column_alias=>'MIME_TYPE'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124409935231229895)
,p_query_column_id=>6
,p_column_alias=>'CREATED_AT'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124407276667229884)
,p_button_sequence=>40
,p_button_name=>'GerarZIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Gerar ZIP'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(244991262207344113)
,p_name=>'P3_APPLICATION'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Aplica\00E7\00E3o')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select application_id||'' - ''||application_name display , application_id value from apex_applications where IS_WORKING_COPY=''No'' and  WORKSPACE_ID=v(''WORKSPACE_ID'') order by application_id'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Selecione'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124410785530229918)
,p_name=>'ClickGerar'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(124407276667229884)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124411324244229919)
,p_event_id=>wwv_flow_imp.id(124410785530229918)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  prc_exporta_versao_apex(',
'    p_workspace_id   => v(''WORKSPACE_ID''),',
'    p_application_id => :P3_APPLICATION,',
'    p_app_user       => :APP_USER',
'  );',
'end;',
'commit; '))
,p_attribute_02=>'P3_APPLICATION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124411812891229920)
,p_event_id=>wwv_flow_imp.id(124410785530229918)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(244988958717344085)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124412182343229920)
,p_name=>'PGLoad'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124412676948229921)
,p_event_id=>wwv_flow_imp.id(124412182343229920)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'execute immediate ''delete from TEMP_ZIP_EXPORT where APP_USER = '''''' || :APP_USER || '''''''';',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124413227675229922)
,p_event_id=>wwv_flow_imp.id(124412182343229920)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(244988958717344085)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
