import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_product_page_widget.dart' show UpdateProductPageWidget;
import 'package:flutter/material.dart';

class UpdateProductPageModel extends FlutterFlowModel<UpdateProductPageWidget> {
  ///  Local state fields for this page.

  List<ProductFieldsRecord> fields = [];
  void addToFields(ProductFieldsRecord item) => fields.add(item);
  void removeFromFields(ProductFieldsRecord item) => fields.remove(item);
  void removeAtIndexFromFields(int index) => fields.removeAt(index);
  void insertAtIndexInFields(int index, ProductFieldsRecord item) =>
      fields.insert(index, item);
  void updateFieldsAtIndex(int index, Function(ProductFieldsRecord) updateFn) =>
      fields[index] = updateFn(fields[index]);

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in UpdateProductPage widget.
  List<ProductFieldsRecord>? allFields;
  // State field(s) for TextFieldTitle widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  String? _textFieldTitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue1;
  FormFieldController<String>? dropDownUnitValueController1;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DropDownUnit widget.
  String? dropDownUnitValue2;
  FormFieldController<String>? dropDownUnitValueController2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateField;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductFieldsRecord? fieldProduct;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateCopy;

  @override
  void initState(BuildContext context) {
    textFieldTitleTextControllerValidator =
        _textFieldTitleTextControllerValidator;
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();
  }
}
