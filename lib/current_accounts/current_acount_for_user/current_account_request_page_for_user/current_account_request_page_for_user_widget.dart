import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'current_account_request_page_for_user_model.dart';
export 'current_account_request_page_for_user_model.dart';

class CurrentAccountRequestPageForUserWidget extends StatefulWidget {
  const CurrentAccountRequestPageForUserWidget({super.key});

  static String routeName = 'CurrentAccountRequestPageForUser';
  static String routePath = '/currentAccountRequestPageForUser';

  @override
  State<CurrentAccountRequestPageForUserWidget> createState() =>
      _CurrentAccountRequestPageForUserWidgetState();
}

class _CurrentAccountRequestPageForUserWidgetState
    extends State<CurrentAccountRequestPageForUserWidget> {
  late CurrentAccountRequestPageForUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CurrentAccountRequestPageForUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allNotifications = await queryNotificationsRecordOnce(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where(
              'type',
              isEqualTo: NotificationTypes.currentAccountRequest.name,
            )
            .where(
              'isAccept',
              isEqualTo: false,
            ),
      );
      for (int loop1Index = 0;
          loop1Index < _model.allNotifications!.length;
          loop1Index++) {
        final currentLoop1Item = _model.allNotifications![loop1Index];
        _model.currentAccountDocRef = await actions.getCurrentAccountDocRef(
          currentLoop1Item.relatedDoc,
        );
        _model.currentAccoun = await CurrentAccountRecord.getDocumentOnce(
            _model.currentAccountDocRef!);
        _model.amISideOnePartner = await actions.isEqual(
          _model.currentAccoun!.sideOneID,
          currentUserReference!.id,
        );
        if (_model.amISideOnePartner!) {
          if (_model.currentAccoun?.sideTwoType == 'Şirket') {
            _model.company3 = await actions.getCompanyDocRef(
              _model.currentAccoun!.sideTwoID,
            );
            _model.companyDetail3 =
                await CompaniesRecord.getDocumentOnce(_model.company3!);
            _model.addToAllCurrentAccount(AllCurrentAccountStruct(
              sideOneType: _model.currentAccoun?.sideOneType,
              sideOneId: _model.currentAccoun?.sideOneID,
              sideTwoType: _model.currentAccoun?.sideTwoType,
              sideTwoId: _model.currentAccoun?.sideTwoID,
              creationTime: _model.currentAccoun?.creationTime,
              status: _model.currentAccoun?.status,
              totalValueForSideOne: _model.currentAccoun?.totalValueForSideOne,
              totalValueForSideTwo: _model.currentAccoun?.totalValueForSideTwo,
              currentAccountId: _model.currentAccoun?.reference,
              totalBillCount: _model.currentAccoun?.totalBillCount,
              totalUnPaidBillCount: _model.currentAccoun?.totalUnPaidBillCount,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.companyDetail3?.name,
            ));
            _model.notifications =
                _model.allNotifications!.toList().cast<NotificationsRecord>();
            safeSetState(() {});
          } else {
            _model.user3 = await actions.getUserDocRef(
              _model.currentAccoun!.sideTwoID,
            );
            _model.userDetail3 =
                await UsersRecord.getDocumentOnce(_model.user3!);
            _model.addToAllCurrentAccount(AllCurrentAccountStruct(
              sideOneType: _model.currentAccoun?.sideOneType,
              sideOneId: _model.currentAccoun?.sideOneID,
              sideTwoType: _model.currentAccoun?.sideTwoType,
              sideTwoId: _model.currentAccoun?.sideTwoID,
              creationTime: _model.currentAccoun?.creationTime,
              status: _model.currentAccoun?.status,
              totalValueForSideOne: _model.currentAccoun?.totalValueForSideOne,
              totalValueForSideTwo: _model.currentAccoun?.totalValueForSideTwo,
              currentAccountId: _model.currentAccoun?.reference,
              totalBillCount: _model.currentAccoun?.totalBillCount,
              totalUnPaidBillCount: _model.currentAccoun?.totalUnPaidBillCount,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.userDetail3?.displayName,
            ));
            _model.notifications =
                _model.allNotifications!.toList().cast<NotificationsRecord>();
            safeSetState(() {});
          }
        } else {
          if (_model.currentAccoun?.sideOneType == 'Şirket') {
            _model.company4 = await actions.getCompanyDocRef(
              _model.currentAccoun!.sideOneID,
            );
            _model.companyDetail4 =
                await CompaniesRecord.getDocumentOnce(_model.company4!);
            _model.addToAllCurrentAccount(AllCurrentAccountStruct(
              sideOneType: _model.currentAccoun?.sideOneType,
              sideOneId: _model.currentAccoun?.sideOneID,
              sideTwoType: _model.currentAccoun?.sideTwoType,
              sideTwoId: _model.currentAccoun?.sideTwoID,
              creationTime: _model.currentAccoun?.creationTime,
              status: _model.currentAccoun?.status,
              totalValueForSideOne: _model.currentAccoun?.totalValueForSideOne,
              totalValueForSideTwo: _model.currentAccoun?.totalValueForSideTwo,
              currentAccountId: _model.currentAccoun?.reference,
              totalBillCount: _model.currentAccoun?.totalBillCount,
              totalUnPaidBillCount: _model.currentAccoun?.totalUnPaidBillCount,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.companyDetail4?.name,
            ));
            _model.notifications =
                _model.allNotifications!.toList().cast<NotificationsRecord>();
            safeSetState(() {});
          } else {
            _model.user4 = await actions.getUserDocRef(
              _model.currentAccoun!.sideOneID,
            );
            _model.userDetail4 =
                await UsersRecord.getDocumentOnce(_model.user4!);
            _model.addToAllCurrentAccount(AllCurrentAccountStruct(
              sideOneType: _model.currentAccoun?.sideOneType,
              sideOneId: _model.currentAccoun?.sideOneID,
              sideTwoType: _model.currentAccoun?.sideTwoType,
              sideTwoId: _model.currentAccoun?.sideTwoID,
              creationTime: _model.currentAccoun?.creationTime,
              status: _model.currentAccoun?.status,
              totalValueForSideOne: _model.currentAccoun?.totalValueForSideOne,
              totalValueForSideTwo: _model.currentAccoun?.totalValueForSideTwo,
              currentAccountId: _model.currentAccoun?.reference,
              totalBillCount: _model.currentAccoun?.totalBillCount,
              totalUnPaidBillCount: _model.currentAccoun?.totalUnPaidBillCount,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.userDetail4?.displayName,
            ));
            _model.notifications =
                _model.allNotifications!.toList().cast<NotificationsRecord>();
            safeSetState(() {});
          }
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Builder(
              builder: (context) {
                final currentAccount = _model.allCurrentAccount.toList();

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: currentAccount.length,
                  itemBuilder: (context, currentAccountIndex) {
                    final currentAccountItem =
                        currentAccount[currentAccountIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: Color(0xFFE0E3E7),
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  width: 24.0,
                                  thickness: 4.0,
                                  indent: 12.0,
                                  endIndent: 12.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 12.0, 16.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Karşı Taraf: ${currentAccountItem.amISideOne ? currentAccountItem.sideTwoType : currentAccountItem.sideOneType}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await currentAccountItem
                                                      .currentAccountId!
                                                      .update(
                                                          createCurrentAccountRecordData(
                                                    isAccepted: true,
                                                  ));

                                                  await _model.notifications
                                                      .elementAtOrNull(
                                                          currentAccountIndex)!
                                                      .reference
                                                      .update(
                                                          createNotificationsRecordData(
                                                        isAccept: true,
                                                        isRead: true,
                                                      ));

                                                  await AjandaRecord.createDoc(
                                                          currentUserReference!)
                                                      .set({
                                                    ...createAjandaRecordData(
                                                      description:
                                                          'Cari Hesap Daveti Kabul Edildi',
                                                      type: WorkHistoryTypes
                                                          .currentAccountAccept
                                                          .name,
                                                      fullDescription:
                                                          '${currentAccountItem.counterPartyName} İle Cari Hesap Onaylandı',
                                                      currentAccount:
                                                          currentAccountItem
                                                              .currentAccountId,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'dateTime': FieldValue
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
                                                  context.safePop();
                                                },
                                                text: 'Kabul Et',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await currentAccountItem
                                                        .currentAccountId!
                                                        .update(
                                                            createCurrentAccountRecordData(
                                                      isReject: false,
                                                    ));

                                                    await _model.notifications
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .reference
                                                        .update(
                                                            createNotificationsRecordData(
                                                          isRead: true,
                                                        ));

                                                    await AjandaRecord.createDoc(
                                                            currentUserReference!)
                                                        .set({
                                                      ...createAjandaRecordData(
                                                        description:
                                                            'Cari Hesap Daveti Reddedildi',
                                                        type: WorkHistoryTypes
                                                            .currentAccountReject
                                                            .name,
                                                        fullDescription:
                                                            '${currentAccountItem.counterPartyName} İle Cari Hesap Reddedildi',
                                                        currentAccount:
                                                            currentAccountItem
                                                                .currentAccountId,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'dateTime': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    if (_model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .amISideOne) {
                                                      if (_model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)
                                                              ?.sideTwoType ==
                                                          'Şirket') {
                                                        _model.company =
                                                            await actions
                                                                .getCompanyDocRef(
                                                          _model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)!
                                                              .sideTwoId,
                                                        );
                                                        _model.companyDetail =
                                                            await CompaniesRecord
                                                                .getDocumentOnce(
                                                                    _model
                                                                        .company!);

                                                        await CompanyNotificationsRecord
                                                                .createDoc(_model
                                                                    .company!)
                                                            .set({
                                                          ...createCompanyNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .currentAccountRejected
                                                                .name,
                                                            content:
                                                                'Cari Hesap Reddedildi',
                                                            isRead: false,
                                                            isDelete: false,
                                                            fullDescription:
                                                                '${_model.companyDetail?.name} isimli Şirket Cari Hesap Oluşturma Talebinizi Reddetti',
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        _model.user =
                                                            await actions
                                                                .getUserDocRef(
                                                          _model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)!
                                                              .sideTwoId,
                                                        );
                                                        _model.userDetail =
                                                            await UsersRecord
                                                                .getDocumentOnce(
                                                                    _model
                                                                        .user!);

                                                        await NotificationsRecord
                                                                .createDoc(
                                                                    _model
                                                                        .user!)
                                                            .set({
                                                          ...createNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .currentAccountRejected
                                                                .name,
                                                            content:
                                                                'Cari Hesap Reddedildi',
                                                            isRead: false,
                                                            isDelete: false,
                                                            fullDescription:
                                                                '${_model.userDetail?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                                            isAccept: false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    } else {
                                                      if (_model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)
                                                              ?.sideOneType ==
                                                          'Şirket') {
                                                        _model.company2 =
                                                            await actions
                                                                .getCompanyDocRef(
                                                          _model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)!
                                                              .sideOneId,
                                                        );
                                                        _model.companyDetail2 =
                                                            await CompaniesRecord
                                                                .getDocumentOnce(
                                                                    _model
                                                                        .company2!);

                                                        await CompanyNotificationsRecord
                                                                .createDoc(_model
                                                                    .company2!)
                                                            .set({
                                                          ...createCompanyNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .currentAccountRejected
                                                                .name,
                                                            content:
                                                                'Cari Hesap Reddedildi',
                                                            isRead: false,
                                                            isDelete: false,
                                                            fullDescription:
                                                                '${_model.companyDetail2?.name} isimli Şirket Cari Hesap Oluşturma Talebinizi Reddetti',
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        _model.user2 =
                                                            await actions
                                                                .getUserDocRef(
                                                          _model
                                                              .allCurrentAccount
                                                              .elementAtOrNull(
                                                                  currentAccountIndex)!
                                                              .sideOneId,
                                                        );
                                                        _model.userDetail2 =
                                                            await UsersRecord
                                                                .getDocumentOnce(
                                                                    _model
                                                                        .user2!);

                                                        await NotificationsRecord
                                                                .createDoc(_model
                                                                    .userDetail2!
                                                                    .reference)
                                                            .set({
                                                          ...createNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .currentAccountRejected
                                                                .name,
                                                            content:
                                                                'Cari Hesap Reddedildi',
                                                            isRead: false,
                                                            isDelete: false,
                                                            fullDescription:
                                                                '${_model.userDetail2?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                                            isAccept: false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    }

                                                    ScaffoldMessenger.of(
                                                            context)
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
                                                    context.safePop();

                                                    safeSetState(() {});
                                                  },
                                                  text: 'Reddet',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          currentAccountItem.counterPartyName,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Text(
                                                'Oluşturma Tarihi',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            Expanded(
                                              child: Text(
                                                dateTimeFormat(
                                                    "d/M/y",
                                                    currentAccountItem
                                                        .creationTime!),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            ),
                                          ],
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
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
