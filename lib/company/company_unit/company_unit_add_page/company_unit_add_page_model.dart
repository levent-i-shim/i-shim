import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'company_unit_add_page_widget.dart' show CompanyUnitAddPageWidget;
import 'package:flutter/material.dart';

class CompanyUnitAddPageModel
    extends FlutterFlowModel<CompanyUnitAddPageWidget> {
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

  // State field(s) for DropDownWorkPlace widget.
  String? dropDownWorkPlaceValue;
  FormFieldController<String>? dropDownWorkPlaceValueController;
  // State field(s) for DropDownDepartment widget.
  String? dropDownDepartmentValue;
  FormFieldController<String>? dropDownDepartmentValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in Button widget.
  DocumentReference? depRef;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlaceRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceUnitsRecord? ref;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyUnitsRecord? companyUnit;

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
