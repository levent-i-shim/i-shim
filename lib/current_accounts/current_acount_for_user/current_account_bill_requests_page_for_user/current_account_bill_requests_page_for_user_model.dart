import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'current_account_bill_requests_page_for_user_widget.dart'
    show CurrentAccountBillRequestsPageForUserWidget;
import 'package:flutter/material.dart';

class CurrentAccountBillRequestsPageForUserModel
    extends FlutterFlowModel<CurrentAccountBillRequestsPageForUserWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountBillRequestsPageForUser widget.
  List<NotificationsRecord>? allNotifications2;
  // Stores action output result for [Custom Action - getCurrentAccountBillDocRef] action in CurrentAccountBillRequestsPageForUser widget.
  DocumentReference? currentAccountBill2DocRef;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillRequestsPageForUser widget.
  CurrentAccountBillRecord? currentAccountBill2;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountBillRequestsPageForUser widget.
  List<NotificationsRecord>? allNotifications;
  // Stores action output result for [Custom Action - getCurrentAccountBillDocRef] action in CurrentAccountBillRequestsPageForUser widget.
  DocumentReference? currentAccountBillDocRef;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillRequestsPageForUser widget.
  CurrentAccountBillRecord? currentAccountBill;
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
