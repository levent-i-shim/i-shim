import '/components/new_nav_bar_social_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'production_trade_widget.dart' show ProductionTradeWidget;
import 'package:flutter/material.dart';

class ProductionTradeModel extends FlutterFlowModel<ProductionTradeWidget> {
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
