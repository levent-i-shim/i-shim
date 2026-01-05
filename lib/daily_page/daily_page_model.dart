import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'daily_page_widget.dart' show DailyPageWidget;
import 'package:flutter/material.dart';

class DailyPageModel extends FlutterFlowModel<DailyPageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  List<AjandaRecord> dailyPageState = [];
  void addToDailyPageState(AjandaRecord item) => dailyPageState.add(item);
  void removeFromDailyPageState(AjandaRecord item) =>
      dailyPageState.remove(item);
  void removeAtIndexFromDailyPageState(int index) =>
      dailyPageState.removeAt(index);
  void insertAtIndexInDailyPageState(int index, AjandaRecord item) =>
      dailyPageState.insert(index, item);
  void updateDailyPageStateAtIndex(
          int index, Function(AjandaRecord) updateFn) =>
      dailyPageState[index] = updateFn(dailyPageState[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getToday] action in DailyPage widget.
  DateTime? today;
  // Stores action output result for [Custom Action - addOneDay] action in DailyPage widget.
  DateTime? addedOneDayCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in DailyPage widget.
  List<AjandaRecord>? dailyReportsCopy;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Custom Action - addOneDay] action in Calendar widget.
  DateTime? addedOneDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<AjandaRecord>? dailyReports;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTasksRecord? companyTask;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<FormFieldsRecord>? formFields;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  DutiesForCompanyRecord? companyDuty;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTasksRecord? companyTaskSendReport;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTaskDutiesRecord? companyTaskDutySendReport;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTasksRecord? companyTaskCreateTask;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  DutiesForCompanyRecord? companyDutyCreateDuty;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyDepartmentsRecord? companyDepartment;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyRolesRecord? companyRole;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyUnitsRecord? companyUnit;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTaskDutiesRecord? companyTaskDuties;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  FormsRecord? form;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  SentMoneyForAllowenceRecord? sentExpanditury;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  SpentMoneyForAllowenceRecord? spendExpanditury;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyTransactionsRecord? transaction;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  ConfirmationsRecord? confirmation;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  StocksRecord? stock;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  StockMovementRecord? stockMovement;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CurrentAccountRecord? currentAccountCreated;
  // Stores action output result for [Custom Action - isEqual] action in Icon widget.
  bool? amISideOnePartner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company3;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail3;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user3;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail3;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company4;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail4;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user4;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail4;
  // Stores action output result for [Custom Action - getCurrentAccountDocRef] action in Icon widget.
  DocumentReference? currentAccountBill;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CurrentAccountBillRecord? bill;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CurrentAccountRecord? currentAccountForBill;
  // Stores action output result for [Custom Action - isEqual] action in Icon widget.
  bool? amISideOne;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company5;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail5;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user5;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail5;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Icon widget.
  DocumentReference? company6;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompaniesRecord? companyDetail6;
  // Stores action output result for [Custom Action - getUserDocRef] action in Icon widget.
  DocumentReference? user6;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  UsersRecord? userDetail6;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  NotesRecord? not;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
