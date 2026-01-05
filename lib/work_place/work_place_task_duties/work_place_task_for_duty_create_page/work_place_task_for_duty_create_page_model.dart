import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'work_place_task_for_duty_create_page_widget.dart'
    show WorkPlaceTaskForDutyCreatePageWidget;
import 'package:flutter/material.dart';

class WorkPlaceTaskForDutyCreatePageModel
    extends FlutterFlowModel<WorkPlaceTaskForDutyCreatePageWidget> {
  ///  Local state fields for this page.

  List<CompanyTaskDutiesRecord> duties = [];
  void addToDuties(CompanyTaskDutiesRecord item) => duties.add(item);
  void removeFromDuties(CompanyTaskDutiesRecord item) => duties.remove(item);
  void removeAtIndexFromDuties(int index) => duties.removeAt(index);
  void insertAtIndexInDuties(int index, CompanyTaskDutiesRecord item) =>
      duties.insert(index, item);
  void updateDutiesAtIndex(
          int index, Function(CompanyTaskDutiesRecord) updateFn) =>
      duties[index] = updateFn(duties[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in WorkPlaceTaskForDutyCreatePage widget.
  List<CompanyTaskDutiesRecord>? dutiesCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getFormRef] action in Button widget.
  DocumentReference? formRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTaskDutiesRecord? workPlaceTaskDuties;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTaskDutiesRecord? companyTaskDuties;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DutiesForCompanyRecord? dutiesForCompanyForName;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkHistoryRecord? workHistory;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkHistoryRecord? workHistoryForReceiver;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
