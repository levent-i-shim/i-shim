import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'work_place_home_page_for_owner_widget.dart'
    show WorkPlaceHomePageForOwnerWidget;
import 'package:flutter/material.dart';

class WorkPlaceHomePageForOwnerModel
    extends FlutterFlowModel<WorkPlaceHomePageForOwnerWidget> {
  ///  Local state fields for this page.

  double? dailyMoney = 0.0;

  double? weeklyMoney = 0.0;

  double? day15Money = 0.0;

  double? monthlyMoney = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getWorkPlaceBudget] action in WorkPlaceHomePageForOwner widget.
  BudgetStruct? budget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
