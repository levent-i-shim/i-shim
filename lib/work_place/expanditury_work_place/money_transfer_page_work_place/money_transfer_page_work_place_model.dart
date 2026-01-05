import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'money_transfer_page_work_place_widget.dart'
    show MoneyTransferPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class MoneyTransferPageWorkPlaceModel
    extends FlutterFlowModel<MoneyTransferPageWorkPlaceWidget> {
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

  bool isDataUploading_uploadData3tg = false;
  FFUploadedFile uploadedLocalFile_uploadData3tg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData3tg = '';

  bool isDataUploading_uploadDataJeo = false;
  FFUploadedFile uploadedLocalFile_uploadDataJeo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJeo = '';

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
