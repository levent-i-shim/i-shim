import '/auth/firebase_auth/auth_util.dart';
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
import 'personal_c_p_a_widget.dart' show PersonalCPAWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalCPAModel extends FlutterFlowModel<PersonalCPAWidget> {
  ///  Local state fields for this page.

  bool amIsideOne = false;

  double? dailyMoney = 0.0;

  double? weeklyMoney = 0.0;

  double? day15Money = 0.0;

  double? monthlyMoney = 0.0;

  int? indexTotalForBill = 0;

  double? totalForBill = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in companiesDropDown widget.
  DocumentReference? companyRefFromDDForBill;
  // Stores action output result for [Firestore Query - Query a collection] action in companiesDropDown widget.
  List<CompanyBillRecord>? billListToGetValues;
  // Stores action output result for [Firestore Query - Query a collection] action in companiesDropDown widget.
  int? billCount;
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
