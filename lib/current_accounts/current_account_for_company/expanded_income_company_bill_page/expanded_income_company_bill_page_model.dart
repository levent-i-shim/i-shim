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
import 'expanded_income_company_bill_page_widget.dart'
    show ExpandedIncomeCompanyBillPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExpandedIncomeCompanyBillPageModel
    extends FlutterFlowModel<ExpandedIncomeCompanyBillPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CurrentAccountBillRecord? billDocument;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CurrentAccountRecord? currentAccount;
  // Stores action output result for [Custom Action - isEqual] action in Icon widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
