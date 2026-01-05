import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'work_place_control_for_partner_widget.dart'
    show WorkPlaceControlForPartnerWidget;
import 'package:flutter/material.dart';

class WorkPlaceControlForPartnerModel
    extends FlutterFlowModel<WorkPlaceControlForPartnerWidget> {
  ///  Local state fields for this page.

  double? dailyMoney = 0.0;

  double? weeklyMoney = 0.0;

  double? day15Money = 0.0;

  double? monthlyMoney = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in workPlaceControlForPartner widget.
  WorkPlacesRecord? workPlaceDocument;
  // Stores action output result for [Custom Action - getWorkPlaceBudget] action in workPlaceControlForPartner widget.
  BudgetStruct? budget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
