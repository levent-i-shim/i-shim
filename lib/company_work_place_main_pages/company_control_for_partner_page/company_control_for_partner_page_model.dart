import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_control_for_partner_page_widget.dart'
    show CompanyControlForPartnerPageWidget;
import 'package:flutter/material.dart';

class CompanyControlForPartnerPageModel
    extends FlutterFlowModel<CompanyControlForPartnerPageWidget> {
  ///  Local state fields for this page.

  double? dailyMoney = 0.0;

  double? dailyWeek = 0.0;

  double? day15Money = 0.0;

  double? monthlyWeek = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CompanyControlForPartnerPage widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getCompanyBudget] action in CompanyControlForPartnerPage widget.
  BudgetStruct? budget;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
