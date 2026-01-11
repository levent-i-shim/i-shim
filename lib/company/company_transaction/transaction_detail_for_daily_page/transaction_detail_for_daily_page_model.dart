import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'transaction_detail_for_daily_page_widget.dart'
    show TransactionDetailForDailyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TransactionDetailForDailyPageModel
    extends FlutterFlowModel<TransactionDetailForDailyPageWidget> {
  ///  Local state fields for this page.

  String toWhom = ' ';

  String description = ' ';

  String tc = ' ';

  double? value = 0.0;

  String type = ' ';

  bool showStocks = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in TransactionDetailForDailyPage widget.
  CompanyIncomes2025Record? income;
  // Stores action output result for [Backend Call - Read Document] action in TransactionDetailForDailyPage widget.
  CompanyPayments2025Record? payment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
