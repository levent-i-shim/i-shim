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
import '/custom_code/actions/index.dart' as actions;
import 'add_current_account_widget.dart' show AddCurrentAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCurrentAccountModel extends FlutterFlowModel<AddCurrentAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ownerOrWorker widget.
  String? ownerOrWorkerValue;
  FormFieldController<String>? ownerOrWorkerValueController;
  // State field(s) for companiesDropDown widget.
  String? companiesDropDownValue;
  FormFieldController<String>? companiesDropDownValueController;
  // State field(s) for workPlacesDropDown widget.
  String? workPlacesDropDownValue;
  FormFieldController<String>? workPlacesDropDownValueController;
  // State field(s) for authorizingCompaniesDropDown widget.
  String? authorizingCompaniesDropDownValue;
  FormFieldController<String>? authorizingCompaniesDropDownValueController;
  // State field(s) for authorizingWorkPlaceDropDown widget.
  String? authorizingWorkPlaceDropDownValue;
  FormFieldController<String>? authorizingWorkPlaceDropDownValueController;
  // State field(s) for supplierOrCustomerDropDown widget.
  String? supplierOrCustomerDropDownValue;
  FormFieldController<String>? supplierOrCustomerDropDownValueController;
  // State field(s) for personOrCompanyDropDown widget.
  String? personOrCompanyDropDownValue;
  FormFieldController<String>? personOrCompanyDropDownValueController;
  // State field(s) for TextFieldPersonSupplier widget.
  FocusNode? textFieldPersonSupplierFocusNode;
  TextEditingController? textFieldPersonSupplierTextController;
  String? Function(BuildContext, String?)?
      textFieldPersonSupplierTextControllerValidator;
  // State field(s) for TextFieldCompanySupplier widget.
  FocusNode? textFieldCompanySupplierFocusNode;
  TextEditingController? textFieldCompanySupplierTextController;
  String? Function(BuildContext, String?)?
      textFieldCompanySupplierTextControllerValidator;
  // State field(s) for TextFieldPersonCustomer widget.
  FocusNode? textFieldPersonCustomerFocusNode;
  TextEditingController? textFieldPersonCustomerTextController;
  String? Function(BuildContext, String?)?
      textFieldPersonCustomerTextControllerValidator;
  // State field(s) for TextFieldCompanyCustomer widget.
  FocusNode? textFieldCompanyCustomerFocusNode;
  TextEditingController? textFieldCompanyCustomerTextController;
  String? Function(BuildContext, String?)?
      textFieldCompanyCustomerTextControllerValidator;
  // State field(s) for TextFieldContent widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // Stores action output result for [Validate Form] action in saveCurrent widget.
  bool? validate;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in saveCurrent widget.
  DocumentReference? companyRefFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in saveCurrent widget.
  DocumentReference? workPlaceRefFromDropDownId;
  // Stores action output result for [Custom Action - getCompanyName] action in saveCurrent widget.
  String? companyNameFromDropDownId;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in saveCurrent widget.
  String? workPlaceNameFromDropDownId;
  // Stores action output result for [Backend Call - Create Document] action in saveCurrent widget.
  CompaniesCurrentsRecord? addedCurrentAccountOwner;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in saveCurrent widget.
  DocumentReference? companyRefFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in saveCurrent widget.
  DocumentReference? workPlaceRefFromDropDownId9;
  // Stores action output result for [Custom Action - getCompanyName] action in saveCurrent widget.
  String? companyNameFromDropDownId9;
  // Stores action output result for [Custom Action - getWorkPlaceName] action in saveCurrent widget.
  String? workPlaceNameFromDropDownId9;
  // Stores action output result for [Backend Call - Create Document] action in saveCurrent widget.
  CompaniesCurrentsRecord? addedCurrentAccountWorker;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldPersonSupplierFocusNode?.dispose();
    textFieldPersonSupplierTextController?.dispose();

    textFieldCompanySupplierFocusNode?.dispose();
    textFieldCompanySupplierTextController?.dispose();

    textFieldPersonCustomerFocusNode?.dispose();
    textFieldPersonCustomerTextController?.dispose();

    textFieldCompanyCustomerFocusNode?.dispose();
    textFieldCompanyCustomerTextController?.dispose();

    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
