import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transactiondetail_page_work_place_model.dart';
export 'transactiondetail_page_work_place_model.dart';

class TransactiondetailPageWorkPlaceWidget extends StatefulWidget {
  const TransactiondetailPageWorkPlaceWidget({
    super.key,
    required this.isPartner,
    required this.canManageTransaction,
    required this.canManageStock,
    required this.transaction,
    required this.workPlace,
    required this.company,
    required this.isWorker,
  });

  final bool? isPartner;
  final bool? canManageTransaction;
  final bool? canManageStock;
  final WorkPlaceTransactionRecord? transaction;
  final DocumentReference? workPlace;
  final DocumentReference? company;
  final bool? isWorker;

  static String routeName = 'TransactiondetailPageWorkPlace';
  static String routePath = '/transactiondetailPageWorkPlace';

  @override
  State<TransactiondetailPageWorkPlaceWidget> createState() =>
      _TransactiondetailPageWorkPlaceWidgetState();
}

class _TransactiondetailPageWorkPlaceWidgetState
    extends State<TransactiondetailPageWorkPlaceWidget> {
  late TransactiondetailPageWorkPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactiondetailPageWorkPlaceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.companyDetail =
          await CompaniesRecord.getDocumentOnce(widget.company!);
      _model.worker = await queryWorkPlaceWorkerRecordOnce(
        parent: _model.companyDetail?.headOffice,
        queryBuilder: (workPlaceWorkerRecord) => workPlaceWorkerRecord.where(
          'canAcceptTransaction',
          isEqualTo: true,
        ),
      );
      _model.isEnteredIncome = widget.transaction!.isConfirmed;
      _model.isEnteredPayment = widget.transaction!.isConfirmed;
      _model.workers = _model.worker!.toList().cast<WorkPlaceWorkerRecord>();
      safeSetState(() {});
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
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: StreamBuilder<CompanyReportsRecord>(
                    stream: CompanyReportsRecord.getDocument(
                        widget.transaction!.companyReports!),
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

                      final containerCompanyReportsRecord = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Builder(
                                builder: (context) {
                                  final fields = containerCompanyReportsRecord
                                      .responses
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: fields.length,
                                    itemBuilder: (context, fieldsIndex) {
                                      final fieldsItem = fields[fieldsIndex];
                                      return StreamBuilder<FormResponsesRecord>(
                                        stream: FormResponsesRecord.getDocument(
                                            fieldsItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final containerFormResponsesRecord =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  height: 100.0,
                                                  child: VerticalDivider(
                                                    thickness: 2.0,
                                                    color: Color(0xFF0071FF),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 10,
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (containerFormResponsesRecord
                                                              .fieldValueType ==
                                                          FieldValueType
                                                              .Image.name) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .question_mark,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      containerFormResponsesRecord
                                                                          .fieldName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
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
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            containerFormResponsesRecord.imagePath,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: containerFormResponsesRecord
                                                                              .imagePath,
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: containerFormResponsesRecord
                                                                        .imagePath,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerFormResponsesRecord
                                                                            .imagePath,
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .question_mark,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        containerFormResponsesRecord
                                                                            .fieldName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 2,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .question_answer_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 10,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFB6B5B5),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(12.0),
                                                                            child:
                                                                                Text(
                                                                              containerFormResponsesRecord.fieldValueType == FieldValueType.DateTime.name
                                                                                  ? ((String yourDate) {
                                                                                      return DateTime.parse(yourDate).day.toString().padLeft(2, '0') + '/' + DateTime.parse(yourDate).month.toString().padLeft(2, '0') + '/' + DateTime.parse(yourDate).year.toString();
                                                                                    }(containerFormResponsesRecord.fieldValue))
                                                                                  : containerFormResponsesRecord.fieldValue,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.transaction?.name,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.transaction?.description,
                                  'açıklama',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.transaction?.totalAmount.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                    "d/M/y", widget.transaction!.date!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!widget.transaction!.isConfirmed &&
                                      !widget.transaction!.isRejected)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 20.0, 5.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if (widget.isPartner!) {
                                                  if (!widget
                                                      .canManageTransaction!) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Yetkiniz Yok',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  if (widget.isWorker!) {
                                                    if (!widget
                                                        .canManageTransaction!) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Yetkiniz Yok',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                }

                                                _model.validate = true;
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  safeSetState(() =>
                                                      _model.validate = false);
                                                  return;
                                                }
                                                if (_model.dropDownValue ==
                                                    null) {
                                                  _model.validate = false;
                                                  safeSetState(() {});
                                                  return;
                                                }
                                                _shouldSetState = true;
                                                if (_model.validate!) {
                                                  await widget
                                                      .transaction!.reference
                                                      .update(
                                                          createWorkPlaceTransactionRecordData(
                                                    isConfirmedFromWorkPlace:
                                                        true,
                                                  ));
                                                  _model.receiverUser =
                                                      await actions
                                                          .getUserDocRef(
                                                    _model.dropDownValue!,
                                                  );
                                                  _shouldSetState = true;

                                                  var companyTransactionsRecordReference =
                                                      CompanyTransactionsRecord
                                                          .createDoc(
                                                              widget.company!);
                                                  await companyTransactionsRecordReference
                                                      .set({
                                                    ...createCompanyTransactionsRecordData(
                                                      name: widget
                                                          .transaction?.name,
                                                      description: widget
                                                          .transaction
                                                          ?.description,
                                                      companyReports: widget
                                                          .transaction
                                                          ?.companyReports,
                                                      senderRef:
                                                          currentUserReference,
                                                      receiverRef:
                                                          _model.receiverUser,
                                                      totalAmount: widget
                                                          .transaction
                                                          ?.totalAmount,
                                                      isConfirmed: false,
                                                      isRejected: false,
                                                      workPlaceTransaction:
                                                          widget.transaction
                                                              ?.reference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'date': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.companyTransaction =
                                                      CompanyTransactionsRecord
                                                          .getDocumentFromData({
                                                    ...createCompanyTransactionsRecordData(
                                                      name: widget
                                                          .transaction?.name,
                                                      description: widget
                                                          .transaction
                                                          ?.description,
                                                      companyReports: widget
                                                          .transaction
                                                          ?.companyReports,
                                                      senderRef:
                                                          currentUserReference,
                                                      receiverRef:
                                                          _model.receiverUser,
                                                      totalAmount: widget
                                                          .transaction
                                                          ?.totalAmount,
                                                      isConfirmed: false,
                                                      isRejected: false,
                                                      workPlaceTransaction:
                                                          widget.transaction
                                                              ?.reference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'date': DateTime.now(),
                                                      },
                                                    ),
                                                  }, companyTransactionsRecordReference);
                                                  _shouldSetState = true;
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Şirket Onayına Gönderildi',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );

                                                  await AjandaRecord.createDoc(
                                                          currentUserReference!)
                                                      .set({
                                                    ...createAjandaRecordData(
                                                      description:
                                                          'İşlem Onaylandı Gelir Olarak Girildi',
                                                      type: WorkHistoryTypes
                                                          .sendTransaction.name,
                                                      transaction: _model
                                                          .companyTransaction
                                                          ?.reference,
                                                      fullDescription:
                                                          '${widget.transaction?.name} isimli işlem onaylandı ve${widget.transaction?.totalAmount.toString()} TL Gelir Olarak girildi',
                                                      isChangedStock: false,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'dateTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.isEnteredIncome = true;
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Bilgileri doldurunuz',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'Şirkete Onaya Gönder',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 18.0, 18.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: Text(
                                            'Şirket içinde onaylayacak kişiyi seçin',
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
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= '',
                                            ),
                                            options: List<String>.from(_model
                                                .workers
                                                .map((e) => e.user?.id)
                                                .withoutNulls
                                                .toList()),
                                            optionLabels: _model.workers
                                                .map((e) => e.userName)
                                                .toList(),
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 200.0,
                                            height: 40.0,
                                            textStyle:
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
                                            hintText: 'Select...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
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
                      );
                    },
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
