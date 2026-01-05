import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spend_money_work_place_page_widget.dart'
    show SpendMoneyWorkPlacePageWidget;
import 'package:flutter/material.dart';

class SpendMoneyWorkPlacePageModel
    extends FlutterFlowModel<SpendMoneyWorkPlacePageWidget> {
  ///  Local state fields for this page.

  bool isUploadPdf = false;

  bool isUploadImage = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

  bool isDataUploading_uploadData3tgzy = false;
  FFUploadedFile uploadedLocalFile_uploadData3tgzy =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData3tgzy = '';

  bool isDataUploading_uploadDataJeozy = false;
  FFUploadedFile uploadedLocalFile_uploadDataJeozy =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJeozy = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend4WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend4;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend5WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend5;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend6WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend6;

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
