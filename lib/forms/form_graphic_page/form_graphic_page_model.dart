import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_graphic_page_widget.dart' show FormGraphicPageWidget;
import 'package:flutter/material.dart';

class FormGraphicPageModel extends FlutterFlowModel<FormGraphicPageWidget> {
  ///  Local state fields for this page.

  List<ChartXYPairsStruct> graphicPairsPageState = [];
  void addToGraphicPairsPageState(ChartXYPairsStruct item) =>
      graphicPairsPageState.add(item);
  void removeFromGraphicPairsPageState(ChartXYPairsStruct item) =>
      graphicPairsPageState.remove(item);
  void removeAtIndexFromGraphicPairsPageState(int index) =>
      graphicPairsPageState.removeAt(index);
  void insertAtIndexInGraphicPairsPageState(
          int index, ChartXYPairsStruct item) =>
      graphicPairsPageState.insert(index, item);
  void updateGraphicPairsPageStateAtIndex(
          int index, Function(ChartXYPairsStruct) updateFn) =>
      graphicPairsPageState[index] = updateFn(graphicPairsPageState[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
