import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'payment_or_collection_cash_table_widget.dart'
    show PaymentOrCollectionCashTableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentOrCollectionCashTableModel
    extends FlutterFlowModel<PaymentOrCollectionCashTableWidget> {
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
  List<FinancialNoteCompanyRecord>? cashListToGetValues;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  int? expenseCompanyCashCount;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  List<FinancialNoteCompanyRecord>? cashRefToGetIncomeValues;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDow widget.
  int? incomeCompanyCashCount;
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
