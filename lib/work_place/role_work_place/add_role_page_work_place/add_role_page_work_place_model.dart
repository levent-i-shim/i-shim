import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_role_page_work_place_widget.dart' show AddRolePageWorkPlaceWidget;
import 'package:flutter/material.dart';

class AddRolePageWorkPlaceModel
    extends FlutterFlowModel<AddRolePageWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
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
