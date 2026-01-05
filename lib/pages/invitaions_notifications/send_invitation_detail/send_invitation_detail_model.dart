import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'send_invitation_detail_widget.dart' show SendInvitationDetailWidget;
import 'package:flutter/material.dart';

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
