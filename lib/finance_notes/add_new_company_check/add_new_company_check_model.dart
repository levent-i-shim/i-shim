import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_new_company_check_widget.dart' show AddNewCompanyCheckWidget;
import 'package:flutter/material.dart';

class AddNewCompanyCheckModel
    extends FlutterFlowModel<AddNewCompanyCheckWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  bool isDataUploading_companyUploadPDFx = false;
  FFUploadedFile uploadedLocalFile_companyUploadPDFx =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_familyUploadMediax = false;
  FFUploadedFile uploadedLocalFile_familyUploadMediax =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for paymentOrCollectionValue widget.
  FocusNode? paymentOrCollectionValueFocusNode;
  TextEditingController? paymentOrCollectionValueTextController;
  String? Function(BuildContext, String?)?
      paymentOrCollectionValueTextControllerValidator;
  // State field(s) for incomeOrExpenseDropDown widget.
  String? incomeOrExpenseDropDownValue;
  FormFieldController<String>? incomeOrExpenseDropDownValueController;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DoesHaveBill widget.
  bool? doesHaveBillValue;
  FormFieldController<bool>? doesHaveBillValueController;
  // Stores action output result for [Validate Form] action in PDFButton widget.
  bool? validate;
  bool isDataUploading_uploadCompanyPDFToFirebasex = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyPDFToFirebasex =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyPDFToFirebasex = '';

  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyRefFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceRefFromDropDownIdCheck;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyNameFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceNameFromDropDownId;
  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialNoteCompanyCheckRecord? addedNote;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyRefFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceRefFromDropDownId9;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyNameFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceNameFromDropDownId9;
  // Stores action output result for [Backend Call - Create Document] action in PDFButton widget.
  FinancialNoteCompanyCheckRecord? create;
  // Stores action output result for [Validate Form] action in MediaButton widget.
  bool? validate8;
  bool isDataUploading_uploadCompanyMediaToFirebaseCheck = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyMediaToFirebaseCheck =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyMediaToFirebaseCheck = '';

  // Stores action output result for [Custom Action - getCompanyDocRef] action in MediaButton widget.
  DocumentReference? companyCheckRefFromDropDownId2;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in MediaButton widget.
  DocumentReference? workPlaceCheckRefFromDropDownId2;
  // Stores action output result for [Custom Action - getCompanyName] action in MediaButton widget.
  String? companyNameCheckFromDropDownId2;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in MediaButton widget.
  String? workPlaceNameCheckFromDropDownId2;
  // Stores action output result for [Backend Call - Create Document] action in MediaButton widget.
  FinancialNoteCompanyCheckRecord? addedCompanyCheckOwner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in MediaButton widget.
  DocumentReference? companyCheckRefFromDropDownId8;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in MediaButton widget.
  DocumentReference? workPlaceCheckRefFromDropDownId8;
  // Stores action output result for [Custom Action - getCompanyName] action in MediaButton widget.
  String? companyNameCheckFromDropDownId8;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in MediaButton widget.
  String? workPlaceNameCheckFromDropDownId8;
  // Stores action output result for [Backend Call - Create Document] action in MediaButton widget.
  FinancialNoteCompanyCheckRecord? addedCompanyCheckWorker;
  // Stores action output result for [Validate Form] action in noEvidence widget.
  bool? validate6;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in noEvidence widget.
  DocumentReference? companyCheckRefFromDropDownId3;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in noEvidence widget.
  DocumentReference? workPlaceCheckRefFromDropDownId3;
  // Stores action output result for [Custom Action - getCompanyName] action in noEvidence widget.
  String? companyNameCheckFromDropDownId3;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in noEvidence widget.
  String? workPlaceNameCheckFromDropDownId3;
  // Stores action output result for [Backend Call - Create Document] action in noEvidence widget.
  FinancialNoteCompanyCheckRecord? addedCompanyCheckOwnerN;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in noEvidence widget.
  DocumentReference? companyCheckRefFromDropDownId7;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in noEvidence widget.
  DocumentReference? workPlaceCheckRefFromDropDownId7;
  // Stores action output result for [Custom Action - getCompanyName] action in noEvidence widget.
  String? companyNameCheckFromDropDownId7;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in noEvidence widget.
  String? workPlaceNameCheckFromDropDownId7;
  // Stores action output result for [Backend Call - Create Document] action in noEvidence widget.
  FinancialNoteCompanyCheckRecord? addedCompanyCheckWorkerN;

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
