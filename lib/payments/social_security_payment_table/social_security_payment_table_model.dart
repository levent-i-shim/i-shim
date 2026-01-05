import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'social_security_payment_table_widget.dart'
    show SocialSecurityPaymentTableWidget;
import 'package:flutter/material.dart';

class SocialSecurityPaymentTableModel
    extends FlutterFlowModel<SocialSecurityPaymentTableWidget> {
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

  DocumentReference? whichCurrentAccountRef;

  ///  State fields for stateful widgets in this page.

  // State field(s) for compannyOrWorkPlace widget.
  String? compannyOrWorkPlaceValue;
  FormFieldController<String>? compannyOrWorkPlaceValueController;
  // State field(s) for whichCompaniesDropDown widget.
  String? whichCompaniesDropDownValue;
  FormFieldController<String>? whichCompaniesDropDownValueController;
  List<CompaniesRecord>? whichCompaniesDropDownPreviousSnapshot;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDown widget.
  DocumentReference? whichCompanyIdFromDD;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  int? countFinancialNoteCompany;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  List<FinancialNoteCompanyRecord>? listofFinancialNotes;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // State field(s) for paymentOrCollection widget.
  String? paymentOrCollectionValue;
  FormFieldController<String>? paymentOrCollectionValueController;
  // State field(s) for hasBillOrNot widget.
  String? hasBillOrNotValue;
  FormFieldController<String>? hasBillOrNotValueController;
  // State field(s) for timeRange widget.
  String? timeRangeValue;
  FormFieldController<String>? timeRangeValueController;
  // State field(s) for tableValuesDropDown widget.
  List<String>? tableValuesDropDownValue;
  FormFieldController<List<String>>? tableValuesDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
