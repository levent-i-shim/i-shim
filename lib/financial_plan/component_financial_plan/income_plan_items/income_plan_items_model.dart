import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'income_plan_items_widget.dart' show IncomePlanItemsWidget;
import 'package:flutter/material.dart';

class IncomePlanItemsModel extends FlutterFlowModel<IncomePlanItemsWidget> {
  ///  Local state fields for this page.

  int? itemIndex = 0;

  double? totalOfItems = 0.0;

  int? paidItemIndex = 0;

  double? paidTotalOfItems = 0.0;

  int? realizedItemIndex = 0;

  double? realizedTotal = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in IncomePlanItems widget.
  int? count;
  // Stores action output result for [Firestore Query - Query a collection] action in IncomePlanItems widget.
  List<IncomePlanItemsRecord>? listOfDocuments;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? count2;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<IncomePlanItemsRecord>? listOfDocuments2;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? count3;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<IncomePlanItemsRecord>? listOfDocuments3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
