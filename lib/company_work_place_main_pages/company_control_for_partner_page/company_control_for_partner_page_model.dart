import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'company_control_for_partner_page_widget.dart'
    show CompanyControlForPartnerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyControlForPartnerPageModel
    extends FlutterFlowModel<CompanyControlForPartnerPageWidget> {
  ///  Local state fields for this page.

  double? dailyMoney = 0.0;

  double? dailyWeek = 0.0;

  double? day15Money = 0.0;

  double? monthlyWeek = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CompanyControlForPartnerPage widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getCompanyBudget] action in CompanyControlForPartnerPage widget.
  BudgetStruct? budget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
