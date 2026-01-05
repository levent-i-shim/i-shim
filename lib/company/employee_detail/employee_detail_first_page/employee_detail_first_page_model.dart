import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'employee_detail_first_page_widget.dart'
    show EmployeeDetailFirstPageWidget;
import 'package:flutter/material.dart';

class EmployeeDetailFirstPageModel
    extends FlutterFlowModel<EmployeeDetailFirstPageWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in EmployeeDetailFirstPage widget.
  MyWorkedWorkPlaceRecord? myWorkedWorkPlaceResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
