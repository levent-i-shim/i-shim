import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'worker_invitation_old_widget.dart' show WorkerInvitationOldWidget;
import 'package:flutter/material.dart';

class WorkerInvitationOldModel
    extends FlutterFlowModel<WorkerInvitationOldWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for kullaniciSec widget.
  String? kullaniciSecValue;
  FormFieldController<String>? kullaniciSecValueController;
  // Stores action output result for [Custom Action - getUserDocRef] action in kullaniciSec widget.
  DocumentReference? userRef;
  // State field(s) for sirketSec widget.
  String? sirketSecValue;
  FormFieldController<String>? sirketSecValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in sirketSec widget.
  DocumentReference? companyRef;
  // State field(s) for isyeriSec widget.
  String? isyeriSecValue;
  FormFieldController<String>? isyeriSecValueController;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in isyeriSec widget.
  DocumentReference? workPlaceRef;
  // State field(s) for birimDropDown widget.
  String? birimDropDownValue;
  FormFieldController<String>? birimDropDownValueController;
  // Stores action output result for [Custom Action - getUnitDocRef] action in birimDropDown widget.
  DocumentReference? unitRef;
  // State field(s) for departmanDropDown widget.
  String? departmanDropDownValue;
  FormFieldController<String>? departmanDropDownValueController;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in departmanDropDown widget.
  DocumentReference? departmentRef;
  // State field(s) for rolDropDown widget.
  String? rolDropDownValue;
  FormFieldController<String>? rolDropDownValueController;
  // Stores action output result for [Custom Action - getRoleDocRef] action in rolDropDown widget.
  DocumentReference? roleREf;
  // State field(s) for gorevSec widget.
  String? gorevSecValue1;
  FormFieldController<String>? gorevSecValueController1;
  // State field(s) for gorevSec widget.
  String? gorevSecValue2;
  FormFieldController<String>? gorevSecValueController2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Custom Action - isEqualRef] action in Button widget.
  bool? isEqual;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvitationsRecord? docRef2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvitationsRecord? docRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
