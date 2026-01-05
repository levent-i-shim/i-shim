import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'x_current_accounts_personel_widget.dart'
    show XCurrentAccountsPersonelWidget;
import 'package:flutter/material.dart';

class XCurrentAccountsPersonelModel
    extends FlutterFlowModel<XCurrentAccountsPersonelWidget> {
  ///  Local state fields for this page.

  int? capitalNeedItemIndex = 0;

  double? totalCapitalNeed = 0.0;

  int? incomeItemIndex = 0;

  double? plannedIncomeTotal = 0.0;

  int? investmentItemIndex = 0;

  double? investmentTotal = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? countFinacePlans;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<FinancialPlansRecord>? listOfFinancePlans;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? countIncomePlans;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<IncomePlansRecord>? listOfIncomePlans;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  int? countInvestmentPlans;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<InvestmentPlansRecord>? listOfInvestmentPlans;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
