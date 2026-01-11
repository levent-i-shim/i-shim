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
import 'match_current_account_requestes_page_widget.dart'
    show MatchCurrentAccountRequestesPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchCurrentAccountRequestesPageModel
    extends FlutterFlowModel<MatchCurrentAccountRequestesPageWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in MatchCurrentAccountRequestesPage widget.
  List<NotificationsRecord>? currentAccountsId;
  // Stores action output result for [Custom Action - getCurrentAccountDocRef] action in MatchCurrentAccountRequestesPage widget.
  DocumentReference? currentAccountDocRef;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesPage widget.
  CurrentAccountRecord? currentAccountDetail;
  // Stores action output result for [Custom Action - isEqual] action in MatchCurrentAccountRequestesPage widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in MatchCurrentAccountRequestesPage widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesPage widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in MatchCurrentAccountRequestesPage widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in MatchCurrentAccountRequestesPage widget.
  UsersRecord? userDetail4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
