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
import 'add_department_widget.dart' show AddDepartmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDepartmentModel extends FlutterFlowModel<AddDepartmentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Şirket Adı is required';
    }

    if (val.length < 3) {
      return 'Lütfen Geçerli Bir şirket ismi Giriniz';
    }

    return null;
  }

  // State field(s) for TextFieldType widget.
  FocusNode? textFieldTypeFocusNode;
  TextEditingController? textFieldTypeTextController;
  String? Function(BuildContext, String?)? textFieldTypeTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlaceDocRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceDepartmentRecord? ref;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyDepartmentsRecord? companyDepartment;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldTypeFocusNode?.dispose();
    textFieldTypeTextController?.dispose();
  }
}
