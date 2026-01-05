import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'business_choose_widget.dart' show BusinessChooseWidget;
import 'package:flutter/material.dart';

class BusinessChooseModel extends FlutterFlowModel<BusinessChooseWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for workPlacesDropDown widget.
  String? workPlacesDropDownValue;
  FormFieldController<String>? workPlacesDropDownValueController;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlacesDropDown widget.
  DocumentReference? workPlaceRef;
  // Stores action output result for [Custom Action - getWorkPlaceDocument] action in Container widget.
  WorkPlacesRecord? workPlaceDocumentFromChosen;
  // Stores action output result for [Custom Action - getCompanyDocument] action in Container widget.
  CompaniesRecord? companyDocumentFromChosenWorkPlace;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
