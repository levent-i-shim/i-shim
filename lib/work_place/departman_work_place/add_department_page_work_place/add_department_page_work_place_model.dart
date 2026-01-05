import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_department_page_work_place_widget.dart'
    show AddDepartmentPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class AddDepartmentPageWorkPlaceModel
    extends FlutterFlowModel<AddDepartmentPageWorkPlaceWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Departman Türü is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceDepartmentRecord? departmanRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyDepartmentsRecord? workPlaceDepartment;

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
