import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'company_worker_company_page_model.dart';
export 'company_worker_company_page_model.dart';

class CompanyWorkerCompanyPageWidget extends StatefulWidget {
  const CompanyWorkerCompanyPageWidget({
    super.key,
    required this.company,
    required this.companyName,
  });

  final DocumentReference? company;
  final String? companyName;

  static String routeName = 'CompanyWorkerCompanyPage';
  static String routePath = '/companyWorkerCompanyPage';

  @override
  State<CompanyWorkerCompanyPageWidget> createState() =>
      _CompanyWorkerCompanyPageWidgetState();
}

class _CompanyWorkerCompanyPageWidgetState
    extends State<CompanyWorkerCompanyPageWidget> {
  late CompanyWorkerCompanyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyWorkerCompanyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.companyDetail =
          await CompaniesRecord.getDocumentOnce(widget.company!);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompanyWorkersRecord>>(
      stream: queryCompanyWorkersRecord(
        parent: widget.company,
        queryBuilder: (companyWorkersRecord) => companyWorkersRecord.where(
          'userRef',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CompanyWorkersRecord>
            companyWorkerCompanyPageCompanyWorkersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final companyWorkerCompanyPageCompanyWorkersRecord =
            companyWorkerCompanyPageCompanyWorkersRecordList.isNotEmpty
                ? companyWorkerCompanyPageCompanyWorkersRecordList.first
                : null;

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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 124.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFF00),
                              Color(0x85310004),
                              Color(0xFF310004),
                              Color(0xFFFFFF00)
                            ],
                            stops: [0.0, 0.01, 0.99, 1.0],
                            begin: AlignmentDirectional(0.0, 1.0),
                            end: AlignmentDirectional(0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord
                                                      ?.canViewEmployee ==
                                                  true) {
                                                context.pushNamed(
                                                  RolesPageWidget.routeName,
                                                  queryParameters: {
                                                    'companyName':
                                                        serializeParam(
                                                      widget.companyName,
                                                      ParamType.String,
                                                    ),
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'canManageEmployee':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord!
                                                              .canManageReports ||
                                                          companyWorkerCompanyPageCompanyWorkersRecord
                                                              .hasAuthorizedByDepartment(),
                                                      ParamType.bool,
                                                    ),
                                                    'canViewTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canManageTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canSendMoney':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .expanditureAuthority,
                                                      ParamType.bool,
                                                    ),
                                                    'isOwner': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'canAddRole':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .roleCreationAuthority,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            },
                                            text: 'Roller',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                  .canViewEmployee) {
                                                context.pushNamed(
                                                  DepartmantsPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'companyName':
                                                        serializeParam(
                                                      widget.companyName,
                                                      ParamType.String,
                                                    ),
                                                    'canManageEmployee':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                              .canManageReports ||
                                                          companyWorkerCompanyPageCompanyWorkersRecord
                                                              .hasAuthorizedByDepartment(),
                                                      ParamType.bool,
                                                    ),
                                                    'canViewTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canManageTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canSendMoney':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .expanditureAuthority,
                                                      ParamType.bool,
                                                    ),
                                                    'isOwner': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'canAddDepartmnet':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .departmentCreationAuthority,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            },
                                            text: 'Departmanlar',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                  .canViewEmployee) {
                                                context.pushNamed(
                                                  CompanyUnitsPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'canManageEmployee':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                              .canManageReports ||
                                                          companyWorkerCompanyPageCompanyWorkersRecord
                                                              .hasAuthorizedByDepartment(),
                                                      ParamType.bool,
                                                    ),
                                                    'canViewTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canManageTask':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageReports,
                                                      ParamType.bool,
                                                    ),
                                                    'canSendMoney':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .expanditureAuthority,
                                                      ParamType.bool,
                                                    ),
                                                    'isOwner': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'canAddUnit':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .unitCreationAuthority,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            },
                                            text: 'Birimler',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                  .hasAuthorizedByDepartment()) {
                                                _model.department =
                                                    await CompanyDepartmentsRecord
                                                        .getDocumentOnce(
                                                            companyWorkerCompanyPageCompanyWorkersRecord
                                                                .authorizedByDepartment!);

                                                context.pushNamed(
                                                  DepartmentEmployessWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'department':
                                                        serializeParam(
                                                      _model.department,
                                                      ParamType.Document,
                                                    ),
                                                    'departmentName':
                                                        serializeParam(
                                                      _model.department?.name,
                                                      ParamType.String,
                                                    ),
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'canManageEmployee':
                                                        serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                              .canManageReports ||
                                                          companyWorkerCompanyPageCompanyWorkersRecord
                                                              .hasAuthorizedByDepartment(),
                                                      ParamType.bool,
                                                    ),
                                                    'canViewTask':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'canManageTask':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'canSendMoney':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'isOwner': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'department':
                                                        _model.department,
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Herhangi Bir Departmanda Sorumlu Değilsiniz',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'Departmanım',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                CompanyWorkerTasksPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'companyWorker':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'companyWorker':
                                                      companyWorkerCompanyPageCompanyWorkersRecord,
                                                },
                                              );
                                            },
                                            text: 'Görevler',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord
                                                      ?.formCreationAuthority ==
                                                  true) {
                                                context.pushNamed(
                                                  ShowAllFormsPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'isPartner': serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'canManage': serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            },
                                            text: 'Formlar',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Container(
                        width: double.infinity,
                        height: 124.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFF00),
                              Color(0x8602A45D),
                              Color(0x8602A45D),
                              Color(0xFFFFFF00)
                            ],
                            stops: [0.0, 0.01, 0.99, 1.0],
                            begin: AlignmentDirectional(0.0, 1.0),
                            end: AlignmentDirectional(0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord
                                                    ?.expanditureAuthority ==
                                                true) {
                                              context.pushNamed(
                                                MyVaultPageWidget.routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Harcamalar',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                .hasAuthorizedByDepartment()) {
                                              context.pushNamed(
                                                ShowMyTransactionsPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'companyRef': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'isPartner': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                  'canManage': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                  'canManageStock':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord
                                                        .stockAuthority,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Onay Bekleyenler',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                .canSendInstruction) {
                                              context.pushNamed(
                                                InstructionsCreatePageWorkPlaceWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'workPlace': serializeParam(
                                                    _model.companyDetail
                                                        ?.headOffice,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'isPartner': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                  'canCreate': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                  'isWorker': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed(
                                                  InstructionPageWidget
                                                      .routeName);
                                            }
                                          },
                                          text: 'Talimatlar',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              ConfirmationsPageWidget.routeName,
                                              queryParameters: {
                                                'company': serializeParam(
                                                  widget.company,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: 'Onay sor',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                                DailyPageWidget.routeName);
                                          },
                                          text: 'Ajanda',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord
                                                    ?.stockAuthority ==
                                                true) {
                                              context.pushNamed(
                                                StocksPageWidget.routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Stok',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Container(
                        width: double.infinity,
                        height: 124.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFF00),
                              Color(0x8602A45D),
                              Color(0x8602A45D),
                              Color(0xFFFFFF00)
                            ],
                            stops: [0.0, 0.01, 0.99, 1.0],
                            begin: AlignmentDirectional(0.0, 1.0),
                            end: AlignmentDirectional(0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                    .currentAccountAuthority ||
                                                companyWorkerCompanyPageCompanyWorkersRecord
                                                    .hasAuthorizedByDepartment()) {
                                              context.pushNamed(
                                                CurrentAccountActivityCompanyWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Cari Hesap',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                .canAddCostAccount) {
                                              context.pushNamed(
                                                ParentProductsPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'workPlace': serializeParam(
                                                    _model.companyDetail
                                                        ?.headOffice,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'isOwner': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          },
                                          text: 'Maliyet Hesabı',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if ((companyWorkerCompanyPageCompanyWorkersRecord
                                                        ?.vehicleCreationAuthority ==
                                                    true) ||
                                                (companyWorkerCompanyPageCompanyWorkersRecord
                                                        ?.expanditureAuthority ==
                                                    true)) {
                                              context.pushNamed(
                                                CompanyVehiclesPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'canAddVehicle':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord
                                                        ?.vehicleCreationAuthority,
                                                    ParamType.bool,
                                                  ),
                                                  'canCreateVehiclePayment':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord
                                                        ?.expanditureAuthority,
                                                    ParamType.bool,
                                                  ),
                                                  'isOwner': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord
                                                      ?.authorizedByDepartment !=
                                                  null) {
                                                _model.departmentAuth =
                                                    await CompanyDepartmentsRecord
                                                        .getDocumentOnce(
                                                            companyWorkerCompanyPageCompanyWorkersRecord!
                                                                .authorizedByDepartment!);
                                                if (_model
                                                        .departmentAuth?.name ==
                                                    'Makine ve Ekipman Yönetimi') {
                                                  context.pushNamed(
                                                    CompanyVehiclesPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'company': serializeParam(
                                                        widget.company,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'canAddVehicle':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'canCreateVehiclePayment':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'isOwner': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Yetkiniz Yok',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'İş Makineleri',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Onay sor',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                .canViewIncomeExpense) {
                                              context.pushNamed(
                                                IncomesPageWidget.routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'canAddIncome':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord
                                                        .canAddManuelIncomeExpense,
                                                    ParamType.bool,
                                                  ),
                                                  'isOwner': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          text: 'Gelirler',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                .canViewIncomeExpense) {
                                              context.pushNamed(
                                                PaymentsPageWidget.routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'canAddPayment':
                                                      serializeParam(
                                                    companyWorkerCompanyPageCompanyWorkersRecord
                                                        .canAddManuelIncomeExpense,
                                                    ParamType.bool,
                                                  ),
                                                  'isOwner': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          text: 'Giderler',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                            elevation: 10.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF00BAB8),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 124.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFF00),
                              Color(0x85310004),
                              Color(0xFF310004),
                              Color(0xFFFFFF00)
                            ],
                            stops: [0.0, 0.01, 0.99, 1.0],
                            begin: AlignmentDirectional(0.0, 1.0),
                            end: AlignmentDirectional(0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                ShiftRequestPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'workPlace': serializeParam(
                                                    _model.companyDetail
                                                        ?.headOffice,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Mesai Talebinde Bulun',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                  .canViewIncomeExpense) {
                                                context.pushNamed(
                                                  CompanySalaryPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'isOwner': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            text: 'Maaşlar',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (companyWorkerCompanyPageCompanyWorkersRecord!
                                                  .canViewNotes) {
                                                context.pushNamed(
                                                  CompanyNotesPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'company': serializeParam(
                                                      widget.company,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'canManage': serializeParam(
                                                      companyWorkerCompanyPageCompanyWorkersRecord
                                                          .canManageNotes,
                                                      ParamType.bool,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            text: 'Şirket Notları',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 10.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF00BAB8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
