import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'roles_page_model.dart';
export 'roles_page_model.dart';

class RolesPageWidget extends StatefulWidget {
  const RolesPageWidget({
    super.key,
    required this.companyName,
    required this.company,
    required this.canManageEmployee,
    required this.canViewTask,
    required this.canManageTask,
    required this.canSendMoney,
    required this.isOwner,
    required this.canAddRole,
  });

  final String? companyName;
  final DocumentReference? company;
  final bool? canManageEmployee;
  final bool? canViewTask;
  final bool? canManageTask;
  final bool? canSendMoney;
  final bool? isOwner;
  final bool? canAddRole;

  static String routeName = 'RolesPage';
  static String routePath = '/rolesPage';

  @override
  State<RolesPageWidget> createState() => _RolesPageWidgetState();
}

class _RolesPageWidgetState extends State<RolesPageWidget> {
  late RolesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RolesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompanyRolesRecord>>(
      stream: queryCompanyRolesRecord(
        parent: widget.company,
        queryBuilder: (companyRolesRecord) => companyRolesRecord.where(
          'isDelete',
          isEqualTo: false,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
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
        List<CompanyRolesRecord> rolesPageCompanyRolesRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
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
              title: Text(
                valueOrDefault<String>(
                  widget.companyName,
                  'Şirket İsmi',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF060418), Color(0xF4300232)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, -0.34),
                    end: AlignmentDirectional(1.0, 0.34),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Roller',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (widget.canAddRole!) {
                                      context.pushNamed(
                                        AddRolePageWidget.routeName,
                                        queryParameters: {
                                          'companyName': serializeParam(
                                            widget.companyName,
                                            ParamType.String,
                                          ),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Yeni Rol Ekle',
                                  options: FFButtonOptions(
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                    Flexible(
                      flex: 10,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Builder(
                            builder: (context) {
                              final companyRoles =
                                  rolesPageCompanyRolesRecordList.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: companyRoles.length,
                                itemBuilder: (context, companyRolesIndex) {
                                  final companyRolesItem =
                                      companyRoles[companyRolesIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            CompanyRoleEmployeesWidget
                                                .routeName,
                                            queryParameters: {
                                              'company': serializeParam(
                                                widget.company,
                                                ParamType.DocumentReference,
                                              ),
                                              'roleName': serializeParam(
                                                companyRolesItem.name,
                                                ParamType.String,
                                              ),
                                              'companyRole': serializeParam(
                                                companyRolesItem,
                                                ParamType.Document,
                                              ),
                                              'isOwner': serializeParam(
                                                widget.isOwner,
                                                ParamType.bool,
                                              ),
                                              'canSendMoney': serializeParam(
                                                widget.canSendMoney,
                                                ParamType.bool,
                                              ),
                                              'canManageTask': serializeParam(
                                                widget.canManageTask,
                                                ParamType.bool,
                                              ),
                                              'canViewTask': serializeParam(
                                                widget.canViewTask,
                                                ParamType.bool,
                                              ),
                                              'canManageEmployee':
                                                  serializeParam(
                                                widget.canManageEmployee,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'companyRole': companyRolesItem,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 16.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      companyRolesItem.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
