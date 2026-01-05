import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'workers_widget.dart' show WorkersWidget;
import 'package:flutter/material.dart';

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
