import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'financial_monitoring_widget.dart' show FinancialMonitoringWidget;
import 'package:flutter/material.dart';

class FinancialMonitoringModel
    extends FlutterFlowModel<FinancialMonitoringWidget> {
  ///  Local state fields for this page.

  int? indexTotal;

  double? totalSpending = 0.0;

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

  // State field(s) for compannyOrWorkPlace widget.
  String? compannyOrWorkPlaceValue;
  FormFieldController<String>? compannyOrWorkPlaceValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in compannyOrWorkPlace widget.
  int? countFinancialNotePersonal;
  // Stores action output result for [Firestore Query - Query a collection] action in compannyOrWorkPlace widget.
  List<FinancialMonitoringNotesRecord>? listofFinancialNotesPersonal;
  // Stores action output result for [Firestore Query - Query a collection] action in compannyOrWorkPlace widget.
  int? familyFinancialCount;
  // Stores action output result for [Firestore Query - Query a collection] action in compannyOrWorkPlace widget.
  List<FinancialMonitoringNotesRecord>? listofFinancialNotesFamily;
  // State field(s) for ownerOrWorker widget.
  String? ownerOrWorkerValue;
  FormFieldController<String>? ownerOrWorkerValueController;
  // State field(s) for whichCompaniesDropDown widget.
  String? whichCompaniesDropDownValue;
  FormFieldController<String>? whichCompaniesDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  int? countFinancialNoteCompany1;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  List<FinancialMonitoringNotesRecord>? listofFinancialNotesCompany1;
  // State field(s) for whichAutrizingCompanies widget.
  String? whichAutrizingCompaniesValue;
  FormFieldController<String>? whichAutrizingCompaniesValueController;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // State field(s) for authorizingWorkPlaceDropDown widget.
  String? authorizingWorkPlaceDropDownValue;
  FormFieldController<String>? authorizingWorkPlaceDropDownValueController;
  // State field(s) for incomeOrExpense widget.
  String? incomeOrExpenseValue;
  FormFieldController<String>? incomeOrExpenseValueController;
  // State field(s) for timeRange widget.
  String? timeRangeValue;
  FormFieldController<String>? timeRangeValueController;
  // State field(s) for companyTableValuesDropDown widget.
  List<String>? companyTableValuesDropDownValue;
  FormFieldController<List<String>>? companyTableValuesDropDownValueController;
  // State field(s) for companyTableValuesDropDown2 widget.
  List<String>? companyTableValuesDropDown2Value;
  FormFieldController<List<String>>? companyTableValuesDropDown2ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
