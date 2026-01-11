import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/task_options/task_options_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'work_place_task_read_report_page_widget.dart'
    show WorkPlaceTaskReadReportPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
