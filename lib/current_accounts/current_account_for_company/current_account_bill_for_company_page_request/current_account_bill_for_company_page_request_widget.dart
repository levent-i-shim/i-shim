import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'current_account_bill_for_company_page_request_model.dart';
export 'current_account_bill_for_company_page_request_model.dart';

class CurrentAccountBillForCompanyPageRequestWidget extends StatefulWidget {
  const CurrentAccountBillForCompanyPageRequestWidget({
    super.key,
    this.company,
    bool? forPaid,
    bool? isPartner,
    bool? canManage,
  })  : this.forPaid = forPaid ?? false,
        this.isPartner = isPartner ?? false,
        this.canManage = canManage ?? false;

  final DocumentReference? company;
  final bool forPaid;
  final bool isPartner;
  final bool canManage;

  static String routeName = 'CurrentAccountBillForCompanyPageRequest';
  static String routePath = '/currentAccountBillForCompanyPageRequest';

  @override
  State<CurrentAccountBillForCompanyPageRequestWidget> createState() =>
      _CurrentAccountBillForCompanyPageRequestWidgetState();
}

class _CurrentAccountBillForCompanyPageRequestWidgetState
    extends State<CurrentAccountBillForCompanyPageRequestWidget> {
  late CurrentAccountBillForCompanyPageRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CurrentAccountBillForCompanyPageRequestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.forPaid) {
        _model.allNotifications2 = await queryCompanyNotificationsRecordOnce(
          parent: widget.company,
          queryBuilder: (companyNotificationsRecord) =>
              companyNotificationsRecord
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
          _model.currentAccountBill2 =
              await CurrentAccountBillRecord.getDocumentOnce(
                  currentLoop1Item.currentAccountBill!);
          _model.addToBills(_model.currentAccountBill2!);
          safeSetState(() {});
        }
      } else {
        _model.allNotifications = await queryCompanyNotificationsRecordOnce(
          parent: widget.company,
          queryBuilder: (companyNotificationsRecord) =>
              companyNotificationsRecord
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
          _model.currentAccountBill =
              await CurrentAccountBillRecord.getDocumentOnce(
                  currentLoop2Item.currentAccountBill!);
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
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var _shouldSetState = false;
                          if (widget.isPartner) {
                            if (!widget.canManage) {
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
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          }
                          _model.currentAccountCopy =
                              await CurrentAccountRecord.getDocumentOnce(
                                  billItem.parentReference);
                          _shouldSetState = true;
                          _model.amISideOnePartner = await actions.isEqual(
                            _model.currentAccountCopy!.sideOneID,
                            widget.company!.id,
                          );
                          _shouldSetState = true;
                          if (_model.amISideOnePartner!) {
                            if (_model.currentAccountCopy?.sideTwoType ==
                                'Şirket') {
                              _model.company3 = await actions.getCompanyDocRef(
                                _model.currentAccountCopy!.sideTwoID,
                              );
                              _shouldSetState = true;
                              _model.companyDetail3 =
                                  await CompaniesRecord.getDocumentOnce(
                                      _model.company3!);
                              _shouldSetState = true;
                              if (widget.forPaid) {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.companyDetail3?.name,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPageWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.companyDetail3?.name,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              }
                            } else {
                              _model.user3 = await actions.getUserDocRef(
                                _model.currentAccountCopy!.sideTwoID,
                              );
                              _shouldSetState = true;
                              _model.userDetail3 =
                                  await UsersRecord.getDocumentOnce(
                                      _model.user3!);
                              _shouldSetState = true;
                              if (widget.forPaid) {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.userDetail3?.displayName,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPageWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.userDetail3?.displayName,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              }
                            }
                          } else {
                            if (_model.currentAccountCopy?.sideOneType ==
                                'Şirket') {
                              _model.company4 = await actions.getCompanyDocRef(
                                _model.currentAccountCopy!.sideOneID,
                              );
                              _shouldSetState = true;
                              _model.companyDetail4 =
                                  await CompaniesRecord.getDocumentOnce(
                                      _model.company4!);
                              _shouldSetState = true;
                              if (widget.forPaid) {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.companyDetail4?.name,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPageWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.companyDetail4?.name,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              }
                            } else {
                              _model.user4 = await actions.getUserDocRef(
                                _model.currentAccountCopy!.sideOneID,
                              );
                              _shouldSetState = true;
                              _model.userDetail4 =
                                  await UsersRecord.getDocumentOnce(
                                      _model.user4!);
                              _shouldSetState = true;
                              if (widget.forPaid) {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.userDetail4?.displayName,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  CurrentAccountBillsDetailForCompanyPageWidget
                                      .routeName,
                                  queryParameters: {
                                    'bill': serializeParam(
                                      billItem,
                                      ParamType.Document,
                                    ),
                                    'currentAccount': serializeParam(
                                      AllCurrentAccountStruct(
                                        sideOneType: _model
                                            .currentAccountCopy?.sideOneType,
                                        sideOneId: _model
                                            .currentAccountCopy?.sideOneID,
                                        sideTwoType: _model
                                            .currentAccountCopy?.sideTwoType,
                                        sideTwoId: _model
                                            .currentAccountCopy?.sideTwoID,
                                        creationTime: _model
                                            .currentAccountCopy?.creationTime,
                                        status:
                                            _model.currentAccountCopy?.status,
                                        totalValueForSideOne: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideOne,
                                        totalValueForSideTwo: _model
                                            .currentAccountCopy
                                            ?.totalValueForSideTwo,
                                        currentAccountId: _model
                                            .currentAccountCopy?.reference,
                                        totalBillCount: _model
                                            .currentAccountCopy?.totalBillCount,
                                        totalUnPaidBillCount: _model
                                            .currentAccountCopy
                                            ?.totalUnPaidBillCount,
                                        amISideOne: _model.amISideOnePartner,
                                        counterPartyName:
                                            _model.userDetail4?.displayName,
                                      ),
                                      ParamType.DataStruct,
                                    ),
                                    'company': serializeParam(
                                      widget.company,
                                      ParamType.DocumentReference,
                                    ),
                                    'isPartner': serializeParam(
                                      widget.isPartner,
                                      ParamType.bool,
                                    ),
                                    'canManage': serializeParam(
                                      widget.canManage,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'bill': billItem,
                                  },
                                );
                              }
                            }
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 12.0, 16.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              billItem.totalValue.toString(),
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
                                                    billItem.isPaid
                                                        ? 'Ödendi'
                                                        : 'Ödenmedi',
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
                                              ],
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
