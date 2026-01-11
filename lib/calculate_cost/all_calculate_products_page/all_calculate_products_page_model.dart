import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_calculate_products_page_widget.dart'
    show AllCalculateProductsPageWidget;
import 'package:flutter/material.dart';

class AllCalculateProductsPageModel
    extends FlutterFlowModel<AllCalculateProductsPageWidget> {
  ///  Local state fields for this page.

  List<CostChartStruct> chart = [];
  void addToChart(CostChartStruct item) => chart.add(item);
  void removeFromChart(CostChartStruct item) => chart.remove(item);
  void removeAtIndexFromChart(int index) => chart.removeAt(index);
  void insertAtIndexInChart(int index, CostChartStruct item) =>
      chart.insert(index, item);
  void updateChartAtIndex(int index, Function(CostChartStruct) updateFn) =>
      chart[index] = updateFn(chart[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AllCalculateProductsPage widget.
  List<CalculationsRecord>? calculations;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductFieldsRecord>? productFields;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
