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
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transaction_detail_page_model.dart';
export 'transaction_detail_page_model.dart';

class TransactionDetailPageWidget extends StatefulWidget {
  const TransactionDetailPageWidget({
    super.key,
    required this.transaction,
    bool? isPartner,
    bool? canManageTransaction,
    bool? canManageStock,
  })  : this.isPartner = isPartner ?? false,
        this.canManageTransaction = canManageTransaction ?? false,
        this.canManageStock = canManageStock ?? false;

  final CompanyTransactionsRecord? transaction;
  final bool isPartner;
  final bool canManageTransaction;
  final bool canManageStock;

  static String routeName = 'TransactionDetailPage';
  static String routePath = '/transactionDetailPage';

  @override
  State<TransactionDetailPageWidget> createState() =>
      _TransactionDetailPageWidgetState();
}

class _TransactionDetailPageWidgetState
    extends State<TransactionDetailPageWidget> {
  late TransactionDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isEnteredIncome = widget.transaction!.isConfirmed;
      _model.isEnteredPayment = widget.transaction!.isConfirmed;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final fields = containerCompanyReportsRecord
                                      .responses
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: fields.length,
                                    itemBuilder: (context, fieldsIndex) {
                                      final fieldsItem = fields[fieldsIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child:
                                            StreamBuilder<FormResponsesRecord>(
                                          stream:
                                              FormResponsesRecord.getDocument(
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
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
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
                                                                          type:
                                                                              PageTransitionType.fade,
                                                                          child:
                                                                              FlutterFlowExpandedImageView(
                                                                            image:
                                                                                Image.network(
                                                                              containerFormResponsesRecord.imagePath,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                            allowRotation:
                                                                                false,
                                                                            tag:
                                                                                containerFormResponsesRecord.imagePath,
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
                                                                            BorderRadius.circular(8.0),
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex:
                                                                            10,
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
                                                                              color: Color(0xFFB6B5B5),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(12.0),
                                                                              child: Text(
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.transaction?.name,
                                    'İsim',
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    widget.transaction?.totalAmount
                                        .toString(),
                                    '0',
                                  )} TL',
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
                                    dateTimeFormat(
                                        "d/M/y", widget.transaction?.date),
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          _model.company = await CompaniesRecord
                                              .getDocumentOnce(widget
                                                  .transaction!
                                                  .parentReference);
                                          _shouldSetState = true;
                                          if (widget.isPartner) {
                                            if (!widget.canManageTransaction) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            if (_model.company?.owner !=
                                                currentUserReference) {
                                              _model.companyWorker =
                                                  await queryCompanyWorkersRecordOnce(
                                                parent: widget.transaction
                                                    ?.parentReference,
                                                queryBuilder:
                                                    (companyWorkersRecord) =>
                                                        companyWorkersRecord
                                                            .where(
                                                  'userRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              if (!_model.companyWorker!
                                                  .hasAuthorizedByDepartment()) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            }
                                          }

                                          _model.workPlace =
                                              await WorkPlaceTransactionRecord
                                                  .getDocumentOnce(widget
                                                      .transaction!
                                                      .workPlaceTransaction!);
                                          _shouldSetState = true;

                                          context.pushNamed(
                                            ReportResultAddIncomePageWidget
                                                .routeName,
                                            queryParameters: {
                                              'workPlace': serializeParam(
                                                _model
                                                    .workPlace?.parentReference,
                                                ParamType.DocumentReference,
                                              ),
                                              'company': serializeParam(
                                                widget.transaction
                                                    ?.parentReference,
                                                ParamType.DocumentReference,
                                              ),
                                              'value': serializeParam(
                                                widget
                                                    .transaction?.totalAmount,
                                                ParamType.double,
                                              ),
                                              'companyTransaction':
                                                  serializeParam(
                                                widget.transaction?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'workPlaceTransaction':
                                                  serializeParam(
                                                widget.transaction
                                                    ?.workPlaceTransaction,
                                                ParamType.DocumentReference,
                                              ),
                                              'transactionName': serializeParam(
                                                widget.transaction?.name,
                                                ParamType.String,
                                              ),
                                              'companyName': serializeParam(
                                                _model.company?.name,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Gelir Olarak Gir',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          _model.companyExpense =
                                              await CompaniesRecord
                                                  .getDocumentOnce(widget
                                                      .transaction!
                                                      .parentReference);
                                          _shouldSetState = true;
                                          if (widget.isPartner) {
                                            if (!widget.canManageTransaction) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            if (_model.companyExpense?.owner !=
                                                currentUserReference) {
                                              _model.companyWorkerExpense =
                                                  await queryCompanyWorkersRecordOnce(
                                                parent: widget.transaction
                                                    ?.parentReference,
                                                queryBuilder:
                                                    (companyWorkersRecord) =>
                                                        companyWorkersRecord
                                                            .where(
                                                  'userRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              if (!_model.companyWorkerExpense!
                                                  .hasAuthorizedByDepartment()) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            }
                                          }

                                          _model.workPlace2 =
                                              await WorkPlaceTransactionRecord
                                                  .getDocumentOnce(widget
                                                      .transaction!
                                                      .workPlaceTransaction!);
                                          _shouldSetState = true;

                                          context.pushNamed(
                                            ReportResultAddIncomePageWidget
                                                .routeName,
                                            queryParameters: {
                                              'workPlace': serializeParam(
                                                _model.workPlace2
                                                    ?.parentReference,
                                                ParamType.DocumentReference,
                                              ),
                                              'company': serializeParam(
                                                widget.transaction
                                                    ?.parentReference,
                                                ParamType.DocumentReference,
                                              ),
                                              'value': serializeParam(
                                                widget
                                                    .transaction?.totalAmount,
                                                ParamType.double,
                                              ),
                                              'companyTransaction':
                                                  serializeParam(
                                                widget.transaction?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'workPlaceTransaction':
                                                  serializeParam(
                                                widget.transaction
                                                    ?.workPlaceTransaction,
                                                ParamType.DocumentReference,
                                              ),
                                              'transactionName': serializeParam(
                                                widget.transaction?.name,
                                                ParamType.String,
                                              ),
                                              'companyName': serializeParam(
                                                _model.company?.name,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Gider Olarak Gir',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          _model.companyReject =
                                              await CompaniesRecord
                                                  .getDocumentOnce(widget
                                                      .transaction!
                                                      .parentReference);
                                          _shouldSetState = true;
                                          if (widget.isPartner) {
                                            if (!widget.canManageTransaction) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Yetkiniz Yok',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            if (_model.companyReject?.owner !=
                                                currentUserReference) {
                                              _model.companyWorkerReject =
                                                  await queryCompanyWorkersRecordOnce(
                                                parent: widget.transaction
                                                    ?.parentReference,
                                                queryBuilder:
                                                    (companyWorkersRecord) =>
                                                        companyWorkersRecord
                                                            .where(
                                                  'userRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              if (!_model.companyWorkerReject!
                                                  .hasAuthorizedByDepartment()) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Yetkiniz Yok',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            }
                                          }

                                          await widget.transaction!.reference
                                              .update(
                                                  createCompanyTransactionsRecordData(
                                            isRejected: true,
                                          ));
                                          _model.workPlaceTransaction =
                                              await WorkPlaceTransactionRecord
                                                  .getDocumentOnce(widget
                                                      .transaction!
                                                      .workPlaceTransaction!);
                                          _shouldSetState = true;

                                          await widget.transaction!
                                              .workPlaceTransaction!
                                              .update(
                                                  createWorkPlaceTransactionRecordData(
                                            isRejected: true,
                                          ));

                                          await AjandaRecord.createDoc(
                                                  currentUserReference!)
                                              .set({
                                            ...createAjandaRecordData(
                                              description: 'İşlem Reddedildi',
                                              type: WorkHistoryTypes
                                                  .transactionRejected.name,
                                              transaction: widget
                                                  .transaction?.reference,
                                              fullDescription:
                                                  '${_model.company?.name} isimli şirketinizde ${widget.transaction?.name} isimli işlem reddedildi',
                                              isIncome: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'dateTime': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });

                                          await WorkPlaceNotificationsRecord
                                                  .createDoc(_model
                                                      .workPlaceTransaction!
                                                      .parentReference)
                                              .set({
                                            ...createWorkPlaceNotificationsRecordData(
                                              type: 'reject',
                                              content: 'İşlem Reddedildi',
                                              isRead: false,
                                              isDelete: false,
                                              company: widget
                                                  .transaction?.parentReference,
                                              fullDescription:
                                                  '${widget.transaction?.name} İsimli İşlem ${currentUserDisplayName} İsimli kişi tarafından Reddedildi',
                                              isAccept: false,
                                              isReject: true,
                                              triggeredBy: currentUserReference,
                                              image:
                                                  _model.company?.companyLogo,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'creationTime': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'İptal Edildi',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          context.safePop();
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'İptal Et',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
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
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: StreamBuilder<List<StocksRecord>>(
                    stream: queryStocksRecord(
                      parent: widget.transaction?.parentReference,
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
                      List<StocksRecord> containerStocksRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Stoklarda İşlem Yapılacak mı',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownStockValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownStockValue ??= '',
                                      ),
                                      options: List<String>.from(
                                          containerStocksRecordList
                                              .map((e) => e.reference.id)
                                              .toList()),
                                      optionLabels: containerStocksRecordList
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                          _model.dropDownStockValue = val),
                                      width: 200.0,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Ürün Seç',
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
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    80.0, 10.0, 80.0, 0.0),
                                            child: Container(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  hintText: 'Miktar Giriniz',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
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
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 20.0))
                                          .around(SizedBox(width: 20.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 18.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              if (widget.isPartner) {
                                                if (widget.canManageStock) {
                                                  _model.validate5 = true;
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    safeSetState(() => _model
                                                        .validate5 = false);
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDownStockValue ==
                                                      null) {
                                                    _model.validate5 = false;
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                  _shouldSetState = true;
                                                  if (!_model.validate5!) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                }
                                              } else {
                                                if (_model.isEnteredIncome ||
                                                    _model.isEnteredPayment) {
                                                  _model.validate2 = true;
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    safeSetState(() => _model
                                                        .validate2 = false);
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDownStockValue ==
                                                      null) {
                                                    _model.validate2 = false;
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                  _shouldSetState = true;
                                                  if (!_model.validate2!) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Önce Gelir Veya Gide Olarak Girin',
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
                                              }

                                              _model.stockDocRef3 =
                                                  await actions.getStockDocRef(
                                                _model.dropDownStockValue!,
                                                widget.transaction!
                                                    .parentReference.id,
                                              );
                                              _shouldSetState = true;

                                              var stockMovementRecordReference =
                                                  StockMovementRecord.createDoc(
                                                      widget.transaction!
                                                          .parentReference);
                                              await stockMovementRecordReference
                                                  .set({
                                                ...createStockMovementRecordData(
                                                  stockRef: _model.stockDocRef3,
                                                  movementType: 'in',
                                                  quantity: double.tryParse(
                                                      _model
                                                          .textController.text),
                                                  creatorUserRef:
                                                      currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'date': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              _model.stockMovement3 =
                                                  StockMovementRecord
                                                      .getDocumentFromData({
                                                ...createStockMovementRecordData(
                                                  stockRef: _model.stockDocRef3,
                                                  movementType: 'in',
                                                  quantity: double.tryParse(
                                                      _model
                                                          .textController.text),
                                                  creatorUserRef:
                                                      currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'date': DateTime.now(),
                                                  },
                                                ),
                                              }, stockMovementRecordReference);
                                              _shouldSetState = true;

                                              await _model.stockDocRef3!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'quantity':
                                                        FieldValue.increment(
                                                            double.parse(_model
                                                                .textController
                                                                .text)),
                                                  },
                                                ),
                                              });

                                              await AjandaRecord.createDoc(
                                                      currentUserReference!)
                                                  .set({
                                                ...createAjandaRecordData(
                                                  description:
                                                      'Stok Arttırıldı',
                                                  type: WorkHistoryTypes
                                                      .createStockMovement.name,
                                                  stockMovement: _model
                                                      .stockMovement3
                                                      ?.reference,
                                                  fullDescription:
                                                      '${_model.textController.text} Stok Arttırıldı',
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'dateTime': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Ürün Eklendi',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            },
                                            text: 'Ürün Ekle',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (widget.isPartner) {
                                                if (widget.canManageStock) {
                                                  _model.validate6 = true;
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    safeSetState(() => _model
                                                        .validate6 = false);
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDownStockValue ==
                                                      null) {
                                                    _model.validate6 = false;
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                  if (_model.validate6!) {
                                                    _model.stockDocRef4 =
                                                        await actions
                                                            .getStockDocRef(
                                                      _model
                                                          .dropDownStockValue!,
                                                      widget.transaction!
                                                          .parentReference.id,
                                                    );

                                                    var stockMovementRecordReference1 =
                                                        StockMovementRecord
                                                            .createDoc(widget
                                                                .transaction!
                                                                .parentReference);
                                                    await stockMovementRecordReference1
                                                        .set({
                                                      ...createStockMovementRecordData(
                                                        stockRef:
                                                            _model.stockDocRef4,
                                                        movementType: 'out',
                                                        quantity: double
                                                            .tryParse(_model
                                                                .textController
                                                                .text),
                                                        creatorUserRef:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'date': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    _model.stockMovement4 =
                                                        StockMovementRecord
                                                            .getDocumentFromData({
                                                      ...createStockMovementRecordData(
                                                        stockRef:
                                                            _model.stockDocRef4,
                                                        movementType: 'out',
                                                        quantity: double
                                                            .tryParse(_model
                                                                .textController
                                                                .text),
                                                        creatorUserRef:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'date':
                                                              DateTime.now(),
                                                        },
                                                      ),
                                                    }, stockMovementRecordReference1);

                                                    await _model.stockDocRef4!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'quantity': FieldValue
                                                              .increment(-(double
                                                                  .parse(_model
                                                                      .textController
                                                                      .text))),
                                                        },
                                                      ),
                                                    });

                                                    await AjandaRecord.createDoc(
                                                            currentUserReference!)
                                                        .set({
                                                      ...createAjandaRecordData(
                                                        description:
                                                            'Stok Azaltıldı',
                                                        type: WorkHistoryTypes
                                                            .createStockMovement
                                                            .name,
                                                        stockMovement: _model
                                                            .stockMovement4
                                                            ?.reference,
                                                        fullDescription:
                                                            '${_model.textController.text} Stok Eksiltildi',
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'dateTime': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Ürün Azaltıldı',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Alanları Doldurunuz',
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
                                                }
                                              } else {
                                                if (_model.isEnteredIncome ||
                                                    _model.isEnteredPayment) {
                                                  _model.validate3 = true;
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    safeSetState(() => _model
                                                        .validate3 = false);
                                                    return;
                                                  }
                                                  if (_model
                                                          .dropDownStockValue ==
                                                      null) {
                                                    _model.validate3 = false;
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                  if (_model.validate3!) {
                                                    _model.stockDocRef2 =
                                                        await actions
                                                            .getStockDocRef(
                                                      _model
                                                          .dropDownStockValue!,
                                                      widget.transaction!
                                                          .parentReference.id,
                                                    );

                                                    var stockMovementRecordReference2 =
                                                        StockMovementRecord
                                                            .createDoc(widget
                                                                .transaction!
                                                                .parentReference);
                                                    await stockMovementRecordReference2
                                                        .set({
                                                      ...createStockMovementRecordData(
                                                        stockRef:
                                                            _model.stockDocRef2,
                                                        movementType: 'out',
                                                        quantity: double
                                                            .tryParse(_model
                                                                .textController
                                                                .text),
                                                        creatorUserRef:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'date': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    _model.stockMovement2 =
                                                        StockMovementRecord
                                                            .getDocumentFromData({
                                                      ...createStockMovementRecordData(
                                                        stockRef:
                                                            _model.stockDocRef2,
                                                        movementType: 'out',
                                                        quantity: double
                                                            .tryParse(_model
                                                                .textController
                                                                .text),
                                                        creatorUserRef:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'date':
                                                              DateTime.now(),
                                                        },
                                                      ),
                                                    }, stockMovementRecordReference2);

                                                    await _model.stockDocRef2!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'quantity': FieldValue
                                                              .increment(-(double
                                                                  .parse(_model
                                                                      .textController
                                                                      .text))),
                                                        },
                                                      ),
                                                    });

                                                    await AjandaRecord.createDoc(
                                                            currentUserReference!)
                                                        .set({
                                                      ...createAjandaRecordData(
                                                        description:
                                                            'Stok Azaltıldı',
                                                        type: WorkHistoryTypes
                                                            .createStockMovement
                                                            .name,
                                                        stockMovement: _model
                                                            .stockMovement2
                                                            ?.reference,
                                                        fullDescription:
                                                            '${_model.textController.text} Stok Eksiltildi',
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'dateTime': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Ürün Azaltıldı',
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
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Alanları Doldurunuz',
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
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Önce Gelir Veya Gide Olarak Girin',
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
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'Ürün Azalt',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
