import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'choose_x_current_type_page_widget.dart'
    show ChooseXCurrentTypePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseXCurrentTypePageModel
    extends FlutterFlowModel<ChooseXCurrentTypePageWidget> {
  ///  Local state fields for this page.

  int? capitalNeedItemIndex = 0;

  double? totalCapitalNeed = 0.0;

  int? incomeItemIndex = 0;

  double? plannedIncomeTotal = 0.0;

  int? investmentItemIndex = 0;

  double? investmentTotal = 0.0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
