import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/delete_request_component/delete_request_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'incomes_page_work_place_copy_model.dart';
export 'incomes_page_work_place_copy_model.dart';

class IncomesPageWorkPlaceCopyWidget extends StatefulWidget {
  const IncomesPageWorkPlaceCopyWidget({
    super.key,
    required this.company,
    required this.canAddIncome,
    this.workPlace,
    required this.isOwner,
  });

  final DocumentReference? company;
  final bool? canAddIncome;
  final DocumentReference? workPlace;
  final bool? isOwner;

  static String routeName = 'IncomesPageWorkPlaceCopy';
  static String routePath = '/incomesPageWorkPlaceCopy';

  @override
  State<IncomesPageWorkPlaceCopyWidget> createState() =>
      _IncomesPageWorkPlaceCopyWidgetState();
}

class _IncomesPageWorkPlaceCopyWidgetState
    extends State<IncomesPageWorkPlaceCopyWidget> {
  late IncomesPageWorkPlaceCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncomesPageWorkPlaceCopyModel());

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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gelirler',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  if (widget.canAddIncome!) {
                    context.pushNamed(
                      AddManualIncomePageWorkPlaceWidget.routeName,
                      queryParameters: {
                        'company': serializeParam(
                          widget.company,
                          ParamType.DocumentReference,
                        ),
                        'workPlace': serializeParam(
                          widget.workPlace,
                          ParamType.DocumentReference,
                        ),
                        'isEdit': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Yetkiniz Yok',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                },
                text: 'Gelir Ekle',
                icon: Icon(
                  Icons.add,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF060418), Color(0xF4300232)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: PagedListView<DocumentSnapshot<Object?>?,
                CompanyIncomes2025Record>(
              pagingController: _model.setListViewController(
                  CompanyIncomes2025Record.collection(widget.company)
                      .where(
                        'isDelete',
                        isEqualTo: false,
                      )
                      .where(
                        'isExpected',
                        isEqualTo: false,
                      )
                      .where(
                        'workPlace',
                        isEqualTo: widget.workPlace,
                      )
                      .orderBy('date'),
                  parent: widget.company),
              padding: EdgeInsets.zero,
              reverse: false,
              scrollDirection: Axis.vertical,
              builderDelegate:
                  PagedChildBuilderDelegate<CompanyIncomes2025Record>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
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
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
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

                itemBuilder: (context, _, listViewIndex) {
                  final listViewCompanyIncomes2025Record =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 18.0, 12.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xCAFFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 18.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        listViewCompanyIncomes2025Record.type,
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
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    if (listViewCompanyIncomes2025Record
                                        .hasIncomePeriodTime())
                                      Flexible(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 8.0, 14.0, 8.0),
                                            child: Text(
                                              listViewCompanyIncomes2025Record
                                                  .incomePeriodTime,
                                              style:
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
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
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  listViewCompanyIncomes2025Record.fromWhom,
                                  maxLines: 5,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  listViewCompanyIncomes2025Record.description,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  formatNumber(
                                    listViewCompanyIncomes2025Record.value,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.commaDecimal,
                                  ),
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
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.canAddIncome!) {
                                            context.pushNamed(
                                              AddManualIncomePageWorkPlaceWidget
                                                  .routeName,
                                              queryParameters: {
                                                'company': serializeParam(
                                                  widget.company,
                                                  ParamType.DocumentReference,
                                                ),
                                                'workPlace': serializeParam(
                                                  widget.workPlace,
                                                  ParamType.DocumentReference,
                                                ),
                                                'companyIncome': serializeParam(
                                                  listViewCompanyIncomes2025Record,
                                                  ParamType.Document,
                                                ),
                                                'isEdit': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'companyIncome':
                                                    listViewCompanyIncomes2025Record,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Yetkiniz Yok',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget.canAddIncome!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Gelir Silinecek'),
                                                          content: Text(
                                                              'Silmek İstediğinize Emin misiniz?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              if (widget.isOwner!) {
                                                await listViewCompanyIncomes2025Record
                                                    .reference
                                                    .update(
                                                        createCompanyIncomes2025RecordData(
                                                  isDelete: true,
                                                ));

                                                await listViewCompanyIncomes2025Record
                                                    .workPlaceIncome!
                                                    .update(
                                                        createWorkPlaceIncomes2025RecordData(
                                                  isDelete: true,
                                                ));

                                                await widget.company!.update({
                                                  ...mapToFirestore(
                                                    {
                                                      'totalMoney':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                      'yearlyMoney':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                      'dailyIncome':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                    },
                                                  ),
                                                });

                                                await listViewCompanyIncomes2025Record
                                                    .workPlace!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'totalMoney':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                      'yearlyMoney':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                      'dailyIncome':
                                                          FieldValue.increment(
                                                              -(listViewCompanyIncomes2025Record
                                                                  .value)),
                                                    },
                                                  ),
                                                });
                                              } else {
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
                                                            DeleteRequestComponentWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model.description =
                                                        value));

                                                if (_model.description !=
                                                        null &&
                                                    _model.description != '') {
                                                  _model.companyDetail =
                                                      await CompaniesRecord
                                                          .getDocumentOnce(
                                                              widget.company!);

                                                  var deletionRequestRecordReference =
                                                      DeletionRequestRecord
                                                          .createDoc(
                                                              widget.company!);
                                                  await deletionRequestRecordReference
                                                      .set(
                                                          createDeletionRequestRecordData(
                                                    type: DeleteionRequestTypes
                                                        .income.name,
                                                    description:
                                                        _model.description,
                                                    triggeredUser:
                                                        currentUserReference,
                                                    isDeleteRequest: false,
                                                    workPlace:
                                                        widget.workPlace,
                                                    income:
                                                        listViewCompanyIncomes2025Record
                                                            .reference,
                                                  ));
                                                  _model.deletionRequest =
                                                      DeletionRequestRecord
                                                          .getDocumentFromData(
                                                              createDeletionRequestRecordData(
                                                                type:
                                                                    DeleteionRequestTypes
                                                                        .income
                                                                        .name,
                                                                description: _model
                                                                    .description,
                                                                triggeredUser:
                                                                    currentUserReference,
                                                                isDeleteRequest:
                                                                    false,
                                                                workPlace: widget
                                                                    .workPlace,
                                                                income:
                                                                    listViewCompanyIncomes2025Record
                                                                        .reference,
                                                              ),
                                                              deletionRequestRecordReference);

                                                  await NotificationsRecord
                                                          .createDoc(_model
                                                              .companyDetail!
                                                              .owner!)
                                                      .set({
                                                    ...createNotificationsRecordData(
                                                      type: NotificationTypes
                                                          .deleteRequest.name,
                                                      content:
                                                          'Silme Talebi Gönderildi',
                                                      relatedDoc: _model
                                                          .deletionRequest
                                                          ?.reference
                                                          .id,
                                                      isRead: false,
                                                      isDelete: false,
                                                      company: widget.company,
                                                      fullDescription:
                                                          '${listViewCompanyIncomes2025Record.type} Türündeki ${listViewCompanyIncomes2025Record.value.toString()} değerindeki Gelir ${currentUserDisplayName} isimli kişi tarafından silinme talebinde bulunuldu',
                                                      workplace:
                                                          widget.workPlace,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'creationTime': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });

                                                  await _model
                                                      .companyDetail!.owner!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'notificationCount':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Silme Talebi Gönderildi',
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
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Silme Talebi Gönderilemedi',
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
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Yetkiniz Yok',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28.0,
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
