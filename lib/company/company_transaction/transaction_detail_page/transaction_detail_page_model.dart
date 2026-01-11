import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'transaction_detail_page_widget.dart' show TransactionDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TransactionDetailPageModel
    extends FlutterFlowModel<TransactionDetailPageWidget> {
  ///  Local state fields for this page.

  bool isEnteredIncome = false;

  bool isEnteredPayment = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? company;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlace;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyExpense;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerExpense;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlace2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyReject;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? companyWorkerReject;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlaceTransaction;
  // State field(s) for DropDownStock widget.
  String? dropDownStockValue;
  FormFieldController<String>? dropDownStockValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
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
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate2;
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
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate3;
  // Stores action output result for [Custom Action - getStockDocRef] action in Button widget.
  DocumentReference? stockDocRef2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StockMovementRecord? stockMovement2;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
