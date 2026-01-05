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
import 'current_account_bills_detail_for_company_page_model.dart';
export 'current_account_bills_detail_for_company_page_model.dart';

class CurrentAccountBillsDetailForCompanyPageWidget extends StatefulWidget {
  const CurrentAccountBillsDetailForCompanyPageWidget({
    super.key,
    required this.bill,
    required this.currentAccount,
    this.company,
    bool? isPartner,
    bool? canManage,
  })  : this.isPartner = isPartner ?? false,
        this.canManage = canManage ?? false;

  final CurrentAccountBillRecord? bill;
  final AllCurrentAccountStruct? currentAccount;
  final DocumentReference? company;
  final bool isPartner;
  final bool canManage;

  static String routeName = 'CurrentAccountBillsDetailForCompanyPage';
  static String routePath = '/currentAccountBillsDetailForCompanyPage';

  @override
  State<CurrentAccountBillsDetailForCompanyPageWidget> createState() =>
      _CurrentAccountBillsDetailForCompanyPageWidgetState();
}

class _CurrentAccountBillsDetailForCompanyPageWidgetState
    extends State<CurrentAccountBillsDetailForCompanyPageWidget> {
  late CurrentAccountBillsDetailForCompanyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CurrentAccountBillsDetailForCompanyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      for (int loop1Index = 0;
          loop1Index < widget.bill!.activities.length;
          loop1Index++) {
        final currentLoop1Item = widget.bill!.activities[loop1Index];
        _model.activiryDetail =
            await CurrentAccountActivityRecord.getDocumentOnce(
                widget.bill!.activities.elementAtOrNull(loop1Index)!);
        _model.addToActivity(_model.activiryDetail!);
        safeSetState(() {});
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'FATURA',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 20.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Toplam Ürün Sayısı',
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
                                      Text(
                                        _model.activity.length.toString(),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Toplam Tutar',
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
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            widget.bill?.totalValue,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                          ),
                                          '0',
                                        ),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Toplam Kdv\'siz Tutar',
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
                                      Text(
                                        (widget.bill!.totalValue -
                                                widget.bill!.totalKdv)
                                            .toString(),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Toplam KDV',
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
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            widget.bill?.totalKdv,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                          ),
                                          '0',
                                        ),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Toplam Tevkifat',
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
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            widget.bill?.totalTevkifat,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                          ),
                                          '0',
                                        ),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Satıcı Taraf',
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
                                      Text(
                                        widget.currentAccount!.amISideOne
                                            ? (widget.bill!.isSideOneSeller
                                                ? 'Sizsiniz'
                                                : 'Karşı Taraf')
                                            : (widget.bill!.isSideOneSeller
                                                ? 'Karşı Taraf'
                                                : 'Sizsiniz'),
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fatura Ödendi mi',
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
                                      Text(
                                        widget.bill!.isPaid
                                            ? 'Ödendi'
                                            : 'Ödenmedi',
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
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'ÜRÜNLER',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final activit = _model.activity.toList();

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(activit.length, (activitIndex) {
                        final activitItem = activit[activitIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 20.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Adı',
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
                                          Text(
                                            activitItem.purchasedGood,
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Miktarı',
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
                                          Text(
                                            activitItem.quantity.toString(),
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Birim Fiyatı',
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
                                          Text(
                                            activitItem.valuePerUnit.toString(),
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Birim',
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
                                          Text(
                                            activitItem.unit,
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Tipi',
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
                                          Text(
                                            activitItem.purchaseType,
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Not',
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
                                          Text(
                                            activitItem.purchaseNote,
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Tevkifat Fiyatı',
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
                                          Text(
                                            activitItem.kdv != 0.0
                                                ? ((activitItem.quantity *
                                                        activitItem
                                                            .valuePerUnit *
                                                        (activitItem.kdv /
                                                            100) *
                                                        (activitItem.tevkifat /
                                                            100)))
                                                    .toString()
                                                : '0',
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün KDV Fiyatı',
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
                                          Text(
                                            activitItem.kdv != 0.0
                                                ? ((activitItem.quantity *
                                                        activitItem
                                                            .valuePerUnit *
                                                        (activitItem.kdv /
                                                            100)))
                                                    .toString()
                                                : '0',
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
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ürün Toplam Fiyatı',
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
                                          Text(
                                            formatNumber(
                                              activitItem.activityValue,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                if ((widget.bill?.isAccept == true) && !widget.bill!.isPaid)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(36.0, 18.0, 36.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
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
                        if (widget.currentAccount?.sideTwoType ==
                            'Kullanmayan') {
                          if (widget.bill!.isSideOneSeller) {
                            if (widget.currentAccount?.sideOneType ==
                                'Şirket') {
                              _model.companySideOneIncomeNotUser =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;
                              _model.companyIncomeNotUser =
                                  await queryCompanyIncomes2025RecordOnce(
                                parent: _model.companySideOneIncomeNotUser,
                                queryBuilder: (companyIncomes2025Record) =>
                                    companyIncomes2025Record.where(
                                  'billRef',
                                  isEqualTo: widget.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;

                              await _model.companyIncomeNotUser!.reference
                                  .update(createCompanyIncomes2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOneIncomeNotUser =
                                  await actions.getUserDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;
                              _model.userSideOneIncomeRefNotUser =
                                  await queryUserIncomeRecordOnce(
                                parent: _model.userSideOneIncomeNotUser,
                                queryBuilder: (userIncomeRecord) =>
                                    userIncomeRecord.where(
                                  'billRef',
                                  isEqualTo: widget.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;

                              await _model
                                  .userSideOneIncomeRefNotUser!.reference
                                  .update(createUserIncomeRecordData(
                                isExpected: false,
                              ));
                            }
                          } else {
                            if (widget.currentAccount?.sideOneType ==
                                'Şirket') {
                              _model.companySideOnePaymentNotUser =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;
                              _model.sideOnePaymentRefNotUser =
                                  await queryCompanyPayments2025RecordOnce(
                                parent: _model.companySideOnePaymentNotUser,
                                queryBuilder: (companyPayments2025Record) =>
                                    companyPayments2025Record.where(
                                  'billRef',
                                  isEqualTo: widget.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;

                              await _model.sideOnePaymentRefNotUser!.reference
                                  .update(createCompanyPayments2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOnePaymentNotUser =
                                  await actions.getUserDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;
                              _model.userSideOnePaymentRefNotUser =
                                  await queryUserPaymentRecordOnce(
                                parent: _model.userSideOnePaymentNotUser,
                                queryBuilder: (userPaymentRecord) =>
                                    userPaymentRecord.where(
                                  'billRef',
                                  isEqualTo: widget.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;

                              await _model
                                  .userSideOnePaymentRefNotUser!.reference
                                  .update(createUserPaymentRecordData(
                                isExpected: false,
                              ));
                            }
                          }

                          if (!widget.bill!.isPaid) {
                            await widget.bill!.reference
                                .update(createCurrentAccountBillRecordData(
                              isPaid: true,
                            ));

                            await widget.currentAccount!.currentAccountId!
                                .update({
                              ...mapToFirestore(
                                {
                                  'totalUnPaidBillCount':
                                      FieldValue.increment(-(1)),
                                  'totalValueForSideOne':
                                      FieldValue.increment(() {
                                    if (widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else if (widget.bill!.isSideOneSeller &&
                                        !widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else if (!widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else {
                                      return widget.bill!.totalValue;
                                    }
                                  }()),
                                  'totalValueForSideTwo':
                                      FieldValue.increment(() {
                                    if (widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else if (widget.bill!.isSideOneSeller &&
                                        !widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else if (!widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else {
                                      return (-1 * widget.bill!.totalValue);
                                    }
                                  }()),
                                  'expandedValueForSideOne':
                                      FieldValue.increment(
                                          widget.bill!.isSideOneSeller
                                              ? (-1 * widget.bill!.totalValue)
                                              : widget.bill!.totalValue),
                                  'expandedValueForTwo': FieldValue.increment(
                                      widget.bill!.isSideOneSeller
                                          ? widget.bill!.totalValue
                                          : (-1 * widget.bill!.totalValue)),
                                },
                              ),
                            });

                            await widget.company!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(() {
                                    if (widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else if (!widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else if (widget.bill!.isSideOneSeller &&
                                        !widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else {
                                      return widget.bill!.totalValue;
                                    }
                                  }()),
                                  'yearlyMoney': FieldValue.increment(() {
                                    if (widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else if (!widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else if (widget.bill!.isSideOneSeller &&
                                        !widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else {
                                      return widget.bill!.totalValue;
                                    }
                                  }()),
                                },
                              ),
                            });
                          }
                        } else {
                          if (((widget.currentAccount?.amISideOne == true) &&
                                  (widget.currentAccount?.sideTwoType ==
                                      'Şirket')) ||
                              ((widget.currentAccount?.amISideOne == false) &&
                                  (widget.currentAccount?.sideOneType ==
                                      'Şirket'))) {
                            if (widget.currentAccount!.amISideOne) {
                              _model.companyRef =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideTwoId,
                              );
                              _shouldSetState = true;

                              await CompanyNotificationsRecord.createDoc(
                                      _model.companyRef!)
                                  .set({
                                ...createCompanyNotificationsRecordData(
                                  type: NotificationTypes
                                      .setCurrentAccountBillPaidRequest.name,
                                  content:
                                      'Faturayı ödendi olarak işaretlemek için davetiye Gönderildi',
                                  isRead: false,
                                  isDelete: false,
                                  fullDescription:
                                      '${widget.bill?.totalValue.toString()} Tutarındaki Fatura için Ödendi Onayı Gerekli',
                                  currentAccount:
                                      widget.currentAccount?.currentAccountId,
                                  currentAccountBill: widget.bill?.reference,
                                  company: widget.company,
                                  isAccept: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              _model.companyRef2 =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;

                              await CompanyNotificationsRecord.createDoc(
                                      _model.companyRef2!)
                                  .set({
                                ...createCompanyNotificationsRecordData(
                                  type: NotificationTypes
                                      .setCurrentAccountBillPaidRequest.name,
                                  content:
                                      'Faturayı ödendi olarak işaretlemek için davetiye Gönderildi',
                                  isRead: false,
                                  isDelete: false,
                                  fullDescription:
                                      '${widget.bill?.totalValue.toString()} Tutarındaki Fatura için Ödendi Onayı Gerekli',
                                  currentAccount:
                                      widget.currentAccount?.currentAccountId,
                                  currentAccountBill: widget.bill?.reference,
                                  company: widget.company,
                                  isAccept: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }
                          } else {
                            if (widget.currentAccount!.amISideOne) {
                              _model.user = await actions.getUserDocRef(
                                widget.currentAccount!.sideTwoId,
                              );
                              _shouldSetState = true;

                              await NotificationsRecord.createDoc(_model.user!)
                                  .set({
                                ...createNotificationsRecordData(
                                  type: NotificationTypes
                                      .setCurrentAccountBillPaidRequest.name,
                                  content:
                                      'Faturayı ödendi olarak işaretlemek için davetiye Gönderildi',
                                  isRead: false,
                                  isDelete: false,
                                  fullDescription:
                                      '${widget.bill?.totalValue.toString()} Tutarındaki Fatura için Ödendi Onayı Gerekli',
                                  relatedDoc: widget.bill?.reference.id,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              _model.user2 = await actions.getUserDocRef(
                                widget.currentAccount!.sideOneId,
                              );
                              _shouldSetState = true;

                              await NotificationsRecord.createDoc(_model.user2!)
                                  .set({
                                ...createNotificationsRecordData(
                                  type: NotificationTypes
                                      .setCurrentAccountBillPaidRequest.name,
                                  content:
                                      'Faturayı ödendi olarak işaretlemek için davetiye Gönderildi',
                                  isRead: false,
                                  isDelete: false,
                                  fullDescription:
                                      '${widget.bill?.totalValue.toString()} Tutarındaki Fatura için Ödendi Onayı Gerekli',
                                  relatedDoc: widget.bill?.reference.id,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }
                          }
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'İstek Gönderildi',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );

                        await AjandaRecord.createDoc(currentUserReference!)
                            .set({
                          ...createAjandaRecordData(
                            description: 'Fatura onaylanmaya gönderildi',
                            type: WorkHistoryTypes
                                .setCurrentAccountBillPaidRequest.name,
                            fullDescription:
                                '${widget.currentAccount?.counterPartyName} İle ${widget.bill?.totalValue.toString()} Tutarındaki Fatura Onaylanmaya gönderildi',
                            currentAccount:
                                widget.currentAccount?.currentAccountId,
                            currentAccountBill: widget.bill?.reference,
                            company: widget.company,
                          ),
                          ...mapToFirestore(
                            {
                              'dateTime': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: widget.currentAccount?.sideTwoType == 'Kullanmayan'
                          ? 'Ödendi Olarak İşaretle'
                          : 'Ödendi Olarak İşaretlemek için İstek Gönder',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!widget.bill!.isAccept)
                        FFButtonWidget(
                          onPressed: () async {
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
                            if (!widget.bill!.isAccept) {
                              await widget.bill!.reference
                                  .update(createCurrentAccountBillRecordData(
                                isAccept: true,
                              ));

                              await widget.currentAccount!.currentAccountId!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'totalBillCount': FieldValue.increment(1),
                                    'totalUnPaidBillCount':
                                        FieldValue.increment(1),
                                  },
                                ),
                              });
                            }
                            if (widget.bill!.isSideOneSeller) {
                              if (widget.currentAccount?.sideTwoType ==
                                  'Şirket') {
                                _model.companySideTwoPayment =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;

                                await _model.companySideTwoPayment!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await CompanyPayments2025Record.createDoc(
                                        _model.companySideTwoPayment!)
                                    .set({
                                  ...createCompanyPayments2025RecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userSideTwoPayment =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;

                                await _model.userSideTwoPayment!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await UserPaymentRecord.createDoc(
                                        _model.userSideTwoPayment!)
                                    .set({
                                  ...createUserPaymentRecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }

                              if (widget.currentAccount?.sideOneType ==
                                  'Şirket') {
                                _model.companySideOneIncome =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;

                                await _model.companySideOneIncome!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await CompanyIncomes2025Record.createDoc(
                                        _model.companySideOneIncome!)
                                    .set({
                                  ...createCompanyIncomes2025RecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userSideOneIncome =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;

                                await _model.userSideOneIncome!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await UserIncomeRecord.createDoc(
                                        _model.userSideOneIncome!)
                                    .set({
                                  ...createUserIncomeRecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }
                            } else {
                              if (widget.currentAccount?.sideTwoType ==
                                  'Şirket') {
                                _model.companySideTwoIncome =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;

                                await _model.companySideTwoIncome!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await CompanyIncomes2025Record.createDoc(
                                        _model.companySideTwoIncome!)
                                    .set({
                                  ...createCompanyIncomes2025RecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userSideTwoIncome =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;

                                await _model.userSideTwoIncome!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await UserIncomeRecord.createDoc(
                                        _model.userSideTwoIncome!)
                                    .set({
                                  ...createUserIncomeRecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    expectedDate: widget.bill?.expendedDate,
                                    isExpected: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }

                              if (widget.currentAccount?.sideOneType ==
                                  'Şirket') {
                                _model.companySideOnePayment =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;

                                await _model.companySideOnePayment!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await CompanyPayments2025Record.createDoc(
                                        _model.companySideOnePayment!)
                                    .set({
                                  ...createCompanyPayments2025RecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    expectedDate: widget.bill?.expendedDate,
                                    isExpected: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userSideOnePayment =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;

                                await _model.userSideOnePayment!.update({
                                  ...mapToFirestore(
                                    {
                                      'totalMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        }
                                      }()),
                                      'yearlyMoney': FieldValue.increment(() {
                                        if (widget.bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return widget.bill!.totalValue;
                                        } else if (!widget
                                                .bill!.isSideOneSeller &&
                                            widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else if (widget
                                                .bill!.isSideOneSeller &&
                                            !widget
                                                .currentAccount!.amISideOne) {
                                          return (-1 *
                                              widget.bill!.totalValue);
                                        } else {
                                          return widget.bill!.totalValue;
                                        }
                                      }()),
                                    },
                                  ),
                                });

                                await UserPaymentRecord.createDoc(
                                        _model.userSideOnePayment!)
                                    .set({
                                  ...createUserPaymentRecordData(
                                    value: widget.bill?.totalValue,
                                    type: 'Fatura',
                                    billRef: widget.bill?.reference,
                                    isExpected: true,
                                    expectedDate: widget.bill?.expendedDate,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Kabul Edildi',
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
                            if (widget.bill!.isSideOneSeller) {
                              await widget.currentAccount!.currentAccountId!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'expandedValueForSideOne':
                                        FieldValue.increment(
                                            widget.bill!.totalValue),
                                    'expandedValueForTwo': FieldValue.increment(
                                        -(widget.bill!.totalValue)),
                                  },
                                ),
                              });
                            } else {
                              await widget.currentAccount!.currentAccountId!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'expandedValueForSideOne':
                                        FieldValue.increment(
                                            -(widget.bill!.totalValue)),
                                    'expandedValueForTwo': FieldValue.increment(
                                        widget.bill!.totalValue),
                                  },
                                ),
                              });
                            }

                            _model.billNotification =
                                await queryCompanyNotificationsRecordOnce(
                              parent: widget.company,
                              queryBuilder: (companyNotificationsRecord) =>
                                  companyNotificationsRecord
                                      .where(
                                        'type',
                                        isEqualTo: NotificationTypes
                                            .currentAccountBillRequest.name,
                                      )
                                      .where(
                                        'currentAccountBill',
                                        isEqualTo: widget.bill?.reference,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _shouldSetState = true;

                            await _model.billNotification!.reference
                                .update(createCompanyNotificationsRecordData(
                              isAccept: true,
                              isRead: true,
                            ));
                            context.safePop();

                            await AjandaRecord.createDoc(currentUserReference!)
                                .set({
                              ...createAjandaRecordData(
                                description: 'Fatura onaylandı',
                                type: WorkHistoryTypes.createBillAccept.name,
                                fullDescription:
                                    '${widget.currentAccount?.counterPartyName} İle ${widget.bill?.totalValue.toString()} Tutarında Yeni Bir Fatura onaylandı',
                                currentAccount:
                                    widget.currentAccount?.currentAccountId,
                                currentAccountBill: widget.bill?.reference,
                                company: widget.company,
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: 'Onayla',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      if (!widget.bill!.isAccept)
                        FFButtonWidget(
                          onPressed: () async {
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Reddedildi',
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
                            _model.billNotification2 =
                                await queryCompanyNotificationsRecordOnce(
                              parent: widget.company,
                              queryBuilder: (companyNotificationsRecord) =>
                                  companyNotificationsRecord
                                      .where(
                                        'type',
                                        isEqualTo: NotificationTypes
                                            .currentAccountBillRequest.name,
                                      )
                                      .where(
                                        'currentAccountBill',
                                        isEqualTo: widget.bill?.reference,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _shouldSetState = true;
                            await _model.billNotification2!.reference.delete();
                            if (widget.currentAccount!.amISideOne) {
                              if (widget.currentAccount?.sideTwoType ==
                                  'Şirket') {
                                _model.companyNotifi =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;
                                _model.companyDetailNotifi =
                                    await CompaniesRecord.getDocumentOnce(
                                        _model.companyNotifi!);
                                _shouldSetState = true;

                                await CompanyNotificationsRecord.createDoc(
                                        _model.companyDetailNotifi!.reference)
                                    .set({
                                  ...createCompanyNotificationsRecordData(
                                    type: NotificationTypes
                                        .currentAccountRejected.name,
                                    content: 'Cari Hesap Reddedildi',
                                    isRead: false,
                                    isDelete: false,
                                    fullDescription:
                                        '${_model.companyDetailNotifi?.name} isimli Şirket Cari Hesap Oluşturma Talebinizi Reddetti',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userNotifi = await actions.getUserDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );
                                _shouldSetState = true;
                                _model.userDetailNotifi =
                                    await UsersRecord.getDocumentOnce(
                                        _model.userNotifi!);
                                _shouldSetState = true;

                                await NotificationsRecord.createDoc(
                                        _model.userDetailNotifi!.reference)
                                    .set({
                                  ...createNotificationsRecordData(
                                    type: NotificationTypes
                                        .currentAccountRejected.name,
                                    content: 'Cari Hesap Reddedildi',
                                    isRead: false,
                                    isDelete: false,
                                    fullDescription:
                                        '${_model.userDetailNotifi?.reference.id} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                    isAccept: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }
                            } else {
                              if (widget.currentAccount?.sideOneType ==
                                  'Şirket') {
                                _model.company2Notifi =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;
                                _model.companyDetail2Notifi =
                                    await CompaniesRecord.getDocumentOnce(
                                        _model.company2Notifi!);
                                _shouldSetState = true;

                                await CompanyNotificationsRecord.createDoc(
                                        _model.companyDetail2Notifi!.reference)
                                    .set({
                                  ...createCompanyNotificationsRecordData(
                                    type: NotificationTypes
                                        .currentAccountRejected.name,
                                    content: 'Cari Hesap Reddedildi',
                                    isRead: false,
                                    isDelete: false,
                                    fullDescription:
                                        '${_model.companyDetail2Notifi?.name} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.user2Notifi =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideOneId,
                                );
                                _shouldSetState = true;
                                _model.userDetail2Notifi =
                                    await UsersRecord.getDocumentOnce(
                                        _model.user2Notifi!);
                                _shouldSetState = true;

                                await NotificationsRecord.createDoc(
                                        _model.userDetail2Notifi!.reference)
                                    .set({
                                  ...createNotificationsRecordData(
                                    type: NotificationTypes
                                        .currentAccountRejected.name,
                                    content: 'Cari Hesap Reddedildi',
                                    isRead: false,
                                    isDelete: false,
                                    fullDescription:
                                        '${_model.userDetail2Notifi?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                    isAccept: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              }
                            }

                            context.safePop();

                            await AjandaRecord.createDoc(currentUserReference!)
                                .set({
                              ...createAjandaRecordData(
                                description: 'Fatura Reddedildi',
                                type: WorkHistoryTypes.createBillReject.name,
                                fullDescription:
                                    '${widget.currentAccount?.counterPartyName} İle ${widget.bill?.totalValue.toString()} Tutarında Yeni Bir Fatura Reddedildi',
                                currentAccount:
                                    widget.currentAccount?.currentAccountId,
                                currentAccountBill: widget.bill?.reference,
                                company: widget.company,
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: 'Reddet',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
