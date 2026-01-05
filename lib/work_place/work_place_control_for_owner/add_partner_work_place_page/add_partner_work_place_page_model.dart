import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_partner_work_place_page_widget.dart'
    show AddPartnerWorkPlacePageWidget;
import 'package:flutter/material.dart';

class AddPartnerWorkPlacePageModel
    extends FlutterFlowModel<AddPartnerWorkPlacePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
