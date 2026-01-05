import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'calculate_detail_page_widget.dart' show CalculateDetailPageWidget;
import 'package:flutter/material.dart';

class CalculateDetailPageModel
    extends FlutterFlowModel<CalculateDetailPageWidget> {
  ///  Local state fields for this page.

  List<ProductCostDataTypeStruct> parameters = [];
  void addToParameters(ProductCostDataTypeStruct item) => parameters.add(item);
  void removeFromParameters(ProductCostDataTypeStruct item) =>
      parameters.remove(item);
  void removeAtIndexFromParameters(int index) => parameters.removeAt(index);
  void insertAtIndexInParameters(int index, ProductCostDataTypeStruct item) =>
      parameters.insert(index, item);
  void updateParametersAtIndex(
          int index, Function(ProductCostDataTypeStruct) updateFn) =>
      parameters[index] = updateFn(parameters[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  String? description;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  DeletionRequestRecord? deletionRequest;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
