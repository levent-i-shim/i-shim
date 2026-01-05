import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'received_invitations_widget.dart' show ReceivedInvitationsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReceivedInvitationsModel
    extends FlutterFlowModel<ReceivedInvitationsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, InvitationsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? notificationDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompanyRolesRecord? role;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompanyDepartmentsRecord? department;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompanyUnitsRecord? unit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyWorkersRecord? companyWorkerRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? notificationDocAccept;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  NotificationsRecord? notifi2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, InvitationsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, InvitationsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, InvitationsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryInvitationsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
