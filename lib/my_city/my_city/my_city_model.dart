import '/backend/backend.dart';
import '/components/new_nav_bar_social_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_city_widget.dart' show MyCityWidget;
import 'package:flutter/material.dart';

class MyCityModel extends FlutterFlowModel<MyCityWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedWorkPlace;

  DocumentReference? selectedCompany;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in myCity widget.
  CitiesRecord? myCity;
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
