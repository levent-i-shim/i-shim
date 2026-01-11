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
import 'add_role_page_widget.dart' show AddRolePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRolePageModel extends FlutterFlowModel<AddRolePageWidget> {
  ///  Local state fields for this page.

  List<WorkPlacesRecord> roles = [];
  void addToRoles(WorkPlacesRecord item) => roles.add(item);
  void removeFromRoles(WorkPlacesRecord item) => roles.remove(item);
  void removeAtIndexFromRoles(int index) => roles.removeAt(index);
  void insertAtIndexInRoles(int index, WorkPlacesRecord item) =>
      roles.insert(index, item);
  void updateRolesAtIndex(int index, Function(WorkPlacesRecord) updateFn) =>
      roles[index] = updateFn(roles[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AddRolePage widget.
  List<WorkPlacesRecord>? workPlaces;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Rol Adı is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceRolesRecord? ref;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyRolesRecord? companyRole;

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
