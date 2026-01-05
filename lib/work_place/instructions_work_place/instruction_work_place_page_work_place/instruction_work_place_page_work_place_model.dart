import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'instruction_work_place_page_work_place_widget.dart'
    show InstructionWorkPlacePageWorkPlaceWidget;
import 'package:flutter/material.dart';

class InstructionWorkPlacePageWorkPlaceModel
    extends FlutterFlowModel<InstructionWorkPlacePageWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Talimatı Girin is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<WorkPlaceWorkerRecord>? companyWorkers;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InstructionsRecord? refInstruction;
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
