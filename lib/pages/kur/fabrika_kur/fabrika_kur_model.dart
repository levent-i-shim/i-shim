import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'fabrika_kur_widget.dart' show FabrikaKurWidget;
import 'package:flutter/material.dart';

class FabrikaKurModel extends FlutterFlowModel<FabrikaKurWidget> {
  ///  Local state fields for this page.

  DocumentReference? company;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fabrikanın adı ne olsun ? is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for companies widget.
  String? companiesValue;
  FormFieldController<String>? companiesValueController;
  // State field(s) for ulkeSec widget.
  String? ulkeSecValue;
  FormFieldController<String>? ulkeSecValueController;
  // State field(s) for sehir widget.
  String? sehirValue;
  FormFieldController<String>? sehirValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? selectedCompany;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacesRecord? workPlace;

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
