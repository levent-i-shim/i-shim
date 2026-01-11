import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/delete_request_component/delete_request_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'calculate_detail_page_widget.dart' show CalculateDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
