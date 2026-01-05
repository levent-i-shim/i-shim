import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'x_current_account_authorize_settings_widget.dart'
    show XCurrentAccountAuthorizeSettingsWidget;
import 'package:flutter/material.dart';

class XCurrentAccountAuthorizeSettingsModel
    extends FlutterFlowModel<XCurrentAccountAuthorizeSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
