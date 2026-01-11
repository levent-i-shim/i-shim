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
import '/index.dart';
import 'form_create_graphic_page_widget.dart' show FormCreateGraphicPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormCreateGraphicPageModel
    extends FlutterFlowModel<FormCreateGraphicPageWidget> {
  ///  Local state fields for this page.

  String fieldValueType = 'notSelected';

  List<ConditionDataTypeStruct> conditions = [];
  void addToConditions(ConditionDataTypeStruct item) => conditions.add(item);
  void removeFromConditions(ConditionDataTypeStruct item) =>
      conditions.remove(item);
  void removeAtIndexFromConditions(int index) => conditions.removeAt(index);
  void insertAtIndexInConditions(int index, ConditionDataTypeStruct item) =>
      conditions.insert(index, item);
  void updateConditionsAtIndex(
          int index, Function(ConditionDataTypeStruct) updateFn) =>
      conditions[index] = updateFn(conditions[index]);

  List<String> dropDownItems = [];
  void addToDropDownItems(String item) => dropDownItems.add(item);
  void removeFromDropDownItems(String item) => dropDownItems.remove(item);
  void removeAtIndexFromDropDownItems(int index) =>
      dropDownItems.removeAt(index);
  void insertAtIndexInDropDownItems(int index, String item) =>
      dropDownItems.insert(index, item);
  void updateDropDownItemsAtIndex(int index, Function(String) updateFn) =>
      dropDownItems[index] = updateFn(dropDownItems[index]);

  ///  State fields for stateful widgets in this page.

  final formKey6 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for DropDownFormField widget.
  String? dropDownFormFieldValue;
  FormFieldController<String>? dropDownFormFieldValueController;
  // State field(s) for DropDownDropDownType widget.
  String? dropDownDropDownTypeValue;
  FormFieldController<String>? dropDownDropDownTypeValueController;
  // State field(s) for DropDownDropDownFilter widget.
  String? dropDownDropDownFilterValue;
  FormFieldController<String>? dropDownDropDownFilterValueController;
  // Stores action output result for [Validate Form] action in ButtonDropDown widget.
  bool? validateDropDown;
  // State field(s) for DropDownTextType widget.
  String? dropDownTextTypeValue;
  FormFieldController<String>? dropDownTextTypeValueController;
  // State field(s) for TextFieldTextFilter widget.
  FocusNode? textFieldTextFilterFocusNode;
  TextEditingController? textFieldTextFilterTextController;
  String? Function(BuildContext, String?)?
      textFieldTextFilterTextControllerValidator;
  String? _textFieldTextFilterTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Filtre is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ButtonText widget.
  bool? validateText;
  // State field(s) for DropDownDateType widget.
  String? dropDownDateTypeValue;
  FormFieldController<String>? dropDownDateTypeValueController;
  DateTime? datePicked;
  // Stores action output result for [Validate Form] action in ButtonDate widget.
  bool? validateDate;
  // State field(s) for DropDownBooleanType widget.
  String? dropDownBooleanTypeValue;
  FormFieldController<String>? dropDownBooleanTypeValueController;
  // State field(s) for DropDownBooleanFiiter widget.
  String? dropDownBooleanFiiterValue;
  FormFieldController<String>? dropDownBooleanFiiterValueController;
  // Stores action output result for [Validate Form] action in ButtonBoolean widget.
  bool? validateBoolean;
  // State field(s) for DropDownNumberType widget.
  String? dropDownNumberTypeValue;
  FormFieldController<String>? dropDownNumberTypeValueController;
  // State field(s) for TextFieldNumberFilter widget.
  FocusNode? textFieldNumberFilterFocusNode;
  TextEditingController? textFieldNumberFilterTextController;
  String? Function(BuildContext, String?)?
      textFieldNumberFilterTextControllerValidator;
  String? _textFieldNumberFilterTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Filtre is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ButtonNumber widget.
  bool? validateNumber;
  // State field(s) for DropDownFormFieldX widget.
  String? dropDownFormFieldXValue;
  FormFieldController<String>? dropDownFormFieldXValueController;
  // State field(s) for DropDownFormFieldY widget.
  String? dropDownFormFieldYValue;
  FormFieldController<String>? dropDownFormFieldYValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateGraphic;
  // Stores action output result for [Custom Action - queryFieldValuesAsChartPairs] action in Button widget.
  List<ChartXYPairsStruct>? graphicPairs;

  @override
  void initState(BuildContext context) {
    textFieldTextFilterTextControllerValidator =
        _textFieldTextFilterTextControllerValidator;
    textFieldNumberFilterTextControllerValidator =
        _textFieldNumberFilterTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldTextFilterFocusNode?.dispose();
    textFieldTextFilterTextController?.dispose();

    textFieldNumberFilterFocusNode?.dispose();
    textFieldNumberFilterTextController?.dispose();
  }
}
