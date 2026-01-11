import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'business_choose_main_titles_widget.dart'
    show BusinessChooseMainTitlesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessChooseMainTitlesModel
    extends FlutterFlowModel<BusinessChooseMainTitlesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvestedMoniesToWorkPlaceRecord>? listOfInvestedMonies;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countNumberOfInvestedMonies;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
