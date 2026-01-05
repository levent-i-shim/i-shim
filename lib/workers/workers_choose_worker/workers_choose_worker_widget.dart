import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workers_choose_worker_model.dart';
export 'workers_choose_worker_model.dart';

class WorkersChooseWorkerWidget extends StatefulWidget {
  const WorkersChooseWorkerWidget({
    super.key,
    required this.workPlaceDocRef,
    required this.companyDocRef,
  });

  final DocumentReference? workPlaceDocRef;
  final DocumentReference? companyDocRef;

  static String routeName = 'workersChooseWorker';
  static String routePath = '/workersChooseWorker';

  @override
  State<WorkersChooseWorkerWidget> createState() =>
      _WorkersChooseWorkerWidgetState();
}

class _WorkersChooseWorkerWidgetState extends State<WorkersChooseWorkerWidget> {
  late WorkersChooseWorkerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkersChooseWorkerModel());

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
            context.safePop();
            HapticFeedback.heavyImpact();
          },
        ),
        title: Text(
          '<   Çalışan Takip Sistemi   >',
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
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                  );
                },
              ),
              StreamBuilder<List<WorkPlaceWorkerRecord>>(
                stream: queryWorkPlaceWorkerRecord(
                  parent: widget.workPlaceDocRef,
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
                  List<WorkPlaceWorkerRecord>
                      listViewWorkPlaceWorkerRecordList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewWorkPlaceWorkerRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewWorkPlaceWorkerRecord =
                          listViewWorkPlaceWorkerRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 4.0, 10.0, 4.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.heavyImpact();

                            context.pushNamed(
                              WorkersPaymentDetailWidget.routeName,
                              queryParameters: {
                                'company': serializeParam(
                                  widget.companyDocRef,
                                  ParamType.DocumentReference,
                                ),
                                'workPlaces': serializeParam(
                                  widget.workPlaceDocRef,
                                  ParamType.DocumentReference,
                                ),
                                'workerUserRef': serializeParam(
                                  listViewWorkPlaceWorkerRecord.user,
                                  ParamType.DocumentReference,
                                ),
                                'workerPlaceWorkerDocument': serializeParam(
                                  listViewWorkPlaceWorkerRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'workerPlaceWorkerDocument':
                                    listViewWorkPlaceWorkerRecord,
                              },
                            );
                          },
                          child: Container(
                            height: 52.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFFFFF00), Color(0xFFC1C100)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(36.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 6.0, 10.0, 6.0),
                                  child: Text(
                                    listViewWorkPlaceWorkerRecord.userName,
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
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
