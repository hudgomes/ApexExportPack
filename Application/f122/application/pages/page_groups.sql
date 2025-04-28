prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 122
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.4'
,p_default_workspace_id=>100000
,p_default_application_id=>122
,p_default_id_offset=>62303545685654718
,p_default_owner=>'HLG'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(124220009956215849)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
