import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'create_task_step3_widget.dart' show CreateTaskStep3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTaskStep3Model extends FlutterFlowModel<CreateTaskStep3Widget> {
  ///  Local state fields for this page.

  List<WorkplaceStruct> workPlaces = [];
  void addToWorkPlaces(WorkplaceStruct item) => workPlaces.add(item);
  void removeFromWorkPlaces(WorkplaceStruct item) => workPlaces.remove(item);
  void removeAtIndexFromWorkPlaces(int index) => workPlaces.removeAt(index);
  void insertAtIndexInWorkPlaces(int index, WorkplaceStruct item) =>
      workPlaces.insert(index, item);
  void updateWorkPlacesAtIndex(int index, Function(WorkplaceStruct) updateFn) =>
      workPlaces[index] = updateFn(workPlaces[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CreateTaskStep3 widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Firestore Query - Query a collection] action in CreateTaskStep3 widget.
  List<WorkPlacesRecord>? workPLaces;
  // Stores action output result for [Backend Call - Read Document] action in CreateTaskStep3 widget.
  WorkPlacesRecord? workPLace;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
