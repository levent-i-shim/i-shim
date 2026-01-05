import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'ortaklk_kur_widget.dart' show OrtaklkKurWidget;
import 'package:flutter/material.dart';

class OrtaklkKurModel extends FlutterFlowModel<OrtaklkKurWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for sirketSec widget.
  String? sirketSecValue;
  FormFieldController<String>? sirketSecValueController;
  // State field(s) for isyeriSec widget.
  String? isyeriSecValue;
  FormFieldController<String>? isyeriSecValueController;
  // State field(s) for gorevSec widget.
  String? gorevSecValue1;
  FormFieldController<String>? gorevSecValueController1;
  // State field(s) for gorevSec widget.
  String? gorevSecValue2;
  FormFieldController<String>? gorevSecValueController2;
  // State field(s) for gorevSec widget.
  String? gorevSecValue3;
  FormFieldController<String>? gorevSecValueController3;
  // State field(s) for gorevSec widget.
  String? gorevSecValue4;
  FormFieldController<String>? gorevSecValueController4;
  // State field(s) for gorevSec widget.
  String? gorevSecValue5;
  FormFieldController<String>? gorevSecValueController5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
