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
import 'current_account_activity_widget.dart' show CurrentAccountActivityWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentAccountActivityModel
    extends FlutterFlowModel<CurrentAccountActivityWidget> {
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

  int myCompaniesCurrentAccountsCount = 0;

  int personalCurrentAccountsCount = 0;

  int partnerCompanyCurrentAccountsCount = 0;

  int totalBillCount = 0;

  int totalUnpaidBillCount = 0;

  double? totalMoney = 0.0;

  String counterPartyType = ' ';

  int? requestForCurrentAccountBillCount = 0;

  int? requestForCurrentAccountCount = 0;

  int? requestForSetPaid = 0;

  int requestForMatchCurrentAccount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  List<CompaniesRecord>? myCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  int? currentAccountCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  int? currentAccountBillCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  int? currentAccountPaidCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  int? currentAccountMatchCount;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  List<CurrentAccountRecord>? myCompaniesCurrentAccounts;
  // Stores action output result for [Custom Action - currentAccountAmISideOne] action in currentAccountActivity widget.
  bool? amISideOne;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company2;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail2;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user2;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail2;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  List<CompaniesRecord>? partnerCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  List<CurrentAccountRecord>? partnersCurrentAccounts;
  // Stores action output result for [Custom Action - currentAccountAmISideOne] action in currentAccountActivity widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail4;
  // Stores action output result for [Firestore Query - Query a collection] action in currentAccountActivity widget.
  List<CurrentAccountRecord>? personalCurrentAccounts;
  // Stores action output result for [Custom Action - isEqualRef] action in currentAccountActivity widget.
  bool? amISideOnePersonal;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company5;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail5;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user5;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail5;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in currentAccountActivity widget.
  DocumentReference? company6;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  CompaniesRecord? companyDetail6;
  // Stores action output result for [Custom Action - getUserDocRef] action in currentAccountActivity widget.
  DocumentReference? user6;
  // Stores action output result for [Backend Call - Read Document] action in currentAccountActivity widget.
  UsersRecord? userDetail6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
