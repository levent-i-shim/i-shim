import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_financial_plan_item_widget.dart'
    show CreateFinancialPlanItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateFinancialPlanItemModel
    extends FlutterFlowModel<CreateFinancialPlanItemWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for itemTitle widget.
  FocusNode? itemTitleFocusNode;
  TextEditingController? itemTitleTextController;
  String? Function(BuildContext, String?)? itemTitleTextControllerValidator;
  // State field(s) for itemValue widget.
  FocusNode? itemValueFocusNode;
  TextEditingController? itemValueTextController;
  String? Function(BuildContext, String?)? itemValueTextControllerValidator;
  // State field(s) for itemContent widget.
  FocusNode? itemContentFocusNode;
  TextEditingController? itemContentTextController;
  String? Function(BuildContext, String?)? itemContentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    itemTitleFocusNode?.dispose();
    itemTitleTextController?.dispose();

    itemValueFocusNode?.dispose();
    itemValueTextController?.dispose();

    itemContentFocusNode?.dispose();
    itemContentTextController?.dispose();
  }
}
