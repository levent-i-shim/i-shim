import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'choose_new_role_widget.dart' show ChooseNewRoleWidget;
import 'package:flutter/material.dart';

class ChooseNewRoleModel extends FlutterFlowModel<ChooseNewRoleWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> newRoleRefs = [];
  void addToNewRoleRefs(DocumentReference item) => newRoleRefs.add(item);
  void removeFromNewRoleRefs(DocumentReference item) =>
      newRoleRefs.remove(item);
  void removeAtIndexFromNewRoleRefs(int index) => newRoleRefs.removeAt(index);
  void insertAtIndexInNewRoleRefs(int index, DocumentReference item) =>
      newRoleRefs.insert(index, item);
  void updateNewRoleRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newRoleRefs[index] = updateFn(newRoleRefs[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Custom Action - getRoleDocRef] action in Button widget.
  DocumentReference? newRole;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workers;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workersCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
