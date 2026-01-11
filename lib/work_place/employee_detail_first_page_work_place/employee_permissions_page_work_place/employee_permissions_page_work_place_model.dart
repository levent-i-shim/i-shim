import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'employee_permissions_page_work_place_widget.dart'
    show EmployeePermissionsPageWorkPlaceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmployeePermissionsPageWorkPlaceModel
    extends FlutterFlowModel<EmployeePermissionsPageWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchForm widget.
  bool? switchFormValue;
  // State field(s) for SwitchRole widget.
  bool? switchRoleValue;
  // State field(s) for SwitchUnit widget.
  bool? switchUnitValue;
  // State field(s) for SwitchDepartment widget.
  bool? switchDepartmentValue;
  // State field(s) for SwitchVehicleAuthority widget.
  bool? switchVehicleAuthorityValue;
  // State field(s) for SwitchStock widget.
  bool? switchStockValue;
  // State field(s) for SwitchExpanditury widget.
  bool? switchExpandituryValue;
  // State field(s) for SwitchCurrentAccount widget.
  bool? switchCurrentAccountValue;
  // State field(s) for SwitchManageUser widget.
  bool? switchManageUserValue;
  // State field(s) for SwitchCreateTask widget.
  bool? switchCreateTaskValue;
  // State field(s) for SwitchManageReports widget.
  bool? switchManageReportsValue;
  // State field(s) for SwitchSendMoney widget.
  bool? switchSendMoneyValue;
  // State field(s) for SwitchCanViewIncomeExpense widget.
  bool? switchCanViewIncomeExpenseValue;
  // State field(s) for SwitchCanAddManuelExpenseIncome widget.
  bool? switchCanAddManuelExpenseIncomeValue;
  // State field(s) for SwitchCanViewEmployee widget.
  bool? switchCanViewEmployeeValue;
  // State field(s) for switchCanSendInstruction widget.
  bool? switchCanSendInstructionValue;
  // State field(s) for switchCanAddCostAccount widget.
  bool? switchCanAddCostAccountValue;
  // State field(s) for switchCanViewNotes widget.
  bool? switchCanViewNotesValue;
  // State field(s) for switchCanManageNotes widget.
  bool? switchCanManageNotesValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
