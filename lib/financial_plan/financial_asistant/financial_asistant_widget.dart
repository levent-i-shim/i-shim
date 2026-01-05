import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/finance_notes/options_income_plans/options_income_plans_widget.dart';
import '/finance_notes/options_investment_plans/options_investment_plans_widget.dart';
import '/financial_plan/component_financial_plan/options_financial_plan/options_financial_plan_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'financial_asistant_model.dart';
export 'financial_asistant_model.dart';

class FinancialAsistantWidget extends StatefulWidget {
  const FinancialAsistantWidget({super.key});

  static String routeName = 'financialAsistant';
  static String routePath = '/financialAsistant';

  @override
  State<FinancialAsistantWidget> createState() =>
      _FinancialAsistantWidgetState();
}

class _FinancialAsistantWidgetState extends State<FinancialAsistantWidget>
    with TickerProviderStateMixin {
  late FinancialAsistantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinancialAsistantModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
    return StreamBuilder<List<CompaniesRecord>>(
      stream: queryCompaniesRecord(
        queryBuilder: (companiesRecord) => companiesRecord
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
          return Scaffold(
            backgroundColor: Color(0xFF060418),
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
        List<CompaniesRecord> financialAsistantCompaniesRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF060418),
            appBar: AppBar(
              backgroundColor: Color(0xFF060418),
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
                  HapticFeedback.heavyImpact();
                },
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 0.0, 2.0),
                      child: Text(
                        'Finansal Planlama',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 4.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.heavyImpact();
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
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF0D00DC),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Icon(
                        Icons.settings_sharp,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.tabBarCurrentIndex == 0)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
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
                                4.0, 4.0, 4.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 3.0, 10.0, 3.0),
                                    child: Text(
                                      'Ödenecek Toplam Gider :',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                4.0, 2.0, 4.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: Color(0xFFFF0000),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 6.0, 16.0, 6.0),
                                    child: Text(
                                      formatNumber(
                                        _model.totalCapitalNeed,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: '₺ ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                if (_model.tabBarCurrentIndex == 1)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
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
                                4.0, 4.0, 4.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 3.0, 10.0, 3.0),
                                    child: Text(
                                      'Beklenen Toplam Gelir :',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                4.0, 2.0, 4.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: Color(0xFFFF0000),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 6.0, 16.0, 6.0),
                                    child: Text(
                                      formatNumber(
                                        _model.plannedIncomeTotal,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: '₺ ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                if (_model.tabBarCurrentIndex == 2)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
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
                                4.0, 4.0, 4.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 3.0, 10.0, 3.0),
                                    child: Text(
                                      'Planlanmış Toplam Yatırım :',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                4.0, 2.0, 4.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: Color(0xFFFF0000),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 6.0, 16.0, 6.0),
                                    child: Text(
                                      formatNumber(
                                        _model.investmentTotal,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: '₺ ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_model.tabBarCurrentIndex == 0)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.mediumImpact();

                                context.pushNamed(
                                    CreateFinancialPlanWidget.routeName);
                              },
                              child: Container(
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF053E54),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Color(0xFF1B57A2),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.featherAlt,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Yeni Ödeme Planı Oluştur',
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
                                              fontSize: 11.0,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_model.tabBarCurrentIndex == 1)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.mediumImpact();

                                context.pushNamed(
                                    CreateIncomePlanWidget.routeName);
                              },
                              child: Container(
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF053E54),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Color(0xFF1B57A2),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.featherAlt,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Yeni Gelir Planı Oluştur',
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
                                              fontSize: 11.0,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_model.tabBarCurrentIndex == 2)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.mediumImpact();

                                context.pushNamed(
                                    CreateInvestmentPlanWidget.routeName);
                              },
                              child: Container(
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF053E54),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Color(0xFF1B57A2),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.featherAlt,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'Yeni Yatırım Planı Oluştur',
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
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
                                              color: Colors.white,
                                              fontSize: 11.0,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.white,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: [
                              Tab(
                                text: 'Ödeme Planlamaları',
                              ),
                              Tab(
                                text: 'Gelir Planlamaları',
                              ),
                              Tab(
                                text: 'Yatırım Planlamaları',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {
                                  _model.capitalNeedItemIndex = 0;
                                  _model.totalCapitalNeed = 0.0;
                                  safeSetState(() {});
                                  _model.countFinacePlans =
                                      await queryFinancialPlansRecordCount(
                                    queryBuilder: (financialPlansRecord) =>
                                        financialPlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  _model.listOfFinancePlans =
                                      await queryFinancialPlansRecordOnce(
                                    queryBuilder: (financialPlansRecord) =>
                                        financialPlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  while (_model.capitalNeedItemIndex! <=
                                      _model.countFinacePlans!) {
                                    _model.totalCapitalNeed = (double var1,
                                            double var2, double var3) {
                                      return var3 = var1 + var2;
                                    }(
                                        _model.totalCapitalNeed!,
                                        _model.listOfFinancePlans!
                                            .elementAtOrNull(
                                                _model.capitalNeedItemIndex!)!
                                            .totalCapitalRequirement,
                                        _model.totalCapitalNeed!);
                                    safeSetState(() {});
                                    _model.capitalNeedItemIndex =
                                        _model.capitalNeedItemIndex! + 1;
                                    safeSetState(() {});
                                  }
                                  HapticFeedback.vibrate();

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.incomeItemIndex = 0;
                                  _model.plannedIncomeTotal = 0.0;
                                  safeSetState(() {});
                                  _model.countIncomePlans =
                                      await queryIncomePlansRecordCount(
                                    queryBuilder: (incomePlansRecord) =>
                                        incomePlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  _model.listOfIncomePlans =
                                      await queryIncomePlansRecordOnce(
                                    queryBuilder: (incomePlansRecord) =>
                                        incomePlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  while (_model.incomeItemIndex! <=
                                      _model.countIncomePlans!) {
                                    _model.plannedIncomeTotal = (double var1,
                                            double var2, double var3) {
                                      return var3 = var1 + var2;
                                    }(
                                        _model.plannedIncomeTotal!,
                                        _model.listOfIncomePlans!
                                            .elementAtOrNull(
                                                _model.incomeItemIndex!)!
                                            .totalCapitalIncome,
                                        _model.plannedIncomeTotal!);
                                    safeSetState(() {});
                                    _model.incomeItemIndex =
                                        _model.incomeItemIndex! + 1;
                                    safeSetState(() {});
                                  }
                                  HapticFeedback.vibrate();

                                  safeSetState(() {});
                                },
                                () async {
                                  _model.investmentItemIndex = 0;
                                  _model.investmentTotal = 0.0;
                                  safeSetState(() {});
                                  _model.countInvestmentPlans =
                                      await queryInvestmentPlansRecordCount(
                                    queryBuilder: (investmentPlansRecord) =>
                                        investmentPlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  _model.listOfInvestmentPlans =
                                      await queryInvestmentPlansRecordOnce(
                                    queryBuilder: (investmentPlansRecord) =>
                                        investmentPlansRecord.where(Filter.or(
                                      Filter(
                                        'creatorUserRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                      Filter(
                                        'authorizedUsersToMonitor',
                                        arrayContains: currentUserReference,
                                      ),
                                    )),
                                  );
                                  while (_model.investmentItemIndex! <=
                                      _model.countInvestmentPlans!) {
                                    _model.totalCapitalNeed = (double var1,
                                            double var2, double var3) {
                                      return var3 = var1 + var2;
                                    }(
                                        _model.investmentTotal!,
                                        _model.listOfInvestmentPlans!
                                            .elementAtOrNull(
                                                _model.investmentItemIndex!)!
                                            .totalInvestmentCapitalRequirement,
                                        _model.investmentTotal!);
                                    safeSetState(() {});
                                    _model.investmentItemIndex =
                                        _model.investmentItemIndex! + 1;
                                    safeSetState(() {});
                                  }
                                  HapticFeedback.vibrate();

                                  safeSetState(() {});
                                }
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 20.0),
                                child:
                                    StreamBuilder<List<FinancialPlansRecord>>(
                                  stream: queryFinancialPlansRecord(
                                    queryBuilder: (financialPlansRecord) =>
                                        financialPlansRecord
                                            .where(Filter.or(
                                              Filter(
                                                'creatorUserRef',
                                                isEqualTo: currentUserReference,
                                              ),
                                              Filter(
                                                'authorizedUsersToMonitor',
                                                arrayContains:
                                                    currentUserReference,
                                              ),
                                            ))
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<FinancialPlansRecord>
                                        gridViewFinancialPlansRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.15,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewFinancialPlansRecordList
                                              .length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewFinancialPlansRecord =
                                            gridViewFinancialPlansRecordList[
                                                gridViewIndex];
                                        return Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 4.0, 2.0, 4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                HapticFeedback.heavyImpact();

                                                context.pushNamed(
                                                  FinancialPlanItemsWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'financialPlanDocumentRef':
                                                        serializeParam(
                                                      gridViewFinancialPlansRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'creatorUserRef':
                                                        serializeParam(
                                                      gridViewFinancialPlansRecord
                                                          .creatorUserRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'companyRef':
                                                        serializeParam(
                                                      gridViewFinancialPlansRecord
                                                          .companyRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'workPlaceRef':
                                                        serializeParam(
                                                      gridViewFinancialPlansRecord
                                                          .workPlaceRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'planName': serializeParam(
                                                      gridViewFinancialPlansRecord
                                                          .planName,
                                                      ParamType.String,
                                                    ),
                                                    'financialPlanDocument':
                                                        serializeParam(
                                                      gridViewFinancialPlansRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'financialPlanDocument':
                                                        gridViewFinancialPlansRecord,
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            OptionsFinancialPlanWidget(
                                                          financialPlanDocument:
                                                              gridViewFinancialPlansRecord,
                                                          financialPlanDocumentRef:
                                                              gridViewFinancialPlansRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        valueOrDefault<Color>(
                                                          gridViewFinancialPlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFF00FF41)
                                                              : Colors.white,
                                                          Colors.white,
                                                        ),
                                                        valueOrDefault<Color>(
                                                          gridViewFinancialPlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFFFFA900)
                                                              : Colors.white,
                                                          Colors.white,
                                                        )
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    border: Border.all(
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 5,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        6.0,
                                                                        4.0,
                                                                        6.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          4.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    gridViewFinancialPlansRecord
                                                                        .planName,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 4,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      2.0),
                                                          child: Container(
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Planlanan Harcama :',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      gridViewFinancialPlansRecord
                                                                          .totalCapitalRequirement,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          '₺ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                                    ],
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 20.0),
                                child: StreamBuilder<List<IncomePlansRecord>>(
                                  stream: queryIncomePlansRecord(
                                    queryBuilder: (incomePlansRecord) =>
                                        incomePlansRecord
                                            .where(Filter.or(
                                              Filter(
                                                'creatorUserRef',
                                                isEqualTo: currentUserReference,
                                              ),
                                              Filter(
                                                'authorizedUsersToMonitor',
                                                arrayContains:
                                                    currentUserReference,
                                              ),
                                            ))
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<IncomePlansRecord>
                                        gridViewIncomePlansRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.15,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewIncomePlansRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewIncomePlansRecord =
                                            gridViewIncomePlansRecordList[
                                                gridViewIndex];
                                        return Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 4.0, 2.0, 4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  IncomePlanItemsWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'incomePlanDocumentRef':
                                                        serializeParam(
                                                      gridViewIncomePlansRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'creatorUserRef':
                                                        serializeParam(
                                                      gridViewIncomePlansRecord
                                                          .creatorUserRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'companyRef':
                                                        serializeParam(
                                                      gridViewIncomePlansRecord
                                                          .companyRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'workPlaceRef':
                                                        serializeParam(
                                                      gridViewIncomePlansRecord
                                                          .workPlaceRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'planName': serializeParam(
                                                      gridViewIncomePlansRecord
                                                          .planName,
                                                      ParamType.String,
                                                    ),
                                                    'incomePlanDocument':
                                                        serializeParam(
                                                      gridViewIncomePlansRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'incomePlanDocument':
                                                        gridViewIncomePlansRecord,
                                                  },
                                                );

                                                HapticFeedback.heavyImpact();
                                              },
                                              onLongPress: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            OptionsIncomePlansWidget(
                                                          incomePlanDocument:
                                                              gridViewIncomePlansRecord,
                                                          incomePlanDocumentRef:
                                                              gridViewIncomePlansRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        valueOrDefault<Color>(
                                                          gridViewIncomePlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFF00FF41)
                                                              : Colors.white,
                                                          Colors.white,
                                                        ),
                                                        valueOrDefault<Color>(
                                                          gridViewIncomePlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFFFFA900)
                                                              : Colors.white,
                                                          Colors.white,
                                                        )
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    border: Border.all(
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 5,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        6.0,
                                                                        4.0,
                                                                        6.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          4.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    gridViewIncomePlansRecord
                                                                        .planName,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 4,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      2.0),
                                                          child: Container(
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Planlanan Harcama :',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      gridViewIncomePlansRecord
                                                                          .totalCapitalIncome,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          '₺ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                                    ],
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 20.0),
                                child:
                                    StreamBuilder<List<InvestmentPlansRecord>>(
                                  stream: queryInvestmentPlansRecord(
                                    queryBuilder: (investmentPlansRecord) =>
                                        investmentPlansRecord
                                            .where(Filter.or(
                                              Filter(
                                                'creatorUserRef',
                                                isEqualTo: currentUserReference,
                                              ),
                                              Filter(
                                                'authorizedUsersToMonitor',
                                                arrayContains:
                                                    currentUserReference,
                                              ),
                                            ))
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<InvestmentPlansRecord>
                                        gridViewInvestmentPlansRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.15,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewInvestmentPlansRecordList
                                              .length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewInvestmentPlansRecord =
                                            gridViewInvestmentPlansRecordList[
                                                gridViewIndex];
                                        return Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 4.0, 2.0, 4.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onLongPress: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            OptionsInvestmentPlansWidget(
                                                          investmentPlanDocument:
                                                              gridViewInvestmentPlansRecord,
                                                          investmentPlanDocumentRef:
                                                              gridViewInvestmentPlansRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        valueOrDefault<Color>(
                                                          gridViewInvestmentPlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFF00FF41)
                                                              : Colors.white,
                                                          Colors.white,
                                                        ),
                                                        valueOrDefault<Color>(
                                                          gridViewInvestmentPlansRecord
                                                                      .creatorUserRef ==
                                                                  currentUserReference
                                                              ? Color(
                                                                  0xFFFFA900)
                                                              : Colors.white,
                                                          Colors.white,
                                                        )
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    border: Border.all(
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 5,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        6.0,
                                                                        4.0,
                                                                        6.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF636363),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          2.0,
                                                                          4.0,
                                                                          2.0),
                                                                  child: Text(
                                                                    gridViewInvestmentPlansRecord
                                                                        .planName,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 4,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      2.0),
                                                          child: Container(
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Planlanan Harcama :',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      gridViewInvestmentPlansRecord
                                                                          .totalInvestmentCapitalRequirement,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          '₺ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                                    ],
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
        );
      },
    );
  }
}
