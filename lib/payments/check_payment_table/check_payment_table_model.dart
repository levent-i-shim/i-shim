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
import 'check_payment_table_widget.dart' show CheckPaymentTableWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckPaymentTableModel extends FlutterFlowModel<CheckPaymentTableWidget> {
  ///  Local state fields for this page.

  int? indexTotal;

  double? totalSpending;

  List<double> listOfValuesForPayment = [];
  void addToListOfValuesForPayment(double item) =>
      listOfValuesForPayment.add(item);
  void removeFromListOfValuesForPayment(double item) =>
      listOfValuesForPayment.remove(item);
  void removeAtIndexFromListOfValuesForPayment(int index) =>
      listOfValuesForPayment.removeAt(index);
  void insertAtIndexInListOfValuesForPayment(int index, double item) =>
      listOfValuesForPayment.insert(index, item);
  void updateListOfValuesForPaymentAtIndex(
          int index, Function(double) updateFn) =>
      listOfValuesForPayment[index] = updateFn(listOfValuesForPayment[index]);

  DocumentReference? whichCurrentAccountRef;

  ///  State fields for stateful widgets in this page.

  // State field(s) for compannyOrWorkPlace widget.
  String? compannyOrWorkPlaceValue;
  FormFieldController<String>? compannyOrWorkPlaceValueController;
  // State field(s) for whichCompaniesDropDown widget.
  String? whichCompaniesDropDownValue;
  FormFieldController<String>? whichCompaniesDropDownValueController;
  List<CompaniesRecord>? whichCompaniesDropDownPreviousSnapshot;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDown widget.
  DocumentReference? whichCompanyIdFromDD;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  int? countFinancialNoteCompany;
  // Stores action output result for [Firestore Query - Query a collection] action in whichCompaniesDropDown widget.
  List<FinancialNoteCompanyRecord>? listofFinancialNotes;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // State field(s) for paymentOrCollection widget.
  String? paymentOrCollectionValue;
  FormFieldController<String>? paymentOrCollectionValueController;
  // State field(s) for hasBillOrNot widget.
  String? hasBillOrNotValue;
  FormFieldController<String>? hasBillOrNotValueController;
  // State field(s) for timeRange widget.
  String? timeRangeValue;
  FormFieldController<String>? timeRangeValueController;
  // State field(s) for tableValuesDropDown widget.
  List<String>? tableValuesDropDownValue;
  FormFieldController<List<String>>? tableValuesDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
