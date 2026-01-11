import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_new_finance_note_personal_widget.dart'
    show AddNewFinanceNotePersonalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewFinanceNotePersonalModel
    extends FlutterFlowModel<AddNewFinanceNotePersonalWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // State field(s) for fileType widget.
  String? fileTypeValue;
  FormFieldController<String>? fileTypeValueController;
  bool isDataUploading_personalUploadPDF = false;
  FFUploadedFile uploadedLocalFile_personalUploadPDF =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_personalUploadeMedia = false;
  FFUploadedFile uploadedLocalFile_personalUploadeMedia =
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
  bool isDataUploading_uploadPersonalPDFToFirebase = false;
  FFUploadedFile uploadedLocalFile_uploadPersonalPDFToFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPersonalPDFToFirebase = '';

  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialMonitoringNotesRecord? addedNote;
  // Stores action output result for [Validate Form] action in MediaButton widget.
  bool? validate2;
  bool isDataUploading_uploadePersonalMediaToFirebase = false;
  FFUploadedFile uploadedLocalFile_uploadePersonalMediaToFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadePersonalMediaToFirebase = '';

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
