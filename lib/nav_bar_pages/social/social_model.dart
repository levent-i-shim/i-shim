import '/backend/backend.dart';
import '/components/new_nav_bar_social_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'social_widget.dart' show SocialWidget;
import 'package:flutter/material.dart';

class SocialModel extends FlutterFlowModel<SocialWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedWorkPlace;

  DocumentReference? selectedCompany;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Container widget.
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
