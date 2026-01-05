import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_sold_page_widget.dart' show AddSoldPageWidget;
import 'package:flutter/material.dart';

class AddSoldPageModel extends FlutterFlowModel<AddSoldPageWidget> {
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

  double remainingQuantity = 0.0;

  CurrentAccountRecord? currentAccountDocument;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AddSoldPage widget.
  List<CurrentAccountRecord>? currentAccounts;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for TextFieldQuantity widget.
  FocusNode? textFieldQuantityFocusNode;
  TextEditingController? textFieldQuantityTextController;
  String? Function(BuildContext, String?)?
      textFieldQuantityTextControllerValidator;
  String? _textFieldQuantityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Satılacak Miktarı Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldValuePerUnit widget.
  FocusNode? textFieldValuePerUnitFocusNode;
  TextEditingController? textFieldValuePerUnitTextController;
  String? Function(BuildContext, String?)?
      textFieldValuePerUnitTextControllerValidator;
  String? _textFieldValuePerUnitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Birim Fiyatı Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldPurchaseType widget.
  FocusNode? textFieldPurchaseTypeFocusNode1;
  TextEditingController? textFieldPurchaseTypeTextController1;
  String? Function(BuildContext, String?)?
      textFieldPurchaseTypeTextController1Validator;
  // State field(s) for TextFieldNot widget.
  FocusNode? textFieldNotFocusNode;
  TextEditingController? textFieldNotTextController;
  String? Function(BuildContext, String?)? textFieldNotTextControllerValidator;
  String? _textFieldNotTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Notunuzu Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for DropDownKdv widget.
  String? dropDownKdvValue;
  FormFieldController<String>? dropDownKdvValueController;
  // State field(s) for DropDownTevkifat widget.
  String? dropDownTevkifatValue;
  FormFieldController<String>? dropDownTevkifatValueController;
  // State field(s) for TextFieldPurchaseType widget.
  FocusNode? textFieldPurchaseTypeFocusNode2;
  TextEditingController? textFieldPurchaseTypeTextController2;
  String? Function(BuildContext, String?)?
      textFieldPurchaseTypeTextController2Validator;
  DateTime? datePicked;
  // State field(s) for DropDownCurrentAcount widget.
  String? dropDownCurrentAcountValue;
  FormFieldController<String>? dropDownCurrentAcountValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountActivityRecord? activity;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountBillRecord? bill2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceIncomes2025Record? workPlaceIncome;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyIncomes2025Record? companyIncome;

  @override
  void initState(BuildContext context) {
    textFieldQuantityTextControllerValidator =
        _textFieldQuantityTextControllerValidator;
    textFieldValuePerUnitTextControllerValidator =
        _textFieldValuePerUnitTextControllerValidator;
    textFieldNotTextControllerValidator = _textFieldNotTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldQuantityFocusNode?.dispose();
    textFieldQuantityTextController?.dispose();

    textFieldValuePerUnitFocusNode?.dispose();
    textFieldValuePerUnitTextController?.dispose();

    textFieldPurchaseTypeFocusNode1?.dispose();
    textFieldPurchaseTypeTextController1?.dispose();

    textFieldNotFocusNode?.dispose();
    textFieldNotTextController?.dispose();

    textFieldPurchaseTypeFocusNode2?.dispose();
    textFieldPurchaseTypeTextController2?.dispose();
  }
}
