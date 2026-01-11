import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'company_worker_tasks_page_widget.dart'
    show CompanyWorkerTasksPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyWorkerTasksPageModel
    extends FlutterFlowModel<CompanyWorkerTasksPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<FormFieldsRecord>? formFields;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  NotificationsRecord? notificationTask;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  NotificationsRecord? notifiDuty;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
