import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'company_control_organization_for_partner_page_model.dart';
export 'company_control_organization_for_partner_page_model.dart';

class CompanyControlOrganizationForPartnerPageWidget extends StatefulWidget {
  const CompanyControlOrganizationForPartnerPageWidget({
    super.key,
    required this.partner,
    this.company,
  });

  final PartnershipsRecord? partner;
  final DocumentReference? company;

  static String routeName = 'CompanyControlOrganizationForPartnerPage';
  static String routePath = '/companyControlOrganizationForPartnerPage';

  @override
  State<CompanyControlOrganizationForPartnerPageWidget> createState() =>
      _CompanyControlOrganizationForPartnerPageWidgetState();
}

class _CompanyControlOrganizationForPartnerPageWidgetState
    extends State<CompanyControlOrganizationForPartnerPageWidget> {
  late CompanyControlOrganizationForPartnerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CompanyControlOrganizationForPartnerPageModel());

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
                              if (widget!.partner!.canViewWorkers) {
                                context.pushNamed(
                                  CompanyWorkersPageWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget!.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'canManageWorker': serializeParam(
                                      widget!.partner?.canManageWorkers,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget!
                                          .partner?.canManageEmployeeExpenses,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget!.partner?.canManageTasks,
                                      ParamType.bool,
                                    ),
                                    'canViewTask': serializeParam(
                                      widget!.partner?.canViewTasks,
                                      ParamType.bool,
                                    ),
                                    'canViewWorker': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yetkiniz Yok',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            text: 'Personeller',
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
                              if (widget!.partner!.canViewWorkers) {
                                context.pushNamed(
                                  DepartmantsPageWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget!.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'companyName': serializeParam(
                                      '   ',
                                      ParamType.String,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget!.partner?.canManageWorkers,
                                      ParamType.bool,
                                    ),
                                    'canViewTask': serializeParam(
                                      widget!.partner?.canViewTasks,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget!.partner?.canManageTasks,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget!
                                          .partner?.canManageEmployeeExpenses,
                                      ParamType.bool,
                                    ),
                                    'isOwner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canAddDepartmnet': serializeParam(
                                      widget!.partner?.canManageDepartments,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yetkiniz Yok',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            text: 'Departmanlar',
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
                              if (widget!.partner!.canViewWorkers) {
                                context.pushNamed(
                                  RolesPageWidget.routeName,
                                  queryParameters: {
                                    'companyName': serializeParam(
                                      '  ',
                                      ParamType.String,
                                    ),
                                    'company': serializeParam(
                                      widget!.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget!.partner?.canManageWorkers,
                                      ParamType.bool,
                                    ),
                                    'canViewTask': serializeParam(
                                      widget!.partner?.canViewTasks,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget!.partner?.canManageTasks,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget!
                                          .partner?.canManageEmployeeExpenses,
                                      ParamType.bool,
                                    ),
                                    'isOwner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canAddRole': serializeParam(
                                      widget!.partner?.canManageRoles,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yetkiniz Yok',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            text: 'Roller',
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
                              if (widget!.partner!.canViewWorkers) {
                                context.pushNamed(
                                  CompanyUnitsPageWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget!.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget!.partner?.canManageWorkers,
                                      ParamType.bool,
                                    ),
                                    'canViewTask': serializeParam(
                                      widget!.partner?.canViewTasks,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget!.partner?.canManageTasks,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget!
                                          .partner?.canManageEmployeeExpenses,
                                      ParamType.bool,
                                    ),
                                    'isOwner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canAddUnit': serializeParam(
                                      widget!.partner?.canManageUnits,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yetkiniz Yok',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                            text: 'Birimler',
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
