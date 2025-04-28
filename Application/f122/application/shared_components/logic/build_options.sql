prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 122
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.4'
,p_default_workspace_id=>100000
,p_default_application_id=>122
,p_default_id_offset=>62303545685654718
,p_default_owner=>'HLG'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(124213771296215790)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>527265789
);
wwv_flow_imp.component_end;
end;
/
