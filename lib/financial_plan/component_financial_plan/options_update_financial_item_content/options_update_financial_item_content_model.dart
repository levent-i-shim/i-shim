import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'options_update_financial_item_content_widget.dart'
    show OptionsUpdateFinancialItemContentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionsUpdateFinancialItemContentModel
    extends FlutterFlowModel<OptionsUpdateFinancialItemContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputItemContent widget.
  FocusNode? inputItemContentFocusNode;
  TextEditingController? inputItemContentTextController;
  String? Function(BuildContext, String?)?
      inputItemContentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputItemContentFocusNode?.dispose();
    inputItemContentTextController?.dispose();
  }
}
