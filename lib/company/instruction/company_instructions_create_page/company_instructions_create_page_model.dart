import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_instructions_create_page_widget.dart'
    show CompanyInstructionsCreatePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CompanyInstructionsCreatePageModel
    extends FlutterFlowModel<CompanyInstructionsCreatePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, InstructionsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, InstructionsRecord> setListViewController(
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

  PagingController<DocumentSnapshot?, InstructionsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, InstructionsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryInstructionsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
