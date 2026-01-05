import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_unit_page_work_place_widget.dart' show AddUnitPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class AddUnitPageWorkPlaceModel
    extends FlutterFlowModel<AddUnitPageWorkPlaceWidget> {
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

  // State field(s) for DropDownDepartment widget.
  String? dropDownDepartmentValue;
  FormFieldController<String>? dropDownDepartmentValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getDepartmentDocRef] action in Button widget.
  DocumentReference? depRef;
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
