import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'options_update_income_item_value_widget.dart'
    show OptionsUpdateIncomeItemValueWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionsUpdateIncomeItemValueModel
    extends FlutterFlowModel<OptionsUpdateIncomeItemValueWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputItemValue widget.
  FocusNode? inputItemValueFocusNode;
  TextEditingController? inputItemValueTextController;
  String? Function(BuildContext, String?)?
      inputItemValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputItemValueFocusNode?.dispose();
    inputItemValueTextController?.dispose();
  }
}
