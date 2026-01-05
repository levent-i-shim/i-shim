import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'work_place_task_read_report_page_widget.dart'
    show WorkPlaceTaskReadReportPageWidget;
import 'package:flutter/material.dart';

class WorkPlaceTaskReadReportPageModel
    extends FlutterFlowModel<WorkPlaceTaskReadReportPageWidget> {
  ///  Local state fields for this page.

  bool isOwner = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUserDocRef] action in workPlaceTaskReadReportPage widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Read Document] action in workPlaceTaskReadReportPage widget.
  UsersRecord? userDetail;
  // Stores action output result for [Backend Call - Read Document] action in workPlaceTaskReadReportPage widget.
  CompaniesRecord? companyDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
