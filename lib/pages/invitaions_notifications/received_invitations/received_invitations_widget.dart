import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'received_invitations_model.dart';
export 'received_invitations_model.dart';

class ReceivedInvitationsWidget extends StatefulWidget {
  const ReceivedInvitationsWidget({super.key});

  static String routeName = 'receivedInvitations';
  static String routePath = '/receivedInvitations';

  @override
  State<ReceivedInvitationsWidget> createState() =>
      _ReceivedInvitationsWidgetState();
}

class _ReceivedInvitationsWidgetState extends State<ReceivedInvitationsWidget> {
  late ReceivedInvitationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceivedInvitationsModel());

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
          title: Text(
            'Gelen Çalışma davetiyelerim',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 16.0,
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
                  colors: [Color(0x56160720), Color(0xF4300232)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(-1.0, -0.34),
                  end: AlignmentDirectional(1.0, 0.34),
                ),
              ),
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    InvitationsRecord>(
                  pagingController: _model.setListViewController(
                      InvitationsRecord.collection(currentUserReference)
                          .where(
                            'receiver',
                            isEqualTo: currentUserReference,
                          )
                          .where(
                            'isDelete',
                            isEqualTo: false,
                          )
                          .orderBy('timestamp', descending: true),
                      parent: currentUserReference),
                  padding: EdgeInsets.zero,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<InvitationsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
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
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
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

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewInvitationsRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF0F1113),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewInvitationsRecord.sender!),
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

                              final rowUsersRecord = snapshot.data!;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 2.0),
                                            child: Text(
                                              listViewInvitationsRecord
                                                  .companyName,
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              '${rowUsersRecord.displayName}',
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                                    4.0, 2.0, 4.0, 10.0),
                                            child: Text(
                                              '${dateTimeFormat("relative", listViewInvitationsRecord.timestamp)}',
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  InvitationDetailWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'invitations':
                                                        serializeParam(
                                                      listViewInvitationsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'invitations':
                                                        listViewInvitationsRecord,
                                                  },
                                                );

                                                _model.notificationDoc =
                                                    await queryNotificationsRecordOnce(
                                                  parent: currentUserReference,
                                                  queryBuilder:
                                                      (notificationsRecord) =>
                                                          notificationsRecord
                                                              .where(
                                                    'relatedDoc',
                                                    isEqualTo:
                                                        listViewInvitationsRecord
                                                            .reference.id,
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);

                                                await _model
                                                    .notificationDoc!.reference
                                                    .update(
                                                        createNotificationsRecordData(
                                                  isRead: true,
                                                ));

                                                safeSetState(() {});
                                              },
                                              text: 'Davetiye detayı',
                                              options: FFButtonOptions(
                                                height: 24.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF497B8F),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                  Builder(
                                    builder: (context) {
                                      if (listViewInvitationsRecord.isAccept) {
                                        return Text(
                                          'Kabul Edildi',
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
                                        );
                                      } else if (listViewInvitationsRecord
                                          .isReject) {
                                        return Text(
                                          'Reddedildi',
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
                                                color: Color(0xFFFDFEFE),
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
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.role =
                                                      await CompanyRolesRecord
                                                          .getDocumentOnce(
                                                              listViewInvitationsRecord
                                                                  .role!);
                                                  _model.department =
                                                      await CompanyDepartmentsRecord
                                                          .getDocumentOnce(
                                                              listViewInvitationsRecord
                                                                  .department!);
                                                  _model.unit =
                                                      await CompanyUnitsRecord
                                                          .getDocumentOnce(
                                                              listViewInvitationsRecord
                                                                  .unit!);

                                                  var companyWorkersRecordReference =
                                                      CompanyWorkersRecord
                                                          .createDoc(
                                                              listViewInvitationsRecord
                                                                  .company!);
                                                  await companyWorkersRecordReference
                                                      .set({
                                                    ...createCompanyWorkersRecordData(
                                                      userRef:
                                                          currentUserReference,
                                                      userName:
                                                          currentUserDisplayName,
                                                      expanditureAuthority:
                                                          false,
                                                      formCreationAuthority:
                                                          false,
                                                      roleCreationAuthority:
                                                          false,
                                                      unitCreationAuthority:
                                                          false,
                                                      departmentCreationAuthority:
                                                          false,
                                                      allowence: 0.0,
                                                      canAcceptTransaction:
                                                          false,
                                                      stockAuthority: false,
                                                      roleName:
                                                          _model.role?.name,
                                                      unitName:
                                                          _model.unit?.name,
                                                      departmenName: _model
                                                          .department?.name,
                                                      currentAccountAuthority:
                                                          false,
                                                      isDelete: false,
                                                      canSendMoney: false,
                                                      canManageReports: false,
                                                      canCreateTask: false,
                                                      canManageUsers: false,
                                                      vehicleCreationAuthority:
                                                          false,
                                                      workPlace:
                                                          listViewInvitationsRecord
                                                              .workPlace,
                                                      canViewIncomeExpense:
                                                          false,
                                                      isWorker: true,
                                                      canViewEmployee: false,
                                                      canSendInstruction: false,
                                                      canAddManuelIncomeExpense:
                                                          false,
                                                      salary:
                                                          listViewInvitationsRecord
                                                              .salary,
                                                      workingHour:
                                                          listViewInvitationsRecord
                                                              .workingHour,
                                                      shiftSalary:
                                                          listViewInvitationsRecord
                                                              .shiftSalary,
                                                      canManageNotes: false,
                                                      canAddCostAccount: false,
                                                      canViewNotes: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'departmentRefs': [
                                                          _model.department
                                                              ?.reference
                                                        ],
                                                        'unitRefs': [
                                                          _model.unit?.reference
                                                        ],
                                                        'roleRefs': [
                                                          _model.role?.reference
                                                        ],
                                                        'updatedAt': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.companyWorkerRef =
                                                      CompanyWorkersRecord
                                                          .getDocumentFromData({
                                                    ...createCompanyWorkersRecordData(
                                                      userRef:
                                                          currentUserReference,
                                                      userName:
                                                          currentUserDisplayName,
                                                      expanditureAuthority:
                                                          false,
                                                      formCreationAuthority:
                                                          false,
                                                      roleCreationAuthority:
                                                          false,
                                                      unitCreationAuthority:
                                                          false,
                                                      departmentCreationAuthority:
                                                          false,
                                                      allowence: 0.0,
                                                      canAcceptTransaction:
                                                          false,
                                                      stockAuthority: false,
                                                      roleName:
                                                          _model.role?.name,
                                                      unitName:
                                                          _model.unit?.name,
                                                      departmenName: _model
                                                          .department?.name,
                                                      currentAccountAuthority:
                                                          false,
                                                      isDelete: false,
                                                      canSendMoney: false,
                                                      canManageReports: false,
                                                      canCreateTask: false,
                                                      canManageUsers: false,
                                                      vehicleCreationAuthority:
                                                          false,
                                                      workPlace:
                                                          listViewInvitationsRecord
                                                              .workPlace,
                                                      canViewIncomeExpense:
                                                          false,
                                                      isWorker: true,
                                                      canViewEmployee: false,
                                                      canSendInstruction: false,
                                                      canAddManuelIncomeExpense:
                                                          false,
                                                      salary:
                                                          listViewInvitationsRecord
                                                              .salary,
                                                      workingHour:
                                                          listViewInvitationsRecord
                                                              .workingHour,
                                                      shiftSalary:
                                                          listViewInvitationsRecord
                                                              .shiftSalary,
                                                      canManageNotes: false,
                                                      canAddCostAccount: false,
                                                      canViewNotes: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'departmentRefs': [
                                                          _model.department
                                                              ?.reference
                                                        ],
                                                        'unitRefs': [
                                                          _model.unit?.reference
                                                        ],
                                                        'roleRefs': [
                                                          _model.role?.reference
                                                        ],
                                                        'updatedAt':
                                                            DateTime.now(),
                                                      },
                                                    ),
                                                  }, companyWorkersRecordReference);

                                                  await WorkPlaceWorkerRecord
                                                          .createDoc(
                                                              listViewInvitationsRecord
                                                                  .workPlace!)
                                                      .set(
                                                          createWorkPlaceWorkerRecordData(
                                                    user: currentUserReference,
                                                    userName:
                                                        currentUserDisplayName,
                                                    companyWorkerRef: _model
                                                        .companyWorkerRef
                                                        ?.reference,
                                                    isDelete: false,
                                                    canAcceptTransaction: false,
                                                    departmentName:
                                                        _model.department?.name,
                                                    unitName: _model.unit?.name,
                                                    roleName: _model.role?.name,
                                                    isWorker: true,
                                                    salary:
                                                        listViewInvitationsRecord
                                                            .salary,
                                                  ));

                                                  await MyWorkedWorkPlaceRecord
                                                          .createDoc(
                                                              currentUserReference!)
                                                      .set({
                                                    ...createMyWorkedWorkPlaceRecordData(
                                                      company:
                                                          listViewInvitationsRecord
                                                              .company,
                                                      isWorking: true,
                                                      isDelete: false,
                                                      copmanyName:
                                                          listViewInvitationsRecord
                                                              .companyName,
                                                      salary:
                                                          listViewInvitationsRecord
                                                              .salary,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'date': FieldValue
                                                            .serverTimestamp(),
                                                        'workPlaceIds': [
                                                          listViewInvitationsRecord
                                                              .workPlace
                                                        ],
                                                      },
                                                    ),
                                                  });

                                                  await listViewInvitationsRecord
                                                      .reference
                                                      .update(
                                                          createInvitationsRecordData(
                                                    isAccept: true,
                                                  ));

                                                  await AjandaRecord.createDoc(
                                                          currentUserReference!)
                                                      .set({
                                                    ...createAjandaRecordData(
                                                      description:
                                                          'İşe Başlandı',
                                                      type: WorkHistoryTypes
                                                          .startJob.name,
                                                      invitation:
                                                          listViewInvitationsRecord
                                                              .reference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'dateTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });

                                                  await NotificationsRecord
                                                          .createDoc(
                                                              listViewInvitationsRecord
                                                                  .sender!)
                                                      .set({
                                                    ...createNotificationsRecordData(
                                                      type: NotificationTypes
                                                          .acceptInvitation
                                                          .name,
                                                      content:
                                                          'Davetiye Kabul Edildi',
                                                      relatedDoc:
                                                          listViewInvitationsRecord
                                                              .reference.id,
                                                      isRead: false,
                                                      isDelete: false,
                                                      company:
                                                          listViewInvitationsRecord
                                                              .company,
                                                      workplace:
                                                          listViewInvitationsRecord
                                                              .workPlace,
                                                      image: currentUserPhoto,
                                                      fullDescription:
                                                          '${currentUserDisplayName} Adlı Kişi Davetiyenizi Kabul Etti ${listViewInvitationsRecord.companyName} İsimli Şirkette ${listViewInvitationsRecord.workPlaceName} isimli İş Yerinde Çalışmaya Başladı.',
                                                      triggeredUser:
                                                          currentUserReference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Kabul Edildi',
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
                                                  _model.notificationDocAccept =
                                                      await queryNotificationsRecordOnce(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (notificationsRecord) =>
                                                            notificationsRecord
                                                                .where(
                                                      'relatedDoc',
                                                      isEqualTo:
                                                          listViewInvitationsRecord
                                                              .reference.id,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);

                                                  await _model
                                                      .notificationDocAccept!
                                                      .reference
                                                      .update(
                                                          createNotificationsRecordData(
                                                    isRead: true,
                                                  ));

                                                  await WorkHistoryRecord.createDoc(
                                                          currentUserReference!)
                                                      .set({
                                                    ...createWorkHistoryRecordData(
                                                      role: _model.role?.name,
                                                      company:
                                                          listViewInvitationsRecord
                                                              .company,
                                                      workPlace:
                                                          listViewInvitationsRecord
                                                              .workPlace,
                                                      unit: _model.unit?.name,
                                                      department: _model
                                                          .department?.name,
                                                      reportCount: 0,
                                                      instructionCount: 0,
                                                      receivedTaskCount: 0,
                                                      assignedTaskCount: 0,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'startDate': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  context.safePop();

                                                  safeSetState(() {});
                                                },
                                                text: 'Kabul et',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF0C3BDB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await listViewInvitationsRecord
                                                      .reference
                                                      .update(
                                                          createInvitationsRecordData(
                                                    isReject: true,
                                                  ));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Reddedildi',
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
                                                  _model.notifi2 =
                                                      await queryNotificationsRecordOnce(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (notificationsRecord) =>
                                                            notificationsRecord
                                                                .where(
                                                      'relatedDoc',
                                                      isEqualTo:
                                                          listViewInvitationsRecord
                                                              .reference.id,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);

                                                  await _model
                                                      .notifi2!.reference
                                                      .update(
                                                          createNotificationsRecordData(
                                                    isRead: true,
                                                  ));

                                                  await NotificationsRecord
                                                          .createDoc(
                                                              listViewInvitationsRecord
                                                                  .sender!)
                                                      .set({
                                                    ...createNotificationsRecordData(
                                                      type: NotificationTypes
                                                          .rejectInvitation
                                                          .name,
                                                      content:
                                                          'Davetiye Reddedildi',
                                                      relatedDoc:
                                                          listViewInvitationsRecord
                                                              .reference.id,
                                                      isRead: false,
                                                      isDelete: false,
                                                      company:
                                                          listViewInvitationsRecord
                                                              .company,
                                                      workplace:
                                                          listViewInvitationsRecord
                                                              .workPlace,
                                                      image: currentUserPhoto,
                                                      fullDescription:
                                                          '${currentUserDisplayName} Adlı Kişi Davetiyenizi Reddetti',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  context.safePop();

                                                  safeSetState(() {});
                                                },
                                                text: 'Reddet',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFEC0C0F),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
