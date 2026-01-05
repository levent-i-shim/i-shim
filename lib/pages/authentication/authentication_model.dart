import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'authentication_widget.dart' show AuthenticationWidget;
import 'package:flutter/material.dart';

class AuthenticationModel extends FlutterFlowModel<AuthenticationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode1;
  TextEditingController? emailAddressCreateTextController1;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController1Validator;
  String? _emailAddressCreateTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  String? _passwordCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Şifre is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode2;
  TextEditingController? emailAddressCreateTextController2;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController2Validator;
  String? _emailAddressCreateTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'İsim Soyisim is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateFormRegister;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Şifre is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateFormLogin;

  @override
  void initState(BuildContext context) {
    emailAddressCreateTextController1Validator =
        _emailAddressCreateTextController1Validator;
    passwordCreateVisibility = false;
    passwordCreateTextControllerValidator =
        _passwordCreateTextControllerValidator;
    emailAddressCreateTextController2Validator =
        _emailAddressCreateTextController2Validator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressCreateFocusNode1?.dispose();
    emailAddressCreateTextController1?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    emailAddressCreateFocusNode2?.dispose();
    emailAddressCreateTextController2?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
