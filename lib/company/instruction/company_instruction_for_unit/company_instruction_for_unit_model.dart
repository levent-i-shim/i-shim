import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'company_instruction_for_unit_widget.dart'
    show CompanyInstructionForUnitWidget;
import 'package:flutter/material.dart';

class CompanyInstructionForUnitModel
    extends FlutterFlowModel<CompanyInstructionForUnitWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getUnitDocRef] action in Button widget.
  DocumentReference? unitRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InstructionsRecord? refInstruction;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? companyWorkers;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InstructionsRecord? instruction;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
