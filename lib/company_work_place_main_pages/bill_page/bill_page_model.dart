import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/finance_notes/options_bill_company/options_bill_company_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'bill_page_widget.dart' show BillPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillPageModel extends FlutterFlowModel<BillPageWidget> {
  ///  Local state fields for this page.

  int? indexTotal;

  double? totalSpending;

  List<double> listOfValuesForPayment = [];
  void addToListOfValuesForPayment(double item) =>
      listOfValuesForPayment.add(item);
  void removeFromListOfValuesForPayment(double item) =>
      listOfValuesForPayment.remove(item);
  void removeAtIndexFromListOfValuesForPayment(int index) =>
      listOfValuesForPayment.removeAt(index);
  void insertAtIndexInListOfValuesForPayment(int index, double item) =>
      listOfValuesForPayment.insert(index, item);
  void updateListOfValuesForPaymentAtIndex(
          int index, Function(double) updateFn) =>
      listOfValuesForPayment[index] = updateFn(listOfValuesForPayment[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for whichCompaniesDropDownn widget.
  String? whichCompaniesDropDownnValue;
  FormFieldController<String>? whichCompaniesDropDownnValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDownn widget.
  DocumentReference? companyRefFromDD;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue1;
  FormFieldController<String>? workPlaceDropDownValueController1;
  bool isDataUploading_companyBillUploadPDF = false;
  FFUploadedFile uploadedLocalFile_companyBillUploadPDF =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadCompanyBillPDFToFirebase = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyBillPDFToFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyBillPDFToFirebase = '';

  // State field(s) for whichCompaniesDropDowN widget.
  String? whichCompaniesDropDowNValue;
  FormFieldController<String>? whichCompaniesDropDowNValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDowN widget.
  DocumentReference? companyRefFromDDN;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue2;
  FormFieldController<String>? workPlaceDropDownValueController2;
  bool isDataUploading_companyBillUploadPDF2 = false;
  FFUploadedFile uploadedLocalFile_companyBillUploadPDF2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadCompanyBillPDFToFirebase2 = false;
  FFUploadedFile uploadedLocalFile_uploadCompanyBillPDFToFirebase2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadCompanyBillPDFToFirebase2 = '';

  // State field(s) for compannyOrWorkPlace widget.
  String? compannyOrWorkPlaceValue;
  FormFieldController<String>? compannyOrWorkPlaceValueController;
  // State field(s) for whichCompaniesDropDown widget.
  String? whichCompaniesDropDownValue;
  FormFieldController<String>? whichCompaniesDropDownValueController;
  List<CompaniesRecord>? whichCompaniesDropDownPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  int? countFinancialNoteCompany;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  List<FinancialNoteCompanyRecord>? listofFinancialNotes;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  int? countFinancialNoteCompany2;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  List<FinancialNoteCompanyRecord>? listofFinancialNotes2;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue3;
  FormFieldController<String>? workPlaceDropDownValueController3;
  // State field(s) for incomeOrExpense widget.
  String? incomeOrExpenseValue;
  FormFieldController<String>? incomeOrExpenseValueController;
  // State field(s) for timeRange widget.
  String? timeRangeValue;
  FormFieldController<String>? timeRangeValueController;
  // State field(s) for tableValuesDropDown widget.
  List<String>? tableValuesDropDownValue;
  FormFieldController<List<String>>? tableValuesDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
