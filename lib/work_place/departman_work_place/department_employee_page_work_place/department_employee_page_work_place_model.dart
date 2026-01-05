import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'department_employee_page_work_place_widget.dart'
    show DepartmentEmployeePageWorkPlaceWidget;
import 'package:flutter/material.dart';

class DepartmentEmployeePageWorkPlaceModel
    extends FlutterFlowModel<DepartmentEmployeePageWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlacesRecord? workPlace;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? userRefOldAuth;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkPlaceWorkerRecord? workPlaceWorker;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetailCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
