import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_partner_company_step2_page_widget.dart'
    show AddPartnerCompanyStep2PageWidget;
import 'package:flutter/material.dart';

class AddPartnerCompanyStep2PageModel
    extends FlutterFlowModel<AddPartnerCompanyStep2PageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ortaklık Yüzdesi is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartnershipInvitationRecord? partnershipInvitation;

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
