import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'payment_or_collection_cash_widget.dart'
    show PaymentOrCollectionCashWidget;
import 'package:flutter/material.dart';

class PaymentOrCollectionCashModel
    extends FlutterFlowModel<PaymentOrCollectionCashWidget> {
  ///  Local state fields for this page.

  DateTime? today;

  DateTime? dueDate;

  int? numberOfDays;

  int? indexTotalSpending = 0;

  double? spendingTotal = 0.0;

  double? collectionTotal = 0.0;

  int? indexTotalIncome = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for whichCompaniesDropDow widget.
  String? whichCompaniesDropDowValue;
  FormFieldController<String>? whichCompaniesDropDowValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDow widget.
  DocumentReference? companyRefFromDD;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  List<FinancialNoteCompanyRecord>? cashRefToGetValues;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  int? expenseCompanyCashCount;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  List<FinancialNoteCompanyRecord>? cashIncomeListToGetValues;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  int? cashIncomeCompanyToCount;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in workPlaceDropDown widget.
  DocumentReference? companyRefFromDD2;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlaceDropDown widget.
  DocumentReference? whichWorkPlaceRef;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDown widget.
  List<FinancialNoteCompanyRecord>? cashRefToGetValues2;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDown widget.
  int? expenseCompanyCashCount2;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDown widget.
  List<FinancialNoteCompanyRecord>? cashRefToGetWorkPlaceIncomeValues;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDown widget.
  int? incomeWorkPlaceCashCount2;
  // State field(s) for incomeOrExpense widget.
  String? incomeOrExpenseValue;
  FormFieldController<String>? incomeOrExpenseValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
