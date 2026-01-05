import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'confirmation_media_save_location_widget.dart'
    show ConfirmationMediaSaveLocationWidget;
import 'package:flutter/material.dart';

class ConfirmationMediaSaveLocationModel
    extends FlutterFlowModel<ConfirmationMediaSaveLocationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Custom Action - requestGalleryPermission] action in RadioButton widget.
  bool? result;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
