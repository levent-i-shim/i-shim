import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'invitation_detail_widget.dart' show InvitationDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitationDetailModel extends FlutterFlowModel<InvitationDetailWidget> {
  ///  Local state fields for this page.

  String unitNameVariable = 'Birim Adı ';

  String departmentNameVariable = 'Departman Adı';

  String rolNameVariable = 'Rol';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDepartmentName] action in InvitationDetail widget.
  String? departmentName;
  // Stores action output result for [Custom Action - getUnitName] action in InvitationDetail widget.
  String? unitName;
  // Stores action output result for [Custom Action - getRoleName] action in InvitationDetail widget.
  String? roleName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyWorkersRecord? copmanyWorkerRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
