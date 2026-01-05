import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_worker_company_page_widget.dart'
    show CompanyWorkerCompanyPageWidget;
import 'package:flutter/material.dart';

class CompanyWorkerCompanyPageModel
    extends FlutterFlowModel<CompanyWorkerCompanyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CompanyWorkerCompanyPage widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompanyDepartmentsRecord? department;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompanyDepartmentsRecord? departmentAuth;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
