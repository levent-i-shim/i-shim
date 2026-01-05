import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'response_form_for_task_widget.dart' show ResponseFormForTaskWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ResponseFormForTaskModel
    extends FlutterFlowModel<ResponseFormForTaskWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CompanyReportsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CompanyReportsRecord>
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

  PagingController<DocumentSnapshot?, CompanyReportsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CompanyReportsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCompanyReportsRecordPage(
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
}
