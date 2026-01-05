import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'show_all_reports_page_widget.dart' show ShowAllReportsPageWidget;
import 'package:flutter/material.dart';

class ShowAllReportsPageModel
    extends FlutterFlowModel<ShowAllReportsPageWidget> {
  ///  Local state fields for this page.

  List<CompanyReportsRecord> allCompanyReports = [];
  void addToAllCompanyReports(CompanyReportsRecord item) =>
      allCompanyReports.add(item);
  void removeFromAllCompanyReports(CompanyReportsRecord item) =>
      allCompanyReports.remove(item);
  void removeAtIndexFromAllCompanyReports(int index) =>
      allCompanyReports.removeAt(index);
  void insertAtIndexInAllCompanyReports(int index, CompanyReportsRecord item) =>
      allCompanyReports.insert(index, item);
  void updateAllCompanyReportsAtIndex(
          int index, Function(CompanyReportsRecord) updateFn) =>
      allCompanyReports[index] = updateFn(allCompanyReports[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ShowAllReportsPage widget.
  List<CompaniesRecord>? myCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in ShowAllReportsPage widget.
  List<CompanyReportsRecord>? allReports;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
