import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'current_account_activity_company_widget.dart'
    show CurrentAccountActivityCompanyWidget;
import 'package:flutter/material.dart';

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
