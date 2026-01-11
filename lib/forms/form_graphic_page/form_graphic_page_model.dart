import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'form_graphic_page_widget.dart' show FormGraphicPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
