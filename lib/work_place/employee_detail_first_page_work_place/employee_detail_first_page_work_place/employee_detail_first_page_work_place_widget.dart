import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'employee_detail_first_page_work_place_model.dart';
export 'employee_detail_first_page_work_place_model.dart';

class EmployeeDetailFirstPageWorkPlaceWidget extends StatefulWidget {
  const EmployeeDetailFirstPageWorkPlaceWidget({
    super.key,
    required this.userRef,
    required this.company,
    required this.canManageEmployee,
    required this.canViewTask,
    required this.canManageTask,
    required this.canSendMoney,
    required this.workPlace,
    required this.isPartner,
    required this.isWorker,
  });

  final DocumentReference? userRef;
  final DocumentReference? company;
  final bool? canManageEmployee;
  final bool? canViewTask;
  final bool? canManageTask;
  final bool? canSendMoney;
  final DocumentReference? workPlace;
  final bool? isPartner;
  final bool? isWorker;

  static String routeName = 'EmployeeDetailFirstPageWorkPlace';
  static String routePath = '/employeeDetailFirstPageWorkPlace';

  @override
  State<EmployeeDetailFirstPageWorkPlaceWidget> createState() =>
      _EmployeeDetailFirstPageWorkPlaceWidgetState();
}

class _EmployeeDetailFirstPageWorkPlaceWidgetState
    extends State<EmployeeDetailFirstPageWorkPlaceWidget> {
  late EmployeeDetailFirstPageWorkPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => EmployeeDetailFirstPageWorkPlaceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.myWorkedWorkPlaceResponse = await queryMyWorkedWorkPlaceRecordOnce(
        parent: widget.userRef,
        queryBuilder: (myWorkedWorkPlaceRecord) => myWorkedWorkPlaceRecord
            .where(
              'isDelete',
              isEqualTo: false,
            )
            .where(
              'isWorking',
              isEqualTo: true,
            )
            .where(
              'company',
              isEqualTo: widget.company,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      for (int loop1Index = 0;
          loop1Index < _model.myWorkedWorkPlaceResponse!.workPlaceIds.length;
          loop1Index++) {
        final currentLoop1Item =
            _model.myWorkedWorkPlaceResponse!.workPlaceIds[loop1Index];
        _model.addToMyWorkedWorkPlaceIds(currentLoop1Item);
        safeSetState(() {});
      }
      _model.myWorkedWorkPlace = _model.myWorkedWorkPlaceResponse;
      safeSetState(() {});
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
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

        final employeeDetailFirstPageWorkPlaceUsersRecord = snapshot.data!;

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
              actions: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: FaIcon(
                        FontAwesomeIcons.trash,
                        color: Color(0xFFFF0000),
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: StreamBuilder<List<CompanyWorkersRecord>>(
                  stream: queryCompanyWorkersRecord(
                    parent: widget.company,
                    queryBuilder: (companyWorkersRecord) =>
                        companyWorkersRecord.where(
                      'userRef',
                      isEqualTo: widget.userRef,
                    ),
                    singleRecord: true,
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
                    List<CompanyWorkersRecord>
                        containerCompanyWorkersRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerCompanyWorkersRecord =
                        containerCompanyWorkersRecordList.isNotEmpty
                            ? containerCompanyWorkersRecordList.first
                            : null;

                    return Container(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    employeeDetailFirstPageWorkPlaceUsersRecord
                                                        .photoUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Text(
                                                      employeeDetailFirstPageWorkPlaceUsersRecord
                                                          .displayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    employeeDetailFirstPageWorkPlaceUsersRecord
                                                        .email,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 4.0),
                                            child: Text(
                                              'Çalıştığı Şirket',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF0099FF),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .myWorkedWorkPlaceResponse
                                                        ?.copmanyName,
                                                    'Şirket İsmi',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 8.0),
                                            child: Text(
                                              'Çalıştığı İşyerleri',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          Builder(
                                            builder: (context) {
                                              final wrokPlace = _model
                                                  .myWorkedWorkPlaceIds
                                                  .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    wrokPlace.length,
                                                    (wrokPlaceIndex) {
                                                  final wrokPlaceItem =
                                                      wrokPlace[wrokPlaceIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: StreamBuilder<
                                                        WorkPlacesRecord>(
                                                      stream: WorkPlacesRecord
                                                          .getDocument(
                                                              wrokPlaceItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final containerWorkPlacesRecord =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF0099FF),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Text(
                                                              containerWorkPlacesRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 12.0, 8.0, 0.0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 64.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                EditEmployeeDetailPageWorkPlaceWidget
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
                                                  'isPartner': serializeParam(
                                                    widget.isPartner,
                                                    ParamType.bool,
                                                  ),
                                                  'canManage': serializeParam(
                                                    widget.canManageEmployee,
                                                    ParamType.bool,
                                                  ),
                                                  'companyWorker':
                                                      serializeParam(
                                                    containerCompanyWorkersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'isWorker': serializeParam(
                                                    widget.isWorker,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'companyWorker':
                                                      containerCompanyWorkersRecord,
                                                },
                                              );
                                            },
                                            text: 'Bilgiler',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 24.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                EmployeePermissionsPageWorkPlaceWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'canManageEmployee':
                                                      serializeParam(
                                                    widget.canManageEmployee,
                                                    ParamType.bool,
                                                  ),
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'companyWorker':
                                                      serializeParam(
                                                    containerCompanyWorkersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'isPartner': serializeParam(
                                                    widget.isPartner,
                                                    ParamType.bool,
                                                  ),
                                                  'isWorker': serializeParam(
                                                    widget.isWorker,
                                                    ParamType.bool,
                                                  ),
                                                  'workPlace': serializeParam(
                                                    widget.workPlace,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'companyWorker':
                                                      containerCompanyWorkersRecord,
                                                },
                                              );
                                            },
                                            text: 'İzinler',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 24.0, 64.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                EmployeeDetailPageWorkPlaceWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'worker': serializeParam(
                                                    containerCompanyWorkersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'isPartner': serializeParam(
                                                    widget.isPartner,
                                                    ParamType.bool,
                                                  ),
                                                  'canManageWorker':
                                                      serializeParam(
                                                    widget.canManageEmployee,
                                                    ParamType.bool,
                                                  ),
                                                  'isWorker': serializeParam(
                                                    widget.isWorker,
                                                    ParamType.bool,
                                                  ),
                                                  'company': serializeParam(
                                                    widget.company,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'canSendMoney':
                                                      serializeParam(
                                                    widget.canSendMoney,
                                                    ParamType.bool,
                                                  ),
                                                  'canManageTask':
                                                      serializeParam(
                                                    widget.canManageTask,
                                                    ParamType.bool,
                                                  ),
                                                  'workPlace': serializeParam(
                                                    widget.workPlace,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'worker':
                                                      containerCompanyWorkersRecord,
                                                },
                                              );
                                            },
                                            text: 'Detaylar',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
