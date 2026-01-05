import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmations_page_widget.dart' show ConfirmationsPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ConfirmationsPageModel extends FlutterFlowModel<ConfirmationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ConfirmationsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ConfirmationsRecord>?
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
  PagingController<DocumentSnapshot?, ConfirmationsRecord>
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

  PagingController<DocumentSnapshot?, ConfirmationsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ConfirmationsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryConfirmationsRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ConfirmationsRecord>
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

  PagingController<DocumentSnapshot?, ConfirmationsRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ConfirmationsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryConfirmationsRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
