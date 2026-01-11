import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'current_account_bill_for_company_page_request_widget.dart'
    show CurrentAccountBillForCompanyPageRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentAccountBillForCompanyPageRequestModel
    extends FlutterFlowModel<CurrentAccountBillForCompanyPageRequestWidget> {
  ///  Local state fields for this page.

  List<CurrentAccountBillRecord> bills = [];
  void addToBills(CurrentAccountBillRecord item) => bills.add(item);
  void removeFromBills(CurrentAccountBillRecord item) => bills.remove(item);
  void removeAtIndexFromBills(int index) => bills.removeAt(index);
  void insertAtIndexInBills(int index, CurrentAccountBillRecord item) =>
      bills.insert(index, item);
  void updateBillsAtIndex(
          int index, Function(CurrentAccountBillRecord) updateFn) =>
      bills[index] = updateFn(bills[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountBillForCompanyPageRequest widget.
  List<CompanyNotificationsRecord>? allNotifications2;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillForCompanyPageRequest widget.
  CurrentAccountBillRecord? currentAccountBill2;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountBillForCompanyPageRequest widget.
  List<CompanyNotificationsRecord>? allNotifications;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillForCompanyPageRequest widget.
  CurrentAccountBillRecord? currentAccountBill;
  // Stores action output result for [Backend Call - Read Document] action in listItem widget.
  CurrentAccountRecord? currentAccountCopy;
  // Stores action output result for [Custom Action - isEqual] action in listItem widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in listItem widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in listItem widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in listItem widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in listItem widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in listItem widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in listItem widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in listItem widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in listItem widget.
  UsersRecord? userDetail4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
