import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'workplace_confirmations_page_widget.dart'
    show WorkplaceConfirmationsPageWidget;
import 'package:flutter/material.dart';

class WorkplaceConfirmationsPageModel
    extends FlutterFlowModel<WorkplaceConfirmationsPageWidget> {
  ///  Local state fields for this page.

  List<WorkplaceConfirmationDataTypeStruct> conifrmations = [];
  void addToConifrmations(WorkplaceConfirmationDataTypeStruct item) =>
      conifrmations.add(item);
  void removeFromConifrmations(WorkplaceConfirmationDataTypeStruct item) =>
      conifrmations.remove(item);
  void removeAtIndexFromConifrmations(int index) =>
      conifrmations.removeAt(index);
  void insertAtIndexInConifrmations(
          int index, WorkplaceConfirmationDataTypeStruct item) =>
      conifrmations.insert(index, item);
  void updateConifrmationsAtIndex(
          int index, Function(WorkplaceConfirmationDataTypeStruct) updateFn) =>
      conifrmations[index] = updateFn(conifrmations[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
