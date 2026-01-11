import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_or_collection_cash_table_model.dart';
export 'payment_or_collection_cash_table_model.dart';

class PaymentOrCollectionCashTableWidget extends StatefulWidget {
  const PaymentOrCollectionCashTableWidget({super.key});

  static String routeName = 'paymentOrCollectionCashTable';
  static String routePath = '/paymentOrCollectionCashTable';

  @override
  State<PaymentOrCollectionCashTableWidget> createState() =>
      _PaymentOrCollectionCashTableWidgetState();
}

class _PaymentOrCollectionCashTableWidgetState
    extends State<PaymentOrCollectionCashTableWidget>
    with TickerProviderStateMixin {
  late PaymentOrCollectionCashTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentOrCollectionCashTableModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        backgroundColor: Color(0xFF090622),
        appBar: AppBar(
          backgroundColor: Color(0xFF090620),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 66.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 36.0,
              ),
              onPressed: () async {
                context.pop();
                HapticFeedback.lightImpact();
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Nakit Takip',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 4.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.lightImpact();
                    },
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF613EEA),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x7F613EEA),
                          )
                        ],
                        borderRadius: BorderRadius.circular(32.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/01.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  unselectedLabelStyle: FlutterFlowTheme.of(context)
                      .titleMedium
                      .override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  indicatorColor: FlutterFlowTheme.of(context).primary,
                  tabs: [
                    Tab(
                      text: 'Ödeme-Tahsilat',
                    ),
                    Tab(
                      text: 'Personel',
                    ),
                    Tab(
                      text: 'Sigorta',
                    ),
                    Tab(
                      text: 'Vergi',
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [
                      () async {
                        HapticFeedback.lightImpact();
                      },
                      () async {
                        HapticFeedback.lightImpact();
                      },
                      () async {
                        HapticFeedback.lightImpact();
                      },
                      () async {
                        HapticFeedback.lightImpact();
                      }
                    ][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 4.0, 8.0, 4.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFEDC51D),
                                            Color(0xFFD9FF00)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.dataset_linked_outlined,
                                                  color: Colors.black,
                                                  size: 22.0,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Tablo olarak gör',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.black,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 15.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.mediumImpact();

                                        context.pushNamed(
                                          AddNewFinanceNoteCompanyWidget
                                              .routeName,
                                          queryParameters: {
                                            'isEdit': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 140.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFEDC51D),
                                              Color(0xFFD9FF00)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .monetization_on_outlined,
                                                    color: Colors.black,
                                                    size: 22.0,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '  Yeni ekle',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 6.0, 24.0, 2.0),
                            child: StreamBuilder<List<CompaniesRecord>>(
                              stream: queryCompaniesRecord(
                                queryBuilder: (companiesRecord) =>
                                    companiesRecord.where(Filter.or(
                                  Filter(
                                    'owner',
                                    isEqualTo: currentUserReference,
                                  ),
                                  Filter(
                                    'partners',
                                    arrayContains: currentUserReference,
                                  ),
                                )),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CompaniesRecord>
                                    whichCompaniesDropDowCompaniesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .whichCompaniesDropDowValueController ??=
                                      FormFieldController<String>(
                                    _model.whichCompaniesDropDowValue ??=
                                        'Other',
                                  ),
                                  options: List<String>.from(
                                      whichCompaniesDropDowCompaniesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      whichCompaniesDropDowCompaniesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model
                                        .whichCompaniesDropDowValue = val);
                                    _model.indexTotalSpending = 0;
                                    _model.spendingTotal = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDD =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDowValue!,
                                    );
                                    _model.cashListToGetValues =
                                        await queryFinancialNoteCompanyRecordOnce(
                                      parent: _model.companyRefFromDD,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo:
                                                        _model.companyRefFromDD,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'expense',
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCashCount =
                                        await queryFinancialNoteCompanyRecordCount(
                                      parent: _model.companyRefFromDD,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo:
                                                        _model.companyRefFromDD,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'expense',
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    while (_model.indexTotalSpending! <=
                                        _model.expenseCompanyCashCount!) {
                                      _model.spendingTotal = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.spendingTotal!,
                                          _model.cashListToGetValues!
                                              .elementAtOrNull(
                                                  _model.indexTotalSpending!)!
                                              .value,
                                          _model.spendingTotal!);
                                      safeSetState(() {});
                                      _model.indexTotalSpending =
                                          _model.indexTotalSpending! + 1;
                                      safeSetState(() {});
                                    }
                                    _model.indexTotalIncome = 0;
                                    _model.collectionTotal = 0.0;
                                    safeSetState(() {});
                                    _model.cashRefToGetIncomeValues =
                                        await queryFinancialNoteCompanyRecordOnce(
                                      parent: _model.companyRefFromDD,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo:
                                                        _model.companyRefFromDD,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'income',
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    _model.incomeCompanyCashCount =
                                        await queryFinancialNoteCompanyRecordCount(
                                      parent: _model.companyRefFromDD,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo:
                                                        _model.companyRefFromDD,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'income',
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    while (_model.indexTotalIncome! <=
                                        _model.incomeCompanyCashCount!) {
                                      _model.collectionTotal = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.collectionTotal!,
                                          _model.cashRefToGetIncomeValues!
                                              .elementAtOrNull(
                                                  _model.indexTotalIncome!)!
                                              .value,
                                          _model.collectionTotal!);
                                      safeSetState(() {});
                                      _model.indexTotalIncome =
                                          _model.indexTotalIncome! + 1;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Hangi şirketin ?',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 2.0, 24.0, 2.0),
                            child: StreamBuilder<List<WorkPlacesRecord>>(
                              stream: queryWorkPlacesRecord(
                                queryBuilder: (workPlacesRecord) =>
                                    workPlacesRecord
                                        .where(
                                          'owner',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'isDelete',
                                          isEqualTo: false,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<WorkPlacesRecord>
                                    workPlaceDropDownWorkPlacesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .workPlaceDropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.workPlaceDropDownValue ??= 'Other',
                                  ),
                                  options: List<String>.from(
                                      workPlaceDropDownWorkPlacesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      workPlaceDropDownWorkPlacesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.workPlaceDropDownValue = val);
                                    _model.indexTotalSpending = 0;
                                    _model.spendingTotal = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDD2 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDowValue!,
                                    );
                                    _model.whichWorkPlaceRef =
                                        await actions.getWorkPlaceDocRef(
                                      _model.workPlaceDropDownValue!,
                                    );
                                    _model.cashRefToGetValues2 =
                                        await queryFinancialNoteCompanyRecordOnce(
                                      parent: _model.companyRefFromDD2,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo: _model
                                                        .companyRefFromDD2,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'expense',
                                                  )
                                                  .where(
                                                    'workPlaceRef',
                                                    isEqualTo: _model
                                                        .whichWorkPlaceRef,
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCashCount2 =
                                        await queryFinancialNoteCompanyRecordCount(
                                      parent: _model.companyRefFromDD2,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo: _model
                                                        .companyRefFromDD2,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'expense',
                                                  )
                                                  .where(
                                                    'workPlaceRef',
                                                    isEqualTo: _model
                                                        .whichWorkPlaceRef,
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    while (_model.indexTotalSpending! <=
                                        _model.expenseCompanyCashCount2!) {
                                      _model.spendingTotal = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.spendingTotal!,
                                          _model.cashListToGetValues!
                                              .elementAtOrNull(
                                                  _model.indexTotalSpending!)!
                                              .value,
                                          _model.spendingTotal!);
                                      safeSetState(() {});
                                      _model.indexTotalSpending =
                                          _model.indexTotalSpending! + 1;
                                      safeSetState(() {});
                                    }
                                    _model.collectionTotal = 0.0;
                                    _model.indexTotalIncome = 0;
                                    safeSetState(() {});
                                    _model.cashRefToGetWorkPlaceIncomeValues =
                                        await queryFinancialNoteCompanyRecordOnce(
                                      parent: _model.companyRefFromDD2,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo: _model
                                                        .companyRefFromDD2,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'income',
                                                  )
                                                  .where(
                                                    'workPlaceRef',
                                                    isEqualTo: _model
                                                        .whichWorkPlaceRef,
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    _model.incomeWorkPlaceCashCount2 =
                                        await queryFinancialNoteCompanyRecordCount(
                                      parent: _model.companyRefFromDD,
                                      queryBuilder:
                                          (financialNoteCompanyRecord) =>
                                              financialNoteCompanyRecord
                                                  .where(
                                                    'companyRef',
                                                    isEqualTo: _model
                                                        .companyRefFromDD2,
                                                  )
                                                  .where(
                                                    'incomeOrExpense',
                                                    isEqualTo: 'income',
                                                  )
                                                  .where(
                                                    'workPlaceRef',
                                                    isEqualTo: _model
                                                        .whichWorkPlaceRef,
                                                  )
                                                  .orderBy('creationDate',
                                                      descending: true),
                                    );
                                    while (_model.indexTotalIncome! <=
                                        _model.incomeWorkPlaceCashCount2!) {
                                      _model.collectionTotal = (double var1,
                                              double var2, double var3) {
                                        return var3 = var2 + var1;
                                      }(
                                          _model.collectionTotal!,
                                          _model
                                              .cashRefToGetWorkPlaceIncomeValues!
                                              .elementAtOrNull(
                                                  _model.indexTotalIncome!)!
                                              .value,
                                          _model.collectionTotal!);
                                      safeSetState(() {});
                                      _model.indexTotalIncome =
                                          _model.indexTotalIncome! + 1;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Hangi işyerin ?',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 2.0, 24.0, 4.0),
                            child: StreamBuilder<List<WorkPlacesRecord>>(
                              stream: queryWorkPlacesRecord(
                                queryBuilder: (workPlacesRecord) =>
                                    workPlacesRecord
                                        .where(
                                          'owner',
                                          isEqualTo: currentUserReference,
                                        )
                                        .where(
                                          'isDelete',
                                          isEqualTo: false,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<WorkPlacesRecord>
                                    incomeOrExpenseWorkPlacesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.incomeOrExpenseValueController ??=
                                          FormFieldController<String>(
                                    _model.incomeOrExpenseValue ??= '',
                                  ),
                                  options:
                                      List<String>.from(['expense', 'income']),
                                  optionLabels: ['gider', 'gelir'],
                                  onChanged: (val) => safeSetState(
                                      () => _model.incomeOrExpenseValue = val),
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Gider mi gelir mi ?',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 2.0),
                                                  child: Text(
                                                    'Toplam Ödeme :',
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
                                                          color: Colors.white,
                                                          fontSize: 13.0,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0xFFFF0000),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          9.0, 6.0, 9.0, 6.0),
                                                  child: Text(
                                                    formatNumber(
                                                      _model.spendingTotal,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: '₺ ',
                                                    ),
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
                                                          color: Colors.white,
                                                          fontSize: 11.0,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 2.0),
                                                  child: Text(
                                                    'Toplam Tahsilat :',
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
                                                          color: Colors.white,
                                                          fontSize: 13.0,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: Color(0xFF5EFF00),
                                                    width: 0.75,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          9.0, 6.0, 9.0, 6.0),
                                                  child: Text(
                                                    formatNumber(
                                                      _model.collectionTotal,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: '₺ ',
                                                    ),
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
                                                          color: Colors.white,
                                                          fontSize: 11.0,
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
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
