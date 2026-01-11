import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'current_account_create_bill_page_widget.dart'
    show CurrentAccountCreateBillPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentAccountCreateBillPageModel
    extends FlutterFlowModel<CurrentAccountCreateBillPageWidget> {
  ///  Local state fields for this page.

  List<CurrentAccountActivityRecord> activities = [];
  void addToActivities(CurrentAccountActivityRecord item) =>
      activities.add(item);
  void removeFromActivities(CurrentAccountActivityRecord item) =>
      activities.remove(item);
  void removeAtIndexFromActivities(int index) => activities.removeAt(index);
  void insertAtIndexInActivities(
          int index, CurrentAccountActivityRecord item) =>
      activities.insert(index, item);
  void updateActivitiesAtIndex(
          int index, Function(CurrentAccountActivityRecord) updateFn) =>
      activities[index] = updateFn(activities[index]);

  double totalMoney = 0.0;

  double totalKdv = 0.0;

  double totalTevkifat = 0.0;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldQuantity widget.
  FocusNode? textFieldQuantityFocusNode;
  TextEditingController? textFieldQuantityTextController;
  String? Function(BuildContext, String?)?
      textFieldQuantityTextControllerValidator;
  // State field(s) for TextFieldValuePerUnit widget.
  FocusNode? textFieldValuePerUnitFocusNode;
  TextEditingController? textFieldValuePerUnitTextController;
  String? Function(BuildContext, String?)?
      textFieldValuePerUnitTextControllerValidator;
  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue;
  FormFieldController<String>? dropDownUnitValueController;
  // State field(s) for TextFieldPurchaseType widget.
  FocusNode? textFieldPurchaseTypeFocusNode;
  TextEditingController? textFieldPurchaseTypeTextController;
  String? Function(BuildContext, String?)?
      textFieldPurchaseTypeTextControllerValidator;
  // State field(s) for TextFieldNot widget.
  FocusNode? textFieldNotFocusNode;
  TextEditingController? textFieldNotTextController;
  String? Function(BuildContext, String?)? textFieldNotTextControllerValidator;
  // State field(s) for DropDownKdv widget.
  String? dropDownKdvValue;
  FormFieldController<String>? dropDownKdvValueController;
  // State field(s) for DropDownTevkifat widget.
  String? dropDownTevkifatValue;
  FormFieldController<String>? dropDownTevkifatValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountActivityRecord? activity;
  DateTime? datePicked;
  // State field(s) for SwitchIsSideOneSellerForBill widget.
  bool? switchIsSideOneSellerForBillValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateBill;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountBillRecord? bill2;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOneIncome;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOneIncome;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companySideOnePayment;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userSideOnePayment;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountBillRecord? bill;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldQuantityFocusNode?.dispose();
    textFieldQuantityTextController?.dispose();

    textFieldValuePerUnitFocusNode?.dispose();
    textFieldValuePerUnitTextController?.dispose();

    textFieldPurchaseTypeFocusNode?.dispose();
    textFieldPurchaseTypeTextController?.dispose();

    textFieldNotFocusNode?.dispose();
    textFieldNotTextController?.dispose();
  }
}
