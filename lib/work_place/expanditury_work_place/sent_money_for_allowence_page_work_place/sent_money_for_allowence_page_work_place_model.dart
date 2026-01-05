import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sent_money_for_allowence_page_work_place_widget.dart'
    show SentMoneyForAllowencePageWorkPlaceWidget;
import 'package:flutter/material.dart';

class SentMoneyForAllowencePageWorkPlaceModel
    extends FlutterFlowModel<SentMoneyForAllowencePageWorkPlaceWidget> {
  ///  Local state fields for this page.

  bool isUploadPdf = false;

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

  bool isDataUploading_uploadDataHqczx = false;
  FFUploadedFile uploadedLocalFile_uploadDataHqczx =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? copmanyDetailMoney;
  bool isDataUploading_uploadDataRek = false;
  FFUploadedFile uploadedLocalFile_uploadDataRek =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataRek = '';

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SentMoneyForAllowenceWorkPlaceRecord? sent1WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SentMoneyForAllowenceRecord? sent1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SentMoneyForAllowenceWorkPlaceRecord? sent2WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SentMoneyForAllowenceRecord? sent2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerAuthUserMoney;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend3WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMonetForAllowenceWorkPlaceRecord? spend4WorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SpentMoneyForAllowenceRecord? spend4;

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
