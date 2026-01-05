import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'current_account_create_for_company_page_model.dart';
export 'current_account_create_for_company_page_model.dart';

class CurrentAccountCreateForCompanyPageWidget extends StatefulWidget {
  const CurrentAccountCreateForCompanyPageWidget({
    super.key,
    this.company,
  });

  final DocumentReference? company;

  static String routeName = 'CurrentAccountCreateForCompanyPage';
  static String routePath = '/currentAccountCreateForCompanyPage';

  @override
  State<CurrentAccountCreateForCompanyPageWidget> createState() =>
      _CurrentAccountCreateForCompanyPageWidgetState();
}

class _CurrentAccountCreateForCompanyPageWidgetState
    extends State<CurrentAccountCreateForCompanyPageWidget> {
  late CurrentAccountCreateForCompanyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CurrentAccountCreateForCompanyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.copmanie = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(Filter.or(
          Filter(
            'owner',
            isEqualTo: currentUserReference,
          ),
          Filter(
            'partners',
            arrayContains: currentUserReference,
          ),
        )),
      );
      _model.allCompanies = await queryCompaniesRecordOnce();
      _model.users = await queryUsersRecordOnce();
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Şirket Hesabınız için Cari Hesap Oluşturuluyor',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Karşı Taraf için',
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
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.sideTwoTypeValueController ??=
                            FormFieldController<String>(
                          _model.sideTwoTypeValue ??= '',
                        ),
                        options: List<String>.from(
                            ['Şahıs', 'Şirket', 'Kullanmayan']),
                        optionLabels: [
                          'Kişisel Cari Hesap',
                          'Şirket Cari Hesabı',
                          'Uygulamayı Kullanmıyor'
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.sideTwoTypeValue = val);
                          _model.isSelectedCompanyForCounter =
                              _model.sideTwoTypeValue == 'Şirket'
                                  ? true
                                  : false;
                          _model.isSelectedUserForCounter =
                              _model.sideTwoTypeValue == 'Şahıs' ? true : false;
                          _model.isSelectedUserNotUsingApp =
                              _model.sideTwoTypeValue == 'Kullanmayan'
                                  ? true
                                  : false;
                          safeSetState(() {});
                        },
                        width: 200.0,
                        height: 40.0,
                        textStyle:
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
                        hintText: 'Select...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
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
                      if (_model.isSelectedUserNotUsingApp)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Text(
                                  'İsmini Giriniz',
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.black,
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
                                        hintText: 'İsim',
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                              color: Colors.black,
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
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
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
                                            color: Colors.black,
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_model.isSelectedUserNotUsingApp)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var currentAccountRecordReference =
                                  CurrentAccountRecord.collection.doc();
                              await currentAccountRecordReference.set({
                                ...createCurrentAccountRecordData(
                                  sideOneType: 'Şirket',
                                  sideOneID: widget.company?.id,
                                  sideTwoType: 'Kullanmayan',
                                  sideTwoID: _model.textController1.text,
                                  status: true,
                                  totalValueForSideOne: 0.0,
                                  totalValueForSideTwo: 0.0,
                                  totalBillCount: 0,
                                  totalUnPaidBillCount: 0,
                                  isAccepted: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.currentAccountNotUsing =
                                  CurrentAccountRecord.getDocumentFromData({
                                ...createCurrentAccountRecordData(
                                  sideOneType: 'Şirket',
                                  sideOneID: widget.company?.id,
                                  sideTwoType: 'Kullanmayan',
                                  sideTwoID: _model.textController1.text,
                                  status: true,
                                  totalValueForSideOne: 0.0,
                                  totalValueForSideTwo: 0.0,
                                  totalBillCount: 0,
                                  totalUnPaidBillCount: 0,
                                  isAccepted: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime': DateTime.now(),
                                  },
                                ),
                              }, currentAccountRecordReference);

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description:
                                      'Cari Hesap Oluşturma Talebi Gönderildi',
                                  type: WorkHistoryTypes
                                      .createCurrentAcountForCompany.name,
                                  company: widget.company,
                                  currentAccount:
                                      _model.currentAccountNotUsing?.reference,
                                  fullDescription:
                                      '${_model.textController1.text} İsimli Uygulamayı Kullanmayan Kişi/Şirket ile Cari Hesap Oluşturma Daveti Gönderildi',
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateTime': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Başarıyla Oluşturuldu',
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
                              context.safePop();

                              safeSetState(() {});
                            },
                            text: 'Onayla',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF0200FF),
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
                              borderSide: BorderSide(
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                              hoverColor: Color(0xFFFF0003),
                              hoverTextColor: Colors.white,
                            ),
                          ),
                        ),
                      if (_model.isSelectedUserForCounter)
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController2',
                                Duration(milliseconds: 2000),
                                () async {
                                  await queryUsersRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults1 = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record,
                                                        [record.displayName]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController2.text)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults1 = [])
                                      .whenComplete(() => safeSetState(() {}));
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Kullanıcı adını girin ...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
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
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      if (_model.isSelectedCompanyForCounter)
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController3',
                                Duration(milliseconds: 2000),
                                () async {
                                  await queryCompaniesRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults2 = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.name]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController3.text)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults2 = [])
                                      .whenComplete(() => safeSetState(() {}));
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: 'İşyeri Adını Giriniz',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
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
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      if (_model.isSelectedUserForCounter)
                        Builder(
                          builder: (context) {
                            final searcResultForUsers =
                                _model.simpleSearchResults1.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searcResultForUsers.length,
                              itemBuilder: (context, searcResultForUsersIndex) {
                                final searcResultForUsersItem =
                                    searcResultForUsers[
                                        searcResultForUsersIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Image.network(
                                                    searcResultForUsersItem
                                                        .photoUrl,
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searcResultForUsersItem
                                                          .displayName,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        searcResultForUsersItem
                                                            .bio,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              searcResultForUsersItem
                                                                  .createdTime
                                                                  ?.toString(),
                                                              'Hesap oluşturma zamanı',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var currentAccountRecordReference =
                                                                CurrentAccountRecord
                                                                    .collection
                                                                    .doc();
                                                            await currentAccountRecordReference
                                                                .set({
                                                              ...createCurrentAccountRecordData(
                                                                sideOneType:
                                                                    'Şirket',
                                                                sideOneID:
                                                                    widget
                                                                        .company
                                                                        ?.id,
                                                                sideTwoType:
                                                                    'Şahıs',
                                                                sideTwoID:
                                                                    searcResultForUsersItem
                                                                        .reference
                                                                        .id,
                                                                status: true,
                                                                totalValueForSideOne:
                                                                    0.0,
                                                                totalValueForSideTwo:
                                                                    0.0,
                                                                totalBillCount:
                                                                    0,
                                                                totalUnPaidBillCount:
                                                                    0,
                                                                isAccepted:
                                                                    false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            _model.currentAccountPersonal =
                                                                CurrentAccountRecord
                                                                    .getDocumentFromData({
                                                              ...createCurrentAccountRecordData(
                                                                sideOneType:
                                                                    'Şirket',
                                                                sideOneID:
                                                                    widget
                                                                        .company
                                                                        ?.id,
                                                                sideTwoType:
                                                                    'Şahıs',
                                                                sideTwoID:
                                                                    searcResultForUsersItem
                                                                        .reference
                                                                        .id,
                                                                status: true,
                                                                totalValueForSideOne:
                                                                    0.0,
                                                                totalValueForSideTwo:
                                                                    0.0,
                                                                totalBillCount:
                                                                    0,
                                                                totalUnPaidBillCount:
                                                                    0,
                                                                isAccepted:
                                                                    false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      DateTime
                                                                          .now(),
                                                                },
                                                              ),
                                                            }, currentAccountRecordReference);
                                                            _model.copmanyDetail =
                                                                await CompaniesRecord
                                                                    .getDocumentOnce(
                                                                        widget
                                                                            .company!);

                                                            await NotificationsRecord
                                                                    .createDoc(
                                                                        searcResultForUsersItem
                                                                            .reference)
                                                                .set({
                                                              ...createNotificationsRecordData(
                                                                type: NotificationTypes
                                                                    .currentAccountRequest
                                                                    .name,
                                                                content:
                                                                    'Cari Hesap Daveti',
                                                                relatedDoc: _model
                                                                    .currentAccountPersonal
                                                                    ?.reference
                                                                    .id,
                                                                isRead: false,
                                                                isDelete: false,
                                                                company: widget
                                                                    .company,
                                                                fullDescription:
                                                                    '${_model.copmanyDetail?.name} İsimli Şirket Cari Hesap Açmak istiyor.',
                                                                image: _model
                                                                    .copmanyDetail
                                                                    ?.companyLogo,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });

                                                            await AjandaRecord
                                                                    .createDoc(
                                                                        currentUserReference!)
                                                                .set({
                                                              ...createAjandaRecordData(
                                                                description:
                                                                    'Cari Hesap Oluşturma Talebi Gönderildi',
                                                                type: WorkHistoryTypes
                                                                    .createCurrentAcountForCompany
                                                                    .name,
                                                                company: widget
                                                                    .company,
                                                                currentAccount: _model
                                                                    .currentAccountPersonal
                                                                    ?.reference,
                                                                fullDescription:
                                                                    '${searcResultForUsersItem.displayName} İsimli Kişi ile Cari Hesap Oluşturma Daveti Gönderildi',
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'dateTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Başarıyla Oluşturuldu',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                            context.safePop();

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Seç',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFF0200FF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                            hoverColor: Color(
                                                                0xFFFF0003),
                                                            hoverTextColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      if (_model.isSelectedCompanyForCounter)
                        Builder(
                          builder: (context) {
                            final searcResultForCompany =
                                _model.simpleSearchResults2.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searcResultForCompany.length,
                              itemBuilder:
                                  (context, searcResultForCompanyIndex) {
                                final searcResultForCompanyItem =
                                    searcResultForCompany[
                                        searcResultForCompanyIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Image.network(
                                                    searcResultForCompanyItem
                                                        .companyLogo,
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searcResultForCompanyItem
                                                          .name,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        searcResultForCompanyItem
                                                            .companyBio,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  searcResultForCompanyItem
                                                                      .companyCreationDate),
                                                              'Hesap oluşturma zamanı',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var currentAccountRecordReference =
                                                                CurrentAccountRecord
                                                                    .collection
                                                                    .doc();
                                                            await currentAccountRecordReference
                                                                .set({
                                                              ...createCurrentAccountRecordData(
                                                                sideOneType:
                                                                    'Şirket',
                                                                sideOneID:
                                                                    widget
                                                                        .company
                                                                        ?.id,
                                                                sideTwoType:
                                                                    'Şirket',
                                                                sideTwoID:
                                                                    searcResultForCompanyItem
                                                                        .reference
                                                                        .id,
                                                                status: true,
                                                                totalValueForSideOne:
                                                                    0.0,
                                                                totalValueForSideTwo:
                                                                    0.0,
                                                                totalBillCount:
                                                                    0,
                                                                totalUnPaidBillCount:
                                                                    0,
                                                                isAccepted:
                                                                    false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            _model.currentAccountCompany =
                                                                CurrentAccountRecord
                                                                    .getDocumentFromData({
                                                              ...createCurrentAccountRecordData(
                                                                sideOneType:
                                                                    'Şirket',
                                                                sideOneID:
                                                                    widget
                                                                        .company
                                                                        ?.id,
                                                                sideTwoType:
                                                                    'Şirket',
                                                                sideTwoID:
                                                                    searcResultForCompanyItem
                                                                        .reference
                                                                        .id,
                                                                status: true,
                                                                totalValueForSideOne:
                                                                    0.0,
                                                                totalValueForSideTwo:
                                                                    0.0,
                                                                totalBillCount:
                                                                    0,
                                                                totalUnPaidBillCount:
                                                                    0,
                                                                isAccepted:
                                                                    false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      DateTime
                                                                          .now(),
                                                                },
                                                              ),
                                                            }, currentAccountRecordReference);
                                                            _model.copmanyDetail2 =
                                                                await CompaniesRecord
                                                                    .getDocumentOnce(
                                                                        widget
                                                                            .company!);

                                                            await CompanyNotificationsRecord
                                                                    .createDoc(
                                                                        searcResultForCompanyItem
                                                                            .reference)
                                                                .set({
                                                              ...createCompanyNotificationsRecordData(
                                                                type: NotificationTypes
                                                                    .currentAccountRequest
                                                                    .name,
                                                                content:
                                                                    'Cari Hesap Daveti',
                                                                isRead: false,
                                                                isDelete: false,
                                                                company: widget
                                                                    .company,
                                                                currentAccount: _model
                                                                    .currentAccountCompany
                                                                    ?.reference,
                                                                fullDescription:
                                                                    '${_model.copmanyDetail2?.name} İsimli Şirket Şirketinizle Cari Hesap Oluşturmak istiyor.',
                                                                image: _model
                                                                    .copmanyDetail
                                                                    ?.companyLogo,
                                                                isAccept: false,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'creationTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });

                                                            await AjandaRecord
                                                                    .createDoc(
                                                                        currentUserReference!)
                                                                .set({
                                                              ...createAjandaRecordData(
                                                                description:
                                                                    'Cari Hesap Oluşturma isteği gönderildi',
                                                                type: WorkHistoryTypes
                                                                    .createCurrentAcountForCompany
                                                                    .name,
                                                                company: widget
                                                                    .company,
                                                                currentAccount: _model
                                                                    .currentAccountCompany
                                                                    ?.reference,
                                                                fullDescription:
                                                                    '${searcResultForCompanyItem.name} İsimli Şirket ile Cari HesapOluşturma İsteği Gönderildi',
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'dateTime':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Başarıyla Oluşturuldu',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                            context.safePop();

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Seç',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFF0200FF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                            hoverColor: Color(
                                                                0xFFFF0003),
                                                            hoverTextColor:
                                                                Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
