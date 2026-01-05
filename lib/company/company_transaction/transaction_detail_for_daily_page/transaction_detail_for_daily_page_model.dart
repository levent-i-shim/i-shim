import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_detail_for_daily_page_widget.dart'
    show TransactionDetailForDailyPageWidget;
import 'package:flutter/material.dart';

class TransactionDetailForDailyPageModel
    extends FlutterFlowModel<TransactionDetailForDailyPageWidget> {
  ///  Local state fields for this page.

  String toWhom = ' ';

  String description = ' ';

  String tc = ' ';

  double? value = 0.0;

  String type = ' ';

  bool showStocks = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in TransactionDetailForDailyPage widget.
  CompanyIncomes2025Record? income;
  // Stores action output result for [Backend Call - Read Document] action in TransactionDetailForDailyPage widget.
  CompanyPayments2025Record? payment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
