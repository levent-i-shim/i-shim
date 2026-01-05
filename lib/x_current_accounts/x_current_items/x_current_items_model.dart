import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'x_current_items_widget.dart' show XCurrentItemsWidget;
import 'package:flutter/material.dart';

class XCurrentItemsModel extends FlutterFlowModel<XCurrentItemsWidget> {
  ///  Local state fields for this page.

  int? itemIndex = 0;

  double? totalOfItems = 0.0;

  int? paidItemIndex = 0;

  double? paidTotalOfItems = 0.0;

  ///  State fields for stateful widgets in this page.

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
