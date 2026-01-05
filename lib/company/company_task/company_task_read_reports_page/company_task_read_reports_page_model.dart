import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'company_task_read_reports_page_widget.dart'
    show CompanyTaskReadReportsPageWidget;
import 'package:flutter/material.dart';

class CompanyTaskReadReportsPageModel
    extends FlutterFlowModel<CompanyTaskReadReportsPageWidget> {
  ///  Local state fields for this page.

  bool isOwner = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUserDocRef] action in CompanyTaskReadReportsPage widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Read Document] action in CompanyTaskReadReportsPage widget.
  UsersRecord? user;
  // Stores action output result for [Backend Call - Read Document] action in CompanyTaskReadReportsPage widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetailForOwner;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
