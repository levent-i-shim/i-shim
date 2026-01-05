import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'department_employess_widget.dart' show DepartmentEmployessWidget;
import 'package:flutter/material.dart';

class DepartmentEmployessModel
    extends FlutterFlowModel<DepartmentEmployessWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? userRefOldAuth;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkPlaceWorkerRecord? workPlaceWorker;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkPlaceWorkerRecord? workPlaceWorkerNewUser;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetailCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
