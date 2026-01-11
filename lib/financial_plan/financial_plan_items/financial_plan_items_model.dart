import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/financial_plan/component_financial_plan/options_financial_plan_items/options_financial_plan_items_widget.dart';
import '/financial_plan/component_financial_plan/options_financial_plan_items_paid/options_financial_plan_items_paid_widget.dart';
import '/financial_plan/component_financial_plan/options_financial_plan_items_postponed/options_financial_plan_items_postponed_widget.dart';
import '/financial_plan/component_financial_plan/options_financial_plan_items_unpaid/options_financial_plan_items_unpaid_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'financial_plan_items_widget.dart' show FinancialPlanItemsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinancialPlanItemsModel
    extends FlutterFlowModel<FinancialPlanItemsWidget> {
  ///  Local state fields for this page.

  int? itemIndex = 0;

  double? totalOfItems = 0.0;

  int? paidItemIndex = 0;

  double? paidTotalOfItems = 0.0;

  int? unpaidItemIndex = 0;

  double? unpaidTotal = 0.0;

  int? toBePostponedItemIndex = 0;

  double? toBePostponedItemsTotal;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? count2;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<FinancialPlansItemsRecord>? listOfDocuments2;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? paidCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<FinancialPlansItemsRecord>? paidListOfDocuments;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? unpaidCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<FinancialPlansItemsRecord>? unpaidListOfDocuments;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? postponedCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<FinancialPlansItemsRecord>? postponedListOfDocuments;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
