import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_new_finance_note_family_widget.dart'
    show AddNewFinanceNoteFamilyWidget;
import 'package:flutter/material.dart';

class AddNewFinanceNoteFamilyModel
    extends FlutterFlowModel<AddNewFinanceNoteFamilyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // State field(s) for fileType widget.
  String? fileTypeValue;
  FormFieldController<String>? fileTypeValueController;
  bool isDataUploading_familyUploadPDF = false;
  FFUploadedFile uploadedLocalFile_familyUploadPDF =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_familyUploadeMedia = false;
  FFUploadedFile uploadedLocalFile_familyUploadeMedia =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // State field(s) for DropDown widget.
  IncomeOrExpense? dropDownValue;
  FormFieldController<IncomeOrExpense>? dropDownValueController;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // State field(s) for DoesHaveBill widget.
  bool? doesHaveBillValue;
  FormFieldController<bool>? doesHaveBillValueController;
  // Stores action output result for [Validate Form] action in PDFButton widget.
  bool? validate;
  bool isDataUploading_uploadFamilyPDFToFirebase = false;
  FFUploadedFile uploadedLocalFile_uploadFamilyPDFToFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadFamilyPDFToFirebase = '';

  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialMonitoringNotesRecord? addedNote;
  // Stores action output result for [Validate Form] action in MediaButton widget.
  bool? validate2;
  bool isDataUploading_uploadeCompanyMediaToFirebase = false;
  FFUploadedFile uploadedLocalFile_uploadeCompanyMediaToFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadeCompanyMediaToFirebase = '';

  // Stores action output result for [Backend Call - Create Document] action in MediaButton widget.
  FinancialMonitoringNotesRecord? addedNote1;
  // Stores action output result for [Validate Form] action in NoEvidenceButton widget.
  bool? validate3;
  // Stores action output result for [Backend Call - Create Document] action in NoEvidenceButton widget.
  FinancialMonitoringNotesRecord? addedNote3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
