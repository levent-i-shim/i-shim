import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'limited_sirket_kur_widget.dart' show LimitedSirketKurWidget;
import 'package:flutter/material.dart';

class LimitedSirketKurModel extends FlutterFlowModel<LimitedSirketKurWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Şirket Adı is required';
    }

    if (val.length < 3) {
      return 'Lütfen Geçerli Bir şirket ismi Giriniz';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesRecord? company;
  // Stores action output result for [Custom Action - getTwoWords] action in Button widget.
  String? officeName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacesRecord? headOffice;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceWorkerRecord? workPlaceWorker;

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
