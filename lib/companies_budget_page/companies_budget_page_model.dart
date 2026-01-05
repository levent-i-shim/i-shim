import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'companies_budget_page_widget.dart' show CompaniesBudgetPageWidget;
import 'package:flutter/material.dart';

class CompaniesBudgetPageModel
    extends FlutterFlowModel<CompaniesBudgetPageWidget> {
  ///  Local state fields for this page.

  List<CompanyBudgetStruct> companyBudget = [];
  void addToCompanyBudget(CompanyBudgetStruct item) => companyBudget.add(item);
  void removeFromCompanyBudget(CompanyBudgetStruct item) =>
      companyBudget.remove(item);
  void removeAtIndexFromCompanyBudget(int index) =>
      companyBudget.removeAt(index);
  void insertAtIndexInCompanyBudget(int index, CompanyBudgetStruct item) =>
      companyBudget.insert(index, item);
  void updateCompanyBudgetAtIndex(
          int index, Function(CompanyBudgetStruct) updateFn) =>
      companyBudget[index] = updateFn(companyBudget[index]);

  double? totalIncome = 0.0;

  double? totalPayment = 0.0;

  double? totalSalary = 0.0;

  double? totalExpanditury = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getYesterdayCompanyFinancials] action in CompaniesBudgetPage widget.
  CompanyBudgetStruct? companyBudgetAdd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
