import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'employee_detail_page_work_place_widget.dart'
    show EmployeeDetailPageWorkPlaceWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EmployeeDetailPageWorkPlaceModel
    extends FlutterFlowModel<EmployeeDetailPageWorkPlaceWidget> {
  ///  Local state fields for this page.

  MyWorkedWorkPlaceRecord? myWorkedWorkPlace;

  List<DocumentReference> myWorkedWorkPlaceIds = [];
  void addToMyWorkedWorkPlaceIds(DocumentReference item) =>
      myWorkedWorkPlaceIds.add(item);
  void removeFromMyWorkedWorkPlaceIds(DocumentReference item) =>
      myWorkedWorkPlaceIds.remove(item);
  void removeAtIndexFromMyWorkedWorkPlaceIds(int index) =>
      myWorkedWorkPlaceIds.removeAt(index);
  void insertAtIndexInMyWorkedWorkPlaceIds(int index, DocumentReference item) =>
      myWorkedWorkPlaceIds.insert(index, item);
  void updateMyWorkedWorkPlaceIdsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myWorkedWorkPlaceIds[index] = updateFn(myWorkedWorkPlaceIds[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in EmployeeDetailPageWorkPlace widget.
  MyWorkedWorkPlaceRecord? myWorkedWorkPlaceResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerAuthUser;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CompanyTasksRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DutiesForCompanyRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, SpentMoneyForAllowenceRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CompanyTasksRecord>
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

  PagingController<DocumentSnapshot?, CompanyTasksRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CompanyTasksRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCompanyTasksRecordPage(
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

  PagingController<DocumentSnapshot?, DutiesForCompanyRecord>
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

  PagingController<DocumentSnapshot?, DutiesForCompanyRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, DutiesForCompanyRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDutiesForCompanyRecordPage(
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

  PagingController<DocumentSnapshot?, SpentMoneyForAllowenceRecord>
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

  PagingController<DocumentSnapshot?, SpentMoneyForAllowenceRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, SpentMoneyForAllowenceRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => querySpentMoneyForAllowenceRecordPage(
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
}
