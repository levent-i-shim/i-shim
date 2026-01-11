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
import '/index.dart';
import 'create_new_confirmation_widget.dart' show CreateNewConfirmationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateNewConfirmationModel
    extends FlutterFlowModel<CreateNewConfirmationWidget> {
  ///  Local state fields for this page.

  List<UsersDataStruct> usersForDropdown = [];
  void addToUsersForDropdown(UsersDataStruct item) =>
      usersForDropdown.add(item);
  void removeFromUsersForDropdown(UsersDataStruct item) =>
      usersForDropdown.remove(item);
  void removeAtIndexFromUsersForDropdown(int index) =>
      usersForDropdown.removeAt(index);
  void insertAtIndexInUsersForDropdown(int index, UsersDataStruct item) =>
      usersForDropdown.insert(index, item);
  void updateUsersForDropdownAtIndex(
          int index, Function(UsersDataStruct) updateFn) =>
      usersForDropdown[index] = updateFn(usersForDropdown[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in createNewConfirmation widget.
  List<CompanyWorkersRecord>? users;
  // Stores action output result for [Backend Call - Read Document] action in createNewConfirmation widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in createNewConfirmation widget.
  UsersRecord? owner;
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
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? receiverUserRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ConfirmationsRecord? confirmation;

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
