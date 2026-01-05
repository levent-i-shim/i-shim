import '/components/new_nav_bar_social_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shopping_widget.dart' show ShoppingWidget;
import 'package:flutter/material.dart';

class ShoppingModel extends FlutterFlowModel<ShoppingWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedWorkPlace;

  DocumentReference? selectedCompany;

  ///  State fields for stateful widgets in this page.

  // Model for newNavBarSocial component.
  late NewNavBarSocialModel newNavBarSocialModel;

  @override
  void initState(BuildContext context) {
    newNavBarSocialModel = createModel(context, () => NewNavBarSocialModel());
  }

  @override
  void dispose() {
    newNavBarSocialModel.dispose();
  }
}
