import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'company_confirmations_page_widget.dart'
    show CompanyConfirmationsPageWidget;
import 'package:flutter/material.dart';

class CompanyConfirmationsPageModel
    extends FlutterFlowModel<CompanyConfirmationsPageWidget> {
  ///  Local state fields for this page.

  List<CompanyConfirmationsDataTypeStruct> conifrmations = [];
  void addToConifrmations(CompanyConfirmationsDataTypeStruct item) =>
      conifrmations.add(item);
  void removeFromConifrmations(CompanyConfirmationsDataTypeStruct item) =>
      conifrmations.remove(item);
  void removeAtIndexFromConifrmations(int index) =>
      conifrmations.removeAt(index);
  void insertAtIndexInConifrmations(
          int index, CompanyConfirmationsDataTypeStruct item) =>
      conifrmations.insert(index, item);
  void updateConifrmationsAtIndex(
          int index, Function(CompanyConfirmationsDataTypeStruct) updateFn) =>
      conifrmations[index] = updateFn(conifrmations[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  CompanyConfirmationsRecord? confirmationForPage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
