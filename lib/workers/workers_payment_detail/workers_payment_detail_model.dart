import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'workers_payment_detail_widget.dart' show WorkersPaymentDetailWidget;
import 'package:flutter/material.dart';

class WorkersPaymentDetailModel
    extends FlutterFlowModel<WorkersPaymentDetailWidget> {
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
