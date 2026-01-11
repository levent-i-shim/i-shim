import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'workers_widget.dart' show WorkersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkersModel extends FlutterFlowModel<WorkersWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - loadCompaniesForDropdown] action in Container widget.
  List<DocumentReference>? companiesICanSeeOutputVariableList;
  // Stores action output result for [Custom Action - getCompanyNamesFromRefs] action in Container widget.
  List<String>? companiesICanSeeOutputNameVariableList;
  // Stores action output result for [Custom Action - loadWorkPlacesForDropdown] action in Container widget.
  List<DocumentReference>? workPlacesICanSeeOutputVariableList;
  // Stores action output result for [Custom Action - getWorkPlaceNamesFromRefs] action in Container widget.
  List<String>? workPlacesCanSeeOutputNameVariableList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
