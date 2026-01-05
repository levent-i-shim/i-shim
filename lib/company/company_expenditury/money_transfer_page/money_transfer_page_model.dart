import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'money_transfer_page_widget.dart' show MoneyTransferPageWidget;
import 'package:flutter/material.dart';

class MoneyTransferPageModel extends FlutterFlowModel<MoneyTransferPageWidget> {
  ///  Local state fields for this page.

  bool isUploadPdf = false;

  bool isUploadImage = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Tutar is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  String? _noteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Not is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  bool isDataUploading_uploadData3tgx = false;
  FFUploadedFile uploadedLocalFile_uploadData3tgx =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData3tgx = '';

  bool isDataUploading_uploadDataJeox = false;
  FFUploadedFile uploadedLocalFile_uploadDataJeox =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJeox = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend1WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend2WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend2;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend3WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend3;

  @override
  void initState(BuildContext context) {
    priceTextControllerValidator = _priceTextControllerValidator;
    noteTextControllerValidator = _noteTextControllerValidator;
  }

  @override
  void dispose() {
    priceFocusNode?.dispose();
    priceTextController?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
