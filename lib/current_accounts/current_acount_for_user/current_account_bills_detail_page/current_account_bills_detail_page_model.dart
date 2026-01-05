import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_account_bills_detail_page_widget.dart'
    show CurrentAccountBillsDetailPageWidget;
import 'package:flutter/material.dart';

class CurrentAccountBillsDetailPageModel
    extends FlutterFlowModel<CurrentAccountBillsDetailPageWidget> {
  ///  Local state fields for this page.

  List<CurrentAccountActivityRecord> activity = [];
  void addToActivity(CurrentAccountActivityRecord item) => activity.add(item);
  void removeFromActivity(CurrentAccountActivityRecord item) =>
      activity.remove(item);
  void removeAtIndexFromActivity(int index) => activity.removeAt(index);
  void insertAtIndexInActivity(int index, CurrentAccountActivityRecord item) =>
      activity.insert(index, item);
  void updateActivityAtIndex(
          int index, Function(CurrentAccountActivityRecord) updateFn) =>
      activity[index] = updateFn(activity[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillsDetailPage widget.
  CurrentAccountActivityRecord? activiryDetail;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideTwoPayment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyPayments2025Record? sideTwoBill;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideTwoPayment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserPaymentRecord? sideTwoBillUser;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOneIncome;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyIncomes2025Record? companyIncome;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOneIncome;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserIncomeRecord? userSideOneIncomeRef;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideTwoIncome;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyIncomes2025Record? sideTwoBillIncomeCompany;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideTwoIncome;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserIncomeRecord? userSideTwoIncomeRef;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOnePayment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyPayments2025Record? sideOnePaymentRef;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOnePayment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserPaymentRecord? sideOnePaymentRefUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? billNotification;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? billNotification2;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyNotifi;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetailNotifi;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userNotifi;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDetailNotifi;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? company2Notifi;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail2Notifi;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? user2Notifi;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDetail2Notifi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
