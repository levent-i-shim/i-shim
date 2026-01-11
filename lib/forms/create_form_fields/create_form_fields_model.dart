import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'create_form_fields_widget.dart' show CreateFormFieldsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateFormFieldsModel extends FlutterFlowModel<CreateFormFieldsWidget> {
  ///  Local state fields for this page.

  List<FormFieldsRecord> formFieldsPageState = [];
  void addToFormFieldsPageState(FormFieldsRecord item) =>
      formFieldsPageState.add(item);
  void removeFromFormFieldsPageState(FormFieldsRecord item) =>
      formFieldsPageState.remove(item);
  void removeAtIndexFromFormFieldsPageState(int index) =>
      formFieldsPageState.removeAt(index);
  void insertAtIndexInFormFieldsPageState(int index, FormFieldsRecord item) =>
      formFieldsPageState.insert(index, item);
  void updateFormFieldsPageStateAtIndex(
          int index, Function(FormFieldsRecord) updateFn) =>
      formFieldsPageState[index] = updateFn(formFieldsPageState[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CreateFormFields widget.
  List<FormFieldsRecord>? formFieldsCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Custom Action - setOptionsForForm] action in Button widget.
  List<String>? options;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FormFieldsRecord? formFieldAdded2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FormFieldsRecord? formFieldAdded;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
