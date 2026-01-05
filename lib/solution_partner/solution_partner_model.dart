import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'solution_partner_widget.dart' show SolutionPartnerWidget;
import 'package:flutter/material.dart';

class SolutionPartnerModel extends FlutterFlowModel<SolutionPartnerWidget> {
  ///  Local state fields for this page.

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

  List<MyWorkedWorkPlaceRecord> myWorkedWorkPlace = [];
  void addToMyWorkedWorkPlace(MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.add(item);
  void removeFromMyWorkedWorkPlace(MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.remove(item);
  void removeAtIndexFromMyWorkedWorkPlace(int index) =>
      myWorkedWorkPlace.removeAt(index);
  void insertAtIndexInMyWorkedWorkPlace(
          int index, MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.insert(index, item);
  void updateMyWorkedWorkPlaceAtIndex(
          int index, Function(MyWorkedWorkPlaceRecord) updateFn) =>
      myWorkedWorkPlace[index] = updateFn(myWorkedWorkPlace[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<FormFieldsRecord>? formFields;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  NotificationsRecord? notificationTask;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  NotificationsRecord? notifiDuty;
  // Stores action output result for [Backend Call - Read Document] action in Card widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in Card widget.
  CompaniesRecord? companyDetailCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
