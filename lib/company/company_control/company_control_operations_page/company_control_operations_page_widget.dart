import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'company_control_operations_page_model.dart';
export 'company_control_operations_page_model.dart';

class CompanyControlOperationsPageWidget extends StatefulWidget {
  const CompanyControlOperationsPageWidget({
    super.key,
    required this.company,
  });

  final DocumentReference? company;

  static String routeName = 'CompanyControlOperationsPage';
  static String routePath = '/companyControlOperationsPage';

  @override
  State<CompanyControlOperationsPageWidget> createState() =>
      _CompanyControlOperationsPageWidgetState();
}

class _CompanyControlOperationsPageWidgetState
    extends State<CompanyControlOperationsPageWidget> {
  late CompanyControlOperationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyControlOperationsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0x563F0E57),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 64.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                CompanyVehiclesPageWidget.routeName,
                                queryParameters: {
                                  'canAddVehicle': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'canCreateVehiclePayment': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'company': serializeParam(
                                    widget.company,
                                    ParamType.DocumentReference,
                                  ),
                                  'isOwner': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Araçlar',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                CompanyTasksPageWidget.routeName,
                                queryParameters: {
                                  'companyName': serializeParam(
                                    ' ',
                                    ParamType.String,
                                  ),
                                  'company': serializeParam(
                                    widget.company,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Tek Aşamalı Görevler',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                CompanyTaskDutiesPageWidget.routeName,
                                queryParameters: {
                                  'companyName': serializeParam(
                                    ' ',
                                    ParamType.String,
                                  ),
                                  'company': serializeParam(
                                    widget.company,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Çok Aşamalı Görevler',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                StocksPageWidget.routeName,
                                queryParameters: {
                                  'company': serializeParam(
                                    widget.company,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Stok Takibi',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 64.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                ShowAllFormsPageWidget.routeName,
                                queryParameters: {
                                  'company': serializeParam(
                                    widget.company,
                                    ParamType.DocumentReference,
                                  ),
                                  'isPartner': serializeParam(
                                    false,
                                    ParamType.bool,
                                  ),
                                  'canManage': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Formlar',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
