import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'current_account_for_company_page_request_widget.dart'
    show CurrentAccountForCompanyPageRequestWidget;
import 'package:flutter/material.dart';

class CurrentAccountForCompanyPageRequestModel
    extends FlutterFlowModel<CurrentAccountForCompanyPageRequestWidget> {
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

  List<DocumentReference> notificationRefs = [];
  void addToNotificationRefs(DocumentReference item) =>
      notificationRefs.add(item);
  void removeFromNotificationRefs(DocumentReference item) =>
      notificationRefs.remove(item);
  void removeAtIndexFromNotificationRefs(int index) =>
      notificationRefs.removeAt(index);
  void insertAtIndexInNotificationRefs(int index, DocumentReference item) =>
      notificationRefs.insert(index, item);
  void updateNotificationRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      notificationRefs[index] = updateFn(notificationRefs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountForCompanyPageRequest widget.
  List<CompanyNotificationsRecord>? allNotifications;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountForCompanyPageRequest widget.
  CurrentAccountRecord? currentAccoun;
  // Stores action output result for [Custom Action - isEqual] action in CurrentAccountForCompanyPageRequest widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in CurrentAccountForCompanyPageRequest widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountForCompanyPageRequest widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in CurrentAccountForCompanyPageRequest widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountForCompanyPageRequest widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in CurrentAccountForCompanyPageRequest widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountForCompanyPageRequest widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in CurrentAccountForCompanyPageRequest widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in CurrentAccountForCompanyPageRequest widget.
  UsersRecord? userDetail4;
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
