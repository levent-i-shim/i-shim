import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'worker_invitation05_department_model.dart';
export 'worker_invitation05_department_model.dart';

class WorkerInvitation05DepartmentWidget extends StatefulWidget {
  const WorkerInvitation05DepartmentWidget({
    super.key,
    required this.company,
    required this.wokerName,
    required this.workerRef,
    required this.workerPlace,
    required this.companyName,
    required this.workPlaceName,
    required this.routeBack,
  });

  final DocumentReference? company;
  final String? wokerName;
  final DocumentReference? workerRef;
  final DocumentReference? workerPlace;
  final String? companyName;
  final String? workPlaceName;
  final bool? routeBack;

  static String routeName = 'WorkerInvitation05Department';
  static String routePath = '/workerInvitation05Department';

  @override
  State<WorkerInvitation05DepartmentWidget> createState() =>
      _WorkerInvitation05DepartmentWidgetState();
}

class _WorkerInvitation05DepartmentWidgetState
    extends State<WorkerInvitation05DepartmentWidget> {
  late WorkerInvitation05DepartmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkerInvitation05DepartmentModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
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
            'Çalışan davet et...',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF060418), Color(0xFF45050D)],
                  stops: [0.0, 0.6],
                  begin: AlignmentDirectional(-1.0, -0.34),
                  end: AlignmentDirectional(1.0, 0.34),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Departman Ekle',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.arrow_forward,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              AddDepartmentWidget.routeName,
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
                          },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Departman Seç...',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Flexible(
                    child: StreamBuilder<List<CompanyDepartmentsRecord>>(
                      stream: queryCompanyDepartmentsRecord(
                        parent: widget.company,
                        queryBuilder: (companyDepartmentsRecord) =>
                            companyDepartmentsRecord
                                .where(
                                  'isDelete',
                                  isEqualTo: false,
                                )
                                .where(
                                  'workPlace',
                                  isEqualTo: widget.workerPlace,
                                ),
                      ),
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
                        List<CompanyDepartmentsRecord>
                            result01CompanyDepartmentsRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              result01CompanyDepartmentsRecordList.length,
                          itemBuilder: (context, result01Index) {
                            final result01CompanyDepartmentsRecord =
                                result01CompanyDepartmentsRecordList[
                                    result01Index];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 1.0, 0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                '',
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result01CompanyDepartmentsRecord
                                                      .name,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    result01CompanyDepartmentsRecord
                                                        .type,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'İşyeri',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          WorkerInvitation04UnitWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'companyRef':
                                                                serializeParam(
                                                              widget.company,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'workerRef':
                                                                serializeParam(
                                                              widget.workerRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'workerName':
                                                                serializeParam(
                                                              widget.wokerName,
                                                              ParamType.String,
                                                            ),
                                                            'workPlace':
                                                                serializeParam(
                                                              widget
                                                                  .workerPlace,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'companyName':
                                                                serializeParam(
                                                              widget
                                                                  .companyName,
                                                              ParamType.String,
                                                            ),
                                                            'workPlaceName':
                                                                serializeParam(
                                                              widget
                                                                  .workPlaceName,
                                                              ParamType.String,
                                                            ),
                                                            'department':
                                                                serializeParam(
                                                              result01CompanyDepartmentsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'routeBack':
                                                                serializeParam(
                                                              widget.routeBack,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: 'Devam',
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFF0200FF),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        hoverColor:
                                                            Color(0xFFFF0003),
                                                        hoverTextColor:
                                                            Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
