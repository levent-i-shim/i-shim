import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_employee_detail_widget.dart' show EditEmployeeDetailWidget;
import 'package:flutter/material.dart';

class EditEmployeeDetailModel
    extends FlutterFlowModel<EditEmployeeDetailWidget> {
  ///  Local state fields for this page.

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

  List<DocumentReference> newDepartmentRefs = [];
  void addToNewDepartmentRefs(DocumentReference item) =>
      newDepartmentRefs.add(item);
  void removeFromNewDepartmentRefs(DocumentReference item) =>
      newDepartmentRefs.remove(item);
  void removeAtIndexFromNewDepartmentRefs(int index) =>
      newDepartmentRefs.removeAt(index);
  void insertAtIndexInNewDepartmentRefs(int index, DocumentReference item) =>
      newDepartmentRefs.insert(index, item);
  void updateNewDepartmentRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newDepartmentRefs[index] = updateFn(newDepartmentRefs[index]);

  List<DocumentReference> newUnitRefs = [];
  void addToNewUnitRefs(DocumentReference item) => newUnitRefs.add(item);
  void removeFromNewUnitRefs(DocumentReference item) =>
      newUnitRefs.remove(item);
  void removeAtIndexFromNewUnitRefs(int index) => newUnitRefs.removeAt(index);
  void insertAtIndexInNewUnitRefs(int index, DocumentReference item) =>
      newUnitRefs.insert(index, item);
  void updateNewUnitRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newUnitRefs[index] = updateFn(newUnitRefs[index]);

  List<DocumentReference> selectedWorkPlaces = [];
  void addToSelectedWorkPlaces(DocumentReference item) =>
      selectedWorkPlaces.add(item);
  void removeFromSelectedWorkPlaces(DocumentReference item) =>
      selectedWorkPlaces.remove(item);
  void removeAtIndexFromSelectedWorkPlaces(int index) =>
      selectedWorkPlaces.removeAt(index);
  void insertAtIndexInSelectedWorkPlaces(int index, DocumentReference item) =>
      selectedWorkPlaces.insert(index, item);
  void updateSelectedWorkPlacesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedWorkPlaces[index] = updateFn(selectedWorkPlaces[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDownDepartment widget.
  String? dropDownDepartmentValue;
  FormFieldController<String>? dropDownDepartmentValueController;
  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue;
  FormFieldController<String>? dropDownUnitValueController;
  // State field(s) for DropDownRole widget.
  String? dropDownRoleValue1;
  FormFieldController<String>? dropDownRoleValueController1;
  // State field(s) for DropDownRole widget.
  List<String>? dropDownRoleValue2;
  FormFieldController<List<String>>? dropDownRoleValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Custom Action - getRoleDocRef] action in Button widget.
  DocumentReference? newRole;
  // Stores action output result for [Custom Action - getUnitDocRef] action in Button widget.
  DocumentReference? newUnit;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in Button widget.
  DocumentReference? newDepartment;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlace;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
