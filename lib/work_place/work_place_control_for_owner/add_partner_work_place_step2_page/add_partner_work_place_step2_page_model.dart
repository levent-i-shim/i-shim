import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_partner_work_place_step2_page_widget.dart'
    show AddPartnerWorkPlaceStep2PageWidget;
import 'package:flutter/material.dart';

class AddPartnerWorkPlaceStep2PageModel
    extends FlutterFlowModel<AddPartnerWorkPlaceStep2PageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlacesRecord? workPlaceDetail;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartnershipInvitationRecord? partnershipInvitation;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  WorkPlacesRecord? workPlaceDetail2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
