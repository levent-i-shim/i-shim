import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kurulum_widget.dart' show KurulumWidget;
import 'package:flutter/material.dart';

class KurulumModel extends FlutterFlowModel<KurulumWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for newNavBar component.
  late NewNavBarModel newNavBarModel;

  @override
  void initState(BuildContext context) {
    newNavBarModel = createModel(context, () => NewNavBarModel());
  }

  @override
  void dispose() {
    newNavBarModel.dispose();
  }
}
