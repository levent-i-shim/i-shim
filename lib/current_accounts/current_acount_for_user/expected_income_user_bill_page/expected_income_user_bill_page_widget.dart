import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'expected_income_user_bill_page_model.dart';
export 'expected_income_user_bill_page_model.dart';

class ExpectedIncomeUserBillPageWidget extends StatefulWidget {
  const ExpectedIncomeUserBillPageWidget({super.key});

  static String routeName = 'ExpectedIncomeUserBillPage';
  static String routePath = '/expectedIncomeUserBillPage';

  @override
  State<ExpectedIncomeUserBillPageWidget> createState() =>
      _ExpectedIncomeUserBillPageWidgetState();
}

class _ExpectedIncomeUserBillPageWidgetState
    extends State<ExpectedIncomeUserBillPageWidget> {
  late ExpectedIncomeUserBillPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpectedIncomeUserBillPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserIncomeRecord>>(
      stream: queryUserIncomeRecord(
        parent: currentUserReference,
        queryBuilder: (userIncomeRecord) => userIncomeRecord
            .where(
              'isExpected',
              isEqualTo: true,
            )
            .orderBy('expectedDate', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UserIncomeRecord> expectedIncomeUserBillPageUserIncomeRecordList =
            snapshot.data!;

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
                    final bill =
                        expectedIncomeUserBillPageUserIncomeRecordList.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: bill.length,
                      itemBuilder: (context, billIndex) {
                        final billItem = bill[billIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
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
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 100.0,
                                      child: VerticalDivider(
                                        width: 24.0,
                                        thickness: 4.0,
                                        indent: 12.0,
                                        endIndent: 12.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
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
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.billDocument =
                                                        await CurrentAccountBillRecord
                                                            .getDocumentOnce(
                                                                billItem
                                                                    .billRef!);
                                                    _model.currentAccount =
                                                        await CurrentAccountRecord
                                                            .getDocumentOnce(_model
                                                                .billDocument!
                                                                .parentReference);
                                                    _model.amISideOnePartner =
                                                        await actions.isEqual(
                                                      _model.currentAccount!
                                                          .sideOneID,
                                                      currentUserReference!.id,
                                                    );
                                                    if (_model.currentAccount
                                                            ?.sideTwoType ==
                                                        'Kullanmayan') {
                                                      context.pushNamed(
                                                        CurrentAccountBillsDetailForUserPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'bill':
                                                              serializeParam(
                                                            _model.billDocument,
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
                                                              currentAccountId: _model
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
                                                              counterPartyName: _model
                                                                  .currentAccount
                                                                  ?.sideTwoID,
                                                            ),
                                                            ParamType
                                                                .DataStruct,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'bill': _model
                                                              .billDocument,
                                                        },
                                                      );
                                                    } else {
                                                      if (_model
                                                          .amISideOnePartner!) {
                                                        if (_model
                                                                .currentAccount
                                                                ?.sideTwoType ==
                                                            'Şirket') {
                                                          _model.company3 =
                                                              await actions
                                                                  .getCompanyDocRef(
                                                            _model
                                                                .currentAccount!
                                                                .sideTwoID,
                                                          );
                                                          _model.companyDetail3 =
                                                              await CompaniesRecord
                                                                  .getDocumentOnce(
                                                                      _model
                                                                          .company3!);

                                                          context.pushNamed(
                                                            CurrentAccountBillsDetailForUserPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'bill':
                                                                  serializeParam(
                                                                _model
                                                                    .billDocument,
                                                                ParamType
                                                                    .Document,
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
                                                                  currentAccountId: _model
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
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'bill': _model
                                                                  .billDocument,
                                                            },
                                                          );
                                                        } else {
                                                          _model.user3 =
                                                              await actions
                                                                  .getUserDocRef(
                                                            _model
                                                                .currentAccount!
                                                                .sideTwoID,
                                                          );
                                                          _model.userDetail3 =
                                                              await UsersRecord
                                                                  .getDocumentOnce(
                                                                      _model
                                                                          .user3!);

                                                          context.pushNamed(
                                                            CurrentAccountBillsDetailForUserPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'bill':
                                                                  serializeParam(
                                                                _model
                                                                    .billDocument,
                                                                ParamType
                                                                    .Document,
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
                                                                  currentAccountId: _model
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
                                                                  counterPartyName: _model
                                                                      .userDetail3
                                                                      ?.displayName,
                                                                ),
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'bill': _model
                                                                  .billDocument,
                                                            },
                                                          );
                                                        }
                                                      } else {
                                                        if (_model
                                                                .currentAccount
                                                                ?.sideOneType ==
                                                            'Şirket') {
                                                          _model.company4 =
                                                              await actions
                                                                  .getCompanyDocRef(
                                                            _model
                                                                .currentAccount!
                                                                .sideOneID,
                                                          );
                                                          _model.companyDetail4 =
                                                              await CompaniesRecord
                                                                  .getDocumentOnce(
                                                                      _model
                                                                          .company4!);

                                                          context.pushNamed(
                                                            CurrentAccountBillsDetailForUserPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'bill':
                                                                  serializeParam(
                                                                _model
                                                                    .billDocument,
                                                                ParamType
                                                                    .Document,
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
                                                                  currentAccountId: _model
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
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'bill': _model
                                                                  .billDocument,
                                                            },
                                                          );
                                                        } else {
                                                          _model.user4 =
                                                              await actions
                                                                  .getUserDocRef(
                                                            _model
                                                                .currentAccount!
                                                                .sideOneID,
                                                          );
                                                          _model.userDetail4 =
                                                              await UsersRecord
                                                                  .getDocumentOnce(
                                                                      _model
                                                                          .user4!);

                                                          context.pushNamed(
                                                            CurrentAccountBillsDetailForUserPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'bill':
                                                                  serializeParam(
                                                                _model
                                                                    .billDocument,
                                                                ParamType
                                                                    .Document,
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
                                                                  currentAccountId: _model
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
                                                                  counterPartyName: _model
                                                                      .userDetail4
                                                                      ?.displayName,
                                                                ),
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'bill': _model
                                                                  .billDocument,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  billItem.value.toString(),
                                                  '0',
                                                ),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          "d/M/y",
                                                          billItem
                                                              .expectedDate!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
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
      },
    );
  }
}
