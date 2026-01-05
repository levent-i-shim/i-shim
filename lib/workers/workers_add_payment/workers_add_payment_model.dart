import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'workers_add_payment_widget.dart' show WorkersAddPaymentWidget;
import 'package:flutter/material.dart';

class WorkersAddPaymentModel extends FlutterFlowModel<WorkersAddPaymentWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadPDFData = false;
  FFUploadedFile uploadedLocalFile_uploadPDFData =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPDFData = '';

  bool isDataUploading_uploadMediaData = false;
  FFUploadedFile uploadedLocalFile_uploadMediaData =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadMediaData = '';

  // State field(s) for howMuchSalaryAreYouPaying widget.
  FocusNode? howMuchSalaryAreYouPayingFocusNode;
  TextEditingController? howMuchSalaryAreYouPayingTextController;
  String? Function(BuildContext, String?)?
      howMuchSalaryAreYouPayingTextControllerValidator;
  // State field(s) for whichMonth widget.
  String? whichMonthValue;
  FormFieldController<String>? whichMonthValueController;
  // State field(s) for fileType widget.
  String? fileTypeValue;
  FormFieldController<String>? fileTypeValueController;
  bool isDataUploading_uploadPDFPayment = false;
  FFUploadedFile uploadedLocalFile_uploadPDFPayment =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadMediaPayment = false;
  FFUploadedFile uploadedLocalFile_uploadMediaPayment =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    howMuchSalaryAreYouPayingFocusNode?.dispose();
    howMuchSalaryAreYouPayingTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
