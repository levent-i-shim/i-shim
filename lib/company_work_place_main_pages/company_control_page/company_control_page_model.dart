import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_control_page_widget.dart' show CompanyControlPageWidget;
import 'package:flutter/material.dart';

class CompanyControlPageModel
    extends FlutterFlowModel<CompanyControlPageWidget> {
  ///  Local state fields for this page.

  bool amIsideOne = false;

  double? dailyMoney = 0.0;

  double? weeklyMoney = 0.0;

  double? day15Money = 0.0;

  double? monthlyMoney = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCompanyBudget] action in CompanyControlPage widget.
  BudgetStruct? budget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
