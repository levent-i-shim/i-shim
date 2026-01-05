import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finance_notes/options_check_company/options_check_company_widget.dart';
import '/finance_notes/options_check_paid/options_check_paid_widget.dart';
import '/finance_notes/options_check_unpaid/options_check_unpaid_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vaults_model.dart';
export 'vaults_model.dart';

class VaultsWidget extends StatefulWidget {
  const VaultsWidget({super.key});

  static String routeName = 'vaults';
  static String routePath = '/vaults';

  @override
  State<VaultsWidget> createState() => _VaultsWidgetState();
}

class _VaultsWidgetState extends State<VaultsWidget>
    with TickerProviderStateMixin {
  late VaultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VaultsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
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
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Kasa Takip',
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
                                fontSize: 18.0,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                  tabs: [
                    Tab(
                      text: 'Ödenmemiş',
                    ),
                    Tab(
                      text: 'Ödenen',
                    ),
                    Tab(
                      text: 'Tüm Çekler',
                    ),
                    Tab(
                      text: 'Alınan',
                    ),
                    Tab(
                      text: 'Tahsil Edilen',
                    ),
                  ],
                  controller: _model.tabBarController,
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
                  controller: _model.tabBarController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 10.0, 4.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF00638A),
                                            Color(0xFF010522)
                                          ],
                                          stops: [0.2, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: Color(0xFF7C7CB8),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.table,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Tablo Olarak Göster',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
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
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 20.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.mediumImpact();

                                        context.pushNamed(
                                          AddNewCompanyCheckWidget.routeName,
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
                                              Color(0xFF00638A),
                                              Color(0xFF010522)
                                            ],
                                            stops: [0.2, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.moneyCheckAlt,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                '  Yeni çek ekle',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                              FontWeight.w600,
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 4.0, 30.0, 4.0),
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
                                    whichCompaniesDropDownCheck1CompaniesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .whichCompaniesDropDownCheck1ValueController ??=
                                      FormFieldController<String>(
                                    _model.whichCompaniesDropDownCheck1Value ??=
                                        'Other',
                                  ),
                                  options: List<String>.from(
                                      whichCompaniesDropDownCheck1CompaniesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      whichCompaniesDropDownCheck1CompaniesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model
                                            .whichCompaniesDropDownCheck1Value =
                                        val);
                                    _model.indexTotal = 0;
                                    _model.totalSpending = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDDCheck1 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDownCheck1Value!,
                                    );
                                    _model.checkRefToGetValues =
                                        await queryFinancialNoteCompanyCheckRecordOnce(
                                      parent: _model.companyRefFromDDCheck1,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'unpaid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCheckCount =
                                        await queryFinancialNoteCompanyCheckRecordCount(
                                      parent: _model.companyRefFromDDCheck1,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'unpaid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    while (_model.indexTotal! <=
                                        _model.expenseCompanyCheckCount!) {
                                      _model.totalSpending = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.totalSpending!,
                                          _model.checkRefToGetValues!
                                              .elementAtOrNull(
                                                  _model.indexTotal!)!
                                              .value,
                                          _model.totalSpending!);
                                      safeSetState(() {});
                                      _model.indexTotal =
                                          _model.indexTotal! + 1;
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
                                30.0, 4.0, 30.0, 4.0),
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
                                    workPlaceDropDownXWorkPlacesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .workPlaceDropDownXValueController ??=
                                      FormFieldController<String>(
                                    _model.workPlaceDropDownXValue ??= 'Other',
                                  ),
                                  options: List<String>.from(
                                      workPlaceDropDownXWorkPlacesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      workPlaceDropDownXWorkPlacesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.workPlaceDropDownXValue = val);
                                    _model.indexTotal = 0;
                                    _model.totalSpending = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDDCheck5 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDownCheck1Value!,
                                    );
                                    _model.workPlaceRefFromDD =
                                        await actions.getWorkPlaceDocRef(
                                      _model.workPlaceDropDownXValue!,
                                    );
                                    _model.checkRefToGetValues5 =
                                        await queryFinancialNoteCompanyCheckRecordOnce(
                                      parent: _model.companyRefFromDDCheck5,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'unpaid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .where(
                                                    'workPlaceDocRef',
                                                    isEqualTo: _model
                                                        .workPlaceRefFromDD,
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCheckCount5 =
                                        await queryFinancialNoteCompanyCheckRecordCount(
                                      parent: _model.companyRefFromDDCheck5,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'unpaid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .where(
                                                    'workPlaceDocRef',
                                                    isEqualTo: _model
                                                        .workPlaceRefFromDD,
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    while (_model.indexTotal! <=
                                        _model.expenseCompanyCheckCount5!) {
                                      _model.totalSpending = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.totalSpending!,
                                          _model.checkRefToGetValues5!
                                              .elementAtOrNull(
                                                  _model.indexTotal!)!
                                              .value,
                                          _model.totalSpending!);
                                      safeSetState(() {});
                                      _model.indexTotal =
                                          _model.indexTotal! + 1;
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
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 4.0, 10.0, 4.0),
                                            child: Text(
                                              'Ödenmemiş Toplam Çek Meblağı :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            child: Text(
                                              formatNumber(
                                                _model.totalSpending,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: '₺ ',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                          ),
                          StreamBuilder<List<FinancialNoteCompanyCheckRecord>>(
                            stream: queryFinancialNoteCompanyCheckRecord(
                              queryBuilder: (financialNoteCompanyCheckRecord) =>
                                  financialNoteCompanyCheckRecord
                                      .where(
                                        'companyDocRef',
                                        isEqualTo:
                                            _model.companyRefFromDDCheck1,
                                      )
                                      .where(
                                        'paymentStatus',
                                        isEqualTo: 'unpaid',
                                      )
                                      .where(
                                        'transactionType',
                                        isEqualTo: 'issued',
                                      )
                                      .where(
                                        'workPlaceDocRef',
                                        isEqualTo: _model.workPlaceRefFromDD,
                                      )
                                      .orderBy('dueDate'),
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
                              List<FinancialNoteCompanyCheckRecord>
                                  listViewFinancialNoteCompanyCheckRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewFinancialNoteCompanyCheckRecordList
                                        .length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewFinancialNoteCompanyCheckRecord =
                                      listViewFinancialNoteCompanyCheckRecordList[
                                          listViewIndex];
                                  return Visibility(
                                    visible:
                                        listViewFinancialNoteCompanyCheckRecord
                                                .companyDocRef ==
                                            _model.companyRefFromDDCheck1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            CheckDetailWidget.routeName,
                                            queryParameters: {
                                              'paymentDocument': serializeParam(
                                                listViewFinancialNoteCompanyCheckRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'paymentDocument':
                                                  listViewFinancialNoteCompanyCheckRecord,
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xCACCCCCC),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF00FFFF),
                                                width: 4.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 6.0, 6.0, 6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Parasal Değer',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödeme tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödenme durumu',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödemeye kalan gün',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Keşide tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Şirket',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'İşyeri',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Türü',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Kime verildi',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 0.2,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (listViewFinancialNoteCompanyCheckRecord
                                                                            .incomeOrExpense ==
                                                                        'income')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          'Kimden alındı',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.black,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                      Flexible(
                                                        flex: 3,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        listViewFinancialNoteCompanyCheckRecord
                                                                            .value,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            '₺ ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .dueDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      listViewFinancialNoteCompanyCheckRecord
                                                                          .paymentStatus,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'xyz',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .writeDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.companyName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.workPlaceName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.incomeOrExpense}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.givenToWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'income')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.takenFromWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF636363),
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Çek Açıklaması: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              AutoSizeText(
                                                                    '${listViewFinancialNoteCompanyCheckRecord.content}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    maxLines:
                                                                        10,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .pdfUrl !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                              child: Container(
                                                                width: 320.0,
                                                                height: 150.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .picture_as_pdf_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          36.0,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2.0),
                                                                        child:
                                                                            FlutterFlowPdfViewer(
                                                                          networkPath:
                                                                              listViewFinancialNoteCompanyCheckRecord.pdfUrl,
                                                                          horizontalScroll:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .imageUrl !=
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 320.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .perm_media,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(2.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                listViewFinancialNoteCompanyCheckRecord.imageUrl,
                                                                                fit: BoxFit.cover,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Kaydı yapan :  ',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.creatorName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    'Kayıt oluşturma tarihi :  ${dateTimeFormat("d/M/y", listViewFinancialNoteCompanyCheckRecord.creationTime)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.newsreader(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF6B7582),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      width:
                                                                          0.2,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            'I-SHIM Çek Kimlik No :',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewFinancialNoteCompanyCheckRecord.reference.id,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          true,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                OptionsCheckUnpaidWidget(
                                                                              checkCompanyDoc: listViewFinancialNoteCompanyCheckRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            44.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 10.0, 4.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF00638A),
                                            Color(0xFF010522)
                                          ],
                                          stops: [0.2, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: Color(0xFF7C7CB8),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.table,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Tablo Olarak Göster',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
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
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 20.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.mediumImpact();

                                        context.pushNamed(
                                          AddNewCompanyCheckWidget.routeName,
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
                                              Color(0xFF00638A),
                                              Color(0xFF010522)
                                            ],
                                            stops: [0.2, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.moneyCheckAlt,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                '  Yeni çek ekle',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                              FontWeight.w600,
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 4.0, 30.0, 4.0),
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
                                    whichCompaniesDropDownCheck2CompaniesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .whichCompaniesDropDownCheck2ValueController ??=
                                      FormFieldController<String>(
                                    _model.whichCompaniesDropDownCheck2Value ??=
                                        'Other',
                                  ),
                                  options: List<String>.from(
                                      whichCompaniesDropDownCheck2CompaniesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      whichCompaniesDropDownCheck2CompaniesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model
                                            .whichCompaniesDropDownCheck2Value =
                                        val);
                                    _model.indexTotal = 0;
                                    _model.totalSpending = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDDCheck2 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDownCheck2Value!,
                                    );
                                    _model.checkRefToGetValues2 =
                                        await queryFinancialNoteCompanyCheckRecordOnce(
                                      parent: _model.companyRefFromDDCheck2,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'paid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCheckCount2 =
                                        await queryFinancialNoteCompanyCheckRecordCount(
                                      parent: _model.companyRefFromDDCheck2,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'paid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    while (_model.indexTotal! <=
                                        _model.expenseCompanyCheckCount2!) {
                                      _model.totalSpending = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.totalSpending!,
                                          _model.checkRefToGetValues2!
                                              .elementAtOrNull(
                                                  _model.indexTotal!)!
                                              .value,
                                          _model.totalSpending!);
                                      safeSetState(() {});
                                      _model.indexTotal =
                                          _model.indexTotal! + 1;
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
                                30.0, 4.0, 30.0, 4.0),
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
                                    workPlaceDropDownXYWorkPlacesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .workPlaceDropDownXYValueController ??=
                                      FormFieldController<String>(
                                    _model.workPlaceDropDownXYValue ??= 'Other',
                                  ),
                                  options: List<String>.from(
                                      workPlaceDropDownXYWorkPlacesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      workPlaceDropDownXYWorkPlacesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.workPlaceDropDownXYValue = val);
                                    _model.indexTotal = 0;
                                    _model.totalSpending = 0.0;
                                    safeSetState(() {});
                                    _model.companyRefFromDDCheck6 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDownCheck2Value!,
                                    );
                                    _model.workPlaceRefFromDDXY =
                                        await actions.getWorkPlaceDocRef(
                                      _model.workPlaceDropDownXYValue!,
                                    );
                                    _model.checkRefToGetValues6 =
                                        await queryFinancialNoteCompanyCheckRecordOnce(
                                      parent: _model.companyRefFromDDCheck6,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'paid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .where(
                                                    'workPlaceDocRef',
                                                    isEqualTo: _model
                                                        .workPlaceRefFromDDXY,
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    _model.expenseCompanyCheckCount6 =
                                        await queryFinancialNoteCompanyCheckRecordCount(
                                      parent: _model.companyRefFromDDCheck6,
                                      queryBuilder:
                                          (financialNoteCompanyCheckRecord) =>
                                              financialNoteCompanyCheckRecord
                                                  .where(
                                                    'paymentStatus',
                                                    isEqualTo: 'paid',
                                                  )
                                                  .where(
                                                    'transactionType',
                                                    isEqualTo: 'issued',
                                                  )
                                                  .where(
                                                    'workPlaceDocRef',
                                                    isEqualTo: _model
                                                        .workPlaceRefFromDDXY,
                                                  )
                                                  .orderBy('creationTime',
                                                      descending: true),
                                    );
                                    while (_model.indexTotal! <=
                                        _model.expenseCompanyCheckCount6!) {
                                      _model.totalSpending = (double var1,
                                              double var2, double var3) {
                                        return var3 = var1 + var2;
                                      }(
                                          _model.totalSpending!,
                                          _model.checkRefToGetValues6!
                                              .elementAtOrNull(
                                                  _model.indexTotal!)!
                                              .value,
                                          _model.totalSpending!);
                                      safeSetState(() {});
                                      _model.indexTotal =
                                          _model.indexTotal! + 1;
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
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 4.0, 10.0, 4.0),
                                            child: Text(
                                              'Ödenmiş Toplam Çek Meblağı :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            child: Text(
                                              formatNumber(
                                                _model.totalSpending,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: '₺ ',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                          ),
                          StreamBuilder<List<FinancialNoteCompanyCheckRecord>>(
                            stream: queryFinancialNoteCompanyCheckRecord(
                              queryBuilder: (financialNoteCompanyCheckRecord) =>
                                  financialNoteCompanyCheckRecord
                                      .where(
                                        'companyDocRef',
                                        isEqualTo:
                                            _model.companyRefFromDDCheck2,
                                      )
                                      .where(
                                        'paymentStatus',
                                        isEqualTo: 'paid',
                                      )
                                      .where(
                                        'transactionType',
                                        isEqualTo: 'issued',
                                      )
                                      .where(
                                        'workPlaceDocRef',
                                        isEqualTo: _model.workPlaceRefFromDDXY,
                                      )
                                      .orderBy('creationTime',
                                          descending: true),
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
                              List<FinancialNoteCompanyCheckRecord>
                                  listViewFinancialNoteCompanyCheckRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewFinancialNoteCompanyCheckRecordList
                                        .length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewFinancialNoteCompanyCheckRecord =
                                      listViewFinancialNoteCompanyCheckRecordList[
                                          listViewIndex];
                                  return Visibility(
                                    visible:
                                        listViewFinancialNoteCompanyCheckRecord
                                                .companyDocRef ==
                                            _model.companyRefFromDDCheck2,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            CheckDetailWidget.routeName,
                                            queryParameters: {
                                              'paymentDocument': serializeParam(
                                                listViewFinancialNoteCompanyCheckRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'paymentDocument':
                                                  listViewFinancialNoteCompanyCheckRecord,
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xCACCCCCC),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF00FFFF),
                                                width: 4.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 6.0, 6.0, 6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Parasal Değer',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödeme tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödenme durumu',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödemeye kalan gün',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Keşide tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Şirket',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'İşyeri',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Türü',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Kime verildi',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 0.2,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (listViewFinancialNoteCompanyCheckRecord
                                                                            .incomeOrExpense ==
                                                                        'income')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          'Kimden alındı',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.black,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                      Flexible(
                                                        flex: 3,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        listViewFinancialNoteCompanyCheckRecord
                                                                            .value,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            '₺ ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .dueDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      listViewFinancialNoteCompanyCheckRecord
                                                                          .paymentStatus,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'xyz',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .writeDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.companyName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.workPlaceName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.incomeOrExpense}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.givenToWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'income')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.takenFromWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF636363),
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Çek Açıklaması: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              AutoSizeText(
                                                                    '${listViewFinancialNoteCompanyCheckRecord.content}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    maxLines:
                                                                        10,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF636363),
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Ödeme Notu: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              AutoSizeText(
                                                                    '${listViewFinancialNoteCompanyCheckRecord.paymentNote}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    maxLines:
                                                                        10,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .pdfUrl !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                              child: Container(
                                                                width: 320.0,
                                                                height: 150.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .picture_as_pdf_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          36.0,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2.0),
                                                                        child:
                                                                            FlutterFlowPdfViewer(
                                                                          networkPath:
                                                                              listViewFinancialNoteCompanyCheckRecord.pdfUrl,
                                                                          horizontalScroll:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .imageUrl !=
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 320.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .perm_media,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(2.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                listViewFinancialNoteCompanyCheckRecord.imageUrl,
                                                                                fit: BoxFit.cover,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Kaydı yapan :  ',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.creatorName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    'Kayıt oluşturma tarihi :  ${dateTimeFormat("d/M/y", listViewFinancialNoteCompanyCheckRecord.creationTime)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.newsreader(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF6B7582),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      width:
                                                                          0.2,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            'I-SHIM Çek Kimlik No :',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewFinancialNoteCompanyCheckRecord.reference.id,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          true,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                OptionsCheckPaidWidget(
                                                                              checkCompanyDoc: listViewFinancialNoteCompanyCheckRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            44.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 10.0, 4.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 52.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF00638A),
                                            Color(0xFF010522)
                                          ],
                                          stops: [0.2, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: Color(0xFF7C7CB8),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.table,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Tablo Olarak Göster',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
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
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 20.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.mediumImpact();

                                        context.pushNamed(
                                          AddNewCompanyCheckWidget.routeName,
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
                                              Color(0xFF00638A),
                                              Color(0xFF010522)
                                            ],
                                            stops: [0.2, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.moneyCheckAlt,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                '  Yeni çek ekle',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                              FontWeight.w600,
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 4.0, 30.0, 4.0),
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
                                    whichCompaniesDropDownCheck3CompaniesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model
                                          .whichCompaniesDropDownCheck3ValueController ??=
                                      FormFieldController<String>(
                                    _model.whichCompaniesDropDownCheck3Value ??=
                                        'Other',
                                  ),
                                  options: List<String>.from(
                                      whichCompaniesDropDownCheck3CompaniesRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels:
                                      whichCompaniesDropDownCheck3CompaniesRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model
                                            .whichCompaniesDropDownCheck3Value =
                                        val);
                                    _model.companyRefFromDDCheck3 =
                                        await actions.getCompanyDocRef(
                                      _model.whichCompaniesDropDownCheck3Value!,
                                    );

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
                                30.0, 4.0, 30.0, 4.0),
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
                                  onChanged: (val) => safeSetState(() =>
                                      _model.workPlaceDropDownValue = val),
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
                                30.0, 4.0, 30.0, 4.0),
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
                                  options: List<String>.from(['income']),
                                  optionLabels: [''],
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
                                  hintText: 'Gelir mi gider mi ?',
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
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 4.0, 10.0, 4.0),
                                            child: Text(
                                              'Keşide Edilmiş Toplam Çek Meblağı :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            child: Text(
                                              '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                          ),
                          StreamBuilder<List<FinancialNoteCompanyCheckRecord>>(
                            stream: queryFinancialNoteCompanyCheckRecord(
                              queryBuilder: (financialNoteCompanyCheckRecord) =>
                                  financialNoteCompanyCheckRecord
                                      .where(
                                        'companyDocRef',
                                        isEqualTo:
                                            _model.companyRefFromDDCheck3,
                                      )
                                      .orderBy('creationTime',
                                          descending: true),
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
                              List<FinancialNoteCompanyCheckRecord>
                                  listViewFinancialNoteCompanyCheckRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewFinancialNoteCompanyCheckRecordList
                                        .length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewFinancialNoteCompanyCheckRecord =
                                      listViewFinancialNoteCompanyCheckRecordList[
                                          listViewIndex];
                                  return Visibility(
                                    visible:
                                        listViewFinancialNoteCompanyCheckRecord
                                                .companyDocRef ==
                                            _model.companyRefFromDDCheck3,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            CheckDetailWidget.routeName,
                                            queryParameters: {
                                              'paymentDocument': serializeParam(
                                                listViewFinancialNoteCompanyCheckRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'paymentDocument':
                                                  listViewFinancialNoteCompanyCheckRecord,
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xCACCCCCC),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF00FFFF),
                                                width: 4.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 6.0, 6.0, 6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Parasal Değer',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödeme tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödenme durumu',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Ödemeye kalan gün',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Keşide tarihi',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Şirket',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'İşyeri',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Türü',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        'Kime verildi',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFF636363),
                                                                    width: 0.2,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (listViewFinancialNoteCompanyCheckRecord
                                                                            .incomeOrExpense ==
                                                                        'income')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          'Kimden alındı',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.black,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                      Flexible(
                                                        flex: 3,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        listViewFinancialNoteCompanyCheckRecord
                                                                            .value,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.commaDecimal,
                                                                        currency:
                                                                            '₺ ',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .dueDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      listViewFinancialNoteCompanyCheckRecord
                                                                          .paymentStatus,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'xyz',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          "d/M/y",
                                                                          listViewFinancialNoteCompanyCheckRecord
                                                                              .writeDate!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.companyName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.workPlaceName}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      '${listViewFinancialNoteCompanyCheckRecord.incomeOrExpense}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'expense')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.givenToWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 0.2,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewFinancialNoteCompanyCheckRecord
                                                                          .incomeOrExpense ==
                                                                      'income')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.takenFromWhomUserName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF636363),
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Çek Açıklaması: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              AutoSizeText(
                                                                    '${listViewFinancialNoteCompanyCheckRecord.content}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    maxLines:
                                                                        10,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF636363),
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    4.0,
                                                                    4.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Ödeme Notu: ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              AutoSizeText(
                                                                    '${listViewFinancialNoteCompanyCheckRecord.paymentNote}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    maxLines:
                                                                        10,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .pdfUrl !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                              child: Container(
                                                                width: 320.0,
                                                                height: 150.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .picture_as_pdf_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          36.0,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2.0),
                                                                        child:
                                                                            FlutterFlowPdfViewer(
                                                                          networkPath:
                                                                              listViewFinancialNoteCompanyCheckRecord.pdfUrl,
                                                                          horizontalScroll:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          if (listViewFinancialNoteCompanyCheckRecord
                                                                      .imageUrl !=
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 320.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .perm_media,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(2.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                listViewFinancialNoteCompanyCheckRecord.imageUrl,
                                                                                fit: BoxFit.cover,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Kaydı yapan :  ',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${listViewFinancialNoteCompanyCheckRecord.creatorName}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.black,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    'Kayıt oluşturma tarihi :  ${dateTimeFormat("d/M/y", listViewFinancialNoteCompanyCheckRecord.creationTime)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.newsreader(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF6B7582),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      width:
                                                                          0.2,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            'I-SHIM Çek Kimlik No :',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewFinancialNoteCompanyCheckRecord.reference.id,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.newsreader(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF6B7582),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          true,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                OptionsCheckCompanyWidget(
                                                                              checkCompanyDoc: listViewFinancialNoteCompanyCheckRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            44.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                  );
                                },
                              );
                            },
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
