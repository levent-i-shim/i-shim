import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'work_place_notifications_page_widget.dart'
    show WorkPlaceNotificationsPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class WorkPlaceNotificationsPageModel
    extends FlutterFlowModel<WorkPlaceNotificationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>
      setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryWorkPlaceNotificationsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>
      setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryWorkPlaceNotificationsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
