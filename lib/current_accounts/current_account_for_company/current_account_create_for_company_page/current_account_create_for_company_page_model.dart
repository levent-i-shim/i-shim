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
import 'current_account_create_for_company_page_widget.dart'
    show CurrentAccountCreateForCompanyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CurrentAccountCreateForCompanyPageModel
    extends FlutterFlowModel<CurrentAccountCreateForCompanyPageWidget> {
  ///  Local state fields for this page.

  bool isSelectedCompanyForCounter = false;

  bool isSelectedUserForCounter = false;

  bool isSelectedUserNotUsingApp = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreateForCompanyPage widget.
  List<CompaniesRecord>? copmanie;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreateForCompanyPage widget.
  List<CompaniesRecord>? allCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreateForCompanyPage widget.
  List<UsersRecord>? users;
  // State field(s) for sideTwoType widget.
  String? sideTwoTypeValue;
  FormFieldController<String>? sideTwoTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountRecord? currentAccountNotUsing;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<CompaniesRecord> simpleSearchResults2 = [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountRecord? currentAccountPersonal;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? copmanyDetail;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountRecord? currentAccountCompany;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? copmanyDetail2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
