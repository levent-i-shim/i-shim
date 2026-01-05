import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'financial_plan_items_widget.dart' show FinancialPlanItemsWidget;
import 'package:flutter/material.dart';

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
