import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'work_places_detail_page_widget.dart' show WorkPlacesDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkPlacesDetailPageModel
    extends FlutterFlowModel<WorkPlacesDetailPageWidget> {
  ///  Local state fields for this page.

  double dailyExpense = 0.0;

  double? dailyIncome = 0.0;

  double? dailyMoney = 0.0;

  double? weeklyExpense = 0.0;

  double? weeklyIcome = 0.0;

  double? weeklyMoney = 0.0;

  double? day15Income = 0.0;

  double? day15Expense = 0.0;

  double? day15Money = 0.0;

  double? monthlyIncome = 0.0;

  double? monthlyExpense = 0.0;

  double? monthlyMoney = 0.0;

  bool amISideOne = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCompanyBudget] action in workPlacesDetailPage widget.
  BudgetStruct? budget;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<WorkPlacesRecord>? workPlaces;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<WorkplaceConfirmationsRecord>? workPlaceConfirmations;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<FormsRecord>? forms;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ConfirmationsRecord>? confirmations;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyConfirmationsRecord>? companyConfirmations;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CurrentAccountRecord>? currentAccounts;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? userVault;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
