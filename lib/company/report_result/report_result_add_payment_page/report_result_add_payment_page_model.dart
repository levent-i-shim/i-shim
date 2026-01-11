import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'report_result_add_payment_page_widget.dart'
    show ReportResultAddPaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportResultAddPaymentPageModel
    extends FlutterFlowModel<ReportResultAddPaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldKaynak widget.
  FocusNode? textFieldKaynakFocusNode;
  TextEditingController? textFieldKaynakTextController;
  String? Function(BuildContext, String?)?
      textFieldKaynakTextControllerValidator;
  String? _textFieldKaynakTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Maaş, Kira vb. is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for TextFieldDetail widget.
  FocusNode? textFieldDetailFocusNode;
  TextEditingController? textFieldDetailTextController;
  String? Function(BuildContext, String?)?
      textFieldDetailTextControllerValidator;
  String? _textFieldDetailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gelir Detayları is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldNo widget.
  FocusNode? textFieldNoFocusNode;
  TextEditingController? textFieldNoTextController;
  String? Function(BuildContext, String?)? textFieldNoTextControllerValidator;
  // State field(s) for TextFieldValue widget.
  FocusNode? textFieldValueFocusNode;
  TextEditingController? textFieldValueTextController;
  String? Function(BuildContext, String?)?
      textFieldValueTextControllerValidator;
  String? _textFieldValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gelir Miktarını Giriniz';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacePayments2025Record? paymentworkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyPayments2025Record? payment;

  @override
  void initState(BuildContext context) {
    textFieldKaynakTextControllerValidator =
        _textFieldKaynakTextControllerValidator;
    textFieldDetailTextControllerValidator =
        _textFieldDetailTextControllerValidator;
    textFieldValueTextControllerValidator =
        _textFieldValueTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldKaynakFocusNode?.dispose();
    textFieldKaynakTextController?.dispose();

    textFieldDetailFocusNode?.dispose();
    textFieldDetailTextController?.dispose();

    textFieldNoFocusNode?.dispose();
    textFieldNoTextController?.dispose();

    textFieldValueFocusNode?.dispose();
    textFieldValueTextController?.dispose();
  }
}
