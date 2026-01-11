import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'bill_detail_page_widget.dart' show BillDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillDetailPageModel extends FlutterFlowModel<BillDetailPageWidget> {
  ///  Local state fields for this page.

  List<CurrentAccountActivityRecord> activity = [];
  void addToActivity(CurrentAccountActivityRecord item) => activity.add(item);
  void removeFromActivity(CurrentAccountActivityRecord item) =>
      activity.remove(item);
  void removeAtIndexFromActivity(int index) => activity.removeAt(index);
  void insertAtIndexInActivity(int index, CurrentAccountActivityRecord item) =>
      activity.insert(index, item);
  void updateActivityAtIndex(
          int index, Function(CurrentAccountActivityRecord) updateFn) =>
      activity[index] = updateFn(activity[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in BillDetailPage widget.
  CurrentAccountActivityRecord? activiryDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
