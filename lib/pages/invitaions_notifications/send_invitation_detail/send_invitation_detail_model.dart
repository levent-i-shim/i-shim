import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'send_invitation_detail_widget.dart' show SendInvitationDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendInvitationDetailModel
    extends FlutterFlowModel<SendInvitationDetailWidget> {
  ///  Local state fields for this page.

  String unitNameVariable = 'Birim Adı';

  String departmentNameVariable = 'Departman Adı';

  String roleNameVariable = 'Rol';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDepartmentName] action in SendInvitationDetail widget.
  String? departmentName;
  // Stores action output result for [Custom Action - getUnitName] action in SendInvitationDetail widget.
  String? unitName;
  // Stores action output result for [Custom Action - getRoleName] action in SendInvitationDetail widget.
  String? roleName;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? notifi2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
