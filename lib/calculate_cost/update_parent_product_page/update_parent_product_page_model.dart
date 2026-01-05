import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_parent_product_page_widget.dart'
    show UpdateParentProductPageWidget;
import 'package:flutter/material.dart';

class UpdateParentProductPageModel
    extends FlutterFlowModel<UpdateParentProductPageWidget> {
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

  final formKey = GlobalKey<FormState>();
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

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;

  @override
  void initState(BuildContext context) {
    textFieldTitleTextControllerValidator =
        _textFieldTitleTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();
  }
}
