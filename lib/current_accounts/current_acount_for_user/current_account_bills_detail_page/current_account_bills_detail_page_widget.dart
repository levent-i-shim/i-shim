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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_account_bills_detail_page_model.dart';
export 'current_account_bills_detail_page_model.dart';

class CurrentAccountBillsDetailPageWidget extends StatefulWidget {
  const CurrentAccountBillsDetailPageWidget({
    super.key,
    required this.bill,
    required this.currentAccount,
  });

  final CurrentAccountBillRecord? bill;
  final AllCurrentAccountStruct? currentAccount;

  static String routeName = 'CurrentAccountBillsDetailPage';
  static String routePath = '/currentAccountBillsDetailPage';

  @override
  State<CurrentAccountBillsDetailPageWidget> createState() =>
      _CurrentAccountBillsDetailPageWidgetState();
}

class _CurrentAccountBillsDetailPageWidgetState
    extends State<CurrentAccountBillsDetailPageWidget> {
  late CurrentAccountBillsDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentAccountBillsDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      for (int loop1Index = 0;
          loop1Index < widget!.bill!.activities.length;
          loop1Index++) {
        final currentLoop1Item = widget!.bill!.activities[loop1Index];
        _model.activiryDetail =
            await CurrentAccountActivityRecord.getDocumentOnce(
                widget!.bill!.activities.elementAtOrNull(loop1Index)!);
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fatura Tutarı',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.bill?.totalValue?.toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fatura Ödendi mi',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                        Text(
                          widget!.bill!.isPaid ? 'Ödendi' : 'Ödenmedi',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello World',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                        Text(
                          widget!.currentAccount!.amISideOne
                              ? (widget!.bill!.isSideOneSeller
                                  ? 'Sizsiniz'
                                  : 'Karşı Taraf')
                              : (widget!.bill!.isSideOneSeller
                                  ? 'Karşı Taraf'
                                  : 'Sizsiniz'),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final activities = _model.activity.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: activities.length,
                        itemBuilder: (context, activitiesIndex) {
                          final activitiesItem = activities[activitiesIndex];
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.purchasedGood,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.quantity.toString(),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.valuePerUnit
                                                .toString(),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.unit,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.purchaseType,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.purchaseNote,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
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
                                            activitiesItem.activityValue
                                                .toString(),
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
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!widget!.bill!.isPaid)
                    FFButtonWidget(
                      onPressed: () async {
                        if (!widget!.bill!.isPaid) {
                          await widget!.bill!.reference
                              .update(createCurrentAccountBillRecordData(
                            isPaid: true,
                          ));

                          await widget!.currentAccount!.currentAccountId!
                              .update({
                            ...mapToFirestore(
                              {
                                'totalUnPaidBillCount':
                                    FieldValue.increment(-(1)),
                                'totalValueForSideOne': FieldValue.increment(
                                    widget!.bill!.isSideOneSeller
                                        ? widget!.bill!.totalValue
                                        : (-1 * widget!.bill!.totalValue)),
                                'totalValueForSideTwo': FieldValue.increment(
                                    !widget!.bill!.isSideOneSeller
                                        ? widget!.bill!.totalValue
                                        : (-1 * widget!.bill!.totalValue)),
                                'expandedValueForSideOne': FieldValue.increment(
                                    widget!.bill!.isSideOneSeller
                                        ? (-1 * widget!.bill!.totalValue)
                                        : widget!.bill!.totalValue),
                                'expandedValueForTwo': FieldValue.increment(
                                    widget!.bill!.isSideOneSeller
                                        ? widget!.bill!.totalValue
                                        : (-1 * widget!.bill!.totalValue)),
                              },
                            ),
                          });
                          if (widget!.bill!.isSideOneSeller) {
                            if (widget!.currentAccount?.sideTwoType ==
                                'Şirket') {
                              _model.companySideTwoPayment =
                                  await actions.getCompanyDocRef(
                                widget!.currentAccount!.sideTwoId,
                              );

                              await _model.companySideTwoPayment!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.sideTwoBill =
                                  await queryCompanyPayments2025RecordOnce(
                                parent: _model.companySideTwoPayment,
                                queryBuilder: (companyPayments2025Record) =>
                                    companyPayments2025Record.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.sideTwoBill!.reference
                                  .update(createCompanyPayments2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideTwoPayment =
                                  await actions.getUserDocRef(
                                widget!.currentAccount!.sideTwoId,
                              );

                              await _model.userSideTwoPayment!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.sideTwoBillUser =
                                  await queryUserPaymentRecordOnce(
                                parent: _model.userSideTwoPayment,
                                queryBuilder: (userPaymentRecord) =>
                                    userPaymentRecord.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.sideTwoBillUser!.reference
                                  .update(createUserPaymentRecordData(
                                isExpected: false,
                              ));
                            }

                            if (widget!.currentAccount?.sideOneType ==
                                'Şirket') {
                              _model.companySideOneIncome =
                                  await actions.getCompanyDocRef(
                                widget!.currentAccount!.sideOneId,
                              );

                              await _model.companySideOneIncome!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.companyIncome =
                                  await queryCompanyIncomes2025RecordOnce(
                                parent: _model.companySideOneIncome,
                                queryBuilder: (companyIncomes2025Record) =>
                                    companyIncomes2025Record.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.companyIncome!.reference
                                  .update(createCompanyIncomes2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOneIncome =
                                  await actions.getUserDocRef(
                                widget!.currentAccount!.sideOneId,
                              );

                              await _model.userSideOneIncome!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.userSideOneIncomeRef =
                                  await queryUserIncomeRecordOnce(
                                parent: _model.userSideOneIncome,
                                queryBuilder: (userIncomeRecord) =>
                                    userIncomeRecord.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.userSideOneIncomeRef!.reference
                                  .update(createUserIncomeRecordData(
                                isExpected: false,
                              ));
                            }
                          } else {
                            if (widget!.currentAccount?.sideTwoType ==
                                'Şirket') {
                              _model.companySideTwoIncome =
                                  await actions.getCompanyDocRef(
                                widget!.currentAccount!.sideTwoId,
                              );

                              await _model.companySideTwoIncome!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.sideTwoBillIncomeCompany =
                                  await queryCompanyIncomes2025RecordOnce(
                                parent: _model.companySideTwoIncome,
                                queryBuilder: (companyIncomes2025Record) =>
                                    companyIncomes2025Record.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.sideTwoBillIncomeCompany!.reference
                                  .update(createCompanyIncomes2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideTwoIncome =
                                  await actions.getUserDocRef(
                                widget!.currentAccount!.sideTwoId,
                              );

                              await _model.userSideTwoIncome!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.userSideTwoIncomeRef =
                                  await queryUserIncomeRecordOnce(
                                parent: _model.userSideTwoIncome,
                                queryBuilder: (userIncomeRecord) =>
                                    userIncomeRecord.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.userSideTwoIncomeRef!.reference
                                  .update(createUserIncomeRecordData(
                                isExpected: false,
                              ));
                            }

                            if (widget!.currentAccount?.sideOneType ==
                                'Şirket') {
                              _model.companySideOnePayment =
                                  await actions.getCompanyDocRef(
                                widget!.currentAccount!.sideOneId,
                              );

                              await _model.companySideOnePayment!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.sideOnePaymentRef =
                                  await queryCompanyPayments2025RecordOnce(
                                parent: _model.companySideOnePayment,
                                queryBuilder: (companyPayments2025Record) =>
                                    companyPayments2025Record.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.sideOnePaymentRef!.reference
                                  .update(createCompanyPayments2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOnePayment =
                                  await actions.getUserDocRef(
                                widget!.currentAccount!.sideOneId,
                              );

                              await _model.userSideOnePayment!.update({
                                ...mapToFirestore(
                                  {
                                    'totalMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else {
                                        return (-1 * widget!.bill!.totalValue);
                                      }
                                    }()),
                                    'yearlyMoney': FieldValue.increment(() {
                                      if (widget!.bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return widget!.bill!.totalValue;
                                      } else if (!widget!
                                              .bill!.isSideOneSeller &&
                                          widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else if (widget!
                                              .bill!.isSideOneSeller &&
                                          !widget!.currentAccount!.amISideOne) {
                                        return (-1 * widget!.bill!.totalValue);
                                      } else {
                                        return widget!.bill!.totalValue;
                                      }
                                    }()),
                                  },
                                ),
                              });
                              _model.sideOnePaymentRefUser =
                                  await queryUserPaymentRecordOnce(
                                parent: _model.userSideOnePayment,
                                queryBuilder: (userPaymentRecord) =>
                                    userPaymentRecord.where(
                                  'billRef',
                                  isEqualTo: widget!.bill?.reference,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.sideOnePaymentRefUser!.reference
                                  .update(createUserPaymentRecordData(
                                isExpected: false,
                              ));
                            }
                          }

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'totalMoney': FieldValue.increment(() {
                                  if (widget!.bill!.isSideOneSeller &&
                                      widget!.currentAccount!.amISideOne) {
                                    return widget!.bill!.totalValue;
                                  } else if (!widget!.bill!.isSideOneSeller &&
                                      widget!.currentAccount!.amISideOne) {
                                    return (-1 * widget!.bill!.totalValue);
                                  } else if (widget!.bill!.isSideOneSeller &&
                                      !widget!.currentAccount!.amISideOne) {
                                    return (-1 * widget!.bill!.totalValue);
                                  } else {
                                    return widget!.bill!.totalValue;
                                  }
                                }()),
                                'yearlyMoney': FieldValue.increment(() {
                                  if (widget!.bill!.isSideOneSeller &&
                                      widget!.currentAccount!.amISideOne) {
                                    return widget!.bill!.totalValue;
                                  } else if (!widget!.bill!.isSideOneSeller &&
                                      widget!.currentAccount!.amISideOne) {
                                    return (-1 * widget!.bill!.totalValue);
                                  } else if (widget!.bill!.isSideOneSeller &&
                                      !widget!.currentAccount!.amISideOne) {
                                    return (-1 * widget!.bill!.totalValue);
                                  } else {
                                    return widget!.bill!.totalValue;
                                  }
                                }()),
                              },
                            ),
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Kabul Edildi',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        _model.billNotification =
                            await queryNotificationsRecordOnce(
                          parent: currentUserReference,
                          queryBuilder: (notificationsRecord) =>
                              notificationsRecord
                                  .where(
                                    'type',
                                    isEqualTo: NotificationTypes
                                        .setCurrentAccountBillPaidRequest.name,
                                  )
                                  .where(
                                    'isAccept',
                                    isEqualTo: false,
                                  ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        await _model.billNotification!.reference
                            .update(createNotificationsRecordData(
                          isAccept: true,
                          isRead: true,
                        ));

                        await AjandaRecord.createDoc(currentUserReference!)
                            .set({
                          ...createAjandaRecordData(
                            description: 'Fatura Ödendi Olarak İşaretlendi',
                            type: WorkHistoryTypes.billApprovalAccept.name,
                            fullDescription:
                                '${widget!.currentAccount?.counterPartyName} İle ${widget!.bill?.totalValue?.toString()} Tutarındaki Fatura Ödendi olarak işaretlenmesi Kabul Edildi',
                            currentAccount:
                                widget!.currentAccount?.currentAccountId,
                            currentAccountBill: widget!.bill?.reference,
                          ),
                          ...mapToFirestore(
                            {
                              'dateTime': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        context.safePop();

                        safeSetState(() {});
                      },
                      text: 'Onayla',
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
                  if (!widget!.bill!.isPaid)
                    FFButtonWidget(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Kabul Edildi',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        _model.billNotification2 =
                            await queryNotificationsRecordOnce(
                          parent: currentUserReference,
                          queryBuilder: (notificationsRecord) =>
                              notificationsRecord
                                  .where(
                                    'type',
                                    isEqualTo: NotificationTypes
                                        .setCurrentAccountBillPaidRequest.name,
                                  )
                                  .where(
                                    'isAccept',
                                    isEqualTo: false,
                                  ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        await _model.billNotification2!.reference.delete();
                        if (widget!.currentAccount!.amISideOne) {
                          if (widget!.currentAccount?.sideTwoType == 'Şirket') {
                            _model.companyNotifi =
                                await actions.getCompanyDocRef(
                              widget!.currentAccount!.sideTwoId,
                            );
                            _model.companyDetailNotifi =
                                await CompaniesRecord.getDocumentOnce(
                                    _model.companyNotifi!);

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
                                  'creationTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          } else {
                            _model.userNotifi = await actions.getUserDocRef(
                              widget!.currentAccount!.sideTwoId,
                            );
                            _model.userDetailNotifi =
                                await UsersRecord.getDocumentOnce(
                                    _model.userNotifi!);

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
                                    '${_model.userDetailNotifi?.displayName} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
                                isAccept: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'creationTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          }
                        } else {
                          if (widget!.currentAccount?.sideOneType == 'Şirket') {
                            _model.company2Notifi =
                                await actions.getCompanyDocRef(
                              widget!.currentAccount!.sideOneId,
                            );
                            _model.companyDetail2Notifi =
                                await CompaniesRecord.getDocumentOnce(
                                    _model.company2Notifi!);

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
                                  'creationTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          } else {
                            _model.user2Notifi = await actions.getUserDocRef(
                              widget!.currentAccount!.sideOneId,
                            );
                            _model.userDetail2Notifi =
                                await UsersRecord.getDocumentOnce(
                                    _model.user2Notifi!);

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
                                  'creationTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          }
                        }

                        context.safePop();

                        await AjandaRecord.createDoc(currentUserReference!)
                            .set({
                          ...createAjandaRecordData(
                            description:
                                'Fatura Ödendi İşaretlemesi Reddedildi',
                            type: WorkHistoryTypes.billApprovalReject.name,
                            fullDescription:
                                '${widget!.currentAccount?.counterPartyName} İle ${widget!.bill?.totalValue?.toString()} Tutarında Fatura Ödendi Olarak İşaretlenmesi Reddedildi',
                            currentAccount:
                                widget!.currentAccount?.currentAccountId,
                            currentAccountBill: widget!.bill?.reference,
                          ),
                          ...mapToFirestore(
                            {
                              'dateTime': FieldValue.serverTimestamp(),
                            },
                          ),
                        });

                        safeSetState(() {});
                      },
                      text: 'Reddet',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
