import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'options_update_invested_money_title_widget.dart'
    show OptionsUpdateInvestedMoneyTitleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionsUpdateInvestedMoneyTitleModel
    extends FlutterFlowModel<OptionsUpdateInvestedMoneyTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for investmentTitle widget.
  FocusNode? investmentTitleFocusNode;
  TextEditingController? investmentTitleTextController;
  String? Function(BuildContext, String?)?
      investmentTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    investmentTitleFocusNode?.dispose();
    investmentTitleTextController?.dispose();
  }
}
