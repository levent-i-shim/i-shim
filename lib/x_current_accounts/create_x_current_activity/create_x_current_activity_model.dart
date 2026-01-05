import '/flutter_flow/flutter_flow_util.dart';
import 'create_x_current_activity_widget.dart'
    show CreateXCurrentActivityWidget;
import 'package:flutter/material.dart';

class CreateXCurrentActivityModel
    extends FlutterFlowModel<CreateXCurrentActivityWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for itemTitle widget.
  FocusNode? itemTitleFocusNode;
  TextEditingController? itemTitleTextController;
  String? Function(BuildContext, String?)? itemTitleTextControllerValidator;
  // State field(s) for itemValue widget.
  FocusNode? itemValueFocusNode;
  TextEditingController? itemValueTextController;
  String? Function(BuildContext, String?)? itemValueTextControllerValidator;
  // State field(s) for itemContent widget.
  FocusNode? itemContentFocusNode;
  TextEditingController? itemContentTextController;
  String? Function(BuildContext, String?)? itemContentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    itemTitleFocusNode?.dispose();
    itemTitleTextController?.dispose();

    itemValueFocusNode?.dispose();
    itemValueTextController?.dispose();

    itemContentFocusNode?.dispose();
    itemContentTextController?.dispose();
  }
}
