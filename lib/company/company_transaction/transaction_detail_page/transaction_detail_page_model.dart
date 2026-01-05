import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'transaction_detail_page_widget.dart' show TransactionDetailPageWidget;
import 'package:flutter/material.dart';

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
