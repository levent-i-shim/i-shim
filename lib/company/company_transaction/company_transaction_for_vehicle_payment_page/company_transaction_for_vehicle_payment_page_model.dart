import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'company_transaction_for_vehicle_payment_page_widget.dart'
    show CompanyTransactionForVehiclePaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyTransactionForVehiclePaymentPageModel
    extends FlutterFlowModel<CompanyTransactionForVehiclePaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyReject;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerReject;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlaceTransaction;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyExpense;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerExpense;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlaceTransaction2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacePayments2025Record? payment2workPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyPayments2025Record? payment2;
  // Stores action output result for [Custom Action - calculateCostVehicle] action in Button widget.
  List<double>? average;
  // Stores action output result for [Custom Action - calculateCostVehicle] action in Button widget.
  List<double>? average2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceNotificationsRecord? workPlaceNotifications;
  // State field(s) for DropDownStock widget.
  String? dropDownStockValue;
  FormFieldController<String>? dropDownStockValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'TextField is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate5;
  // Stores action output result for [Custom Action - getStockDocRef] action in Button widget.
  DocumentReference? stockDocRef3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StockMovementRecord? stockMovement3;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate6;
  // Stores action output result for [Custom Action - getStockDocRef] action in Button widget.
  DocumentReference? stockDocRef4;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StockMovementRecord? stockMovement4;

  @override
  void initState(BuildContext context) {
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
