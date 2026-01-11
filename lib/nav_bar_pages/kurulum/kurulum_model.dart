import '/components/new_nav_bar_setup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'kurulum_widget.dart' show KurulumWidget;
import 'package:flutter/material.dart';

class KurulumModel extends FlutterFlowModel<KurulumWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for newNavBarSetup component.
  late NewNavBarSetupModel newNavBarSetupModel;

  @override
  void initState(BuildContext context) {
    newNavBarSetupModel = createModel(context, () => NewNavBarSetupModel());
  }

  @override
  void dispose() {
    newNavBarSetupModel.dispose();
  }
}
