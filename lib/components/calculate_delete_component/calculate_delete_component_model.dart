import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'calculate_delete_component_widget.dart'
    show CalculateDeleteComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculateDeleteComponentModel
    extends FlutterFlowModel<CalculateDeleteComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ParentProductsRecord? parentProduct;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? childProductDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
