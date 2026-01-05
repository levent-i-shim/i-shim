import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'match_current_account_requestes_for_company_page_widget.dart'
    show MatchCurrentAccountRequestesForCompanyPageWidget;
import 'package:flutter/material.dart';

class MatchCurrentAccountRequestesForCompanyPageModel
    extends FlutterFlowModel<MatchCurrentAccountRequestesForCompanyPageWidget> {
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

  List<CompanyNotificationsRecord> notifications = [];
  void addToNotifications(CompanyNotificationsRecord item) =>
      notifications.add(item);
  void removeFromNotifications(CompanyNotificationsRecord item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(
          int index, CompanyNotificationsRecord item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(CompanyNotificationsRecord) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MatchCurrentAccountRequestesForCompanyPage widget.
  List<CompanyNotificationsRecord>? currentAccountsId;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesForCompanyPage widget.
  CurrentAccountRecord? currentAccountDetail;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in MatchCurrentAccountRequestesForCompanyPage widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesForCompanyPage widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in MatchCurrentAccountRequestesForCompanyPage widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesForCompanyPage widget.
  UsersRecord? userDetail4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
