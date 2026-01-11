import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'daily_page_model.dart';
export 'daily_page_model.dart';

class DailyPageWidget extends StatefulWidget {
  const DailyPageWidget({super.key});

  static String routeName = 'DailyPage';
  static String routePath = '/dailyPage';

  @override
  State<DailyPageWidget> createState() => _DailyPageWidgetState();
}

class _DailyPageWidgetState extends State<DailyPageWidget> {
  late DailyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.today = await actions.getToday();
      _model.addedOneDayCopy = await actions.addOneDay(
        _model.today!,
      );
      _model.dailyReportsCopy = await queryAjandaRecordOnce(
        parent: currentUserReference,
        queryBuilder: (ajandaRecord) => ajandaRecord
            .where(
              'dateTime',
              isGreaterThan: _model.today,
            )
            .where(
              'dateTime',
              isLessThan: _model.addedOneDayCopy,
            ),
      );
      _model.dailyPageState =
          _model.dailyReportsCopy!.toList().cast<AjandaRecord>();
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
            children: [
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                weekFormat: false,
                weekStartsMonday: false,
                rowHeight: 48.0,
                onChange: (DateTimeRange? newSelectedDate) async {
                  if (_model.calendarSelectedDay == newSelectedDate) {
                    return;
                  }
                  _model.calendarSelectedDay = newSelectedDate;
                  _model.selectedDate = _model.calendarSelectedDay?.start;
                  safeSetState(() {});
                  _model.addedOneDay = await actions.addOneDay(
                    _model.selectedDate!,
                  );
                  _model.dailyReports = await queryAjandaRecordOnce(
                    parent: currentUserReference,
                    queryBuilder: (ajandaRecord) => ajandaRecord
                        .where(
                          'dateTime',
                          isGreaterThan: _model.selectedDate,
                        )
                        .where(
                          'dateTime',
                          isLessThan: _model.addedOneDay,
                        ),
                  );
                  _model.dailyPageState =
                      _model.dailyReports!.toList().cast<AjandaRecord>();
                  safeSetState(() {});
                  safeSetState(() {});
                },
                titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                selectedDateStyle: FlutterFlowTheme.of(context)
                    .titleSmall
                    .override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                inactiveDateStyle: FlutterFlowTheme.of(context)
                    .labelMedium
                    .override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
              ),
              Flexible(
                flex: 6,
                child: Builder(
                  builder: (context) {
                    final daily = _model.dailyPageState.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: daily.length,
                      itemBuilder: (context, dailyIndex) {
                        final dailyItem = daily[dailyIndex];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 20.0, 10.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dailyItem.description,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
                                                          dailyItem
                                                              .fullDescription,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (dailyItem.type ==
                                                WorkHistoryTypes
                                                    .startTask.name) {
                                              _model.companyTask =
                                                  await CompanyTasksRecord
                                                      .getDocumentOnce(dailyItem
                                                          .companyTask!);
                                              _model.formFields =
                                                  await queryFormFieldsRecordOnce(
                                                parent:
                                                    _model.companyTask?.form,
                                              );

                                              context.pushNamed(
                                                ResponseFormForTaskWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'companyTask': serializeParam(
                                                    _model.companyTask,
                                                    ParamType.Document,
                                                  ),
                                                  'createdUserRef':
                                                      serializeParam(
                                                    _model.companyTask
                                                        ?.createdUserRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'formFields': serializeParam(
                                                    _model.formFields,
                                                    ParamType.Document,
                                                    isList: true,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'companyTask':
                                                      _model.companyTask,
                                                  'formFields':
                                                      _model.formFields,
                                                },
                                              );
                                            } else {
                                              if (dailyItem.type ==
                                                  WorkHistoryTypes
                                                      .startDuty.name) {
                                                _model.companyDuty =
                                                    await DutiesForCompanyRecord
                                                        .getDocumentOnce(
                                                            dailyItem
                                                                .companyDuty!);

                                                context.pushNamed(
                                                  CompanyShowAllTaskDutiesPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'dutiesForCompany':
                                                        serializeParam(
                                                      _model.companyDuty,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'dutiesForCompany':
                                                        _model.companyDuty,
                                                  },
                                                );
                                              } else {
                                                if (dailyItem.type ==
                                                    WorkHistoryTypes
                                                        .sendReportTask.name) {
                                                  _model.companyTaskSendReport =
                                                      await CompanyTasksRecord
                                                          .getDocumentOnce(
                                                              dailyItem
                                                                  .companyTask!);

                                                  context.pushNamed(
                                                    CompanyTaskReadReportsPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'task': serializeParam(
                                                        _model
                                                            .companyTaskSendReport,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'task': _model
                                                          .companyTaskSendReport,
                                                    },
                                                  );
                                                } else {
                                                  if (dailyItem.type ==
                                                      WorkHistoryTypes
                                                          .sendReportDuty
                                                          .name) {
                                                    _model.companyTaskDutySendReport =
                                                        await CompanyTaskDutiesRecord
                                                            .getDocumentOnce(
                                                                dailyItem
                                                                    .companyTaskDuties!);

                                                    context.pushNamed(
                                                      CompanyTaskDutiesReadReportPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'company':
                                                            serializeParam(
                                                          _model
                                                              .companyTaskDutySendReport
                                                              ?.parentReference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'dutiesForCompany':
                                                            serializeParam(
                                                          _model
                                                              .companyTaskDutySendReport
                                                              ?.dutiesForCompany,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'companyTaskDuties':
                                                            serializeParam(
                                                          _model
                                                              .companyTaskDutySendReport,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'companyTaskDuties': _model
                                                            .companyTaskDutySendReport,
                                                      },
                                                    );
                                                  } else {
                                                    if (dailyItem.type ==
                                                        WorkHistoryTypes
                                                            .createTask.name) {
                                                      _model.companyTaskCreateTask =
                                                          await CompanyTasksRecord
                                                              .getDocumentOnce(
                                                                  dailyItem
                                                                      .companyTask!);

                                                      context.pushNamed(
                                                        CompanyTaskReadReportsPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'task':
                                                              serializeParam(
                                                            _model
                                                                .companyTaskCreateTask,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'task': _model
                                                              .companyTaskCreateTask,
                                                        },
                                                      );
                                                    } else {
                                                      if (dailyItem.type ==
                                                          WorkHistoryTypes
                                                              .createDuty
                                                              .name) {
                                                        _model.companyDutyCreateDuty =
                                                            await DutiesForCompanyRecord
                                                                .getDocumentOnce(
                                                                    dailyItem
                                                                        .companyDuty!);

                                                        context.pushNamed(
                                                          CompanyTasksDutiesShowReportsPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'companyName':
                                                                serializeParam(
                                                              dailyItem
                                                                  .companyName,
                                                              ParamType.String,
                                                            ),
                                                            'company':
                                                                serializeParam(
                                                              _model
                                                                  .companyDutyCreateDuty
                                                                  ?.companyRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'dutiesForCompanyRef':
                                                                serializeParam(
                                                              _model
                                                                  .companyDutyCreateDuty
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'dutiesForCompany':
                                                                serializeParam(
                                                              _model
                                                                  .companyDutyCreateDuty,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'dutiesForCompany':
                                                                _model
                                                                    .companyDutyCreateDuty,
                                                          },
                                                        );
                                                      } else {
                                                        if (dailyItem.type ==
                                                            WorkHistoryTypes
                                                                .createCompany
                                                                .name) {
                                                          context.pushNamed(
                                                            WorkPlacesDetailPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'companyId':
                                                                  serializeParam(
                                                                dailyItem
                                                                    .company,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (dailyItem.type ==
                                                              WorkHistoryTypes
                                                                  .createWorkPlace
                                                                  .name) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Work Place Sayfası henüz oluşturulmadı',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else {
                                                            if (dailyItem
                                                                    .type ==
                                                                WorkHistoryTypes
                                                                    .createDepartment
                                                                    .name) {
                                                              _model.companyDepartment =
                                                                  await CompanyDepartmentsRecord
                                                                      .getDocumentOnce(
                                                                          dailyItem
                                                                              .companyDepartment!);

                                                              context.pushNamed(
                                                                DepartmentEmployessWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'department':
                                                                      serializeParam(
                                                                    _model
                                                                        .companyDepartment,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'departmentName':
                                                                      serializeParam(
                                                                    _model
                                                                        .companyDepartment
                                                                        ?.name,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'company':
                                                                      serializeParam(
                                                                    _model
                                                                        .companyDepartment
                                                                        ?.parentReference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'canManageEmployee':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'canViewTask':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'canManageTask':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'canSendMoney':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'isOwner':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'department':
                                                                      _model
                                                                          .companyDepartment,
                                                                },
                                                              );
                                                            } else {
                                                              if (dailyItem
                                                                      .type ==
                                                                  WorkHistoryTypes
                                                                      .createRole
                                                                      .name) {
                                                                _model.companyRole =
                                                                    await CompanyRolesRecord.getDocumentOnce(
                                                                        dailyItem
                                                                            .companyRole!);

                                                                context
                                                                    .pushNamed(
                                                                  CompanyRoleEmployeesWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'company':
                                                                        serializeParam(
                                                                      _model
                                                                          .companyRole
                                                                          ?.parentReference,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'roleName':
                                                                        serializeParam(
                                                                      _model
                                                                          .companyRole
                                                                          ?.name,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'companyRole':
                                                                        serializeParam(
                                                                      _model
                                                                          .companyRole,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'isOwner':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'canSendMoney':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'canManageTask':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'canViewTask':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'canManageEmployee':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'companyRole':
                                                                        _model
                                                                            .companyRole,
                                                                  },
                                                                );
                                                              } else {
                                                                if (dailyItem
                                                                        .type ==
                                                                    WorkHistoryTypes
                                                                        .createUnit
                                                                        .name) {
                                                                  _model.companyUnit =
                                                                      await CompanyUnitsRecord.getDocumentOnce(
                                                                          dailyItem
                                                                              .companyUnit!);

                                                                  context
                                                                      .pushNamed(
                                                                    CompanyUnitEmployeesWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'company':
                                                                          serializeParam(
                                                                        _model
                                                                            .companyUnit
                                                                            ?.parentReference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'unitName':
                                                                          serializeParam(
                                                                        _model
                                                                            .companyUnit
                                                                            ?.name,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'companyUnit':
                                                                          serializeParam(
                                                                        _model
                                                                            .companyUnit,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'isOwner':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'canSendMoney':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'canManageTask':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'canViewTask':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'canManageEmployee':
                                                                          serializeParam(
                                                                        false,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'companyUnit':
                                                                          _model
                                                                              .companyUnit,
                                                                    },
                                                                  );
                                                                } else {
                                                                  if (dailyItem
                                                                          .type ==
                                                                      WorkHistoryTypes
                                                                          .createTaskForDuty
                                                                          .name) {
                                                                    _model.companyTaskDuties =
                                                                        await CompanyTaskDutiesRecord.getDocumentOnce(
                                                                            dailyItem.companyTaskDuties!);

                                                                    context
                                                                        .pushNamed(
                                                                      CompanyTaskDutiesReadReportPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'company':
                                                                            serializeParam(
                                                                          dailyItem
                                                                              .company,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'dutiesForCompany':
                                                                            serializeParam(
                                                                          _model
                                                                              .companyTaskDuties
                                                                              ?.dutiesForCompany,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'companyTaskDuties':
                                                                            serializeParam(
                                                                          _model
                                                                              .companyTaskDuties,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'companyTaskDuties':
                                                                            _model.companyTaskDuties,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    if (dailyItem
                                                                            .type ==
                                                                        WorkHistoryTypes
                                                                            .createForm
                                                                            .name) {
                                                                      _model.form =
                                                                          await FormsRecord.getDocumentOnce(
                                                                              dailyItem.form!);

                                                                      context
                                                                          .pushNamed(
                                                                        ShowFormFieldsPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'form':
                                                                              serializeParam(
                                                                            _model.form,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'form':
                                                                              _model.form,
                                                                        },
                                                                      );
                                                                    } else {
                                                                      if (dailyItem
                                                                              .type ==
                                                                          WorkHistoryTypes
                                                                              .sentExpanditury
                                                                              .name) {
                                                                        _model.sentExpanditury =
                                                                            await SentMoneyForAllowenceRecord.getDocumentOnce(dailyItem.sentMoneyForAllowence!);

                                                                        context
                                                                            .pushNamed(
                                                                          SentExpandituryDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'sentMoneyForAllowence':
                                                                                serializeParam(
                                                                              _model.sentExpanditury,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'sentMoneyForAllowence':
                                                                                _model.sentExpanditury,
                                                                          },
                                                                        );
                                                                      } else {
                                                                        if (dailyItem.type ==
                                                                            WorkHistoryTypes.spentExpanditury.name) {
                                                                          _model.spendExpanditury =
                                                                              await SpentMoneyForAllowenceRecord.getDocumentOnce(dailyItem.spendMoneyForAllowence!);

                                                                          context
                                                                              .pushNamed(
                                                                            SpendExpandituryDetailPageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'spentMoneyForAllowence': serializeParam(
                                                                                _model.spendExpanditury,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'spentMoneyForAllowence': _model.spendExpanditury,
                                                                            },
                                                                          );
                                                                        } else {
                                                                          if ((dailyItem.type == WorkHistoryTypes.sendTransaction.name) ||
                                                                              (dailyItem.type == WorkHistoryTypes.incomeEntered.name) ||
                                                                              (dailyItem.type == WorkHistoryTypes.expenseEntered.name) ||
                                                                              (dailyItem.type == WorkHistoryTypes.transactionRejected.name)) {
                                                                            _model.transaction =
                                                                                await CompanyTransactionsRecord.getDocumentOnce(dailyItem.transaction!);
                                                                            if (dailyItem.type ==
                                                                                WorkHistoryTypes.incomeEntered.name) {
                                                                              context.pushNamed(
                                                                                TransactionDetailForDailyPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'transaction': serializeParam(
                                                                                    _model.transaction,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                  'isIncome': serializeParam(
                                                                                    true,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                  'companyIncomeRef': serializeParam(
                                                                                    dailyItem.companyIncome,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                  'showStock': serializeParam(
                                                                                    dailyItem.isChangedStock,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                  'stockMovement': serializeParam(
                                                                                    dailyItem.stockMovement,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'transaction': _model.transaction,
                                                                                },
                                                                              );
                                                                            } else {
                                                                              if (dailyItem.type == WorkHistoryTypes.expenseEntered.name) {
                                                                                if (_model.transaction!.hasCompanyReports()) {
                                                                                  context.pushNamed(
                                                                                    TransactionDetailForDailyPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'transaction': serializeParam(
                                                                                        _model.transaction,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'isIncome': serializeParam(
                                                                                        false,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'companyPaymentsRed': serializeParam(
                                                                                        dailyItem.companyPayment,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'transaction': _model.transaction,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (_model.transaction!.hasVehiclePayment()) {
                                                                                    context.pushNamed(
                                                                                      CompanyTransactionForVehiclePaymentPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'transaction': serializeParam(
                                                                                          _model.transaction,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'isPartner': serializeParam(
                                                                                          true,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                        'canManage': serializeParam(
                                                                                          false,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                        'canManageStock': serializeParam(
                                                                                          false,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'transaction': _model.transaction,
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                }
                                                                              } else {
                                                                                if (dailyItem.type == WorkHistoryTypes.transactionRejected.name) {
                                                                                  if (_model.transaction!.hasCompanyReports()) {
                                                                                    context.pushNamed(
                                                                                      TransactionDetailForDailyPageWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'transaction': serializeParam(
                                                                                          _model.transaction,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'isIncome': serializeParam(
                                                                                          false,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                        'companyPaymentsRed': serializeParam(
                                                                                          dailyItem.companyPayment,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'transaction': _model.transaction,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    if (_model.transaction!.hasVehiclePayment()) {
                                                                                      context.pushNamed(
                                                                                        CompanyTransactionForVehiclePaymentPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'transaction': serializeParam(
                                                                                            _model.transaction,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'isPartner': serializeParam(
                                                                                            true,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'canManage': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'canManageStock': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'transaction': _model.transaction,
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  }
                                                                                } else {
                                                                                  context.pushNamed(
                                                                                    TransactionDetailPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'transaction': serializeParam(
                                                                                        _model.transaction,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'transaction': _model.transaction,
                                                                                    },
                                                                                  );
                                                                                }
                                                                              }
                                                                            }
                                                                          } else {
                                                                            if ((dailyItem.type == WorkHistoryTypes.createConfirmation.name) ||
                                                                                (dailyItem.type == WorkHistoryTypes.answeredConfirmation.name)) {
                                                                              _model.confirmation = await ConfirmationsRecord.getDocumentOnce(dailyItem.confirmation!);

                                                                              context.pushNamed(
                                                                                MessagePageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'confirmation': serializeParam(
                                                                                    _model.confirmation,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'confirmation': _model.confirmation,
                                                                                },
                                                                              );
                                                                            } else {
                                                                              if (dailyItem.type == WorkHistoryTypes.createStock.name) {
                                                                                _model.stock = await StocksRecord.getDocumentOnce(dailyItem.stock!);

                                                                                context.pushNamed(
                                                                                  StockDetailPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'stock': serializeParam(
                                                                                      _model.stock,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'stock': _model.stock,
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                if (dailyItem.type == WorkHistoryTypes.createStockMovement.name) {
                                                                                  _model.stockMovement = await StockMovementRecord.getDocumentOnce(dailyItem.stockMovement!);

                                                                                  context.pushNamed(
                                                                                    StockMovementDetailPageWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'stockMovement': serializeParam(
                                                                                        _model.stockMovement,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'stockMovement': _model.stockMovement,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (dailyItem.type == WorkHistoryTypes.createCurrentAcountForCompany.name) {
                                                                                    _model.currentAccountCreated = await CurrentAccountRecord.getDocumentOnce(dailyItem.currentAccount!);
                                                                                    _model.amISideOnePartner = await actions.isEqual(
                                                                                      _model.currentAccountCreated!.sideOneID,
                                                                                      dailyItem.company!.id,
                                                                                    );
                                                                                    if (_model.amISideOnePartner!) {
                                                                                      if (_model.currentAccountCreated?.sideTwoType == 'Şirket') {
                                                                                        _model.company3 = await actions.getCompanyDocRef(
                                                                                          _model.currentAccountCreated!.sideTwoID,
                                                                                        );
                                                                                        _model.companyDetail3 = await CompaniesRecord.getDocumentOnce(_model.company3!);

                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillsForCompanyPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'currentAccount': serializeParam(
                                                                                              AllCurrentAccountStruct(
                                                                                                sideOneType: _model.currentAccountCreated?.sideOneType,
                                                                                                sideOneId: _model.currentAccountCreated?.sideOneID,
                                                                                                sideTwoType: _model.currentAccountCreated?.sideTwoType,
                                                                                                sideTwoId: _model.currentAccountCreated?.sideTwoID,
                                                                                                creationTime: _model.currentAccountCreated?.creationTime,
                                                                                                status: _model.currentAccountCreated?.status,
                                                                                                totalValueForSideOne: _model.currentAccountCreated?.totalValueForSideOne,
                                                                                                totalValueForSideTwo: _model.currentAccountCreated?.totalValueForSideTwo,
                                                                                                currentAccountId: _model.currentAccountCreated?.reference,
                                                                                                totalBillCount: _model.currentAccountCreated?.totalBillCount,
                                                                                                totalUnPaidBillCount: _model.currentAccountCreated?.totalUnPaidBillCount,
                                                                                                amISideOne: _model.amISideOnePartner,
                                                                                                counterPartyName: _model.companyDetail3?.name,
                                                                                              ),
                                                                                              ParamType.DataStruct,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              dailyItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      } else {
                                                                                        _model.user3 = await actions.getUserDocRef(
                                                                                          _model.currentAccountCreated!.sideTwoID,
                                                                                        );
                                                                                        _model.userDetail3 = await UsersRecord.getDocumentOnce(_model.user3!);

                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillsForCompanyPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'currentAccount': serializeParam(
                                                                                              AllCurrentAccountStruct(
                                                                                                sideOneType: _model.currentAccountCreated?.sideOneType,
                                                                                                sideOneId: _model.currentAccountCreated?.sideOneID,
                                                                                                sideTwoType: _model.currentAccountCreated?.sideTwoType,
                                                                                                sideTwoId: _model.currentAccountCreated?.sideTwoID,
                                                                                                creationTime: _model.currentAccountCreated?.creationTime,
                                                                                                status: _model.currentAccountCreated?.status,
                                                                                                totalValueForSideOne: _model.currentAccountCreated?.totalValueForSideOne,
                                                                                                totalValueForSideTwo: _model.currentAccountCreated?.totalValueForSideTwo,
                                                                                                currentAccountId: _model.currentAccountCreated?.reference,
                                                                                                totalBillCount: _model.currentAccountCreated?.totalBillCount,
                                                                                                totalUnPaidBillCount: _model.currentAccountCreated?.totalUnPaidBillCount,
                                                                                                amISideOne: _model.amISideOnePartner,
                                                                                                counterPartyName: _model.userDetail3?.displayName,
                                                                                              ),
                                                                                              ParamType.DataStruct,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              dailyItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      if (_model.currentAccountCreated?.sideOneType == 'Şirket') {
                                                                                        _model.company4 = await actions.getCompanyDocRef(
                                                                                          _model.currentAccountCreated!.sideOneID,
                                                                                        );
                                                                                        _model.companyDetail4 = await CompaniesRecord.getDocumentOnce(_model.company4!);

                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillsForCompanyPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'currentAccount': serializeParam(
                                                                                              AllCurrentAccountStruct(
                                                                                                sideOneType: _model.currentAccountCreated?.sideOneType,
                                                                                                sideOneId: _model.currentAccountCreated?.sideOneID,
                                                                                                sideTwoType: _model.currentAccountCreated?.sideTwoType,
                                                                                                sideTwoId: _model.currentAccountCreated?.sideTwoID,
                                                                                                creationTime: _model.currentAccountCreated?.creationTime,
                                                                                                status: _model.currentAccountCreated?.status,
                                                                                                totalValueForSideOne: _model.currentAccountCreated?.totalValueForSideOne,
                                                                                                totalValueForSideTwo: _model.currentAccountCreated?.totalValueForSideTwo,
                                                                                                currentAccountId: _model.currentAccountCreated?.reference,
                                                                                                totalBillCount: _model.currentAccountCreated?.totalBillCount,
                                                                                                totalUnPaidBillCount: _model.currentAccountCreated?.totalUnPaidBillCount,
                                                                                                amISideOne: _model.amISideOnePartner,
                                                                                                counterPartyName: _model.companyDetail4?.name,
                                                                                              ),
                                                                                              ParamType.DataStruct,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              dailyItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      } else {
                                                                                        _model.user4 = await actions.getUserDocRef(
                                                                                          _model.currentAccountCreated!.sideOneID,
                                                                                        );
                                                                                        _model.userDetail4 = await UsersRecord.getDocumentOnce(_model.user4!);

                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillsForCompanyPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'currentAccount': serializeParam(
                                                                                              AllCurrentAccountStruct(
                                                                                                sideOneType: _model.currentAccountCreated?.sideOneType,
                                                                                                sideOneId: _model.currentAccountCreated?.sideOneID,
                                                                                                sideTwoType: _model.currentAccountCreated?.sideTwoType,
                                                                                                sideTwoId: _model.currentAccountCreated?.sideTwoID,
                                                                                                creationTime: _model.currentAccountCreated?.creationTime,
                                                                                                status: _model.currentAccountCreated?.status,
                                                                                                totalValueForSideOne: _model.currentAccountCreated?.totalValueForSideOne,
                                                                                                totalValueForSideTwo: _model.currentAccountCreated?.totalValueForSideTwo,
                                                                                                currentAccountId: _model.currentAccountCreated?.reference,
                                                                                                totalBillCount: _model.currentAccountCreated?.totalBillCount,
                                                                                                totalUnPaidBillCount: _model.currentAccountCreated?.totalUnPaidBillCount,
                                                                                                amISideOne: _model.amISideOnePartner,
                                                                                                counterPartyName: _model.userDetail4?.displayName,
                                                                                              ),
                                                                                              ParamType.DataStruct,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              dailyItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  } else {
                                                                                    if (dailyItem.type == WorkHistoryTypes.createCurrentAccountsBillForCompany.name) {
                                                                                      _model.currentAccountBill = await actions.getCurrentAccountDocRef(
                                                                                        dailyItem.currentAccountID,
                                                                                      );
                                                                                      _model.bill = await CurrentAccountBillRecord.getDocumentOnce(dailyItem.currentAccountBill!);
                                                                                      _model.currentAccountForBill = await CurrentAccountRecord.getDocumentOnce(_model.currentAccountBill!);
                                                                                      _model.amISideOne = await actions.isEqual(
                                                                                        _model.currentAccountForBill!.sideOneID,
                                                                                        dailyItem.company!.id,
                                                                                      );
                                                                                      if (_model.amISideOne!) {
                                                                                        if (_model.currentAccountForBill?.sideTwoType == 'Şirket') {
                                                                                          _model.company5 = await actions.getCompanyDocRef(
                                                                                            _model.currentAccountForBill!.sideTwoID,
                                                                                          );
                                                                                          _model.companyDetail5 = await CompaniesRecord.getDocumentOnce(_model.company5!);

                                                                                          context.pushNamed(
                                                                                            CurrentAccountBillsDetailForCompanyPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'bill': serializeParam(
                                                                                                _model.bill,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'currentAccount': serializeParam(
                                                                                                AllCurrentAccountStruct(
                                                                                                  sideOneType: _model.currentAccountForBill?.sideOneType,
                                                                                                  sideOneId: _model.currentAccountForBill?.sideOneID,
                                                                                                  sideTwoType: _model.currentAccountForBill?.sideTwoType,
                                                                                                  sideTwoId: _model.currentAccountForBill?.sideTwoID,
                                                                                                  creationTime: _model.currentAccountForBill?.creationTime,
                                                                                                  status: _model.currentAccountForBill?.status,
                                                                                                  totalValueForSideOne: _model.currentAccountForBill?.totalValueForSideOne,
                                                                                                  totalValueForSideTwo: _model.currentAccountForBill?.totalValueForSideTwo,
                                                                                                  currentAccountId: _model.currentAccountForBill?.reference,
                                                                                                  totalBillCount: _model.currentAccountForBill?.totalBillCount,
                                                                                                  totalUnPaidBillCount: _model.currentAccountForBill?.totalUnPaidBillCount,
                                                                                                  amISideOne: _model.amISideOne,
                                                                                                  counterPartyName: _model.companyDetail5?.name,
                                                                                                ),
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'bill': _model.bill,
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          _model.user5 = await actions.getUserDocRef(
                                                                                            _model.currentAccountForBill!.sideTwoID,
                                                                                          );
                                                                                          _model.userDetail5 = await UsersRecord.getDocumentOnce(_model.user5!);

                                                                                          context.pushNamed(
                                                                                            CurrentAccountBillsDetailForCompanyPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'bill': serializeParam(
                                                                                                _model.bill,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'currentAccount': serializeParam(
                                                                                                AllCurrentAccountStruct(
                                                                                                  sideOneType: _model.currentAccountForBill?.sideOneType,
                                                                                                  sideOneId: _model.currentAccountForBill?.sideOneID,
                                                                                                  sideTwoType: _model.currentAccountForBill?.sideTwoType,
                                                                                                  sideTwoId: _model.currentAccountForBill?.sideTwoID,
                                                                                                  creationTime: _model.currentAccountForBill?.creationTime,
                                                                                                  status: _model.currentAccountForBill?.status,
                                                                                                  totalValueForSideOne: _model.currentAccountForBill?.totalValueForSideOne,
                                                                                                  totalValueForSideTwo: _model.currentAccountForBill?.totalValueForSideTwo,
                                                                                                  currentAccountId: _model.currentAccountForBill?.reference,
                                                                                                  totalBillCount: _model.currentAccountForBill?.totalBillCount,
                                                                                                  totalUnPaidBillCount: _model.currentAccountForBill?.totalUnPaidBillCount,
                                                                                                  amISideOne: _model.amISideOne,
                                                                                                  counterPartyName: _model.userDetail5?.displayName,
                                                                                                ),
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'bill': _model.bill,
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      } else {
                                                                                        if (_model.currentAccountForBill?.sideOneType == 'Şirket') {
                                                                                          _model.company6 = await actions.getCompanyDocRef(
                                                                                            _model.currentAccountForBill!.sideOneID,
                                                                                          );
                                                                                          _model.companyDetail6 = await CompaniesRecord.getDocumentOnce(_model.company6!);

                                                                                          context.pushNamed(
                                                                                            CurrentAccountBillsDetailForCompanyPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'bill': serializeParam(
                                                                                                _model.bill,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'currentAccount': serializeParam(
                                                                                                AllCurrentAccountStruct(
                                                                                                  sideOneType: _model.currentAccountForBill?.sideOneType,
                                                                                                  sideOneId: _model.currentAccountForBill?.sideOneID,
                                                                                                  sideTwoType: _model.currentAccountForBill?.sideTwoType,
                                                                                                  sideTwoId: _model.currentAccountForBill?.sideTwoID,
                                                                                                  creationTime: _model.currentAccountForBill?.creationTime,
                                                                                                  status: _model.currentAccountForBill?.status,
                                                                                                  totalValueForSideOne: _model.currentAccountForBill?.totalValueForSideOne,
                                                                                                  totalValueForSideTwo: _model.currentAccountForBill?.totalValueForSideTwo,
                                                                                                  currentAccountId: _model.currentAccountForBill?.reference,
                                                                                                  totalBillCount: _model.currentAccountForBill?.totalBillCount,
                                                                                                  totalUnPaidBillCount: _model.currentAccountForBill?.totalUnPaidBillCount,
                                                                                                  amISideOne: _model.amISideOne,
                                                                                                  counterPartyName: _model.companyDetail6?.name,
                                                                                                ),
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'bill': _model.bill,
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          _model.user6 = await actions.getUserDocRef(
                                                                                            _model.currentAccountForBill!.sideOneID,
                                                                                          );
                                                                                          _model.userDetail6 = await UsersRecord.getDocumentOnce(_model.user6!);

                                                                                          context.pushNamed(
                                                                                            CurrentAccountBillsDetailForCompanyPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'bill': serializeParam(
                                                                                                _model.bill,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'currentAccount': serializeParam(
                                                                                                AllCurrentAccountStruct(
                                                                                                  sideOneType: _model.currentAccountForBill?.sideOneType,
                                                                                                  sideOneId: _model.currentAccountForBill?.sideOneID,
                                                                                                  sideTwoType: _model.currentAccountForBill?.sideTwoType,
                                                                                                  sideTwoId: _model.currentAccountForBill?.sideTwoID,
                                                                                                  creationTime: _model.currentAccountForBill?.creationTime,
                                                                                                  status: _model.currentAccountForBill?.status,
                                                                                                  totalValueForSideOne: _model.currentAccountForBill?.totalValueForSideOne,
                                                                                                  totalValueForSideTwo: _model.currentAccountForBill?.totalValueForSideTwo,
                                                                                                  currentAccountId: _model.currentAccountForBill?.reference,
                                                                                                  totalBillCount: _model.currentAccountForBill?.totalBillCount,
                                                                                                  totalUnPaidBillCount: _model.currentAccountForBill?.totalUnPaidBillCount,
                                                                                                  amISideOne: _model.amISideOne,
                                                                                                  counterPartyName: _model.userDetail6?.displayName,
                                                                                                ),
                                                                                                ParamType.DataStruct,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'bill': _model.bill,
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                    } else {
                                                                                      if (dailyItem.type == WorkHistoryTypes.createNote.name) {
                                                                                        _model.not = await NotesRecord.getDocumentOnce(dailyItem.note!);

                                                                                        context.pushNamed(
                                                                                          NoteDetailPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'note': serializeParam(
                                                                                              _model.not,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'note': _model.not,
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
