import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_products_page_widget.dart' show AllProductsPageWidget;
import 'package:flutter/material.dart';

class AllProductsPageModel extends FlutterFlowModel<AllProductsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? description;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeletionRequestRecord? deletionRequest;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
