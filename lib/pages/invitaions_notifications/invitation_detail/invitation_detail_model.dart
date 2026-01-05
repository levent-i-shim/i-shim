import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invitation_detail_widget.dart' show InvitationDetailWidget;
import 'package:flutter/material.dart';

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
