import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'add_manual_income_page_widget.dart' show AddManualIncomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddManualIncomePageModel
    extends FlutterFlowModel<AddManualIncomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldGelirKaynak widget.
  FocusNode? textFieldGelirKaynakFocusNode;
  TextEditingController? textFieldGelirKaynakTextController;
  String? Function(BuildContext, String?)?
      textFieldGelirKaynakTextControllerValidator;
  String? _textFieldGelirKaynakTextControllerValidator(
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
  // State field(s) for TextFieldGelirDetail widget.
  FocusNode? textFieldGelirDetailFocusNode;
  TextEditingController? textFieldGelirDetailTextController;
  String? Function(BuildContext, String?)?
      textFieldGelirDetailTextControllerValidator;
  String? _textFieldGelirDetailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Gelir Detayları is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

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

  // State field(s) for DropDownWorkPlace widget.
  String? dropDownWorkPlaceValue;
  FormFieldController<String>? dropDownWorkPlaceValueController;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceIncomes2025Record? workPlaceIncome;

  @override
  void initState(BuildContext context) {
    textFieldGelirKaynakTextControllerValidator =
        _textFieldGelirKaynakTextControllerValidator;
    textFieldGelirDetailTextControllerValidator =
        _textFieldGelirDetailTextControllerValidator;
    textFieldValueTextControllerValidator =
        _textFieldValueTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldGelirKaynakFocusNode?.dispose();
    textFieldGelirKaynakTextController?.dispose();

    textFieldGelirDetailFocusNode?.dispose();
    textFieldGelirDetailTextController?.dispose();

    textFieldValueFocusNode?.dispose();
    textFieldValueTextController?.dispose();
  }
}
