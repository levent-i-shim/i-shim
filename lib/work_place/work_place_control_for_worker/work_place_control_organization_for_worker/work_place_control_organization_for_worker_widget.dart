import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'work_place_control_organization_for_worker_model.dart';
export 'work_place_control_organization_for_worker_model.dart';

class WorkPlaceControlOrganizationForWorkerWidget extends StatefulWidget {
  const WorkPlaceControlOrganizationForWorkerWidget({
    super.key,
    required this.companyWorker,
    required this.workPlace,
  });

  final CompanyWorkersRecord? companyWorker;
  final DocumentReference? workPlace;

  static String routeName = 'WorkPlaceControlOrganizationForWorker';
  static String routePath = '/workPlaceControlOrganizationForWorker';

  @override
  State<WorkPlaceControlOrganizationForWorkerWidget> createState() =>
      _WorkPlaceControlOrganizationForWorkerWidgetState();
}

class _WorkPlaceControlOrganizationForWorkerWidgetState
    extends State<WorkPlaceControlOrganizationForWorkerWidget> {
  late WorkPlaceControlOrganizationForWorkerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => WorkPlaceControlOrganizationForWorkerModel());

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
                              if (widget.companyWorker!.canViewEmployee) {
                                context.pushNamed(
                                  WorkPlaceWorkersPageWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget.companyWorker?.parentReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'workPlace': serializeParam(
                                      widget.workPlace,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.companyWorker?.canManageUsers,
                                      ParamType.bool,
                                    ),
                                    'isWorker': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget
                                          .companyWorker?.expanditureAuthority,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget.companyWorker?.canManageReports,
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
                              if (widget.companyWorker!
                                  .hasAuthorizedByDepartment()) {
                                _model.department =
                                    await CompanyDepartmentsRecord
                                        .getDocumentOnce(widget.companyWorker!
                                            .authorizedByDepartment!);

                                context.pushNamed(
                                  DepartmentEmployeePageWorkPlaceWidget
                                      .routeName,
                                  queryParameters: {
                                    'isPartner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'canManageDepartments': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'workplace': serializeParam(
                                      widget.workPlace,
                                      ParamType.DocumentReference,
                                    ),
                                    'isWorker': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'company': serializeParam(
                                      widget.companyWorker?.parentReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'departmentRefs': serializeParam(
                                      _model.department,
                                      ParamType.Document,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget.companyWorker?.canManageReports,
                                      ParamType.bool,
                                    ),
                                    'canViewTask': serializeParam(
                                      widget.companyWorker?.canCreateTask,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget
                                          .companyWorker?.expanditureAuthority,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'departmentRefs': _model.department,
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Herhangi Bir Departmanda Sorumlu Değilsiniz',
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

                              safeSetState(() {});
                            },
                            text: 'Departmanım',
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
                              if (widget.companyWorker!.canViewEmployee) {
                                context.pushNamed(
                                  DepartmansPageWorkPlaceWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget.companyWorker?.parentReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'workPlace': serializeParam(
                                      widget.workPlace,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canManageDepartment': serializeParam(
                                      widget.companyWorker
                                          ?.departmentCreationAuthority,
                                      ParamType.bool,
                                    ),
                                    'canViewEmployee': serializeParam(
                                      widget.companyWorker?.canViewEmployee,
                                      ParamType.bool,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget.companyWorker?.canManageUsers,
                                      ParamType.bool,
                                    ),
                                    'isWorker': serializeParam(
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
                              if (widget.companyWorker!.canViewEmployee) {
                                context.pushNamed(
                                  RolesPageWorkPlaceWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget.companyWorker?.parentReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'workPlace': serializeParam(
                                      widget.workPlace,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canManageRole': serializeParam(
                                      widget
                                          .companyWorker?.roleCreationAuthority,
                                      ParamType.bool,
                                    ),
                                    'canViewEmployee': serializeParam(
                                      widget.companyWorker?.canViewEmployee,
                                      ParamType.bool,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget.companyWorker?.canManageUsers,
                                      ParamType.bool,
                                    ),
                                    'isWorker': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget
                                          .companyWorker?.expanditureAuthority,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget.companyWorker?.canManageReports,
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
                              if (widget.companyWorker!.canViewEmployee) {
                                context.pushNamed(
                                  UnitsPageWorkPlaceWidget.routeName,
                                  queryParameters: {
                                    'company': serializeParam(
                                      widget.companyWorker?.parentReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'workPlace': serializeParam(
                                      widget.workPlace,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                    'canManageEmployee': serializeParam(
                                      widget.companyWorker?.canManageUsers,
                                      ParamType.bool,
                                    ),
                                    'canManageUnit': serializeParam(
                                      widget
                                          .companyWorker?.unitCreationAuthority,
                                      ParamType.bool,
                                    ),
                                    'canViewEmployee': serializeParam(
                                      widget.companyWorker?.canViewEmployee,
                                      ParamType.bool,
                                    ),
                                    'isWorker': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'canSendMoney': serializeParam(
                                      widget
                                          .companyWorker?.expanditureAuthority,
                                      ParamType.bool,
                                    ),
                                    'canManageTask': serializeParam(
                                      widget.companyWorker?.canManageReports,
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
