import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/x_current_accounts/options_x_current_account_activities/options_x_current_account_activities_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'x_current_items_widget.dart' show XCurrentItemsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class XCurrentItemsModel extends FlutterFlowModel<XCurrentItemsWidget> {
  ///  Local state fields for this page.

  int? itemIndex = 0;

  double? totalOfItems = 0.0;

  int? paidItemIndex = 0;

  double? paidTotalOfItems = 0.0;

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
