import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delete_request_page_widget.dart' show DeleteRequestPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DeleteRequestPageModel extends FlutterFlowModel<DeleteRequestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DeletionRequestRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DeletionRequestRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DeletionRequestRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DeletionRequestRecord>?
      listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CalculationsRecord? calculate;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DeletionRequestRecord>?
      listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CalculationsRecord? calculate2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    listViewStreamSubscriptions5.forEach((s) => s?.cancel());
    listViewPagingController5?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, DeletionRequestRecord>
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

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DeletionRequestRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDeletionRequestRecordPage(
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

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
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

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DeletionRequestRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDeletionRequestRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DeletionRequestRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDeletionRequestRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DeletionRequestRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDeletionRequestRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, DeletionRequestRecord>
      _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DeletionRequestRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDeletionRequestRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery5 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
