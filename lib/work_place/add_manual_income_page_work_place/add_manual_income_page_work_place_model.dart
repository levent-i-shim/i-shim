import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_manual_income_page_work_place_widget.dart'
    show AddManualIncomePageWorkPlaceWidget;
import 'package:flutter/material.dart';

class AddManualIncomePageWorkPlaceModel
    extends FlutterFlowModel<AddManualIncomePageWorkPlaceWidget> {
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
