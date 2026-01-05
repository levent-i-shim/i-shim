import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/financial_plan/component_financial_plan/options_invested_monies_to_work_place/options_invested_monies_to_work_place_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'invested_moniest_to_work_place_model.dart';
export 'invested_moniest_to_work_place_model.dart';

class InvestedMoniestToWorkPlaceWidget extends StatefulWidget {
  const InvestedMoniestToWorkPlaceWidget({
    super.key,
    required this.workPlaceDocument,
    required this.companyDocument,
  });

  final WorkPlacesRecord? workPlaceDocument;
  final CompaniesRecord? companyDocument;

  static String routeName = 'investedMoniestToWorkPlace';
  static String routePath = '/investedMoniestToWorkPlace';

  @override
  State<InvestedMoniestToWorkPlaceWidget> createState() =>
      _InvestedMoniestToWorkPlaceWidgetState();
}

class _InvestedMoniestToWorkPlaceWidgetState
    extends State<InvestedMoniestToWorkPlaceWidget> {
  late InvestedMoniestToWorkPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvestedMoniestToWorkPlaceModel());

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
        List<CompaniesRecord> investedMoniestToWorkPlaceCompaniesRecordList =
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 2.0, 0.0, 2.0),
                          child: Text(
                            'İşyeri Yatırım Takip',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
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
                      ],
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
                                borderRadius: BorderRadius.circular(36.0),
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
                                      'Yatırımlar İçin Alt Başlık Oluştur',
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 20.0),
                    child: StreamBuilder<List<InvestedMoniesToWorkPlaceRecord>>(
                      stream: queryInvestedMoniesToWorkPlaceRecord(
                        parent: widget.workPlaceDocument?.reference,
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
                        List<InvestedMoniesToWorkPlaceRecord>
                            gridViewInvestedMoniesToWorkPlaceRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 2;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 4;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 6;
                              } else {
                                return 10;
                              }
                            }(),
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.15,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewInvestedMoniesToWorkPlaceRecordList
                              .length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewInvestedMoniesToWorkPlaceRecord =
                                gridViewInvestedMoniesToWorkPlaceRecordList[
                                    gridViewIndex];
                            return Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 4.0, 2.0, 4.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.heavyImpact();
                                  },
                                  onLongPress: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child:
                                                OptionsInvestedMoniesToWorkPlaceWidget(
                                              investedMoneyToWorkPlaceDocument:
                                                  gridViewInvestedMoniesToWorkPlaceRecord,
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
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAF6),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: Colors.white,
                                            offset: Offset(0.0, 0.0),
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 6.0, 4.0, 6.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    border: Border.all(
                                                      color: Color(0xFF636363),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  2.0,
                                                                  4.0,
                                                                  2.0),
                                                      child: Text(
                                                        'Hello World',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 4,
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
                                                              fontSize: 14.0,
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 2.0),
                                              child: Container(
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Planlanan Harcama :',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        formatNumber(
                                                          gridViewInvestedMoniesToWorkPlaceRecord
                                                              .value,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                          currency: '₺ ',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
