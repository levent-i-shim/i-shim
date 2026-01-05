import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_employee_detail_page_work_place_widget.dart'
    show EditEmployeeDetailPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class EditEmployeeDetailPageWorkPlaceModel
    extends FlutterFlowModel<EditEmployeeDetailPageWorkPlaceWidget> {
  ///  Local state fields for this page.

  List<CompanyUnitsRecord> companyUnits = [];
  void addToCompanyUnits(CompanyUnitsRecord item) => companyUnits.add(item);
  void removeFromCompanyUnits(CompanyUnitsRecord item) =>
      companyUnits.remove(item);
  void removeAtIndexFromCompanyUnits(int index) => companyUnits.removeAt(index);
  void insertAtIndexInCompanyUnits(int index, CompanyUnitsRecord item) =>
      companyUnits.insert(index, item);
  void updateCompanyUnitsAtIndex(
          int index, Function(CompanyUnitsRecord) updateFn) =>
      companyUnits[index] = updateFn(companyUnits[index]);

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

  List<DocumentReference> newDepRefs = [];
  void addToNewDepRefs(DocumentReference item) => newDepRefs.add(item);
  void removeFromNewDepRefs(DocumentReference item) => newDepRefs.remove(item);
  void removeAtIndexFromNewDepRefs(int index) => newDepRefs.removeAt(index);
  void insertAtIndexInNewDepRefs(int index, DocumentReference item) =>
      newDepRefs.insert(index, item);
  void updateNewDepRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newDepRefs[index] = updateFn(newDepRefs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in EditEmployeeDetailPageWorkPlace widget.
  List<CompanyUnitsRecord>? units;
  // State field(s) for DropDownDepartment widget.
  String? dropDownDepartmentValue;
  FormFieldController<String>? dropDownDepartmentValueController;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in DropDownDepartment widget.
  DocumentReference? dep;
  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue;
  FormFieldController<String>? dropDownUnitValueController;
  // State field(s) for DropDownRole widget.
  String? dropDownRoleValue;
  FormFieldController<String>? dropDownRoleValueController;
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
