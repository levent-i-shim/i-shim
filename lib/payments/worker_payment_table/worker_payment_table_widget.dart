import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'worker_payment_table_model.dart';
export 'worker_payment_table_model.dart';

class WorkerPaymentTableWidget extends StatefulWidget {
  const WorkerPaymentTableWidget({
    super.key,
    String? valuesOnTableTitle,
    String? valuesOnTableDate,
    String? valuesOnTableBill,
    String? valuesOnTableDoer,
    String? valuesOnTablePayCollection,
    String? valuesOnTableValue,
    this.whichCompanyId,
    this.whichCurrentAccountRef,
  })  : this.valuesOnTableTitle = valuesOnTableTitle ?? 'title',
        this.valuesOnTableDate = valuesOnTableDate ?? 'date',
        this.valuesOnTableBill = valuesOnTableBill ?? 'doesHaveBill',
        this.valuesOnTableDoer = valuesOnTableDoer ?? 'doer',
        this.valuesOnTablePayCollection =
            valuesOnTablePayCollection ?? 'paymentOrCollection',
        this.valuesOnTableValue = valuesOnTableValue ?? 'value';

  final String valuesOnTableTitle;
  final String valuesOnTableDate;
  final String valuesOnTableBill;
  final String valuesOnTableDoer;
  final String valuesOnTablePayCollection;
  final String valuesOnTableValue;
  final String? whichCompanyId;
  final DocumentReference? whichCurrentAccountRef;

  static String routeName = 'workerPaymentTable';
  static String routePath = '/workerPaymentTable';

  @override
  State<WorkerPaymentTableWidget> createState() =>
      _WorkerPaymentTableWidgetState();
}

class _WorkerPaymentTableWidgetState extends State<WorkerPaymentTableWidget> {
  late WorkerPaymentTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkerPaymentTableModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.indexTotal = 0;
      _model.totalSpending = 0.0;
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
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Personel Ödeme/Tahsilat',
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
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        'Tablo',
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
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
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
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF090620),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 4.0, 30.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .compannyOrWorkPlaceValueController ??=
                                        FormFieldController<String>(null),
                                    options: List<String>.from(
                                        ['company', 'workPlace']),
                                    optionLabels: ['Şirket', 'İşyeri'],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.compannyOrWorkPlaceValue = val),
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
                                    hintText: 'Şirket mi işyeri mi ?',
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
                                ),
                                if (_model.compannyOrWorkPlaceValue ==
                                    'company')
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
                                      )..listen((snapshot) {
                                          List<CompaniesRecord>
                                              whichCompaniesDropDownCompaniesRecordList =
                                              snapshot;
                                          if (_model.whichCompaniesDropDownPreviousSnapshot !=
                                                  null &&
                                              !const ListEquality(
                                                      CompaniesRecordDocumentEquality())
                                                  .equals(
                                                      whichCompaniesDropDownCompaniesRecordList,
                                                      _model
                                                          .whichCompaniesDropDownPreviousSnapshot)) {
                                            () async {
                                              _model.indexTotal = 0;
                                              _model.totalSpending = 0.0;
                                              safeSetState(() {});
                                              _model.whichCompanyIdFromDD =
                                                  await actions
                                                      .getCompanyDocRef(
                                                _model
                                                    .whichCompaniesDropDownValue!,
                                              );
                                              _model.countFinancialNoteCompany =
                                                  await queryFinancialNoteCompanyRecordCount(
                                                queryBuilder:
                                                    (financialNoteCompanyRecord) =>
                                                        financialNoteCompanyRecord
                                                            .where(
                                                  'companyId',
                                                  isEqualTo: _model
                                                      .whichCompaniesDropDownValue,
                                                ),
                                              );
                                              _model.listofFinancialNotes =
                                                  await queryFinancialNoteCompanyRecordOnce(
                                                queryBuilder:
                                                    (financialNoteCompanyRecord) =>
                                                        financialNoteCompanyRecord
                                                            .where(
                                                  'companyId',
                                                  isEqualTo: _model
                                                      .whichCompaniesDropDownValue,
                                                ),
                                              );
                                              while (_model.indexTotal! <=
                                                  _model
                                                      .countFinancialNoteCompany!) {
                                                _model.totalSpending = (_model
                                                        .totalSpending!) +
                                                    _model.listofFinancialNotes!
                                                        .elementAtOrNull(
                                                            _model.indexTotal!)!
                                                        .value;
                                                safeSetState(() {});
                                                _model.indexTotal =
                                                    _model.indexTotal! + 1;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            }();
                                          }
                                          _model.whichCompaniesDropDownPreviousSnapshot =
                                              snapshot;
                                        }),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                        List<CompaniesRecord>
                                            whichCompaniesDropDownCompaniesRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .whichCompaniesDropDownValueController ??=
                                              FormFieldController<String>(
                                            _model.whichCompaniesDropDownValue ??=
                                                'Other',
                                          ),
                                          options: List<String>.from(
                                              whichCompaniesDropDownCompaniesRecordList
                                                  .map((e) => e.reference.id)
                                                  .toList()),
                                          optionLabels:
                                              whichCompaniesDropDownCompaniesRecordList
                                                  .map((e) => e.name)
                                                  .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.whichCompaniesDropDownValue =
                                                  val),
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                        );
                                      },
                                    ),
                                  ),
                                if (_model.compannyOrWorkPlaceValue ==
                                    'workPlace')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 4.0, 30.0, 4.0),
                                    child:
                                        StreamBuilder<List<WorkPlacesRecord>>(
                                      stream: queryWorkPlacesRecord(
                                        queryBuilder: (workPlacesRecord) =>
                                            workPlacesRecord.where(Filter.or(
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                            _model.workPlaceDropDownValue ??=
                                                'Other',
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
                                            safeSetState(() => _model
                                                .workPlaceDropDownValue = val);
                                            await actions.getCompanyDocRef(
                                              '',
                                            );
                                          },
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                        );
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 4.0, 30.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .paymentOrCollectionValueController ??=
                                        FormFieldController<String>(null),
                                    options: List<String>.from(
                                        ['payment', 'collection', 'both']),
                                    optionLabels: [
                                      'Ödeme',
                                      'Tahsilat',
                                      'İkisi de'
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.paymentOrCollectionValue = val),
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
                                    hintText: 'Ödeme mi tahsilat mı ?',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 4.0, 30.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.hasBillOrNotValueController ??=
                                            FormFieldController<String>(null),
                                    options: List<String>.from(
                                        ['has', 'hasNot', 'both']),
                                    optionLabels: [
                                      'Fatura var',
                                      'Fatura yok',
                                      'İkisi de'
                                    ],
                                    onChanged: (val) => safeSetState(
                                        () => _model.hasBillOrNotValue = val),
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
                                    hintText: 'Fatura var mı yok mu ?',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 4.0, 30.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.timeRangeValueController ??=
                                            FormFieldController<String>(null),
                                    options: List<String>.from([
                                      'oneWeek',
                                      'twoWeek',
                                      'oneMonth',
                                      'threeMonth',
                                      'sixMonth',
                                      'oneYear',
                                      'allTimes'
                                    ]),
                                    optionLabels: [
                                      'Bir hafta',
                                      'İki hafta',
                                      'Bir ay',
                                      'Üç ay',
                                      'Altı',
                                      'Bir yıl',
                                      'Tüm zamanlar'
                                    ],
                                    onChanged: (val) => safeSetState(
                                        () => _model.timeRangeValue = val),
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
                                    hintText: 'Tarih aralığı seç',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 4.0, 30.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    multiSelectController: _model
                                            .tableValuesDropDownValueController ??=
                                        FormListFieldController<String>(null),
                                    options: List<String>.from([
                                      'doer',
                                      'title',
                                      'date',
                                      'paymentOrCollection',
                                      'doesHaveBill',
                                      'value'
                                    ]),
                                    optionLabels: [
                                      'İşlemi yapan',
                                      'Ünvanı',
                                      'Tarih',
                                      'Ödeme / Tahsilat',
                                      'Fatura var mı',
                                      'Parasal Değer'
                                    ],
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
                                    hintText: 'Tabloda gösterilecek veriler',
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
                                    isMultiSelect: true,
                                    onMultiSelectChanged: (val) => safeSetState(
                                        () => _model.tableValuesDropDownValue =
                                            val),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF090620),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF090620),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 4.0),
                                                  child: Text(
                                                    'Toplam ödeme :',
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        _model.totalSpending,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                        currency: '₺',
                                                      ),
                                                      '0',
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 4.0),
                                                  child: Text(
                                                    'Toplam tahsilat :',
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        _model.totalSpending,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                        currency: '₺',
                                                      ),
                                                      '0',
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.compannyOrWorkPlaceValue ==
                                    'workPlace')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 1.0, 4.0, 1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTableDoer) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'İşlemi yapan',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTableTitle) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Ünvan',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTableDate) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Tarih',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTablePayCollection) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Ödeme / Tahsilat',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTableBill) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Fatura var mı',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model
                                                      .tableValuesDropDownValue
                                                      ?.contains(widget
                                                          .valuesOnTableValue) ??
                                                  true)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFCCAAEE),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Parasal Değer',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
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
                                  ),
                                if (_model.compannyOrWorkPlaceValue ==
                                    'company')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: StreamBuilder<
                                        List<FinancialNoteCompanyRecord>>(
                                      stream: queryFinancialNoteCompanyRecord(
                                        parent: _model.whichCompanyIdFromDD,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<FinancialNoteCompanyRecord>
                                            listViewForCompanyFinancialNoteCompanyRecordList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewForCompanyFinancialNoteCompanyRecordList
                                                  .length,
                                          itemBuilder: (context,
                                              listViewForCompanyIndex) {
                                            final listViewForCompanyFinancialNoteCompanyRecord =
                                                listViewForCompanyFinancialNoteCompanyRecordList[
                                                    listViewForCompanyIndex];
                                            return Visibility(
                                              visible: _model
                                                      .whichCompaniesDropDownValue ==
                                                  listViewForCompanyFinancialNoteCompanyRecord
                                                      .companyId,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 1.0, 4.0, 1.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTableDoer) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewForCompanyFinancialNoteCompanyRecord
                                                                    .creatorName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTableTitle) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewForCompanyFinancialNoteCompanyRecord
                                                                    .creatorTitle,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTableDate) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                    "d/M/y",
                                                                    listViewForCompanyFinancialNoteCompanyRecord
                                                                        .creationDate!),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTablePayCollection) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewForCompanyFinancialNoteCompanyRecord
                                                                      .incomeOrExpense,
                                                                  'Gelir/Gider',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTableBill) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewForCompanyFinancialNoteCompanyRecord
                                                                    .doesHaveBill,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .tableValuesDropDownValue
                                                            ?.contains(widget
                                                                .valuesOnTableValue) ??
                                                        true)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Container(
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFCCAAEE),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Text(
                                                                formatNumber(
                                                                  listViewForCompanyFinancialNoteCompanyRecord
                                                                      .value,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency: '₺',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
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
