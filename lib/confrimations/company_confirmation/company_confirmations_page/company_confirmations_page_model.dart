import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'company_confirmations_page_widget.dart'
    show CompanyConfirmationsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
