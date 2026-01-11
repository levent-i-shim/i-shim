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
import 'work_place_task_duties_create_page_widget.dart'
    show WorkPlaceTaskDutiesCreatePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkPlaceTaskDutiesCreatePageModel
    extends FlutterFlowModel<WorkPlaceTaskDutiesCreatePageWidget> {
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
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRefWhoCanSEe;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DutiesForWorkPlaceRecord? dutiesForWorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DutiesForCompanyRecord? dutiesForCompany;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
