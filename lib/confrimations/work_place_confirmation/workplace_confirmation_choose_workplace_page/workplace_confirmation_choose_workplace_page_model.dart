import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'workplace_confirmation_choose_workplace_page_widget.dart'
    show WorkplaceConfirmationChooseWorkplacePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkplaceConfirmationChooseWorkplacePageModel
    extends FlutterFlowModel<WorkplaceConfirmationChooseWorkplacePageWidget> {
  ///  Local state fields for this page.

  List<WorkplaceStruct> workplaces = [];
  void addToWorkplaces(WorkplaceStruct item) => workplaces.add(item);
  void removeFromWorkplaces(WorkplaceStruct item) => workplaces.remove(item);
  void removeAtIndexFromWorkplaces(int index) => workplaces.removeAt(index);
  void insertAtIndexInWorkplaces(int index, WorkplaceStruct item) =>
      workplaces.insert(index, item);
  void updateWorkplacesAtIndex(int index, Function(WorkplaceStruct) updateFn) =>
      workplaces[index] = updateFn(workplaces[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in WorkplaceConfirmationChooseWorkplacePage widget.
  List<WorkPlacesRecord>? owner;
  // Stores action output result for [Firestore Query - Query a collection] action in WorkplaceConfirmationChooseWorkplacePage widget.
  List<MyWorkedWorkPlaceRecord>? myWorked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
