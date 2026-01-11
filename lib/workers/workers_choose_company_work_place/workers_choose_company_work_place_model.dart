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
import 'workers_choose_company_work_place_widget.dart'
    show WorkersChooseCompanyWorkPlaceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkersChooseCompanyWorkPlaceModel
    extends FlutterFlowModel<WorkersChooseCompanyWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in companiesDropDown widget.
  DocumentReference? companyRefFromDD;
  // State field(s) for workPlacesDropDown widget.
  String? workPlacesDropDownValue;
  FormFieldController<String>? workPlacesDropDownValueController;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlacesDropDown widget.
  DocumentReference? workPlaceRefFromDD;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Container widget.
  DocumentReference? companyRefCustomActionOutput;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Container widget.
  DocumentReference? workPlaceRefCustomActionOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
