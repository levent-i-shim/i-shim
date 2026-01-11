import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
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
import 'current_account_bill_requests_page_for_user_model.dart';
export 'current_account_bill_requests_page_for_user_model.dart';

class CurrentAccountBillRequestsPageForUserWidget extends StatefulWidget {
  const CurrentAccountBillRequestsPageForUserWidget({
    super.key,
    this.forPaid,
  });

  final bool? forPaid;

  static String routeName = 'CurrentAccountBillRequestsPageForUser';
  static String routePath = '/currentAccountBillRequestsPageForUser';

  @override
  State<CurrentAccountBillRequestsPageForUserWidget> createState() =>
      _CurrentAccountBillRequestsPageForUserWidgetState();
}

class _CurrentAccountBillRequestsPageForUserWidgetState
    extends State<CurrentAccountBillRequestsPageForUserWidget> {
  late CurrentAccountBillRequestsPageForUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CurrentAccountBillRequestsPageForUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.forPaid!) {
        _model.allNotifications2 = await queryNotificationsRecordOnce(
          parent: currentUserReference,
          queryBuilder: (notificationsRecord) => notificationsRecord
              .where(
                'type',
                isEqualTo:
                    NotificationTypes.setCurrentAccountBillPaidRequest.name,
              )
              .where(
                'isAccept',
                isEqualTo: false,
              ),
        );
        for (int loop1Index = 0;
            loop1Index < _model.allNotifications2!.length;
            loop1Index++) {
          final currentLoop1Item = _model.allNotifications2![loop1Index];
          _model.currentAccountBill2DocRef =
              await actions.getCurrentAccountBillDocRef(
            currentLoop1Item.relatedDoc,
          );
          _model.currentAccountBill2 =
              await CurrentAccountBillRecord.getDocumentOnce(
                  _model.currentAccountBill2DocRef!);
          _model.addToBills(_model.currentAccountBill2!);
          safeSetState(() {});
        }
      } else {
        _model.allNotifications = await queryNotificationsRecordOnce(
          parent: currentUserReference,
          queryBuilder: (notificationsRecord) => notificationsRecord
              .where(
                'type',
                isEqualTo: NotificationTypes.currentAccountBillRequest.name,
              )
              .where(
                'isAccept',
                isEqualTo: false,
              ),
        );
        for (int loop2Index = 0;
            loop2Index < _model.allNotifications!.length;
            loop2Index++) {
          final currentLoop2Item = _model.allNotifications![loop2Index];
          _model.currentAccountBillDocRef =
              await actions.getCurrentAccountBillDocRef(
            currentLoop2Item.relatedDoc,
          );
          _model.currentAccountBill =
              await CurrentAccountBillRecord.getDocumentOnce(
                  _model.currentAccountBillDocRef!);
          _model.addToBills(_model.currentAccountBill!);
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
                final bill = _model.bills.toList();

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: bill.length,
                  itemBuilder: (context, billIndex) {
                    final billItem = bill[billIndex];
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
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.currentAccount =
                                                  await CurrentAccountRecord
                                                      .getDocumentOnce(billItem
                                                          .parentReference);
                                              _model.amISideOnePartner =
                                                  await actions.isEqual(
                                                _model
                                                    .currentAccount!.sideOneID,
                                                currentUserReference!.id,
                                              );
                                              if (_model.amISideOnePartner!) {
                                                if (_model.currentAccount
                                                        ?.sideTwoType ==
                                                    'Şirket') {
                                                  _model.company3 =
                                                      await actions
                                                          .getCompanyDocRef(
                                                    _model.currentAccount!
                                                        .sideTwoID,
                                                  );
                                                  _model.companyDetail3 =
                                                      await CompaniesRecord
                                                          .getDocumentOnce(
                                                              _model.company3!);
                                                  if (widget!.forPaid!) {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .companyDetail3
                                                                    ?.name,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailForUserPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .companyDetail3
                                                                    ?.name,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  _model.user3 = await actions
                                                      .getUserDocRef(
                                                    _model.currentAccount!
                                                        .sideTwoID,
                                                  );
                                                  _model.userDetail3 =
                                                      await UsersRecord
                                                          .getDocumentOnce(
                                                              _model.user3!);
                                                  if (widget!.forPaid!) {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .userDetail3
                                                                    ?.displayName,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailForUserPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .userDetail3
                                                                    ?.displayName,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  }
                                                }
                                              } else {
                                                if (_model.currentAccount
                                                        ?.sideOneType ==
                                                    'Şirket') {
                                                  _model.company4 =
                                                      await actions
                                                          .getCompanyDocRef(
                                                    _model.currentAccount!
                                                        .sideOneID,
                                                  );
                                                  _model.companyDetail4 =
                                                      await CompaniesRecord
                                                          .getDocumentOnce(
                                                              _model.company4!);
                                                  if (widget!.forPaid!) {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .companyDetail4
                                                                    ?.name,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailForUserPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .companyDetail4
                                                                    ?.name,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  _model.user4 = await actions
                                                      .getUserDocRef(
                                                    _model.currentAccount!
                                                        .sideOneID,
                                                  );
                                                  _model.userDetail4 =
                                                      await UsersRecord
                                                          .getDocumentOnce(
                                                              _model.user4!);
                                                  if (widget!.forPaid!) {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .userDetail4
                                                                    ?.displayName,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      CurrentAccountBillsDetailForUserPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bill': serializeParam(
                                                          billItem,
                                                          ParamType.Document,
                                                        ),
                                                        'currentAccount':
                                                            serializeParam(
                                                          AllCurrentAccountStruct(
                                                            sideOneType: _model
                                                                .currentAccount
                                                                ?.sideOneType,
                                                            sideOneId: _model
                                                                .currentAccount
                                                                ?.sideOneID,
                                                            sideTwoType: _model
                                                                .currentAccount
                                                                ?.sideTwoType,
                                                            sideTwoId: _model
                                                                .currentAccount
                                                                ?.sideTwoID,
                                                            creationTime: _model
                                                                .currentAccount
                                                                ?.creationTime,
                                                            status: _model
                                                                .currentAccount
                                                                ?.status,
                                                            totalValueForSideOne: _model
                                                                .currentAccount
                                                                ?.totalValueForSideOne,
                                                            totalValueForSideTwo: _model
                                                                .currentAccount
                                                                ?.totalValueForSideTwo,
                                                            currentAccountId:
                                                                _model
                                                                    .currentAccount
                                                                    ?.reference,
                                                            totalBillCount: _model
                                                                .currentAccount
                                                                ?.totalBillCount,
                                                            totalUnPaidBillCount: _model
                                                                .currentAccount
                                                                ?.totalUnPaidBillCount,
                                                            amISideOne: _model
                                                                .amISideOnePartner,
                                                            counterPartyName:
                                                                _model
                                                                    .userDetail4
                                                                    ?.displayName,
                                                          ),
                                                          ParamType.DataStruct,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'bill': billItem,
                                                      },
                                                    );
                                                  }
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          billItem.totalValue.toString(),
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
                                                billItem.isPaid
                                                    ? 'Ödendi'
                                                    : 'Ödenmedi',
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
