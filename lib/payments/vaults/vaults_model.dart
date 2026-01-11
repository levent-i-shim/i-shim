import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finance_notes/options_check_company/options_check_company_widget.dart';
import '/finance_notes/options_check_paid/options_check_paid_widget.dart';
import '/finance_notes/options_check_unpaid/options_check_unpaid_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'vaults_widget.dart' show VaultsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VaultsModel extends FlutterFlowModel<VaultsWidget> {
  ///  Local state fields for this page.

  int? indexTotal = 0;

  double? totalSpending = 0.0;

  List<double> listOfValues = [];
  void addToListOfValues(double item) => listOfValues.add(item);
  void removeFromListOfValues(double item) => listOfValues.remove(item);
  void removeAtIndexFromListOfValues(int index) => listOfValues.removeAt(index);
  void insertAtIndexInListOfValues(int index, double item) =>
      listOfValues.insert(index, item);
  void updateListOfValuesAtIndex(int index, Function(double) updateFn) =>
      listOfValues[index] = updateFn(listOfValues[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for whichCompaniesDropDownCheck1 widget.
  String? whichCompaniesDropDownCheck1Value;
  FormFieldController<String>? whichCompaniesDropDownCheck1ValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDownCheck1 widget.
  DocumentReference? companyRefFromDDCheck1;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDownCheck1 widget.
  List<FinancialNoteCompanyCheckRecord>? checkRefToGetValues;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDownCheck1 widget.
  int? expenseCompanyCheckCount;
  // State field(s) for workPlaceDropDownX widget.
  String? workPlaceDropDownXValue;
  FormFieldController<String>? workPlaceDropDownXValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in workPlaceDropDownX widget.
  DocumentReference? companyRefFromDDCheck5;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlaceDropDownX widget.
  DocumentReference? workPlaceRefFromDD;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDownX widget.
  List<FinancialNoteCompanyCheckRecord>? checkRefToGetValues5;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDownX widget.
  int? expenseCompanyCheckCount5;
  // State field(s) for whichCompaniesDropDownCheck2 widget.
  String? whichCompaniesDropDownCheck2Value;
  FormFieldController<String>? whichCompaniesDropDownCheck2ValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDownCheck2 widget.
  DocumentReference? companyRefFromDDCheck2;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDownCheck2 widget.
  List<FinancialNoteCompanyCheckRecord>? checkRefToGetValues2;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDownCheck2 widget.
  int? expenseCompanyCheckCount2;
  // State field(s) for workPlaceDropDownXY widget.
  String? workPlaceDropDownXYValue;
  FormFieldController<String>? workPlaceDropDownXYValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in workPlaceDropDownXY widget.
  DocumentReference? companyRefFromDDCheck6;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlaceDropDownXY widget.
  DocumentReference? workPlaceRefFromDDXY;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDownXY widget.
  List<FinancialNoteCompanyCheckRecord>? checkRefToGetValues6;
  // Stores action output result for [Firestore Query - Query a collection] action in workPlaceDropDownXY widget.
  int? expenseCompanyCheckCount6;
  // State field(s) for whichCompaniesDropDownCheck3 widget.
  String? whichCompaniesDropDownCheck3Value;
  FormFieldController<String>? whichCompaniesDropDownCheck3ValueController;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDownCheck3 widget.
  DocumentReference? companyRefFromDDCheck3;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // State field(s) for incomeOrExpense widget.
  String? incomeOrExpenseValue;
  FormFieldController<String>? incomeOrExpenseValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
