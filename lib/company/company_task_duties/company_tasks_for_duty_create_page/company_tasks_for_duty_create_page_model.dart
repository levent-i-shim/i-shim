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
import '/index.dart';
import 'company_tasks_for_duty_create_page_widget.dart'
    show CompanyTasksForDutyCreatePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyTasksForDutyCreatePageModel
    extends FlutterFlowModel<CompanyTasksForDutyCreatePageWidget> {
  ///  Local state fields for this page.

  List<CompanyTaskDutiesRecord> companyTaskDutiesPageState = [];
  void addToCompanyTaskDutiesPageState(CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.add(item);
  void removeFromCompanyTaskDutiesPageState(CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.remove(item);
  void removeAtIndexFromCompanyTaskDutiesPageState(int index) =>
      companyTaskDutiesPageState.removeAt(index);
  void insertAtIndexInCompanyTaskDutiesPageState(
          int index, CompanyTaskDutiesRecord item) =>
      companyTaskDutiesPageState.insert(index, item);
  void updateCompanyTaskDutiesPageStateAtIndex(
          int index, Function(CompanyTaskDutiesRecord) updateFn) =>
      companyTaskDutiesPageState[index] =
          updateFn(companyTaskDutiesPageState[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in CompanyTasksForDutyCreatePage widget.
  List<CompanyTaskDutiesRecord>? dutiesCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getFormRef] action in Button widget.
  DocumentReference? formRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DutiesForCompanyRecord? dutiesForCompanyForName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTaskDutiesRecord? workPlaceTaskDuties;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTaskDutiesRecord? companyTaskDuties;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkHistoryRecord? workHistory;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  WorkHistoryRecord? workHistoryForReceiver;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
