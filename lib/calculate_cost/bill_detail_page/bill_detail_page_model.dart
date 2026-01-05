import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_detail_page_widget.dart' show BillDetailPageWidget;
import 'package:flutter/material.dart';

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
