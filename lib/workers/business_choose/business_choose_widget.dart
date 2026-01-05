import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'business_choose_model.dart';
export 'business_choose_model.dart';

class BusinessChooseWidget extends StatefulWidget {
  const BusinessChooseWidget({
    super.key,
    required this.companiesIcanSee,
    required this.companiesICanSeeNames,
    required this.workPlacesICanSee,
    required this.workPlacesICanSeeNames,
  });

  final List<DocumentReference>? companiesIcanSee;
  final List<String>? companiesICanSeeNames;
  final List<DocumentReference>? workPlacesICanSee;
  final List<String>? workPlacesICanSeeNames;

  static String routeName = 'businessChoose';
  static String routePath = '/businessChoose';

  @override
  State<BusinessChooseWidget> createState() => _BusinessChooseWidgetState();
}

class _BusinessChooseWidgetState extends State<BusinessChooseWidget> {
  late BusinessChooseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessChooseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF13001E),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 25.0,
          ),
          onPressed: () async {
            context.pushNamed(ProfileWidget.routeName);
          },
        ),
        title: Text(
          '<   İşyeri Seç   >',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<List<CompaniesRecord>>(
                stream: queryCompaniesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<CompaniesRecord> containerCompaniesRecordList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 8.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.workPlacesDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.workPlacesDropDownValue ??= '',
                              ),
                              options: List<String>.from(widget
                                  .workPlacesICanSee!
                                  .map((e) => e.id)
                                  .toList()),
                              optionLabels: widget.workPlacesICanSeeNames!,
                              onChanged: (val) async {
                                safeSetState(
                                    () => _model.workPlacesDropDownValue = val);
                                _model.workPlaceRef =
                                    await actions.getWorkPlaceDocRef(
                                  _model.workPlacesDropDownValue!,
                                );

                                safeSetState(() {});
                              },
                              height: 60.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              hintText: 'Hangi işyerin ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 40.0,
                              ),
                              fillColor: Color(0xFF13001E),
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 24.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.workPlaceDocumentFromChosen =
                                await actions.getWorkPlaceDocument(
                              _model.workPlacesDropDownValue!,
                            );
                            HapticFeedback.mediumImpact();
                            _model.companyDocumentFromChosenWorkPlace =
                                await actions.getCompanyDocument(
                              _model
                                  .workPlaceDocumentFromChosen!.companyRef!.id,
                            );

                            context.pushNamed(
                              BusinessChooseMainTitlesWidget.routeName,
                              queryParameters: {
                                'companyDocument': serializeParam(
                                  _model.companyDocumentFromChosenWorkPlace,
                                  ParamType.Document,
                                ),
                                'workPlaceDocument': serializeParam(
                                  _model.workPlaceDocumentFromChosen,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'companyDocument':
                                    _model.companyDocumentFromChosenWorkPlace,
                                'workPlaceDocument':
                                    _model.workPlaceDocumentFromChosen,
                              },
                            );

                            safeSetState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFFFF00), Color(0xFFC1C100)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(66.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.insights,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 44.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Text(
                                      'İşletme Takip Sayfasına Git ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
