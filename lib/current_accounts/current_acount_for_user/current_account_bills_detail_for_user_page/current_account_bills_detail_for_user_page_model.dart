import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_account_bills_detail_for_user_page_widget.dart'
    show CurrentAccountBillsDetailForUserPageWidget;
import 'package:flutter/material.dart';

class CurrentAccountBillsDetailForUserPageModel
    extends FlutterFlowModel<CurrentAccountBillsDetailForUserPageWidget> {
  ///  Local state fields for this page.

  List<CurrentAccountActivityRecord> activities = [];
  void addToActivities(CurrentAccountActivityRecord item) =>
      activities.add(item);
  void removeFromActivities(CurrentAccountActivityRecord item) =>
      activities.remove(item);
  void removeAtIndexFromActivities(int index) => activities.removeAt(index);
  void insertAtIndexInActivities(
          int index, CurrentAccountActivityRecord item) =>
      activities.insert(index, item);
  void updateActivitiesAtIndex(
          int index, Function(CurrentAccountActivityRecord) updateFn) =>
      activities[index] = updateFn(activities[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountBillsDetailForUserPage widget.
  CurrentAccountActivityRecord? activiryDetail;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOneIncomeNotUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyIncomes2025Record? companyIncomeNotUser;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOneIncomeNotUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserIncomeRecord? userSideOneIncomeRefNotUser;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOnePaymentNotUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyPayments2025Record? sideOnePaymentRefNotUser;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOnePaymentNotUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserPaymentRecord? userSideOnePaymentRefNotUser;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRef;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRef2;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? user;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? user2;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideTwoPayment;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideTwoPayment;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOneIncome;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOneIncome;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideTwoIncome;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideTwoIncome;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOnePayment;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOnePayment;
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
