import '/components/new_nav_bar_social_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_orders_shopping_widget.dart' show MyOrdersShoppingWidget;
import 'package:flutter/material.dart';

class MyOrdersShoppingModel extends FlutterFlowModel<MyOrdersShoppingWidget> {
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
