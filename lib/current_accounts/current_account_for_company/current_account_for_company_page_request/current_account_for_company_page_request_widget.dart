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
import 'current_account_for_company_page_request_model.dart';
export 'current_account_for_company_page_request_model.dart';

class CurrentAccountForCompanyPageRequestWidget extends StatefulWidget {
  const CurrentAccountForCompanyPageRequestWidget({
    super.key,
    this.company,
  });

  final DocumentReference? company;

  static String routeName = 'CurrentAccountForCompanyPageRequest';
  static String routePath = '/currentAccountForCompanyPageRequest';

  @override
  State<CurrentAccountForCompanyPageRequestWidget> createState() =>
      _CurrentAccountForCompanyPageRequestWidgetState();
}

class _CurrentAccountForCompanyPageRequestWidgetState
    extends State<CurrentAccountForCompanyPageRequestWidget> {
  late CurrentAccountForCompanyPageRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CurrentAccountForCompanyPageRequestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allNotifications = await queryCompanyNotificationsRecordOnce(
        parent: widget.company,
        queryBuilder: (companyNotificationsRecord) => companyNotificationsRecord
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
        _model.currentAccoun = await CurrentAccountRecord.getDocumentOnce(
            currentLoop1Item.currentAccount!);
        _model.amISideOnePartner = await actions.isEqual(
          _model.currentAccoun!.sideOneID,
          widget.company!.id,
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
              currentAccountId: _model.currentAccoun?.reference,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.companyDetail3?.name,
            ));
            _model.addToNotificationRefs(currentLoop1Item.reference);
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
              currentAccountId: _model.currentAccoun?.reference,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.userDetail3?.displayName,
            ));
            _model.addToNotificationRefs(currentLoop1Item.reference);
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
              currentAccountId: _model.currentAccoun?.reference,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.companyDetail4?.name,
            ));
            _model.addToNotificationRefs(currentLoop1Item.reference);
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
              currentAccountId: _model.currentAccoun?.reference,
              amISideOne: _model.amISideOnePartner,
              counterPartyName: _model.userDetail4?.displayName,
            ));
            _model.addToNotificationRefs(currentLoop1Item.reference);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Flexible(
                                flex: 8,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              currentAccountItem
                                                  .counterPartyName,
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
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    'Oluşturma Tarihi',
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
                                                Expanded(
                                                  child: Text(
                                                    dateTimeFormat(
                                                        "d/M/y",
                                                        currentAccountItem
                                                            .creationTime!),
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await currentAccountItem
                                                    .currentAccountId!
                                                    .update(
                                                        createCurrentAccountRecordData(
                                                  isAccepted: true,
                                                ));

                                                await _model.notificationRefs
                                                    .elementAtOrNull(
                                                        currentAccountIndex)!
                                                    .update(
                                                        createCompanyNotificationsRecordData(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await currentAccountItem
                                                  .currentAccountId!
                                                  .update(
                                                      createCurrentAccountRecordData(
                                                isReject: true,
                                              ));

                                              await _model.notificationRefs
                                                  .elementAtOrNull(
                                                      currentAccountIndex)!
                                                  .update(
                                                      createCompanyNotificationsRecordData(
                                                    isRead: true,
                                                    isReject: true,
                                                  ));
                                              if (_model.allCurrentAccount
                                                  .elementAtOrNull(
                                                      currentAccountIndex)!
                                                  .amISideOne) {
                                                if (_model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)
                                                        ?.sideTwoType ==
                                                    'Şirket') {
                                                  _model.companyNotifi =
                                                      await actions
                                                          .getCompanyDocRef(
                                                    _model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .sideTwoId,
                                                  );
                                                  _model.companyDetailNotifi =
                                                      await CompaniesRecord
                                                          .getDocumentOnce(_model
                                                              .companyNotifi!);

                                                  await CompanyNotificationsRecord
                                                          .createDoc(_model
                                                              .companyDetailNotifi!
                                                              .reference)
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
                                                          '${_model.companyDetailNotifi?.name} isimli Şirket Cari Hesap Oluşturma Talebinizi Reddetti',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  _model.userNotifi =
                                                      await actions
                                                          .getUserDocRef(
                                                    _model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .sideTwoId,
                                                  );
                                                  _model.userDetailNotifi =
                                                      await UsersRecord
                                                          .getDocumentOnce(
                                                              _model
                                                                  .userNotifi!);

                                                  await NotificationsRecord
                                                          .createDoc(_model
                                                              .userDetailNotifi!
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
                                                          '${_model.userDetailNotifi?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                                      isAccept: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                }
                                              } else {
                                                if (_model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)
                                                        ?.sideOneType ==
                                                    'Şirket') {
                                                  _model.company2Notifi =
                                                      await actions
                                                          .getCompanyDocRef(
                                                    _model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .sideOneId,
                                                  );
                                                  _model.companyDetail2Notifi =
                                                      await CompaniesRecord
                                                          .getDocumentOnce(_model
                                                              .company2Notifi!);

                                                  await CompanyNotificationsRecord
                                                          .createDoc(_model
                                                              .companyDetail2Notifi!
                                                              .reference)
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
                                                          '${_model.companyDetail2Notifi?.name} isimli Şirket Cari Hesap Oluşturma Talebinizi Reddetti',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  _model.user2Notifi =
                                                      await actions
                                                          .getUserDocRef(
                                                    _model.allCurrentAccount
                                                        .elementAtOrNull(
                                                            currentAccountIndex)!
                                                        .sideOneId,
                                                  );
                                                  _model.userDetail2Notifi =
                                                      await UsersRecord
                                                          .getDocumentOnce(_model
                                                              .user2Notifi!);

                                                  await NotificationsRecord
                                                          .createDoc(_model
                                                              .userDetail2Notifi!
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
                                                          '${_model.userDetail2Notifi?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                                      isAccept: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                }
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Reddedildi',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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

                                              safeSetState(() {});
                                            },
                                            text: 'Reddet',
                                            options: FFButtonOptions(
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
                                        ],
                                      ),
                                    ),
                                  ],
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
