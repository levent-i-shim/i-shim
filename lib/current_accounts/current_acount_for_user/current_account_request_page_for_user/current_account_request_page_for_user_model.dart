import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_account_request_page_for_user_widget.dart'
    show CurrentAccountRequestPageForUserWidget;
import 'package:flutter/material.dart';

class CurrentAccountRequestPageForUserModel
    extends FlutterFlowModel<CurrentAccountRequestPageForUserWidget> {
  ///  Local state fields for this page.

  List<AllCurrentAccountStruct> allCurrentAccount = [];
  void addToAllCurrentAccount(AllCurrentAccountStruct item) =>
      allCurrentAccount.add(item);
  void removeFromAllCurrentAccount(AllCurrentAccountStruct item) =>
      allCurrentAccount.remove(item);
  void removeAtIndexFromAllCurrentAccount(int index) =>
      allCurrentAccount.removeAt(index);
  void insertAtIndexInAllCurrentAccount(
          int index, AllCurrentAccountStruct item) =>
      allCurrentAccount.insert(index, item);
  void updateAllCurrentAccountAtIndex(
          int index, Function(AllCurrentAccountStruct) updateFn) =>
      allCurrentAccount[index] = updateFn(allCurrentAccount[index]);

  List<NotificationsRecord> notifications = [];
  void addToNotifications(NotificationsRecord item) => notifications.add(item);
  void removeFromNotifications(NotificationsRecord item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, NotificationsRecord item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(NotificationsRecord) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountRequestPageForUser widget.
  List<NotificationsRecord>? allNotifications;
  // Stores action output result for [Custom Action - getCurrentAccountDocRef] action in CurrentAccountRequestPageForUser widget.
  DocumentReference? currentAccountDocRef;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountRequestPageForUser widget.
  CurrentAccountRecord? currentAccoun;
  // Stores action output result for [Custom Action - isEqual] action in CurrentAccountRequestPageForUser widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in CurrentAccountRequestPageForUser widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountRequestPageForUser widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in CurrentAccountRequestPageForUser widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountRequestPageForUser widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in CurrentAccountRequestPageForUser widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountRequestPageForUser widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in CurrentAccountRequestPageForUser widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountRequestPageForUser widget.
  UsersRecord? userDetail4;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? company;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? user;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDetail;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? company2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail2;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? user2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDetail2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
