import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_task_step6_for_task_duties_widget.dart'
    show CreateTaskStep6ForTaskDutiesWidget;
import 'package:flutter/material.dart';

class CreateTaskStep6ForTaskDutiesModel
    extends FlutterFlowModel<CreateTaskStep6ForTaskDutiesWidget> {
  ///  Local state fields for this page.

  List<CompanyTaskDutiesRecord> companyTaskDutiesPageState = [];
  void addToCompanyTaskDutiesPageState(CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.add(item);
  void removeFromCompanyTaskDutiesPageState(CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.remove(item);
  void removeAtIndexFromCompanyTaskDutiesPageState(int index) =>
      companyTaskDutiesPageState.removeAt(index);
  void insertAtIndexInCompanyTaskDutiesPageState(
          int index, CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.insert(index, item);
  void updateCompanyTaskDutiesPageStateAtIndex(
          int index, Function(CompanyTaskDutiesRecord) updateFn) =>
      companyTaskDutiesPageState[index] =
          updateFn(companyTaskDutiesPageState[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CreateTaskStep6ForTaskDuties widget.
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
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DutiesForCompanyRecord? dutiesForCompanyForName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTaskDutiesRecord? workPlaceTaskDuties;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTaskDutiesRecord? companyTaskDuties;
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
