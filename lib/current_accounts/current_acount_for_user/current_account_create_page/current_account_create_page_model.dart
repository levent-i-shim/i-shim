import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'current_account_create_page_widget.dart'
    show CurrentAccountCreatePageWidget;
import 'package:flutter/material.dart';

class CurrentAccountCreatePageModel
    extends FlutterFlowModel<CurrentAccountCreatePageWidget> {
  ///  Local state fields for this page.

  bool isSelectedCompanyForCounter = false;

  bool isSelectedUserForCounter = false;

  bool isSelectedNotUserForCounter = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreatePage widget.
  List<CompaniesRecord>? copmanie;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreatePage widget.
  List<CompaniesRecord>? allCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in CurrentAccountCreatePage widget.
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
  CurrentAccountRecord? currentAccount;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CurrentAccountRecord? currentAccountCompany;

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
