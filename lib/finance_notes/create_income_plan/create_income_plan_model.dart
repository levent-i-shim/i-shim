import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_income_plan_widget.dart' show CreateIncomePlanWidget;
import 'package:flutter/material.dart';

class CreateIncomePlanModel extends FlutterFlowModel<CreateIncomePlanWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ownerOrWorker widget.
  String? ownerOrWorkerValue;
  FormFieldController<String>? ownerOrWorkerValueController;
  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in companiesDropDown widget.
  DocumentReference? ownerCompaniesFDD;
  // State field(s) for workPlacesDropDown widget.
  String? workPlacesDropDownValue;
  FormFieldController<String>? workPlacesDropDownValueController;
  // State field(s) for authorizingCompaniesDropDown widget.
  String? authorizingCompaniesDropDownValue;
  FormFieldController<String>? authorizingCompaniesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in authorizingCompaniesDropDown widget.
  DocumentReference? authorizingCompanyFDD;
  // State field(s) for authorizingWorkPlaceDropDown widget.
  String? authorizingWorkPlaceDropDownValue;
  FormFieldController<String>? authorizingWorkPlaceDropDownValueController;
  // State field(s) for planName widget.
  FocusNode? planNameFocusNode;
  TextEditingController? planNameTextController;
  String? Function(BuildContext, String?)? planNameTextControllerValidator;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyDocRef1;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyName1;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceDocRef1;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceName1;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in PDFButton widget.
  DocumentReference? companyDocRef2;
  // Stores action output result for [Custom Action - getCompanyName] action in PDFButton widget.
  String? companyName2;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in PDFButton widget.
  DocumentReference? workPlaceDocRef2;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in PDFButton widget.
  String? workPlaceName2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    planNameFocusNode?.dispose();
    planNameTextController?.dispose();
  }
}
