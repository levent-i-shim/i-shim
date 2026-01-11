import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'choose_new_department_widget.dart' show ChooseNewDepartmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseNewDepartmentModel
    extends FlutterFlowModel<ChooseNewDepartmentWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> newDepartmentList = [];
  void addToNewDepartmentList(DocumentReference item) =>
      newDepartmentList.add(item);
  void removeFromNewDepartmentList(DocumentReference item) =>
      newDepartmentList.remove(item);
  void removeAtIndexFromNewDepartmentList(int index) =>
      newDepartmentList.removeAt(index);
  void insertAtIndexInNewDepartmentList(int index, DocumentReference item) =>
      newDepartmentList.insert(index, item);
  void updateNewDepartmentListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newDepartmentList[index] = updateFn(newDepartmentList[index]);

  bool isAuthorizedByDepartment = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in Button widget.
  DocumentReference? newDepartment;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workers;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workersCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
