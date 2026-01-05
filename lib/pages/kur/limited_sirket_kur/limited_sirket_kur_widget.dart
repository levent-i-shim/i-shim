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
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'limited_sirket_kur_model.dart';
export 'limited_sirket_kur_model.dart';

class LimitedSirketKurWidget extends StatefulWidget {
  const LimitedSirketKurWidget({
    super.key,
    required this.companyType,
    bool? invitation,
  }) : this.invitation = invitation ?? false;

  final String? companyType;
  final bool invitation;

  static String routeName = 'LimitedSirketKur';
  static String routePath = '/LimitedSirketKur';

  @override
  State<LimitedSirketKurWidget> createState() => _LimitedSirketKurWidgetState();
}

class _LimitedSirketKurWidgetState extends State<LimitedSirketKurWidget> {
  late LimitedSirketKurModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitedSirketKurModel());

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
        backgroundColor: Colors.black,
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
          title: Text(
            'Giriş',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF060418), Color(0xFF45050D)],
                        stops: [0.0, 0.6],
                        begin: AlignmentDirectional(-1.0, -0.34),
                        end: AlignmentDirectional(1.0, 0.34),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
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
                                        hintText: 'Şirket Adı',
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
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: ['Aktif', 'Pasif'],
                                    onChanged: (val) => safeSetState(
                                        () => _model.dropDownValue = val),
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
                                    hintText: 'Select...',
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
                                  padding: EdgeInsets.all(20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.validate = true;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        _model.validate = false;
                                      }
                                      if (_model.dropDownValue == null) {
                                        _model.validate = false;
                                      }
                                      if (_model.validate!) {
                                        var companiesRecordReference =
                                            CompaniesRecord.collection.doc();
                                        await companiesRecordReference
                                            .set(createCompaniesRecordData(
                                          name: _model.textController.text,
                                          owner: currentUserReference,
                                          status: _model.dropDownValue,
                                          type: widget.companyType,
                                          totalMoney: 0.0,
                                          yearlyMoney: 0.0,
                                          isDelete: false,
                                        ));
                                        _model.company =
                                            CompaniesRecord.getDocumentFromData(
                                                createCompaniesRecordData(
                                                  name: _model
                                                      .textController.text,
                                                  owner: currentUserReference,
                                                  status: _model.dropDownValue,
                                                  type: widget.companyType,
                                                  totalMoney: 0.0,
                                                  yearlyMoney: 0.0,
                                                  isDelete: false,
                                                ),
                                                companiesRecordReference);

                                        await AjandaRecord.createDoc(
                                                currentUserReference!)
                                            .set({
                                          ...createAjandaRecordData(
                                            description: 'Şirket Kuruldu',
                                            type: WorkHistoryTypes
                                                .createCompany.name,
                                            company: _model.company?.reference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'dateTime':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.officeName =
                                            await actions.getTwoWords(
                                          _model.textController.text,
                                        );

                                        var workPlacesRecordReference =
                                            WorkPlacesRecord.collection.doc();
                                        await workPlacesRecordReference.set({
                                          ...createWorkPlacesRecordData(
                                            name:
                                                '${_model.officeName} Ana Ofis',
                                            owner: currentUserReference,
                                            type: WorkPlaceTypes.office.name,
                                            companyRef:
                                                _model.company?.reference,
                                            isDelete: false,
                                            yearlyMoney: 0.0,
                                            totalMoney: 0.0,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'workPlaceCreationDate':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.headOffice = WorkPlacesRecord
                                            .getDocumentFromData({
                                          ...createWorkPlacesRecordData(
                                            name:
                                                '${_model.officeName} Ana Ofis',
                                            owner: currentUserReference,
                                            type: WorkPlaceTypes.office.name,
                                            companyRef:
                                                _model.company?.reference,
                                            isDelete: false,
                                            yearlyMoney: 0.0,
                                            totalMoney: 0.0,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'workPlaceCreationDate':
                                                  DateTime.now(),
                                            },
                                          ),
                                        }, workPlacesRecordReference);

                                        var companyWorkersRecordReference =
                                            CompanyWorkersRecord.createDoc(
                                                _model.company!.reference);
                                        await companyWorkersRecordReference
                                            .set(createCompanyWorkersRecordData(
                                          userRef: currentUserReference,
                                          userName: currentUserDisplayName,
                                          departmenName: ' ',
                                          roleName: ' ',
                                          unitName: ' ',
                                          workPlace:
                                              _model.headOffice?.reference,
                                          isDelete: false,
                                          canAcceptTransaction: true,
                                          isWorker: false,
                                        ));
                                        _model.companyWorker = CompanyWorkersRecord
                                            .getDocumentFromData(
                                                createCompanyWorkersRecordData(
                                                  userRef: currentUserReference,
                                                  userName:
                                                      currentUserDisplayName,
                                                  departmenName: ' ',
                                                  roleName: ' ',
                                                  unitName: ' ',
                                                  workPlace: _model
                                                      .headOffice?.reference,
                                                  isDelete: false,
                                                  canAcceptTransaction: true,
                                                  isWorker: false,
                                                ),
                                                companyWorkersRecordReference);

                                        var workPlaceWorkerRecordReference =
                                            WorkPlaceWorkerRecord.createDoc(
                                                _model.headOffice!.reference);
                                        await workPlaceWorkerRecordReference
                                            .set(
                                                createWorkPlaceWorkerRecordData(
                                          userName: currentUserDisplayName,
                                          roleName: ' ',
                                          unitName: ' ',
                                          isDelete: false,
                                          departmentName: '',
                                          user: currentUserReference,
                                          companyWorkerRef:
                                              _model.companyWorker?.reference,
                                          canAcceptTransaction: false,
                                          isWorker: false,
                                        ));
                                        _model.workPlaceWorker =
                                            WorkPlaceWorkerRecord.getDocumentFromData(
                                                createWorkPlaceWorkerRecordData(
                                                  userName:
                                                      currentUserDisplayName,
                                                  roleName: ' ',
                                                  unitName: ' ',
                                                  isDelete: false,
                                                  departmentName: '',
                                                  user: currentUserReference,
                                                  companyWorkerRef: _model
                                                      .companyWorker?.reference,
                                                  canAcceptTransaction: false,
                                                  isWorker: false,
                                                ),
                                                workPlaceWorkerRecordReference);

                                        await _model.company!.reference
                                            .update(createCompaniesRecordData(
                                          headOffice:
                                              _model.headOffice?.reference,
                                        ));
                                        await actions
                                            .createDefaultDepartmentsUnitsAndRolesForOffice(
                                          _model.company!.reference,
                                          _model.headOffice!.reference,
                                          currentUserReference!,
                                        );
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Varsayılan Organizasyon Yapısı Kuruluyor'),
                                              content: Text(
                                                  'Gerekli Departman, Birim ve rolleri sizin için oluşturuyoruz. Dilerseniz daha sonra bunları silebilirsiniz. '),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Tamam'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Şirket Başarı ile oluşturuldu',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2150),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        if (widget.invitation) {
                                          context.safePop();
                                          context.safePop();
                                        } else {
                                          context
                                              .goNamed(ProfileWidget.routeName);
                                        }

                                        await WorkHistoryRecord.createDoc(
                                                currentUserReference!)
                                            .set({
                                          ...createWorkHistoryRecordData(
                                            role: 'CEO',
                                            company: _model.company?.reference,
                                            workPlace:
                                                _model.headOffice?.reference,
                                            unit: 'Üst Yönetim',
                                            department: 'Yönetim',
                                            reportCount: 0,
                                            instructionCount: 0,
                                            receivedTaskCount: 0,
                                            assignedTaskCount: 0,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'startDate':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Şirket Oluşturulamadı',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2750),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Şirketi Kur',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF0200FF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                      borderSide: BorderSide(
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                      hoverColor: Color(0xFF3FFF00),
                                      hoverTextColor: Colors.black,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
