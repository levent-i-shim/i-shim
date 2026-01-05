import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_edit_profile_widget.dart' show SettingsEditProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SettingsEditProfileModel
    extends FlutterFlowModel<SettingsEditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late MaskTextInputFormatter textFieldMask1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Custom Action - formatPhoneNumber] action in Button widget.
  String? docId;
  // State field(s) for TextFieldAboutMe widget.
  FocusNode? textFieldAboutMeFocusNode;
  TextEditingController? textFieldAboutMeTextController;
  String? Function(BuildContext, String?)?
      textFieldAboutMeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController7;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController8;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Custom Action - changeUsersPassword] action in Button widget.
  String? changePasswordReturn;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    passwordVisibility3 = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldAboutMeFocusNode?.dispose();
    textFieldAboutMeTextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    textFieldFocusNode6?.dispose();
    textController7?.dispose();

    textFieldFocusNode7?.dispose();
    textController8?.dispose();
  }
}
