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
import 'current_account_bills_detail_for_user_page_model.dart';
export 'current_account_bills_detail_for_user_page_model.dart';

class CurrentAccountBillsDetailForUserPageWidget extends StatefulWidget {
  const CurrentAccountBillsDetailForUserPageWidget({
    super.key,
    required this.bill,
    required this.currentAccount,
  });

  final CurrentAccountBillRecord? bill;
  final AllCurrentAccountStruct? currentAccount;

  static String routeName = 'CurrentAccountBillsDetailForUserPage';
  static String routePath = '/currentAccountBillsDetailForUserPage';

  @override
  State<CurrentAccountBillsDetailForUserPageWidget> createState() =>
      _CurrentAccountBillsDetailForUserPageWidgetState();
}

class _CurrentAccountBillsDetailForUserPageWidgetState
    extends State<CurrentAccountBillsDetailForUserPageWidget> {
  late CurrentAccountBillsDetailForUserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CurrentAccountBillsDetailForUserPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      for (int loop1Index = 0;
          loop1Index < widget.bill!.activities.length;
          loop1Index++) {
        final currentLoop1Item = widget.bill!.activities[loop1Index];
        _model.activiryDetail =
            await CurrentAccountActivityRecord.getDocumentOnce(
                currentLoop1Item);
        _model.addToActivities(_model.activiryDetail!);
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            widget.bill?.totalValue.toString(),
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
                          widget.bill!.isPaid ? 'Ödendi' : 'Ödenmedi',
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
                          'Satıcı Taraf',
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
                          widget.bill!.isSideOneSeller
                              ? (widget.currentAccount?.sideOneId ==
                                      currentUserReference?.id
                                  ? 'Sizsiniz'
                                  : 'Karşı Taraf')
                              : (widget.currentAccount?.sideOneId ==
                                      currentUserReference?.id
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
                flex: 9,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final activity = _model.activities.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: activity.length,
                        itemBuilder: (context, activityIndex) {
                          final activityItem = activity[activityIndex];
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
                                            activityItem.purchasedGood,
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
                                            activityItem.quantity.toString(),
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
                                            activityItem.valuePerUnit
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
                                            activityItem.unit,
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
                                            activityItem.purchaseType,
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
                                            activityItem.purchaseNote,
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
                                            activityItem.activityValue
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
              if ((widget.bill?.isAccept == true) && !widget.bill!.isPaid)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(36.0, 8.0, 36.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget.currentAccount?.sideTwoType ==
                            'Kullanmayan') {
                          if (widget.bill!.isSideOneSeller) {
                            if (widget.currentAccount?.sideOneType ==
                                'Şirket') {
                              _model.companySideOneIncomeNotUser =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideOneId,
                              );
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

                              await _model.companyIncomeNotUser!.reference
                                  .update(createCompanyIncomes2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOneIncomeNotUser =
                                  await actions.getUserDocRef(
                                widget.currentAccount!.sideOneId,
                              );
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

                              await _model.sideOnePaymentRefNotUser!.reference
                                  .update(createCompanyPayments2025RecordData(
                                isExpected: false,
                              ));
                            } else {
                              _model.userSideOnePaymentNotUser =
                                  await actions.getUserDocRef(
                                widget.currentAccount!.sideOneId,
                              );
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
                                  'totalValueForSideTwo':
                                      FieldValue.increment(() {
                                    if (widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return (-1 * widget.bill!.totalValue);
                                    } else if (!widget.bill!.isSideOneSeller &&
                                        widget.currentAccount!.amISideOne) {
                                      return widget.bill!.totalValue;
                                    } else if (widget.bill!.isSideOneSeller &&
                                        !widget.currentAccount!.amISideOne) {
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
                                      !widget.bill!.isSideOneSeller
                                          ? widget.bill!.totalValue
                                          : (-1 * widget.bill!.totalValue)),
                                },
                              ),
                            });

                            await currentUserReference!.update({
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
                          if (((widget.currentAccount?.sideTwoType ==
                                      'Şirket') &&
                                  widget.currentAccount!.amISideOne) ||
                              (!widget.currentAccount!.amISideOne &&
                                  (widget.currentAccount?.sideOneType ==
                                      'Şirket'))) {
                            if (widget.currentAccount!.amISideOne) {
                              _model.companyRef =
                                  await actions.getCompanyDocRef(
                                widget.currentAccount!.sideTwoId,
                              );

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
                                      '${widget.bill?.totalValue.toString()}  Tutarındaki Fatura için Ödendi Onayı Gerekli',
                                  currentAccount:
                                      widget.currentAccount?.currentAccountId,
                                  currentAccountBill: widget.bill?.reference,
                                  isAccept: false,
                                  company: _model.companyRef,
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
                                  isAccept: false,
                                  company: _model.companyRef2,
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
                          ),
                          ...mapToFirestore(
                            {
                              'dateTime': FieldValue.serverTimestamp(),
                            },
                          ),
                        });

                        safeSetState(() {});
                      },
                      text: 'Ödendi Olarak İşaretlemek için İstek Gönder',
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
                ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (widget.bill?.isAccept ?? true)
                        FFButtonWidget(
                          onPressed: () async {
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

                                await CompanyIncomes2025Record.createDoc(
                                        _model.companySideOneIncome!)
                                    .set({
                                  ...createCompanyIncomes2025RecordData(
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
                                _model.userSideOneIncome =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideOneId,
                                );

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

                                await CompanyIncomes2025Record.createDoc(
                                        _model.companySideTwoIncome!)
                                    .set({
                                  ...createCompanyIncomes2025RecordData(
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
                                _model.userSideTwoIncome =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideTwoId,
                                );

                                await UserIncomeRecord.createDoc(
                                        _model.userSideTwoIncome!)
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

                              if (widget.currentAccount?.sideOneType ==
                                  'Şirket') {
                                _model.companySideOnePayment =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideOneId,
                                );

                                await CompanyPayments2025Record.createDoc(
                                        _model.companySideOnePayment!)
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
                                _model.userSideOnePayment =
                                    await actions.getUserDocRef(
                                  widget.currentAccount!.sideOneId,
                                );

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
                                await queryNotificationsRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord
                                      .where(
                                        'type',
                                        isEqualTo: NotificationTypes
                                            .currentAccountBillRequest.name,
                                      )
                                      .where(
                                        'relatedDoc',
                                        isEqualTo: widget.bill?.reference.id,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.billNotification!.reference
                                .update(createNotificationsRecordData(
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
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });

                            safeSetState(() {});
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
                      if (widget.bill?.isAccept ?? true)
                        FFButtonWidget(
                          onPressed: () async {
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
                                await queryNotificationsRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord
                                      .where(
                                        'type',
                                        isEqualTo: NotificationTypes
                                            .currentAccountBillRequest.name,
                                      )
                                      .where(
                                        'relatedDoc',
                                        isEqualTo: widget.bill?.reference.id,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            await _model.billNotification2!.reference.delete();
                            if (widget.currentAccount!.amISideOne) {
                              if (widget.currentAccount?.sideTwoId ==
                                  'Şirket') {
                                _model.companyNotifi =
                                    await actions.getCompanyDocRef(
                                  widget.currentAccount!.sideTwoId,
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
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              } else {
                                _model.userNotifi = await actions.getUserDocRef(
                                  widget.currentAccount!.sideTwoId,
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
                                        '${_model.companyDetail2Notifi?.reference.id} İsimli Kişi Cari Hesap Oluşturma Talebinizi Reddetdi',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
