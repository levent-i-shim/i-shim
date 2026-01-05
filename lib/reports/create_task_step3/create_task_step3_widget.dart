import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_task_step3_model.dart';
export 'create_task_step3_model.dart';

class CreateTaskStep3Widget extends StatefulWidget {
  const CreateTaskStep3Widget({
    super.key,
    required this.isDutyTask,
    required this.company,
    required this.canCreateWorkPlace,
    required this.canCreateForm,
    required this.isWorker,
    required this.workPlace,
  });

  final bool? isDutyTask;
  final DocumentReference? company;
  final bool? canCreateWorkPlace;
  final bool? canCreateForm;
  final bool? isWorker;
  final DocumentReference? workPlace;

  static String routeName = 'CreateTaskStep3';
  static String routePath = '/createTaskStep3';

  @override
  State<CreateTaskStep3Widget> createState() => _CreateTaskStep3WidgetState();
}

class _CreateTaskStep3WidgetState extends State<CreateTaskStep3Widget> {
  late CreateTaskStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTaskStep3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isWorker!) {
        _model.companyDetail =
            await CompaniesRecord.getDocumentOnce(widget.company!);
        if (_model.companyDetail?.headOffice == widget.workPlace) {
          _model.workPLaces = await queryWorkPlacesRecordOnce(
            queryBuilder: (workPlacesRecord) => workPlacesRecord.where(
              'companyRef',
              isEqualTo: widget.company,
            ),
          );
          for (int loop1Index = 0;
              loop1Index < _model.workPLaces!.length;
              loop1Index++) {
            final currentLoop1Item = _model.workPLaces![loop1Index];
            _model.addToWorkPlaces(WorkplaceStruct(
              id: currentLoop1Item.reference,
              name: currentLoop1Item.name,
            ));
            safeSetState(() {});
          }
        } else {
          _model.workPLace =
              await WorkPlacesRecord.getDocumentOnce(widget.workPlace!);
          _model.addToWorkPlaces(WorkplaceStruct(
            id: _model.workPLace?.reference,
            name: _model.workPLace?.name,
          ));
          safeSetState(() {});
        }
      }
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  if (widget.canCreateWorkPlace!) {
                    context.pushNamed(
                      IsyerikurWidget.routeName,
                      queryParameters: {
                        'invitation': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'İş Yeri Kurma Yetkiniz Yok',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                },
                text: 'Yeni İşyeri Ekle',
                icon: Icon(
                  Icons.add,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF041AFF),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
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
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'Görevin Verileceği İş Yerini Seçiniz',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  if (!widget.isWorker!)
                    StreamBuilder<List<WorkPlacesRecord>>(
                      stream: queryWorkPlacesRecord(
                        queryBuilder: (workPlacesRecord) => workPlacesRecord
                            .where(
                              'companyRef',
                              isEqualTo: widget.company,
                            )
                            .where(
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
                        List<WorkPlacesRecord> containerWorkPlacesRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final containerVar =
                                  containerWorkPlacesRecordList.toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: containerVar.length,
                                itemBuilder: (context, containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        CreateTaskStep4Widget.routeName,
                                        queryParameters: {
                                          'workPlace': serializeParam(
                                            containerVarItem.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'company': serializeParam(
                                            widget.company,
                                            ParamType.DocumentReference,
                                          ),
                                          'canCreateForm': serializeParam(
                                            widget.canCreateForm,
                                            ParamType.bool,
                                          ),
                                          'isDutyTask': serializeParam(
                                            widget.isDutyTask,
                                            ParamType.bool,
                                          ),
                                          'canAddNewEmployee': serializeParam(
                                            widget.canCreateWorkPlace,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFF2F5B96),
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            containerVarItem.name,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
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
                        );
                      },
                    ),
                  if (widget.isWorker ?? true)
                    Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final containerVar = _model.workPlaces.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: containerVar.length,
                            itemBuilder: (context, containerVarIndex) {
                              final containerVarItem =
                                  containerVar[containerVarIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    CreateTaskStep4Widget.routeName,
                                    queryParameters: {
                                      'workPlace': serializeParam(
                                        containerVarItem.id,
                                        ParamType.DocumentReference,
                                      ),
                                      'company': serializeParam(
                                        widget.company,
                                        ParamType.DocumentReference,
                                      ),
                                      'canCreateForm': serializeParam(
                                        widget.canCreateForm,
                                        ParamType.bool,
                                      ),
                                      'isDutyTask': serializeParam(
                                        widget.isDutyTask,
                                        ParamType.bool,
                                      ),
                                      'canAddNewEmployee': serializeParam(
                                        widget.canCreateWorkPlace,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFF2F5B96),
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        containerVarItem.name,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
