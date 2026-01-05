import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'workplace_confirmation_create_confirmation_page_widget.dart'
    show WorkplaceConfirmationCreateConfirmationPageWidget;
import 'package:flutter/material.dart';

class WorkplaceConfirmationCreateConfirmationPageModel extends FlutterFlowModel<
    WorkplaceConfirmationCreateConfirmationPageWidget> {
  ///  Local state fields for this page.

  List<UserDetailDataStruct> usersForDropdown = [];
  void addToUsersForDropdown(UserDetailDataStruct item) =>
      usersForDropdown.add(item);
  void removeFromUsersForDropdown(UserDetailDataStruct item) =>
      usersForDropdown.remove(item);
  void removeAtIndexFromUsersForDropdown(int index) =>
      usersForDropdown.removeAt(index);
  void insertAtIndexInUsersForDropdown(int index, UserDetailDataStruct item) =>
      usersForDropdown.insert(index, item);
  void updateUsersForDropdownAtIndex(
          int index, Function(UserDetailDataStruct) updateFn) =>
      usersForDropdown[index] = updateFn(usersForDropdown[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in WorkplaceConfirmationCreateConfirmationPage widget.
  List<WorkPlaceWorkerRecord>? users;
  // Stores action output result for [Backend Call - Read Document] action in WorkplaceConfirmationCreateConfirmationPage widget.
  WorkPlacesRecord? workplaceDetail;
  // Stores action output result for [Backend Call - Read Document] action in WorkplaceConfirmationCreateConfirmationPage widget.
  UsersRecord? owner;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? receiverUserRefCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUserCopy;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmation;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationName;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSql;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationCopy;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameCopy;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
