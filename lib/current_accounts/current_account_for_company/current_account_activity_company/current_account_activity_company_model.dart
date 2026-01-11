import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'current_account_activity_company_widget.dart'
    show CurrentAccountActivityCompanyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentAccountActivityCompanyModel
    extends FlutterFlowModel<CurrentAccountActivityCompanyWidget> {
  ///  Local state fields for this page.

  List<AllCurrentAccountStruct> currentAccounts = [];
  void addToCurrentAccounts(AllCurrentAccountStruct item) =>
      currentAccounts.add(item);
  void removeFromCurrentAccounts(AllCurrentAccountStruct item) =>
      currentAccounts.remove(item);
  void removeAtIndexFromCurrentAccounts(int index) =>
      currentAccounts.removeAt(index);
  void insertAtIndexInCurrentAccounts(
          int index, AllCurrentAccountStruct item) =>
      currentAccounts.insert(index, item);
  void updateCurrentAccountsAtIndex(
          int index, Function(AllCurrentAccountStruct) updateFn) =>
      currentAccounts[index] = updateFn(currentAccounts[index]);

  int totalBillCount = 0;

  int totalUnpaidBillCount = 0;

  double? totalMoney = 0.0;

  String counterPartyType = ' ';

  int totalCurrentAccountCount = 0;

  int requestForCurrentAccountCount = 0;

  int requestForCurrentAccountBillCount = 0;

  int? requestForSetPaid = 0;

  int requestForMatchCurrentAccount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivityCompany widget.
  List<CurrentAccountRecord>? partnersCurrentAccounts;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivityCompany widget.
  int? currentAccountCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivityCompany widget.
  int? currentAccountBillCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivityCompany widget.
  int? currentAccountPaidCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivityCompany widget.
  int? currentAccountMatchCount;
  // Stores action output result for [Custom Action - isEqual] action in currentAccountActivityCompany widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivityCompany widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivityCompany widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivityCompany widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivityCompany widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivityCompany widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivityCompany widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivityCompany widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivityCompany widget.
  UsersRecord? userDetail4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
