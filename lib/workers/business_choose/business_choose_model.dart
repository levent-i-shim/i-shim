import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'business_choose_widget.dart' show BusinessChooseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
