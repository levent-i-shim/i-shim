import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_confirmation_choose_company_page_widget.dart'
    show CompanyConfirmationChooseCompanyPageWidget;
import 'package:flutter/material.dart';

class CompanyConfirmationChooseCompanyPageModel
    extends FlutterFlowModel<CompanyConfirmationChooseCompanyPageWidget> {
  ///  Local state fields for this page.

  List<CompaniesStruct> companies = [];
  void addToCompanies(CompaniesStruct item) => companies.add(item);
  void removeFromCompanies(CompaniesStruct item) => companies.remove(item);
  void removeAtIndexFromCompanies(int index) => companies.removeAt(index);
  void insertAtIndexInCompanies(int index, CompaniesStruct item) =>
      companies.insert(index, item);
  void updateCompaniesAtIndex(int index, Function(CompaniesStruct) updateFn) =>
      companies[index] = updateFn(companies[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CompanyConfirmationChooseCompanyPage widget.
  List<CompaniesRecord>? owner;
  // Stores action output result for [Firestore Query - Query a collection] action in CompanyConfirmationChooseCompanyPage widget.
  List<MyWorkedWorkPlaceRecord>? myWorked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
