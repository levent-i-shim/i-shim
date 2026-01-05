import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_manual_payment_page_widget.dart' show AddManualPaymentPageWidget;
import 'package:flutter/material.dart';

class AddManualPaymentPageModel
    extends FlutterFlowModel<AddManualPaymentPageWidget> {
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

  // State field(s) for DropDownPeriod widget.
  String? dropDownPeriodValue;
  FormFieldController<String>? dropDownPeriodValueController;
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
  // Stores action output result for [Custom Action - hesapla] action in Button widget.
  double? dailyOld;
  // Stores action output result for [Custom Action - hesapla] action in Button widget.
  double? dailynew;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacePayments2025Record? workPlacePaymnet;
  // Stores action output result for [Custom Action - hesapla] action in Button widget.
  double? daily;

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

    textFieldValueFocusNode?.dispose();
    textFieldValueTextController?.dispose();
  }
}
