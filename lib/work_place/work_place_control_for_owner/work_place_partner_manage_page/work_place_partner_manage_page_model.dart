import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'work_place_partner_manage_page_widget.dart'
    show WorkPlacePartnerManagePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkPlacePartnerManagePageModel
    extends FlutterFlowModel<WorkPlacePartnerManagePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchCanViewExpense widget.
  bool? switchCanViewExpenseValue;
  // State field(s) for SwitchCanAddManuelExpenseIncome widget.
  bool? switchCanAddManuelExpenseIncomeValue;
  // State field(s) for SwitchCanManageTransaction widget.
  bool? switchCanManageTransactionValue;
  // State field(s) for SwitchCanViewExpanditury widget.
  bool? switchCanViewExpandituryValue;
  // State field(s) for SwitcCanSpendMoney widget.
  bool? switcCanSpendMoneyValue;
  // State field(s) for SwitchCanViewVehicles widget.
  bool? switchCanViewVehiclesValue;
  // State field(s) for SwitchCanManageVehicles widget.
  bool? switchCanManageVehiclesValue;
  // State field(s) for SwitchCanViewTask widget.
  bool? switchCanViewTaskValue;
  // State field(s) for SwitchCanCreateTask widget.
  bool? switchCanCreateTaskValue;
  // State field(s) for SwitchCanManageTask widget.
  bool? switchCanManageTaskValue;
  // State field(s) for SwitchCanViewStock widget.
  bool? switchCanViewStockValue;
  // State field(s) for SwitchCanManageStock widget.
  bool? switchCanManageStockValue;
  // State field(s) for SwitchCanViewForms widget.
  bool? switchCanViewFormsValue;
  // State field(s) for SwitchCanManageForms widget.
  bool? switchCanManageFormsValue;
  // State field(s) for SwitchCanManageDepartments widget.
  bool? switchCanManageDepartmentsValue;
  // State field(s) for SwitchCanManageRoles widget.
  bool? switchCanManageRolesValue;
  // State field(s) for SwitchCanManageUnits widget.
  bool? switchCanManageUnitsValue;
  // State field(s) for SwitchCanCreateInstructions widget.
  bool? switchCanCreateInstructionsValue;
  // State field(s) for SwitchCanViewInstructions widget.
  bool? switchCanViewInstructionsValue;
  // State field(s) for SwitchCanManageUsers widget.
  bool? switchCanManageUsersValue;
  // State field(s) for SwitchCanViewUser widget.
  bool? switchCanViewUserValue;
  // State field(s) for SwitchCanCalculateCost widget.
  bool? switchCanCalculateCostValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
