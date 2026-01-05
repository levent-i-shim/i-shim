import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'work_place_task_duties_page_model.dart';
export 'work_place_task_duties_page_model.dart';

class WorkPlaceTaskDutiesPageWidget extends StatefulWidget {
  const WorkPlaceTaskDutiesPageWidget({
    super.key,
    required this.company,
    required this.workPlace,
    required this.isPartner,
    required this.canCreateTask,
    required this.canManageTask,
    required this.isWorker,
  });

  final DocumentReference? company;
  final DocumentReference? workPlace;
  final bool? isPartner;
  final bool? canCreateTask;
  final bool? canManageTask;
  final bool? isWorker;

  static String routeName = 'WorkPlaceTaskDutiesPage';
  static String routePath = '/workPlaceTaskDutiesPage';

  @override
  State<WorkPlaceTaskDutiesPageWidget> createState() =>
      _WorkPlaceTaskDutiesPageWidgetState();
}

class _WorkPlaceTaskDutiesPageWidgetState
    extends State<WorkPlaceTaskDutiesPageWidget> {
  late WorkPlaceTaskDutiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkPlaceTaskDutiesPageModel());

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
                Container(
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
                            'Sıralı Görevler',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (widget.isPartner!) {
                              if (!widget.canCreateTask!) {
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
                                return;
                              }
                            } else {
                              if (widget.isWorker!) {
                                if (!widget.canCreateTask!) {
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
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  return;
                                }
                              }
                            }

                            context.pushNamed(
                              WorkPlaceTaskDutiesCreatePageWidget.routeName,
                              queryParameters: {
                                'company': serializeParam(
                                  widget.company,
                                  ParamType.DocumentReference,
                                ),
                                'workPlace': serializeParam(
                                  widget.workPlace,
                                  ParamType.DocumentReference,
                                ),
                                'isPartner': serializeParam(
                                  widget.isPartner,
                                  ParamType.bool,
                                ),
                                'canCreate': serializeParam(
                                  widget.canCreateTask,
                                  ParamType.bool,
                                ),
                                'isWorker': serializeParam(
                                  widget.isWorker,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 430.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: StreamBuilder<List<DutiesForCompanyRecord>>(
                      stream: queryDutiesForCompanyRecord(
                        parent: widget.company,
                        queryBuilder: (dutiesForCompanyRecord) =>
                            dutiesForCompanyRecord.where(
                          'isDelete',
                          isEqualTo: false,
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
                        List<DutiesForCompanyRecord>
                            listViewDutiesForCompanyRecordList = snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewDutiesForCompanyRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewDutiesForCompanyRecord =
                                listViewDutiesForCompanyRecordList[
                                    listViewIndex];
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
                                      WorkPlaceTasksDutiesShowReportsPageWidget
                                          .routeName,
                                      queryParameters: {
                                        'company': serializeParam(
                                          widget.company,
                                          ParamType.DocumentReference,
                                        ),
                                        'workPlace': serializeParam(
                                          widget.workPlace,
                                          ParamType.DocumentReference,
                                        ),
                                        'dutiesForCompany': serializeParam(
                                          listViewDutiesForCompanyRecord,
                                          ParamType.Document,
                                        ),
                                        'isPartner': serializeParam(
                                          widget.isPartner,
                                          ParamType.bool,
                                        ),
                                        'canCreate': serializeParam(
                                          widget.canCreateTask,
                                          ParamType.bool,
                                        ),
                                        'canManage': serializeParam(
                                          widget.canManageTask,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'dutiesForCompany':
                                            listViewDutiesForCompanyRecord,
                                      },
                                    );
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 16.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  listViewDutiesForCompanyRecord
                                                      .taskName,
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
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
