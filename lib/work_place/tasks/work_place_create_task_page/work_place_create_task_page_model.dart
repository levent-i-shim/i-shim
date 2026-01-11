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
import 'work_place_create_task_page_widget.dart'
    show WorkPlaceCreateTaskPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkPlaceCreateTaskPageModel
    extends FlutterFlowModel<WorkPlaceCreateTaskPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> whoCanSee = [];
  void addToWhoCanSee(DocumentReference item) => whoCanSee.add(item);
  void removeFromWhoCanSee(DocumentReference item) => whoCanSee.remove(item);
  void removeAtIndexFromWhoCanSee(int index) => whoCanSee.removeAt(index);
  void insertAtIndexInWhoCanSee(int index, DocumentReference item) =>
      whoCanSee.insert(index, item);
  void updateWhoCanSeeAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      whoCanSee[index] = updateFn(whoCanSee[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Görev Adı is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Görev Açıklaması is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDownWhoCanSee widget.
  List<String>? dropDownWhoCanSeeValue;
  FormFieldController<List<String>>? dropDownWhoCanSeeValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getFormRef] action in Button widget.
  DocumentReference? formRef;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRefWhoCanSee;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTasksRecord? workPlaceTask;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTasksRecord? deneme;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
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
