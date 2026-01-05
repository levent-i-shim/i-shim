import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_current_account_model.dart';
export 'add_current_account_model.dart';

class AddCurrentAccountWidget extends StatefulWidget {
  const AddCurrentAccountWidget({
    super.key,
    required this.isEdit,
    this.noteFinanceCompany,
  });

  final bool? isEdit;
  final FinancialMonitoringNotesRecord? noteFinanceCompany;

  static String routeName = 'addCurrentAccount';
  static String routePath = '/addCurrentAccount';

  @override
  State<AddCurrentAccountWidget> createState() =>
      _AddCurrentAccountWidgetState();
}

class _AddCurrentAccountWidgetState extends State<AddCurrentAccountWidget> {
  late AddCurrentAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCurrentAccountModel());

    _model.textFieldPersonSupplierTextController ??= TextEditingController();
    _model.textFieldPersonSupplierFocusNode ??= FocusNode();

    _model.textFieldCompanySupplierTextController ??= TextEditingController();
    _model.textFieldCompanySupplierFocusNode ??= FocusNode();

    _model.textFieldPersonCustomerTextController ??= TextEditingController();
    _model.textFieldPersonCustomerFocusNode ??= FocusNode();

    _model.textFieldCompanyCustomerTextController ??= TextEditingController();
    _model.textFieldCompanyCustomerFocusNode ??= FocusNode();

    _model.textFieldContentTextController ??= TextEditingController(
        text: widget.isEdit! ? widget.noteFinanceCompany?.content : '');
    _model.textFieldContentFocusNode ??= FocusNode();

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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFF060020),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                child: Text(
                  'Cari Hesap Oluşturma',
                  textAlign: TextAlign.center,
                  maxLines: 2,
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
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 12.0, 4.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.validate = true;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        safeSetState(() => _model.validate = false);
                        return;
                      }
                      if (_model.validate!) {
                        if (widget.isEdit!) {
                          await widget.noteFinanceCompany!.reference
                              .update(createFinancialMonitoringNotesRecordData(
                            content: _model.textFieldContentTextController.text,
                          ));
                        } else {
                          if (_model.ownerOrWorkerValue == 'ownerOrPartner') {
                            _model.companyRefFromDropDownId =
                                await actions.getCompanyDocRef(
                              _model.companiesDropDownValue!,
                            );
                            _model.workPlaceRefFromDropDownId =
                                await actions.getWorkPlaceDocRef(
                              _model.workPlacesDropDownValue!,
                            );
                            _model.companyNameFromDropDownId =
                                await actions.getCompanyName(
                              _model.companiesDropDownValue!,
                            );
                            _model.workPlaceNameFromDropDownId =
                                await actions.getWorkPlaceName(
                              _model.workPlacesDropDownValue!,
                            );

                            var companiesCurrentsRecordReference1 =
                                CompaniesCurrentsRecord.createDoc(
                                    _model.companyRefFromDropDownId!);
                            await companiesCurrentsRecordReference1
                                .set(createCompaniesCurrentsRecordData(
                              content:
                                  _model.textFieldContentTextController.text,
                              companyRef: _model.companyRefFromDropDownId,
                              workPlaceId: _model.workPlacesDropDownValue,
                              creationTime: getCurrentTimestamp,
                              supplierOrCustomer:
                                  _model.supplierOrCustomerDropDownValue,
                              refCompanyName: _model.companyNameFromDropDownId,
                              creatorUserRef: currentUserReference,
                              workPlaceRef: _model.workPlaceRefFromDropDownId,
                              workPlaceName: _model.workPlaceNameFromDropDownId,
                              refCompanyId: _model.companiesDropDownValue,
                              counterpartyType:
                                  _model.supplierOrCustomerDropDownValue,
                              supplierPersonName: _model
                                  .textFieldPersonSupplierTextController.text,
                              supplierCompanyName: _model
                                  .textFieldCompanySupplierTextController.text,
                              customerPersonName: _model
                                  .textFieldPersonCustomerTextController.text,
                              customerCompanyName: _model
                                  .textFieldCompanyCustomerTextController.text,
                              creatorUserName: currentUserDisplayName,
                            ));
                            _model.addedCurrentAccountOwner =
                                CompaniesCurrentsRecord.getDocumentFromData(
                                    createCompaniesCurrentsRecordData(
                                      content: _model
                                          .textFieldContentTextController.text,
                                      companyRef:
                                          _model.companyRefFromDropDownId,
                                      workPlaceId:
                                          _model.workPlacesDropDownValue,
                                      creationTime: getCurrentTimestamp,
                                      supplierOrCustomer: _model
                                          .supplierOrCustomerDropDownValue,
                                      refCompanyName:
                                          _model.companyNameFromDropDownId,
                                      creatorUserRef: currentUserReference,
                                      workPlaceRef:
                                          _model.workPlaceRefFromDropDownId,
                                      workPlaceName:
                                          _model.workPlaceNameFromDropDownId,
                                      refCompanyId:
                                          _model.companiesDropDownValue,
                                      counterpartyType: _model
                                          .supplierOrCustomerDropDownValue,
                                      supplierPersonName: _model
                                          .textFieldPersonSupplierTextController
                                          .text,
                                      supplierCompanyName: _model
                                          .textFieldCompanySupplierTextController
                                          .text,
                                      customerPersonName: _model
                                          .textFieldPersonCustomerTextController
                                          .text,
                                      customerCompanyName: _model
                                          .textFieldCompanyCustomerTextController
                                          .text,
                                      creatorUserName: currentUserDisplayName,
                                    ),
                                    companiesCurrentsRecordReference1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Cari hesap başarı ile oluşturuldu.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2500),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            await AjandaRecord.createDoc(currentUserReference!)
                                .set({
                              ...createAjandaRecordData(
                                description: 'Cari hesap oluşturuldu.',
                                type: WorkHistoryTypes.createNote.name,
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
                                  'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 1500),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            if (_model.ownerOrWorkerValue == 'worker') {
                              _model.companyRefFromDropDownId9 =
                                  await actions.getCompanyDocRef(
                                _model.authorizingCompaniesDropDownValue!,
                              );
                              _model.workPlaceRefFromDropDownId9 =
                                  await actions.getWorkPlaceDocRef(
                                _model.authorizingWorkPlaceDropDownValue!,
                              );
                              _model.companyNameFromDropDownId9 =
                                  await actions.getCompanyName(
                                _model.authorizingCompaniesDropDownValue!,
                              );
                              _model.workPlaceNameFromDropDownId9 =
                                  await actions.getWorkPlaceName(
                                _model.authorizingWorkPlaceDropDownValue!,
                              );

                              var companiesCurrentsRecordReference2 =
                                  CompaniesCurrentsRecord.createDoc(
                                      _model.companyRefFromDropDownId9!);
                              await companiesCurrentsRecordReference2
                                  .set(createCompaniesCurrentsRecordData(
                                content:
                                    _model.textFieldContentTextController.text,
                                companyRef: _model.companyRefFromDropDownId9,
                                workPlaceId:
                                    _model.workPlaceNameFromDropDownId9,
                                creationTime: getCurrentTimestamp,
                                supplierOrCustomer:
                                    _model.supplierOrCustomerDropDownValue,
                                refCompanyName:
                                    _model.companyNameFromDropDownId9,
                                creatorUserRef: currentUserReference,
                                workPlaceRef:
                                    _model.workPlaceRefFromDropDownId9,
                                workPlaceName:
                                    _model.workPlaceNameFromDropDownId9,
                                refCompanyId:
                                    _model.authorizingCompaniesDropDownValue,
                                counterpartyType:
                                    _model.supplierOrCustomerDropDownValue,
                                supplierPersonName: _model
                                    .textFieldPersonSupplierTextController.text,
                                supplierCompanyName: _model
                                    .textFieldCompanySupplierTextController
                                    .text,
                                customerPersonName: _model
                                    .textFieldPersonCustomerTextController.text,
                                customerCompanyName: _model
                                    .textFieldCompanyCustomerTextController
                                    .text,
                                creatorUserName: currentUserDisplayName,
                              ));
                              _model.addedCurrentAccountWorker =
                                  CompaniesCurrentsRecord.getDocumentFromData(
                                      createCompaniesCurrentsRecordData(
                                        content: _model
                                            .textFieldContentTextController
                                            .text,
                                        companyRef:
                                            _model.companyRefFromDropDownId9,
                                        workPlaceId:
                                            _model.workPlaceNameFromDropDownId9,
                                        creationTime: getCurrentTimestamp,
                                        supplierOrCustomer: _model
                                            .supplierOrCustomerDropDownValue,
                                        refCompanyName:
                                            _model.companyNameFromDropDownId9,
                                        creatorUserRef: currentUserReference,
                                        workPlaceRef:
                                            _model.workPlaceRefFromDropDownId9,
                                        workPlaceName:
                                            _model.workPlaceNameFromDropDownId9,
                                        refCompanyId: _model
                                            .authorizingCompaniesDropDownValue,
                                        counterpartyType: _model
                                            .supplierOrCustomerDropDownValue,
                                        supplierPersonName: _model
                                            .textFieldPersonSupplierTextController
                                            .text,
                                        supplierCompanyName: _model
                                            .textFieldCompanySupplierTextController
                                            .text,
                                        customerPersonName: _model
                                            .textFieldPersonCustomerTextController
                                            .text,
                                        customerCompanyName: _model
                                            .textFieldCompanyCustomerTextController
                                            .text,
                                        creatorUserName: currentUserDisplayName,
                                      ),
                                      companiesCurrentsRecordReference2);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Cari hesap başarı ile oluşturuldu.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2500),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Cari hesap oluşturuldu.',
                                  type: WorkHistoryTypes.createNote.name,
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
                                    'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          }
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Cari hesap oluşturma süreci başarı ile tamamlandı.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 1500),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        context.safePop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Validation Unsuccessfull',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'Kaydet',
                    icon: Icon(
                      Icons.save_as,
                      size: 22.0,
                    ),
                    options: FFButtonOptions(
                      width: 110.0,
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconAlignment: IconAlignment.end,
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF0007FF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF060418), Color(0xFF45050D)],
                stops: [0.2, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 10.0),
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
                          List<CompaniesRecord>
                              ownerOrWorkerCompaniesRecordList = snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.ownerOrWorkerValueController ??=
                                FormFieldController<String>(null),
                            options:
                                List<String>.from(['ownerOrPartner', 'worker']),
                            optionLabels: [
                              'Sahibi veya ortağı olduğun şirket',
                              'Yetkilisi olduğun şirket'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.ownerOrWorkerValue = val),
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
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
                            hintText: 'Şirket türü ?',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          );
                        },
                      ),
                    ),
                    if (_model.ownerOrWorkerValue == 'ownerOrPartner')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
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
                            List<CompaniesRecord>
                                companiesDropDownCompaniesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.companiesDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.companiesDropDownValue ??= 'Other',
                              ),
                              options: List<String>.from(
                                  companiesDropDownCompaniesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels: companiesDropDownCompaniesRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) => safeSetState(
                                  () => _model.companiesDropDownValue = val),
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                              hintText: 'Hangi şirketin ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                            );
                          },
                        ),
                      ),
                    if (_model.ownerOrWorkerValue == 'ownerOrPartner')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<WorkPlacesRecord>>(
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<WorkPlacesRecord>
                                workPlacesDropDownWorkPlacesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.workPlacesDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.workPlacesDropDownValue ??= 'Other',
                              ),
                              options: List<String>.from(
                                  workPlacesDropDownWorkPlacesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  workPlacesDropDownWorkPlacesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) => safeSetState(
                                  () => _model.workPlacesDropDownValue = val),
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                              hintText: 'Hangi işyerin ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                            );
                          },
                        ),
                      ),
                    if (_model.ownerOrWorkerValue == 'worker')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<CompaniesRecord>>(
                          stream: queryCompaniesRecord(
                            queryBuilder: (companiesRecord) =>
                                companiesRecord.where(
                              'expenditureAuthorizedOfficers',
                              arrayContains: currentUserReference,
                            ),
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
                            List<CompaniesRecord>
                                authorizingCompaniesDropDownCompaniesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller: _model
                                      .authorizingCompaniesDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.authorizingCompaniesDropDownValue ??=
                                    'Other',
                              ),
                              options: List<String>.from(
                                  authorizingCompaniesDropDownCompaniesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  authorizingCompaniesDropDownCompaniesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) => safeSetState(() => _model
                                  .authorizingCompaniesDropDownValue = val),
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                              hintText: 'Yetkilisi olduğun şirket ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                            );
                          },
                        ),
                      ),
                    if (_model.ownerOrWorkerValue == 'worker')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<WorkPlacesRecord>>(
                          stream: queryWorkPlacesRecord(
                            queryBuilder: (workPlacesRecord) =>
                                workPlacesRecord.where(
                              'expenditureAuthorizedOfficers',
                              arrayContains: currentUserReference,
                            ),
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
                            List<WorkPlacesRecord>
                                authorizingWorkPlaceDropDownWorkPlacesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller: _model
                                      .authorizingWorkPlaceDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.authorizingWorkPlaceDropDownValue ??=
                                    'Other',
                              ),
                              options: List<String>.from(
                                  authorizingWorkPlaceDropDownWorkPlacesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  authorizingWorkPlaceDropDownWorkPlacesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) => safeSetState(() => _model
                                  .authorizingWorkPlaceDropDownValue = val),
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                              hintText: 'Yetkilisi olduğun işyeri ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                            );
                          },
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model
                                  .supplierOrCustomerDropDownValueController ??=
                              FormFieldController<String>(null),
                          options: List<String>.from(['supplier', 'customer']),
                          optionLabels: ['Tedarikçi', 'Müşteri'],
                          onChanged: (val) => safeSetState(() =>
                              _model.supplierOrCustomerDropDownValue = val),
                          width: double.infinity,
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
                          hintText: 'Tedarikçi mi müşteri mi ?',
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
                      ),
                    ),
                    if (_model.supplierOrCustomerDropDownValue != null &&
                        _model.supplierOrCustomerDropDownValue != '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 10.0, 30.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model
                                    .personOrCompanyDropDownValueController ??=
                                FormFieldController<String>(null),
                            options: List<String>.from(['person', 'company']),
                            optionLabels: ['Kişi', 'Şirket'],
                            onChanged: (val) => safeSetState(() =>
                                _model.personOrCompanyDropDownValue = val),
                            width: double.infinity,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
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
                            hintText: 'Kişi mi şirket mi ?',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      ),
                    if ((_model.supplierOrCustomerDropDownValue ==
                            'supplier') &&
                        (_model.personOrCompanyDropDownValue == 'person'))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.textFieldPersonSupplierTextController,
                          focusNode: _model.textFieldPersonSupplierFocusNode,
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'Tedarikçi kişi adı',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model
                              .textFieldPersonSupplierTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    if ((_model.supplierOrCustomerDropDownValue ==
                            'supplier') &&
                        (_model.personOrCompanyDropDownValue == 'company'))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.textFieldCompanySupplierTextController,
                          focusNode: _model.textFieldCompanySupplierFocusNode,
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'Tedarikçi şirket adı',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model
                              .textFieldCompanySupplierTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    if ((_model.supplierOrCustomerDropDownValue ==
                            'customer') &&
                        (_model.personOrCompanyDropDownValue == 'person'))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.textFieldPersonCustomerTextController,
                          focusNode: _model.textFieldPersonCustomerFocusNode,
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'Müşteri Adı',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model
                              .textFieldPersonCustomerTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    if ((_model.supplierOrCustomerDropDownValue ==
                            'customer') &&
                        (_model.personOrCompanyDropDownValue == 'company'))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: TextFormField(
                          controller:
                              _model.textFieldCompanyCustomerTextController,
                          focusNode: _model.textFieldCompanyCustomerFocusNode,
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintText: 'Müşteri şirket adı',
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model
                              .textFieldCompanyCustomerTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Açıklama',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 8.0, 4.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldContentTextController,
                                          focusNode:
                                              _model.textFieldContentFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
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
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xC4F0F2F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: 15,
                                          minLines: 4,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textFieldContentTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 500.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, -1.0),
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
        ),
      ),
    );
  }
}
