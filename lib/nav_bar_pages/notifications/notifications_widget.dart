import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  static String routeName = 'notifications';
  static String routePath = '/notifications';

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with TickerProviderStateMixin {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompaniesRecord>>(
      stream: queryCompaniesRecord(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF060417),
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
        List<CompaniesRecord> notificationsCompaniesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF060417),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(44.0),
              child: AppBar(
                backgroundColor: Color(0xFF060418),
                automaticallyImplyLeading: false,
                title: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Ayarlar',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF060418),
                              textStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFF0EFF00),
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 8.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: StreamBuilder<List<WorkPlacesRecord>>(
                            stream: queryWorkPlacesRecord(
                              queryBuilder: (workPlacesRecord) =>
                                  workPlacesRecord.where(
                                'owner',
                                isEqualTo: currentUserReference,
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
                              List<WorkPlacesRecord>
                                  containerWorkPlacesRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF060418),
                                      Color(0xF4300232)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(-1.0, -0.34),
                                    end: AlignmentDirectional(1.0, 0.34),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor: Colors.white,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                              unselectedLabelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              tabs: [
                                                Tab(
                                                  text: 'Kişisel',
                                                  icon: Icon(
                                                    Icons.person_rounded,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'İşyeri',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.store,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Şirket',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.city,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Tümü',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.battleNet,
                                                  ),
                                                ),
                                                Tab(
                                                  text: 'Sosyal',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .phoenixFramework,
                                                  ),
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StreamBuilder<
                                                          List<
                                                              NotificationsRecord>>(
                                                        stream:
                                                            queryNotificationsRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (notificationsRecord) =>
                                                              notificationsRecord
                                                                  .where(
                                                                    'isDelete',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'creationTime',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<NotificationsRecord>
                                                              containerNotificationsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00FFFFFF),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController1,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode1,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.textController1',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.simpleSearchResults1 =
                                                                                TextSearch(
                                                                              containerNotificationsRecordList
                                                                                  .map(
                                                                                    (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.type!,
                                                                                      record.content!,
                                                                                      record.fullDescription!
                                                                                    ]),
                                                                                  )
                                                                                  .toList(),
                                                                            ).search(_model.textController1.text).map((r) => r.object).toList();
                                                                            ;
                                                                          });
                                                                        },
                                                                      ),
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        hintText:
                                                                            'Kişisel bildimlerinde ara ...',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF644646),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController1Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Okunmayanlar',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFAAFF00),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (_model.textController1
                                                                            .text ==
                                                                        null ||
                                                                    _model.textController1
                                                                            .text ==
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final containerVar = containerNotificationsRecordList
                                                                          .where((e) =>
                                                                              !e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            containerVar.length,
                                                                            (containerVarIndex) {
                                                                          final containerVarItem =
                                                                              containerVar[containerVarIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                2.0,
                                                                                16.0,
                                                                                2.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await containerVarItem.reference.update(createNotificationsRecordData(
                                                                                  isRead: true,
                                                                                ));
                                                                                if (valueOrDefault(currentUserDocument?.notificationCount, 0) > 0) {
                                                                                  await currentUserReference!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(-(1)),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }
                                                                                if (containerVarItem.type == NotificationTypes.invitation.name) {
                                                                                  _model.invitation = await actions.getInvitationDocRef(
                                                                                    currentUserReference!.id,
                                                                                    containerVarItem.relatedDoc,
                                                                                  );
                                                                                  _model.invitaitonDocument = await InvitationsRecord.getDocumentOnce(_model.invitation!);

                                                                                  context.pushNamed(
                                                                                    InvitationDetailWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'invitations': serializeParam(
                                                                                        _model.invitaitonDocument,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'invitations': _model.invitaitonDocument,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (containerVarItem.type == NotificationTypes.task.name) {
                                                                                    _model.taskDocRef = await actions.getCompanyTaskDocRef(
                                                                                      containerVarItem.relatedDoc,
                                                                                      containerVarItem.company!.id,
                                                                                    );
                                                                                    _model.task = await CompanyTasksRecord.getDocumentOnce(_model.taskDocRef!);
                                                                                    _model.formFields = await queryFormFieldsRecordOnce(
                                                                                      parent: _model.task?.form,
                                                                                    );

                                                                                    context.pushNamed(
                                                                                      ResponseFormForTaskWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'companyTask': serializeParam(
                                                                                          _model.task,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'createdUserRef': serializeParam(
                                                                                          _model.task?.createdUserRef,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'formFields': serializeParam(
                                                                                          _model.formFields,
                                                                                          ParamType.Document,
                                                                                          isList: true,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companyTask': _model.task,
                                                                                        'formFields': _model.formFields,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    if (containerVarItem.type == NotificationTypes.taskReport.name) {
                                                                                      _model.companyWorker = await queryCompanyWorkersRecordOnce(
                                                                                        parent: containerVarItem.company,
                                                                                        queryBuilder: (companyWorkersRecord) => companyWorkersRecord.where(
                                                                                          'userRef',
                                                                                          isEqualTo: currentUserReference,
                                                                                        ),
                                                                                        singleRecord: true,
                                                                                      ).then((s) => s.firstOrNull);
                                                                                      if (_model.companyWorker!.hasUserRef()) {
                                                                                        if (containerVarItem.isDuty) {
                                                                                          _model.companyTaskDutiesDocRef = await actions.getCompanyTaskDutiesDocRef(
                                                                                            containerVarItem.relatedDoc,
                                                                                            containerVarItem.company!.id,
                                                                                          );
                                                                                          _model.companyTaskDuties = await CompanyTaskDutiesRecord.getDocumentOnce(_model.companyTaskDutiesDocRef!);

                                                                                          context.pushNamed(
                                                                                            CompanyTaskDutiesReadReportPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'company': serializeParam(
                                                                                                containerVarItem.company,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                              'dutiesForCompany': serializeParam(
                                                                                                _model.companyTaskDuties?.dutiesForCompany,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                              'companyTaskDuties': serializeParam(
                                                                                                _model.companyTaskDuties,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'isPartner': serializeParam(
                                                                                                !_model.companyWorker!.isWorker,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                              'canManage': serializeParam(
                                                                                                _model.companyWorker?.canManageReports,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'companyTaskDuties': _model.companyTaskDuties,
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          _model.companyTaskDocRef = await actions.getCompanyTaskDocRef(
                                                                                            containerVarItem.relatedDoc,
                                                                                            containerVarItem.company!.id,
                                                                                          );
                                                                                          _model.companyTask = await CompanyTasksRecord.getDocumentOnce(_model.companyTaskDocRef!);

                                                                                          context.pushNamed(
                                                                                            CompanyTaskReadReportsPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'task': serializeParam(
                                                                                                _model.companyTask,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'isPartner': serializeParam(
                                                                                                !_model.companyWorker!.isWorker,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                              'canManage': serializeParam(
                                                                                                _model.companyWorker?.canManageReports,
                                                                                                ParamType.bool,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'task': _model.companyTask,
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                    } else {
                                                                                      if (containerVarItem.type == NotificationTypes.dutiesTask.name) {
                                                                                        _model.dutiesForCompanyDocRef = await actions.getDutiesForCompanyDocRef(
                                                                                          containerVarItem.relatedDoc,
                                                                                          containerVarItem.company!.id,
                                                                                        );
                                                                                        _model.notifiDuty = await DutiesForCompanyRecord.getDocumentOnce(_model.dutiesForCompanyDocRef!);

                                                                                        context.pushNamed(
                                                                                          CompanyShowAllTaskDutiesPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.notifiDuty,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'dutiesForCompany': _model.notifiDuty,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        if (containerVarItem.type == NotificationTypes.instruction.name) {
                                                                                          context.pushNamed(InstructionPageWidget.routeName);
                                                                                        } else {
                                                                                          if (containerVarItem.type == NotificationTypes.confirmation.name) {
                                                                                            _model.confirmationDocRef = await actions.getConfirmationDocRef(
                                                                                              containerVarItem.relatedDoc,
                                                                                            );
                                                                                            _model.confirmation = await ConfirmationsRecord.getDocumentOnce(_model.confirmationDocRef!);

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
                                                                                            if (containerVarItem.type == 'message') {
                                                                                              _model.messageRef = await actions.getMessageDocRef(
                                                                                                containerVarItem.relatedDoc,
                                                                                              );
                                                                                              _model.messageDoc = await MessageRecord.getDocumentOnce(_model.messageRef!);
                                                                                              _model.messageDoc2 = await actions.getOrCreateMessage(
                                                                                                _model.messageDoc!.user1!.id,
                                                                                                _model.messageDoc!.user2!.id,
                                                                                                _model.messageDoc!.user1Name,
                                                                                                _model.messageDoc!.user2Name,
                                                                                                containerVarItem.messageType,
                                                                                                true,
                                                                                              );
                                                                                              _model.conversationName = await actions.getConversationName(
                                                                                                _model.messageRef!,
                                                                                              );
                                                                                              _model.conversationIdCompany = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                                conversationName: _model.conversationName!,
                                                                                                type: containerVarItem.messageType,
                                                                                              );
                                                                                              if (_model.messageDoc?.user1 == currentUserReference) {
                                                                                                _model.user2Company = await UsersRecord.getDocumentOnce(_model.messageDoc!.user2!);

                                                                                                context.pushNamed(
                                                                                                  MessageNewPageCopyWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'message': serializeParam(
                                                                                                      _model.messageDoc2,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                    'type': serializeParam(
                                                                                                      containerVarItem.messageType,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'conversationId': serializeParam(
                                                                                                      _model.conversationIdCompany?.lastOrNull?.id,
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'receiverUser': serializeParam(
                                                                                                      _model.user2Company,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'message': _model.messageDoc2,
                                                                                                    'receiverUser': _model.user2Company,
                                                                                                  },
                                                                                                );
                                                                                              } else {
                                                                                                _model.user1Company = await UsersRecord.getDocumentOnce(_model.messageDoc!.user1!);

                                                                                                context.pushNamed(
                                                                                                  MessageNewPageCopyWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'message': serializeParam(
                                                                                                      _model.messageDoc2,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                    'type': serializeParam(
                                                                                                      containerVarItem.messageType,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'conversationId': serializeParam(
                                                                                                      _model.conversationIdCompany?.lastOrNull?.id,
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'receiverUser': serializeParam(
                                                                                                      _model.user1Company,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'message': _model.messageDoc2,
                                                                                                    'receiverUser': _model.user1Company,
                                                                                                  },
                                                                                                );
                                                                                              }

                                                                                              _model.allSameNotifications = await queryNotificationsRecordOnce(
                                                                                                parent: currentUserReference,
                                                                                                queryBuilder: (notificationsRecord) => notificationsRecord
                                                                                                    .where(
                                                                                                      'relatedDoc',
                                                                                                      isEqualTo: containerVarItem.relatedDoc,
                                                                                                    )
                                                                                                    .where(
                                                                                                      'messageType',
                                                                                                      isEqualTo: containerVarItem.messageType,
                                                                                                    )
                                                                                                    .where(
                                                                                                      'isRead',
                                                                                                      isEqualTo: false,
                                                                                                    ),
                                                                                              );
                                                                                              for (int loop1Index = 0; loop1Index < _model.allSameNotifications!.length; loop1Index++) {
                                                                                                final currentLoop1Item = _model.allSameNotifications![loop1Index];

                                                                                                await currentLoop1Item.reference.update(createNotificationsRecordData(
                                                                                                  isRead: true,
                                                                                                ));
                                                                                              }

                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'notificationCount': FieldValue.increment(-(_model.allSameNotifications!.length)),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            } else {
                                                                                              if (containerVarItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                context.pushNamed(AllConfirmaitonsRequestPageWidget.routeName);
                                                                                              } else {
                                                                                                if (containerVarItem.type != NotificationTypes.confirmationWorkPlace.name) {
                                                                                                  if (containerVarItem.type == NotificationTypes.confirmationWorkplaceRequest.name) {
                                                                                                    context.pushNamed(AllConfirmaitonsRequestPageWidget.routeName);
                                                                                                  } else {
                                                                                                    if (containerVarItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                                      context.pushNamed(CurrentAccountRequestPageForUserWidget.routeName);
                                                                                                    } else {
                                                                                                      if (containerVarItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                                        context.pushNamed(
                                                                                                          CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'forPaid': serializeParam(
                                                                                                              false,
                                                                                                              ParamType.bool,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      } else {
                                                                                                        if (containerVarItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                                          context.pushNamed(
                                                                                                            CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'forPaid': serializeParam(
                                                                                                                true,
                                                                                                                ParamType.bool,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        } else {
                                                                                                          if (containerVarItem.type == NotificationTypes.acceptInvitation.name) {
                                                                                                            _model.invitationAccept = await actions.getInvitationDocRef(
                                                                                                              containerVarItem.triggeredUser!.id,
                                                                                                              containerVarItem.relatedDoc,
                                                                                                            );
                                                                                                            _model.invitationAcceptDoc = await InvitationsRecord.getDocumentOnce(_model.invitationAccept!);

                                                                                                            context.pushNamed(
                                                                                                              InvitationDetailWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'invitations': serializeParam(
                                                                                                                  _model.invitationAcceptDoc,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'invitations': _model.invitationAcceptDoc,
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            if (containerVarItem.type == NotificationTypes.createPartnership.name) {
                                                                                                              context.pushNamed(ReceivedPartnershipInvitationWidget.routeName);
                                                                                                            } else {
                                                                                                              if (containerVarItem.type == NotificationTypes.acceptPartnership.name) {
                                                                                                                _model.partnershipDocRef = await actions.getPartnershipInvitationDocRef(
                                                                                                                  containerVarItem.triggeredUser!.id,
                                                                                                                  containerVarItem.relatedDoc,
                                                                                                                );
                                                                                                                _model.partnerships = await PartnershipInvitationRecord.getDocumentOnce(_model.partnershipDocRef!);
                                                                                                                if (_model.partnerships!.isCompanyPartnership) {
                                                                                                                  _model.companyDetailPartnership = await CompaniesRecord.getDocumentOnce(_model.partnerships!.company!);

                                                                                                                  context.pushNamed(
                                                                                                                    CopmanyPartnershipsPageWidget.routeName,
                                                                                                                    queryParameters: {
                                                                                                                      'companyDetail': serializeParam(
                                                                                                                        _model.companyDetailPartnership,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'companyDetail': _model.companyDetailPartnership,
                                                                                                                    },
                                                                                                                  );
                                                                                                                } else {
                                                                                                                  _model.workPlaceDetailPartnership = await WorkPlacesRecord.getDocumentOnce(_model.partnerships!.workPlace!);

                                                                                                                  context.pushNamed(
                                                                                                                    PartnersWorkPlacePageWidget.routeName,
                                                                                                                    queryParameters: {
                                                                                                                      'workPlaceRef': serializeParam(
                                                                                                                        _model.workPlaceDetailPartnership,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'workPlaceRef': _model.workPlaceDetailPartnership,
                                                                                                                    },
                                                                                                                  );
                                                                                                                }
                                                                                                              } else {
                                                                                                                if (containerVarItem.type == NotificationTypes.sendFriendRequest.name) {
                                                                                                                  context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                                                                } else {
                                                                                                                  if (containerVarItem.type == NotificationTypes.acceptFriendRequest.name) {
                                                                                                                    context.pushNamed(SocialFriendPageWidget.routeName);
                                                                                                                  } else {
                                                                                                                    if (containerVarItem.type == NotificationTypes.shiftRequest.name) {
                                                                                                                      context.pushNamed(
                                                                                                                        ShiftRequestersPageWidget.routeName,
                                                                                                                        queryParameters: {
                                                                                                                          'company': serializeParam(
                                                                                                                            containerVarItem.company,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    } else {
                                                                                                                      if (containerVarItem.type == NotificationTypes.deleteRequest.name) {
                                                                                                                        context.pushNamed(
                                                                                                                          DeleteRequestPageWidget.routeName,
                                                                                                                          queryParameters: {
                                                                                                                            'company': serializeParam(
                                                                                                                              containerVarItem.company,
                                                                                                                              ParamType.DocumentReference,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
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

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        1.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 65.0,
                                                                                        height: 65.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/460/600',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                containerVarItem.content,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  containerVarItem.fullDescription,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                ),
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
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (_model.textController1
                                                                            .text !=
                                                                        null &&
                                                                    _model.textController1
                                                                            .text !=
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final containerVar = _model
                                                                          .simpleSearchResults1
                                                                          .where((e) =>
                                                                              !e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            containerVar.length,
                                                                            (containerVarIndex) {
                                                                          final containerVarItem =
                                                                              containerVar[containerVarIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                2.0,
                                                                                16.0,
                                                                                2.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await containerVarItem.reference.update(createNotificationsRecordData(
                                                                                  isRead: true,
                                                                                ));
                                                                                if (valueOrDefault(currentUserDocument?.notificationCount, 0) > 0) {
                                                                                  await currentUserReference!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(-(1)),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }
                                                                                if (containerVarItem.type == NotificationTypes.invitation.name) {
                                                                                  _model.invitationCpy = await actions.getInvitationDocRef(
                                                                                    currentUserReference!.id,
                                                                                    containerVarItem.relatedDoc,
                                                                                  );
                                                                                  _model.invitaitonDocumentCpy = await InvitationsRecord.getDocumentOnce(_model.invitationCpy!);

                                                                                  context.pushNamed(
                                                                                    InvitationDetailWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'invitations': serializeParam(
                                                                                        _model.invitaitonDocumentCpy,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'invitations': _model.invitaitonDocumentCpy,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (containerVarItem.type == NotificationTypes.task.name) {
                                                                                    _model.taskDocRefCpy = await actions.getCompanyTaskDocRef(
                                                                                      containerVarItem.relatedDoc,
                                                                                      containerVarItem.company!.id,
                                                                                    );
                                                                                    _model.taskCpy = await CompanyTasksRecord.getDocumentOnce(_model.taskDocRefCpy!);
                                                                                    _model.formFieldsCpy = await queryFormFieldsRecordOnce(
                                                                                      parent: _model.taskCpy?.form,
                                                                                    );

                                                                                    context.pushNamed(
                                                                                      ResponseFormForTaskWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'companyTask': serializeParam(
                                                                                          _model.taskCpy,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'createdUserRef': serializeParam(
                                                                                          _model.taskCpy?.createdUserRef,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'formFields': serializeParam(
                                                                                          _model.formFieldsCpy,
                                                                                          ParamType.Document,
                                                                                          isList: true,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companyTask': _model.taskCpy,
                                                                                        'formFields': _model.formFieldsCpy,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    if (containerVarItem.type == NotificationTypes.taskReport.name) {
                                                                                      if (containerVarItem.isDuty) {
                                                                                        _model.companyTaskDutiesDocRefCpy = await actions.getCompanyTaskDutiesDocRef(
                                                                                          containerVarItem.relatedDoc,
                                                                                          containerVarItem.company!.id,
                                                                                        );
                                                                                        _model.companyTaskDutiesCpy = await CompanyTaskDutiesRecord.getDocumentOnce(_model.companyTaskDutiesDocRefCpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskDutiesReadReportPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'company': serializeParam(
                                                                                              containerVarItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.companyTaskDutiesCpy?.dutiesForCompany,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'companyTaskDuties': serializeParam(
                                                                                              _model.companyTaskDutiesCpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'companyTaskDuties': _model.companyTaskDutiesCpy,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        _model.companyTaskDocRefCpy = await actions.getCompanyTaskDocRef(
                                                                                          containerVarItem.relatedDoc,
                                                                                          containerVarItem.company!.id,
                                                                                        );
                                                                                        _model.companyTaskCpy = await CompanyTasksRecord.getDocumentOnce(_model.companyTaskDocRefCpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskReadReportsPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'task': serializeParam(
                                                                                              _model.companyTaskCpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'task': _model.companyTaskCpy,
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      if (containerVarItem.type == NotificationTypes.dutiesTask.name) {
                                                                                        _model.dutiesForCompanyDocRefCpy = await actions.getDutiesForCompanyDocRef(
                                                                                          containerVarItem.relatedDoc,
                                                                                          containerVarItem.company!.id,
                                                                                        );
                                                                                        _model.notifiDutyCpy = await DutiesForCompanyRecord.getDocumentOnce(_model.dutiesForCompanyDocRefCpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyShowAllTaskDutiesPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.notifiDutyCpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'dutiesForCompany': _model.notifiDutyCpy,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        if (containerVarItem.type == NotificationTypes.instruction.name) {
                                                                                          context.pushNamed(InstructionPageWidget.routeName);
                                                                                        } else {
                                                                                          if (containerVarItem.type == NotificationTypes.confirmation.name) {
                                                                                            _model.confirmationDocRefCpy = await actions.getConfirmationDocRef(
                                                                                              containerVarItem.relatedDoc,
                                                                                            );
                                                                                            _model.confirmationCpy = await ConfirmationsRecord.getDocumentOnce(_model.confirmationDocRefCpy!);

                                                                                            context.pushNamed(
                                                                                              MessagePageWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'confirmation': serializeParam(
                                                                                                  _model.confirmationCpy,
                                                                                                  ParamType.Document,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                'confirmation': _model.confirmationCpy,
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            if (containerVarItem.type == NotificationTypes.confirmationCompany.name) {
                                                                                              _model.messageRef2 = await actions.getMessageDocRef(
                                                                                                containerVarItem.relatedDoc,
                                                                                              );
                                                                                              _model.messageDocCopy = await MessageRecord.getDocumentOnce(_model.messageRef2!);
                                                                                              _model.messageDoc2Copy = await actions.getOrCreateMessage(
                                                                                                _model.messageDocCopy!.user1!.id,
                                                                                                _model.messageDocCopy!.user2!.id,
                                                                                                _model.messageDocCopy!.user1Name,
                                                                                                _model.messageDocCopy!.user2Name,
                                                                                                containerVarItem.messageType,
                                                                                                true,
                                                                                              );
                                                                                              _model.conversationName2 = await actions.getConversationName(
                                                                                                _model.messageDoc2Copy!.reference,
                                                                                              );
                                                                                              _model.conversationIdCompany2 = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                                conversationName: _model.conversationName2!,
                                                                                                type: containerVarItem.messageType,
                                                                                              );
                                                                                              if (_model.messageDocCopy?.user1 == currentUserReference) {
                                                                                                _model.user2Company2 = await UsersRecord.getDocumentOnce(_model.messageDocCopy!.user2!);

                                                                                                context.pushNamed(
                                                                                                  MessageNewPageCopyWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'message': serializeParam(
                                                                                                      _model.messageDoc2Copy,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                    'type': serializeParam(
                                                                                                      containerVarItem.messageType,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'conversationId': serializeParam(
                                                                                                      _model.conversationIdCompany2?.lastOrNull?.id,
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'receiverUser': serializeParam(
                                                                                                      _model.user2Company2,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'message': _model.messageDoc2Copy,
                                                                                                    'receiverUser': _model.user2Company2,
                                                                                                  },
                                                                                                );
                                                                                              } else {
                                                                                                _model.user1Company2 = await UsersRecord.getDocumentOnce(_model.messageDocCopy!.user1!);

                                                                                                context.pushNamed(
                                                                                                  MessageNewPageCopyWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'message': serializeParam(
                                                                                                      _model.messageDoc2Copy,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                    'type': serializeParam(
                                                                                                      containerVarItem.messageType,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'conversationId': serializeParam(
                                                                                                      _model.conversationIdCompany2?.lastOrNull?.id,
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'receiverUser': serializeParam(
                                                                                                      _model.user1Company2,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'message': _model.messageDoc2Copy,
                                                                                                    'receiverUser': _model.user1Company2,
                                                                                                  },
                                                                                                );
                                                                                              }

                                                                                              _model.allSameNotifications2 = await queryNotificationsRecordOnce(
                                                                                                parent: currentUserReference,
                                                                                                queryBuilder: (notificationsRecord) => notificationsRecord
                                                                                                    .where(
                                                                                                      'relatedDoc',
                                                                                                      isEqualTo: containerVarItem.relatedDoc,
                                                                                                    )
                                                                                                    .where(
                                                                                                      'messageType',
                                                                                                      isEqualTo: containerVarItem.messageType,
                                                                                                    )
                                                                                                    .where(
                                                                                                      'isRead',
                                                                                                      isEqualTo: false,
                                                                                                    ),
                                                                                              );

                                                                                              await currentUserReference!.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'notificationCount': FieldValue.increment(-(_model.allSameNotifications2!.length)),
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                              for (int loop1Index = 0; loop1Index < _model.allSameNotifications2!.length; loop1Index++) {
                                                                                                final currentLoop1Item = _model.allSameNotifications2![loop1Index];

                                                                                                await currentLoop1Item.reference.update(createNotificationsRecordData());
                                                                                              }
                                                                                            } else {
                                                                                              if (containerVarItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                context.pushNamed(AllConfirmaitonsRequestPageWidget.routeName);
                                                                                              } else {
                                                                                                if (containerVarItem.type != NotificationTypes.confirmationWorkPlace.name) {
                                                                                                  if (containerVarItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                    context.pushNamed(AllConfirmaitonsRequestPageWidget.routeName);
                                                                                                  } else {
                                                                                                    if (containerVarItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                                      context.pushNamed(CurrentAccountRequestPageForUserWidget.routeName);
                                                                                                    } else {
                                                                                                      if (containerVarItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                                        context.pushNamed(
                                                                                                          CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'forPaid': serializeParam(
                                                                                                              false,
                                                                                                              ParamType.bool,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      } else {
                                                                                                        if (containerVarItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                                          context.pushNamed(
                                                                                                            CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'forPaid': serializeParam(
                                                                                                                true,
                                                                                                                ParamType.bool,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        } else {
                                                                                                          if (containerVarItem.type == NotificationTypes.acceptInvitation.name) {
                                                                                                            _model.invitationAcceptCopy = await actions.getInvitationDocRef(
                                                                                                              containerVarItem.triggeredUser!.id,
                                                                                                              containerVarItem.relatedDoc,
                                                                                                            );
                                                                                                            _model.invitationAcceptDocCopy = await InvitationsRecord.getDocumentOnce(_model.invitationAcceptCopy!);

                                                                                                            context.pushNamed(
                                                                                                              InvitationDetailWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'invitations': serializeParam(
                                                                                                                  _model.invitationAcceptDocCopy,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'invitations': _model.invitationAcceptDocCopy,
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            if (containerVarItem.type == NotificationTypes.createPartnership.name) {
                                                                                                              context.pushNamed(ReceivedPartnershipInvitationWidget.routeName);
                                                                                                            } else {
                                                                                                              if (containerVarItem.type == NotificationTypes.acceptPartnership.name) {
                                                                                                                _model.partnershipDocRef2 = await actions.getPartnershipInvitationDocRef(
                                                                                                                  containerVarItem.triggeredUser!.id,
                                                                                                                  containerVarItem.relatedDoc,
                                                                                                                );
                                                                                                                _model.partnerships2 = await PartnershipInvitationRecord.getDocumentOnce(_model.partnershipDocRef2!);
                                                                                                                if (_model.partnerships2!.isCompanyPartnership) {
                                                                                                                  _model.companyDetailPartnership2 = await CompaniesRecord.getDocumentOnce(_model.partnerships2!.company!);

                                                                                                                  context.pushNamed(
                                                                                                                    CopmanyPartnershipsPageWidget.routeName,
                                                                                                                    queryParameters: {
                                                                                                                      'companyDetail': serializeParam(
                                                                                                                        _model.companyDetailPartnership2,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'companyDetail': _model.companyDetailPartnership2,
                                                                                                                    },
                                                                                                                  );
                                                                                                                } else {
                                                                                                                  _model.workPlaceDetailPartnership2 = await WorkPlacesRecord.getDocumentOnce(_model.partnerships2!.workPlace!);

                                                                                                                  context.pushNamed(
                                                                                                                    PartnersWorkPlacePageWidget.routeName,
                                                                                                                    queryParameters: {
                                                                                                                      'workPlaceRef': serializeParam(
                                                                                                                        _model.workPlaceDetailPartnership2,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'workPlaceRef': _model.workPlaceDetailPartnership2,
                                                                                                                    },
                                                                                                                  );
                                                                                                                }
                                                                                                              } else {
                                                                                                                if (containerVarItem.type == NotificationTypes.sendFriendRequest.name) {
                                                                                                                  context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                                                                } else {
                                                                                                                  if (containerVarItem.type == NotificationTypes.acceptFriendRequest.name) {
                                                                                                                    context.pushNamed(SocialFriendPageWidget.routeName);
                                                                                                                  } else {
                                                                                                                    if (containerVarItem.type == NotificationTypes.shiftRequest.name) {
                                                                                                                      context.pushNamed(
                                                                                                                        ShiftRequestersPageWidget.routeName,
                                                                                                                        queryParameters: {
                                                                                                                          'company': serializeParam(
                                                                                                                            containerVarItem.company,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    } else {
                                                                                                                      if (containerVarItem.type == NotificationTypes.deleteRequest.name) {
                                                                                                                        context.pushNamed(
                                                                                                                          DeleteRequestPageWidget.routeName,
                                                                                                                          queryParameters: {
                                                                                                                            'company': serializeParam(
                                                                                                                              containerVarItem.company,
                                                                                                                              ParamType.DocumentReference,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
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

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        1.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 65.0,
                                                                                        height: 65.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/460/600',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                containerVarItem.content,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  containerVarItem.fullDescription,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                ),
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
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            25.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      'Okunanlar',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF00AAFF),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (_model.textController1
                                                                            .text ==
                                                                        null ||
                                                                    _model.textController1
                                                                            .text ==
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notifications = containerNotificationsRecordList
                                                                          .where((e) =>
                                                                              e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notifications.length,
                                                                            (notificationsIndex) {
                                                                          final notificationsItem =
                                                                              notifications[notificationsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                4.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (notificationsItem.type == NotificationTypes.invitation.name) {
                                                                                  _model.invitation2 = await actions.getInvitationDocRef(
                                                                                    currentUserReference!.id,
                                                                                    notificationsItem.relatedDoc,
                                                                                  );
                                                                                  _model.invitaitonDocument2 = await InvitationsRecord.getDocumentOnce(_model.invitation2!);

                                                                                  context.pushNamed(
                                                                                    InvitationDetailWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'invitations': serializeParam(
                                                                                        _model.invitaitonDocument2,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'invitations': _model.invitaitonDocument2,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (notificationsItem.type == NotificationTypes.task.name) {
                                                                                    _model.taskDocRef2 = await actions.getCompanyTaskDocRef(
                                                                                      notificationsItem.relatedDoc,
                                                                                      notificationsItem.company!.id,
                                                                                    );
                                                                                    _model.task2 = await CompanyTasksRecord.getDocumentOnce(_model.taskDocRef2!);
                                                                                    _model.formFields2 = await queryFormFieldsRecordOnce(
                                                                                      parent: _model.task2?.form,
                                                                                    );

                                                                                    context.pushNamed(
                                                                                      ResponseFormForTaskWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'companyTask': serializeParam(
                                                                                          _model.task2,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'createdUserRef': serializeParam(
                                                                                          _model.task2?.createdUserRef,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'formFields': serializeParam(
                                                                                          _model.formFields2,
                                                                                          ParamType.Document,
                                                                                          isList: true,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companyTask': _model.task2,
                                                                                        'formFields': _model.formFields2,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    if (notificationsItem.type == NotificationTypes.taskReport.name) {
                                                                                      if (notificationsItem.isDuty) {
                                                                                        _model.companyTaskDutiesDocRef2 = await actions.getCompanyTaskDutiesDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.companyTaskDuties2 = await CompanyTaskDutiesRecord.getDocumentOnce(_model.companyTaskDutiesDocRef2!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskDutiesReadReportPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'company': serializeParam(
                                                                                              notificationsItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.companyTaskDuties2?.dutiesForCompany,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'companyTaskDuties': serializeParam(
                                                                                              _model.companyTaskDuties2,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'companyTaskDuties': _model.companyTaskDuties2,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        _model.companyTaskDocRef2 = await actions.getCompanyTaskDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.companyTask2 = await CompanyTasksRecord.getDocumentOnce(_model.companyTaskDocRef2!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskReadReportsPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'task': serializeParam(
                                                                                              _model.companyTask2,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                            'isPartner': serializeParam(
                                                                                              false,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'task': _model.companyTask2,
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      if (notificationsItem.type == NotificationTypes.dutiesTask.name) {
                                                                                        _model.dutiesForCompanyDocRef2 = await actions.getDutiesForCompanyDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.notifiDuty2 = await DutiesForCompanyRecord.getDocumentOnce(_model.dutiesForCompanyDocRef2!);

                                                                                        context.pushNamed(
                                                                                          CompanyShowAllTaskDutiesPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.notifiDuty2,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'dutiesForCompany': _model.notifiDuty2,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        if (notificationsItem.type == NotificationTypes.instruction.name) {
                                                                                          context.pushNamed(InstructionPageWidget.routeName);
                                                                                        } else {
                                                                                          if (notificationsItem.type == NotificationTypes.confirmation.name) {
                                                                                            _model.confirmationDocRef2 = await actions.getConfirmationDocRef(
                                                                                              notificationsItem.relatedDoc,
                                                                                            );
                                                                                            _model.confirmation2 = await ConfirmationsRecord.getDocumentOnce(_model.confirmationDocRef2!);

                                                                                            context.pushNamed(
                                                                                              MessagePageWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'confirmation': serializeParam(
                                                                                                  _model.confirmation2,
                                                                                                  ParamType.Document,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                'confirmation': _model.confirmation2,
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            if (notificationsItem.type == NotificationTypes.confirmationCompany.name) {
                                                                                              _model.confirmationCompany2 = await actions.getCompanyConfirmaitonDocRef(
                                                                                                notificationsItem.relatedDoc,
                                                                                              );
                                                                                              _model.companyConfirmation2 = await CompanyConfirmationsRecord.getDocumentOnce(_model.confirmationCompany2!);

                                                                                              context.pushNamed(
                                                                                                CompanyConfirmationMessagePageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'companyConfirmation': serializeParam(
                                                                                                    _model.companyConfirmation2,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'companyConfirmation': _model.companyConfirmation2,
                                                                                                },
                                                                                              );
                                                                                            } else {
                                                                                              if (notificationsItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                context.pushNamed(
                                                                                                  CompanyConfirmationRequestPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'company': serializeParam(
                                                                                                      notificationsItem.company,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              } else {
                                                                                                if (notificationsItem.type == NotificationTypes.confirmationWorkPlace.name) {
                                                                                                  _model.confirmationWorkplace2 = await actions.getWorkplaceConfirmaitonDocRef(
                                                                                                    notificationsItem.relatedDoc,
                                                                                                  );
                                                                                                  _model.workplaceConfirmation2 = await WorkplaceConfirmationsRecord.getDocumentOnce(_model.confirmationWorkplace2!);

                                                                                                  context.pushNamed(
                                                                                                    WorkplaceConfirmationMessagePageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'workplaceConfirmation': serializeParam(
                                                                                                        _model.workplaceConfirmation2,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'workplaceConfirmation': _model.workplaceConfirmation2,
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  if (notificationsItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                    context.pushNamed(
                                                                                                      WorkplaceConfirmationRequestPageWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'workplace': serializeParam(
                                                                                                          notificationsItem.workplace,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  } else {
                                                                                                    if (notificationsItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                                      context.pushNamed(CurrentAccountRequestPageForUserWidget.routeName);
                                                                                                    } else {
                                                                                                      if (notificationsItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                                        context.pushNamed(
                                                                                                          CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'forPaid': serializeParam(
                                                                                                              false,
                                                                                                              ParamType.bool,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      } else {
                                                                                                        if (notificationsItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                                          context.pushNamed(
                                                                                                            CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'forPaid': serializeParam(
                                                                                                                true,
                                                                                                                ParamType.bool,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        } else {
                                                                                                          if (notificationsItem.type == NotificationTypes.acceptInvitation.name) {
                                                                                                            _model.invitationAcceptCopy2 = await actions.getInvitationDocRef(
                                                                                                              notificationsItem.triggeredUser!.id,
                                                                                                              notificationsItem.relatedDoc,
                                                                                                            );
                                                                                                            _model.invitationAcceptDocCopy2 = await InvitationsRecord.getDocumentOnce(_model.invitationAcceptCopy2!);

                                                                                                            context.pushNamed(
                                                                                                              InvitationDetailWidget.routeName,
                                                                                                              queryParameters: {
                                                                                                                'invitations': serializeParam(
                                                                                                                  _model.invitationAcceptDocCopy2,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'invitations': _model.invitationAcceptDocCopy2,
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            if (notificationsItem.type == NotificationTypes.createPartnership.name) {
                                                                                                              _model.partnershipDocRefCopy2 = await actions.getPartnershipDocRef(
                                                                                                                currentUserReference!.id,
                                                                                                                notificationsItem.relatedDoc,
                                                                                                              );
                                                                                                              _model.partnershipsCopy2 = await PartnershipsRecord.getDocumentOnce(_model.partnershipDocRefCopy2!);

                                                                                                              context.pushNamed(
                                                                                                                CompanyControlForPartnerPageWidget.routeName,
                                                                                                                queryParameters: {
                                                                                                                  'partnership': serializeParam(
                                                                                                                    _model.partnershipsCopy2,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                  'company': serializeParam(
                                                                                                                    notificationsItem.company,
                                                                                                                    ParamType.DocumentReference,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                                extra: <String, dynamic>{
                                                                                                                  'partnership': _model.partnershipsCopy2,
                                                                                                                },
                                                                                                              );
                                                                                                            } else {
                                                                                                              if (notificationsItem.type == NotificationTypes.sendFriendRequest.name) {
                                                                                                                context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                                                              } else {
                                                                                                                if (notificationsItem.type == NotificationTypes.acceptFriendRequest.name) {
                                                                                                                  context.pushNamed(SocialFriendPageWidget.routeName);
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
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        1.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 65.0,
                                                                                        height: 65.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/460/600',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                notificationsItem.content,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  notificationsItem.fullDescription,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", notificationsItem.creationTime!),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                ),
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
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (_model.textController1
                                                                            .text !=
                                                                        null &&
                                                                    _model.textController1
                                                                            .text !=
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notifications = _model
                                                                          .simpleSearchResults1
                                                                          .where((e) =>
                                                                              e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notifications.length,
                                                                            (notificationsIndex) {
                                                                          final notificationsItem =
                                                                              notifications[notificationsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                4.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (notificationsItem.type == NotificationTypes.invitation.name) {
                                                                                  _model.invitation2Cpy = await actions.getInvitationDocRef(
                                                                                    currentUserReference!.id,
                                                                                    notificationsItem.relatedDoc,
                                                                                  );
                                                                                  _model.invitaitonDocument2Cpy = await InvitationsRecord.getDocumentOnce(_model.invitation2Cpy!);

                                                                                  context.pushNamed(
                                                                                    InvitationDetailWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'invitations': serializeParam(
                                                                                        _model.invitaitonDocument2Cpy,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'invitations': _model.invitaitonDocument2Cpy,
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (notificationsItem.type == NotificationTypes.task.name) {
                                                                                    _model.taskDocRef2Cpy = await actions.getCompanyTaskDocRef(
                                                                                      notificationsItem.relatedDoc,
                                                                                      notificationsItem.company!.id,
                                                                                    );
                                                                                    _model.task2Cpy = await CompanyTasksRecord.getDocumentOnce(_model.taskDocRef2Cpy!);
                                                                                    _model.formFields2Cpy = await queryFormFieldsRecordOnce(
                                                                                      parent: _model.taskCpy?.form,
                                                                                    );

                                                                                    context.pushNamed(
                                                                                      ResponseFormForTaskWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'companyTask': serializeParam(
                                                                                          _model.task2Cpy,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'createdUserRef': serializeParam(
                                                                                          _model.task2Cpy?.createdUserRef,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                        'formFields': serializeParam(
                                                                                          _model.formFields2Cpy,
                                                                                          ParamType.Document,
                                                                                          isList: true,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'companyTask': _model.task2Cpy,
                                                                                        'formFields': _model.formFields2Cpy,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    if (notificationsItem.type == NotificationTypes.taskReport.name) {
                                                                                      if (notificationsItem.isDuty) {
                                                                                        _model.companyTaskDutiesDocRef2Cpy = await actions.getCompanyTaskDutiesDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.companyTaskDuties2Cpy = await CompanyTaskDutiesRecord.getDocumentOnce(_model.companyTaskDutiesDocRef2Cpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskDutiesReadReportPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'company': serializeParam(
                                                                                              notificationsItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.companyTaskDuties2Cpy?.dutiesForCompany,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                            'companyTaskDuties': serializeParam(
                                                                                              _model.companyTaskDuties2Cpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'companyTaskDuties': _model.companyTaskDuties2Cpy,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        _model.companyTaskDocRef2Cpy = await actions.getCompanyTaskDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.companyTask2Cpy = await CompanyTasksRecord.getDocumentOnce(_model.companyTaskDocRef2Cpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyTaskReadReportsPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'task': serializeParam(
                                                                                              _model.companyTask2Cpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                            'isPartner': serializeParam(
                                                                                              false,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'task': _model.companyTask2Cpy,
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      if (notificationsItem.type == NotificationTypes.dutiesTask.name) {
                                                                                        _model.dutiesForCompanyDocRef2Cpy = await actions.getDutiesForCompanyDocRef(
                                                                                          notificationsItem.relatedDoc,
                                                                                          notificationsItem.company!.id,
                                                                                        );
                                                                                        _model.notifiDuty2Cpy = await DutiesForCompanyRecord.getDocumentOnce(_model.dutiesForCompanyDocRef2Cpy!);

                                                                                        context.pushNamed(
                                                                                          CompanyShowAllTaskDutiesPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'dutiesForCompany': serializeParam(
                                                                                              _model.notifiDuty2Cpy,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'dutiesForCompany': _model.notifiDuty2Cpy,
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        if (notificationsItem.type == NotificationTypes.instruction.name) {
                                                                                          context.pushNamed(InstructionPageWidget.routeName);
                                                                                        } else {
                                                                                          if (notificationsItem.type == NotificationTypes.confirmation.name) {
                                                                                            _model.confirmationDocRef2Cpy = await actions.getConfirmationDocRef(
                                                                                              notificationsItem.relatedDoc,
                                                                                            );
                                                                                            _model.confirmation2Cpy = await ConfirmationsRecord.getDocumentOnce(_model.confirmationDocRef2Cpy!);

                                                                                            context.pushNamed(
                                                                                              MessagePageWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'confirmation': serializeParam(
                                                                                                  _model.confirmation2Cpy,
                                                                                                  ParamType.Document,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                'confirmation': _model.confirmation2Cpy,
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            if (notificationsItem.type == NotificationTypes.confirmationCompany.name) {
                                                                                              _model.confirmationCompany2Cpy = await actions.getCompanyConfirmaitonDocRef(
                                                                                                notificationsItem.relatedDoc,
                                                                                              );
                                                                                              _model.companyConfirmation2Cpy = await CompanyConfirmationsRecord.getDocumentOnce(_model.confirmationCompany2Cpy!);

                                                                                              context.pushNamed(
                                                                                                CompanyConfirmationMessagePageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'companyConfirmation': serializeParam(
                                                                                                    _model.companyConfirmation2Cpy,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'companyConfirmation': _model.companyConfirmation2Cpy,
                                                                                                },
                                                                                              );
                                                                                            } else {
                                                                                              if (notificationsItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                context.pushNamed(
                                                                                                  CompanyConfirmationRequestPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'company': serializeParam(
                                                                                                      notificationsItem.company,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              } else {
                                                                                                if (notificationsItem.type == NotificationTypes.confirmationWorkPlace.name) {
                                                                                                  _model.confirmationWorkplace2Cpy = await actions.getWorkplaceConfirmaitonDocRef(
                                                                                                    notificationsItem.relatedDoc,
                                                                                                  );
                                                                                                  _model.workplaceConfirmation2Cpy = await WorkplaceConfirmationsRecord.getDocumentOnce(_model.confirmationWorkplace2Cpy!);

                                                                                                  context.pushNamed(
                                                                                                    WorkplaceConfirmationMessagePageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'workplaceConfirmation': serializeParam(
                                                                                                        _model.workplaceConfirmation2Cpy,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'workplaceConfirmation': _model.workplaceConfirmation2Cpy,
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  if (notificationsItem.type == NotificationTypes.confirmationCompanyRequest.name) {
                                                                                                    context.pushNamed(
                                                                                                      WorkplaceConfirmationRequestPageWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'workplace': serializeParam(
                                                                                                          notificationsItem.workplace,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  } else {
                                                                                                    if (notificationsItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                                      context.pushNamed(CurrentAccountRequestPageForUserWidget.routeName);
                                                                                                    } else {
                                                                                                      if (notificationsItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                                        context.pushNamed(
                                                                                                          CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'forPaid': serializeParam(
                                                                                                              false,
                                                                                                              ParamType.bool,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      } else {
                                                                                                        if (notificationsItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                                          context.pushNamed(
                                                                                                            CurrentAccountBillRequestsPageForUserWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'forPaid': serializeParam(
                                                                                                                true,
                                                                                                                ParamType.bool,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        } else {
                                                                                                          if (notificationsItem.type == NotificationTypes.sendFriendRequest.name) {
                                                                                                            context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                                                          } else {
                                                                                                            if (notificationsItem.type == NotificationTypes.acceptFriendRequest.name) {
                                                                                                              context.pushNamed(SocialFriendPageWidget.routeName);
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
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        1.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 65.0,
                                                                                        height: 65.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/460/600',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                notificationsItem.content,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  notificationsItem.fullDescription,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", notificationsItem.creationTime!),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                ),
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
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final containerVar =
                                                              containerWorkPlacesRecordList
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: List.generate(
                                                                  containerVar
                                                                      .length,
                                                                  (containerVarIndex) {
                                                                final containerVarItem =
                                                                    containerVar[
                                                                        containerVarIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.selectedWorkPlace =
                                                                          containerVarItem
                                                                              .reference;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text: containerVarItem
                                                                        .name,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: _model.selectedWorkPlace ==
                                                                              containerVarItem
                                                                                  .reference
                                                                          ? Color(
                                                                              0xFF06FF20)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              WorkPlaceNotificationsRecord>>(
                                                        stream:
                                                            queryWorkPlaceNotificationsRecord(
                                                          parent: _model
                                                              .selectedWorkPlace,
                                                          queryBuilder: (workPlaceNotificationsRecord) =>
                                                              workPlaceNotificationsRecord
                                                                  .where(
                                                                    'isDelete',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'creationTime',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<WorkPlaceNotificationsRecord>
                                                              containerWorkPlaceNotificationsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00FFFFFF),
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00FFFFFF),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            8.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController2,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode2,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.textController2',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                        ),
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.simpleSearchResults2 =
                                                                                TextSearch(
                                                                              containerWorkPlaceNotificationsRecordList
                                                                                  .map(
                                                                                    (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.type!,
                                                                                      record.content!,
                                                                                      record.fullDescription!
                                                                                    ]),
                                                                                  )
                                                                                  .toList(),
                                                                            ).search(_model.textController2.text).map((r) => r.object).toList();
                                                                            ;
                                                                          });
                                                                        },
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          hintText:
                                                                              'İşyeri bildimlerinde ara ....',
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0xFF644646),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .textController2Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Okunmayanlar',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFFAAFF00),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model.textController2
                                                                              .text ==
                                                                          null ||
                                                                      _model.textController2
                                                                              .text ==
                                                                          '')
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final containerVar = containerWorkPlaceNotificationsRecordList
                                                                            .where((e) =>
                                                                                !e.isRead)
                                                                            .toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              containerVar.length,
                                                                              (containerVarIndex) {
                                                                            final containerVarItem =
                                                                                containerVar[containerVarIndex];
                                                                            return Visibility(
                                                                              visible: _model.selectedWorkPlace != null,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  containerVarItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerVarItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  if (_model.textController2
                                                                              .text !=
                                                                          null &&
                                                                      _model.textController2
                                                                              .text !=
                                                                          '')
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final containerVar = _model
                                                                            .simpleSearchResults2
                                                                            .where((e) =>
                                                                                !e.isRead)
                                                                            .toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              containerVar.length,
                                                                              (containerVarIndex) {
                                                                            final containerVarItem =
                                                                                containerVar[containerVarIndex];
                                                                            return Visibility(
                                                                              visible: _model.selectedWorkPlace != null,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  containerVarItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerVarItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          25.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        'Okunanlar',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF00AAFF),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model.textController2
                                                                              .text ==
                                                                          null ||
                                                                      _model.textController2
                                                                              .text ==
                                                                          '')
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final containerVar = containerWorkPlaceNotificationsRecordList
                                                                            .where((e) =>
                                                                                e.isRead)
                                                                            .toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              containerVar.length,
                                                                              (containerVarIndex) {
                                                                            final containerVarItem =
                                                                                containerVar[containerVarIndex];
                                                                            return Visibility(
                                                                              visible: _model.selectedWorkPlace != null,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  containerVarItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerVarItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  if (_model.textController2
                                                                              .text !=
                                                                          null &&
                                                                      _model.textController2
                                                                              .text !=
                                                                          '')
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final containerVar = _model
                                                                            .simpleSearchResults2
                                                                            .where((e) =>
                                                                                e.isRead)
                                                                            .toList();

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              containerVar.length,
                                                                              (containerVarIndex) {
                                                                            final containerVarItem =
                                                                                containerVar[containerVarIndex];
                                                                            return Visibility(
                                                                              visible: _model.selectedCompany != null,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  containerVarItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    containerVarItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final notificationsVar =
                                                              notificationsCompaniesRecordList
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: List.generate(
                                                                  notificationsVar
                                                                      .length,
                                                                  (notificationsVarIndex) {
                                                                final notificationsVarItem =
                                                                    notificationsVar[
                                                                        notificationsVarIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.selectedCompany =
                                                                          notificationsVarItem
                                                                              .reference;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text: notificationsVarItem
                                                                        .name,
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: _model.selectedCompany ==
                                                                              notificationsVarItem
                                                                                  .reference
                                                                          ? Color(
                                                                              0xFF06FF20)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              CompanyNotificationsRecord>>(
                                                        stream:
                                                            queryCompanyNotificationsRecord(
                                                          parent: _model
                                                              .selectedCompany,
                                                          queryBuilder: (companyNotificationsRecord) =>
                                                              companyNotificationsRecord
                                                                  .where(
                                                                    'isDelete',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'creationTime',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<CompanyNotificationsRecord>
                                                              containerCompanyNotificationsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00FFFFFF),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textController3,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode3,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.textController3',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.simpleSearchResults3 =
                                                                                TextSearch(
                                                                              containerCompanyNotificationsRecordList
                                                                                  .map(
                                                                                    (record) => TextSearchItem.fromTerms(record, [
                                                                                      record.content!,
                                                                                      record.fullDescription!,
                                                                                      record.type!
                                                                                    ]),
                                                                                  )
                                                                                  .toList(),
                                                                            ).search(_model.textController3.text).map((r) => r.object).toList();
                                                                            ;
                                                                          });
                                                                        },
                                                                      ),
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        hintText:
                                                                            'Şirket bildimlerinde ara ....',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF644646),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textController3Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Okunmayanlar',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFAAFF00),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (_model.textController3
                                                                            .text ==
                                                                        null ||
                                                                    _model.textController3
                                                                            .text ==
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notification = containerCompanyNotificationsRecordList
                                                                          .where((e) =>
                                                                              !e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notification.length,
                                                                            (notificationIndex) {
                                                                          final notificationItem =
                                                                              notification[notificationIndex];
                                                                          return Visibility(
                                                                            visible:
                                                                                _model.selectedCompany != null,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (notificationItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                    context.pushNamed(
                                                                                      CurrentAccountForCompanyPageRequestWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'company': serializeParam(
                                                                                          notificationItem.company,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    if (notificationItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                      context.pushNamed(
                                                                                        CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'forPaid': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'company': serializeParam(
                                                                                            notificationItem.company,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      if (notificationItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'forPaid': serializeParam(
                                                                                              true,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              notificationItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  notificationItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    notificationItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", notificationItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (_model.textController3
                                                                            .text !=
                                                                        null &&
                                                                    _model.textController3
                                                                            .text !=
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notification2 = _model
                                                                          .simpleSearchResults3
                                                                          .where((e) =>
                                                                              !e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notification2.length,
                                                                            (notification2Index) {
                                                                          final notification2Item =
                                                                              notification2[notification2Index];
                                                                          return Visibility(
                                                                            visible:
                                                                                _model.selectedCompany != null,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (notification2Item.type == NotificationTypes.currentAccountRequest.name) {
                                                                                    context.pushNamed(
                                                                                      CurrentAccountForCompanyPageRequestWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'company': serializeParam(
                                                                                          notification2Item.company,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    if (notification2Item.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                      context.pushNamed(
                                                                                        CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'forPaid': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'company': serializeParam(
                                                                                            notification2Item.company,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      if (notification2Item.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'forPaid': serializeParam(
                                                                                              true,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              notification2Item.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  notification2Item.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    notification2Item.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", notification2Item.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            25.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      'Okunanlar',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF00AAFF),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (_model.textController3
                                                                            .text ==
                                                                        null ||
                                                                    _model.textController3
                                                                            .text ==
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notificationCompany = containerCompanyNotificationsRecordList
                                                                          .where((e) =>
                                                                              e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notificationCompany.length,
                                                                            (notificationCompanyIndex) {
                                                                          final notificationCompanyItem =
                                                                              notificationCompany[notificationCompanyIndex];
                                                                          return Visibility(
                                                                            visible:
                                                                                _model.selectedCompany != null,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (notificationCompanyItem.type == NotificationTypes.currentAccountRequest.name) {
                                                                                    context.pushNamed(
                                                                                      CurrentAccountForCompanyPageRequestWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'company': serializeParam(
                                                                                          notificationCompanyItem.company,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    if (notificationCompanyItem.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                      context.pushNamed(
                                                                                        CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'forPaid': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'company': serializeParam(
                                                                                            notificationCompanyItem.company,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      if (notificationCompanyItem.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'forPaid': serializeParam(
                                                                                              true,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              notificationCompanyItem.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  notificationCompanyItem.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    notificationCompanyItem.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", notificationCompanyItem.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                if (_model.textController3
                                                                            .text !=
                                                                        null &&
                                                                    _model.textController3
                                                                            .text !=
                                                                        '')
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final notificationCompany2 = _model
                                                                          .simpleSearchResults3
                                                                          .where((e) =>
                                                                              e.isRead)
                                                                          .toList();

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            notificationCompany2.length,
                                                                            (notificationCompany2Index) {
                                                                          final notificationCompany2Item =
                                                                              notificationCompany2[notificationCompany2Index];
                                                                          return Visibility(
                                                                            visible:
                                                                                _model.selectedCompany != null,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (notificationCompany2Item.type == NotificationTypes.currentAccountRequest.name) {
                                                                                    context.pushNamed(
                                                                                      CurrentAccountForCompanyPageRequestWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'company': serializeParam(
                                                                                          notificationCompany2Item.company,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    if (notificationCompany2Item.type == NotificationTypes.currentAccountBillRequest.name) {
                                                                                      context.pushNamed(
                                                                                        CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'forPaid': serializeParam(
                                                                                            false,
                                                                                            ParamType.bool,
                                                                                          ),
                                                                                          'company': serializeParam(
                                                                                            notificationCompany2Item.company,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      if (notificationCompany2Item.type == NotificationTypes.setCurrentAccountBillPaidRequest.name) {
                                                                                        context.pushNamed(
                                                                                          CurrentAccountBillForCompanyPageRequestWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'forPaid': serializeParam(
                                                                                              true,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'company': serializeParam(
                                                                                              notificationCompany2Item.company,
                                                                                              ParamType.DocumentReference,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 3.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(
                                                                                          0.0,
                                                                                          1.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 65.0,
                                                                                          height: 65.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  'https://picsum.photos/seed/460/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  notificationCompany2Item.content,
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    notificationCompany2Item.fullDescription,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("relative", notificationCompany2Item.creationTime!),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
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
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    8.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController4,
                                                            focusNode: _model
                                                                .textFieldFocusNode4,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController4',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  'Tüm bildimlerinde ara ....',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF644646),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                            ),
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
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController4Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: Text(
                                                              'Okunmayanlar',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                    color: Color(
                                                                        0xFFAAFF00),
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
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              NotificationsRecord>>(
                                                        stream:
                                                            queryNotificationsRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (notificationsRecord) =>
                                                              notificationsRecord
                                                                  .where(
                                                                    'isDelete',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .where(
                                                                    'isRead',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'creationTime',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<NotificationsRecord>
                                                              containerNotificationsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar =
                                                                    containerNotificationsRecordList
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          2.0,
                                                                          16.0,
                                                                          2.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 65.0,
                                                                                height: 65.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  shape: BoxShape.circle,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        'https://picsum.photos/seed/460/600',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        containerVarItem.content,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          containerVarItem.fullDescription,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              'Okunanlar',
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
                                                                    color: Color(
                                                                        0xFF00AAFF),
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
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              NotificationsRecord>>(
                                                        stream:
                                                            queryNotificationsRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (notificationsRecord) =>
                                                              notificationsRecord
                                                                  .where(
                                                                    'isRead',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .where(
                                                                    'isDelete',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'creationTime',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<NotificationsRecord>
                                                              containerNotificationsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar =
                                                                    containerNotificationsRecordList
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          4.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 65.0,
                                                                                height: 65.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                  shape: BoxShape.circle,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        'https://picsum.photos/seed/460/600',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        containerVarItem.content,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          containerVarItem.fullDescription,
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat("relative", containerVarItem.creationTime!),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    8.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController5,
                                                            focusNode: _model
                                                                .textFieldFocusNode5,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController5',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () =>
                                                                  safeSetState(
                                                                      () {}),
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  'Tüm bildimlerinde ara ....',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF644646),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                            ),
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
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController5Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            'Okunmayanlar',
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
                                                                  color: Color(
                                                                      0xFFAAFF00),
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
                                                      StreamBuilder<
                                                          List<
                                                              SocialNotificationRecord>>(
                                                        stream:
                                                            querySocialNotificationRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (socialNotificationRecord) =>
                                                              socialNotificationRecord
                                                                  .where(
                                                                    'isRead',
                                                                    isEqualTo:
                                                                        false,
                                                                  )
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<SocialNotificationRecord>
                                                              containerSocialNotificationRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar =
                                                                    containerSocialNotificationRecordList
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          2.0,
                                                                          16.0,
                                                                          2.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await containerVarItem
                                                                              .reference
                                                                              .update(createSocialNotificationRecordData(
                                                                            isRead:
                                                                                true,
                                                                          ));
                                                                          if (containerVarItem.type ==
                                                                              NotificationTypes.sendFriendRequest.name) {
                                                                            context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                          } else {
                                                                            if (containerVarItem.type ==
                                                                                NotificationTypes.acceptFriendRequest.name) {
                                                                              context.pushNamed(SocialFriendPageWidget.routeName);
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 65.0,
                                                                                  height: 65.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://picsum.photos/seed/460/600',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerVarItem.title,
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            containerVarItem.description,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat("relative", containerVarItem.date!),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                          ),
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
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Text(
                                                            'Okunanlar',
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
                                                                  color: Color(
                                                                      0xFF00AAFF),
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
                                                      StreamBuilder<
                                                          List<
                                                              SocialNotificationRecord>>(
                                                        stream:
                                                            querySocialNotificationRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (socialNotificationRecord) =>
                                                              socialNotificationRecord
                                                                  .where(
                                                                    'isRead',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<SocialNotificationRecord>
                                                              containerSocialNotificationRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar =
                                                                    containerSocialNotificationRecordList
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      containerVar
                                                                          .length,
                                                                      (containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          4.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (containerVarItem.type ==
                                                                              NotificationTypes.sendFriendRequest.name) {
                                                                            context.pushNamed(SocialReceivedRequestWidget.routeName);
                                                                          } else {
                                                                            if (containerVarItem.type ==
                                                                                NotificationTypes.acceptFriendRequest.name) {
                                                                              context.pushNamed(SocialFriendPageWidget.routeName);
                                                                            }
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 65.0,
                                                                                  height: 65.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          'https://picsum.photos/seed/460/600',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerVarItem.title,
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            containerVarItem.description,
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat("relative", containerVarItem.date!),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                          ),
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
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.newNavBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NewNavBarWidget(
                            pageIndex: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
