import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_new_finance_note_company_widget.dart'
    show AddNewFinanceNoteCompanyWidget;
import 'package:flutter/material.dart';

class AddNewFinanceNoteCompanyModel
    extends FlutterFlowModel<AddNewFinanceNoteCompanyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Validate Form] action in PDFButton widget.
  bool? validate;
  bool isDataUploading_uploadCompanyPDFToFirebaseCheck = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyPDFToFirebaseCheck =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyPDFToFirebaseCheck = '';

  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyRefFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceRefFromDropDownIdx;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyNameFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceNameFromDropDownId;
  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialMonitoringNotesRecord? addedNote;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyRefFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceRefFromDropDownId9;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyNameFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceNameFromDropDownId9;
  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialMonitoringNotesRecord? addedNote9;
  // Stores action output result for [Validate Form] action in MediaButton widget.
  bool? validate8;
  bool isDataUploading_uploadCompanyMediaToFirebase8Check = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyMediaToFirebase8Check =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyMediaToFirebase8Check = '';

  // Stores action output result for [Custom Action - getCompanyDocRef] action in MediaButton widget.
  DocumentReference? companyRefFromDropDownId2;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in MediaButton widget.
  DocumentReference? workPlaceRefFromDropDownId2;
  // Stores action output result for [Custom Action - getCompanyName] action in MediaButton widget.
  String? companyNameFromDropDownId2;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in MediaButton widget.
  String? workPlaceNameFromDropDownId2;
  // Stores action output result for [Backend Call - Create Document] action in MediaButton widget.
  FinancialMonitoringNotesRecord? addedNote2;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in MediaButton widget.
  DocumentReference? companyRefFromDropDownId8;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in MediaButton widget.
  DocumentReference? workPlaceRefFromDropDownId8;
  // Stores action output result for [Custom Action - getCompanyName] action in MediaButton widget.
  String? companyNameFromDropDownId8;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in MediaButton widget.
  String? workPlaceNameFromDropDownId8;
  // Stores action output result for [Backend Call - Create Document] action in MediaButton widget.
  FinancialMonitoringNotesRecord? addedNote8;
  // Stores action output result for [Validate Form] action in NoEvidenceButton widget.
  bool? validate5;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in NoEvidenceButton widget.
  DocumentReference? companyRefFromDropDownId3;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in NoEvidenceButton widget.
  DocumentReference? workPlaceRefFromDropDownId3;
  // Stores action output result for [Custom Action - getCompanyName] action in NoEvidenceButton widget.
  String? companyNameFromDropDownId3;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in NoEvidenceButton widget.
  String? workPlaceNameFromDropDownId3;
  // Stores action output result for [Backend Call - Create Document] action in NoEvidenceButton widget.
  FinancialMonitoringNotesRecord? addedNote5;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in NoEvidenceButton widget.
  DocumentReference? companyRefFromDropDownId7;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in NoEvidenceButton widget.
  DocumentReference? workPlaceRefFromDropDownId7;
  // Stores action output result for [Custom Action - getCompanyName] action in NoEvidenceButton widget.
  String? companyNameFromDropDownId7;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in NoEvidenceButton widget.
  String? workPlaceNameFromDropDownId7;
  // State field(s) for ownerOrWorker widget.
  String? ownerOrWorkerValue;
  FormFieldController<String>? ownerOrWorkerValueController;
  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in companiesDropDown widget.
  DocumentReference? ownerCompaniesFDD;
  // State field(s) for workPlacesDropDown widget.
  String? workPlacesDropDownValue;
  FormFieldController<String>? workPlacesDropDownValueController;
  // State field(s) for authorizingCompaniesDropDown widget.
  String? authorizingCompaniesDropDownValue;
  FormFieldController<String>? authorizingCompaniesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in authorizingCompaniesDropDown widget.
  DocumentReference? authorizingCompanyFDD;
  // State field(s) for authorizingWorkPlaceDropDown widget.
  String? authorizingWorkPlaceDropDownValue;
  FormFieldController<String>? authorizingWorkPlaceDropDownValueController;
  // State field(s) for fileType widget.
  String? fileTypeValue;
  FormFieldController<String>? fileTypeValueController;
  bool isDataUploading_companyUploadPDFCheck = false;
  FFUploadedFile uploadedLocalFile_companyUploadPDFCheck =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadMediaPaymentForCompany = false;
  FFUploadedFile uploadedLocalFile_uploadMediaPaymentForCompany =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for paymentOrCollectionValue widget.
  FocusNode? paymentOrCollectionValueFocusNode;
  TextEditingController? paymentOrCollectionValueTextController;
  String? Function(BuildContext, String?)?
      paymentOrCollectionValueTextControllerValidator;
  // State field(s) for incomeOrExpenseDropDown widget.
  String? incomeOrExpenseDropDownValue;
  FormFieldController<String>? incomeOrExpenseDropDownValueController;
  // State field(s) for expenseType widget.
  String? expenseTypeValue;
  FormFieldController<String>? expenseTypeValueController;
  // State field(s) for whichTypeCurrent widget.
  String? whichTypeCurrentValue;
  FormFieldController<String>? whichTypeCurrentValueController;
  // State field(s) for whichCurrentPersonForOwner widget.
  String? whichCurrentPersonForOwnerValue;
  FormFieldController<String>? whichCurrentPersonForOwnerValueController;
  // State field(s) for whichCurrentPersonForWorker widget.
  String? whichCurrentPersonForWorkerValue;
  FormFieldController<String>? whichCurrentPersonForWorkerValueController;
  // State field(s) for whichCurrentCompanyForOwner widget.
  String? whichCurrentCompanyForOwnerValue;
  FormFieldController<String>? whichCurrentCompanyForOwnerValueController;
  // State field(s) for whichCurrentCompanyForWorker widget.
  String? whichCurrentCompanyForWorkerValue;
  FormFieldController<String>? whichCurrentCompanyForWorkerValueController;
  // State field(s) for whichAccount widget.
  String? whichAccountValue;
  FormFieldController<String>? whichAccountValueController;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // State field(s) for DoesHaveBill widget.
  bool? doesHaveBillValue;
  FormFieldController<bool>? doesHaveBillValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paymentOrCollectionValueFocusNode?.dispose();
    paymentOrCollectionValueTextController?.dispose();

    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
