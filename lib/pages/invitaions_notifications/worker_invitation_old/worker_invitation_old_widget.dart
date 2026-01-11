import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'worker_invitation_old_model.dart';
export 'worker_invitation_old_model.dart';

class WorkerInvitationOldWidget extends StatefulWidget {
  const WorkerInvitationOldWidget({super.key});

  static String routeName = 'workerInvitationOld';
  static String routePath = '/workerInvitationOld';

  @override
  State<WorkerInvitationOldWidget> createState() =>
      _WorkerInvitationOldWidgetState();
}

class _WorkerInvitationOldWidgetState extends State<WorkerInvitationOldWidget> {
  late WorkerInvitationOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkerInvitationOldModel());

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
            'Çalışan davet et...',
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 280.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.search,
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
                                        hintText: 'Kullanıcı No Girin...',
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
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          kullaniciSecUsersRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .kullaniciSecValueController ??=
                                            FormFieldController<String>(
                                          _model.kullaniciSecValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            kullaniciSecUsersRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            kullaniciSecUsersRecordList
                                                .map((e) => e.displayName)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.kullaniciSecValue = val);
                                          _model.userRef =
                                              await actions.getUserDocRef(
                                            _model.kullaniciSecValue!,
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
                                        height: 40.0,
                                        searchHintTextStyle: FlutterFlowTheme
                                                .of(context)
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
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
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
                                        hintText: 'Kullanıcı Seç...',
                                        searchHintText: 'Search...',
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
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<CompaniesRecord>>(
                                    stream: queryCompaniesRecord(
                                      queryBuilder: (companiesRecord) =>
                                          companiesRecord.where(
                                        'owner',
                                        isEqualTo: currentUserReference,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<CompaniesRecord>
                                          sirketSecCompaniesRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.sirketSecValueController ??=
                                                FormFieldController<String>(
                                          _model.sirketSecValue ??=
                                              valueOrDefault<String>(
                                            sirketSecCompaniesRecordList
                                                .firstOrNull?.name,
                                            'Şirket Seç',
                                          ),
                                        ),
                                        options: List<String>.from(
                                            sirketSecCompaniesRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            sirketSecCompaniesRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.sirketSecValue = val);
                                          _model.companyRef =
                                              await actions.getCompanyDocRef(
                                            _model.sirketSecValue!,
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
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
                                        hintText: 'Şirket seç...',
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
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<List<WorkPlacesRecord>>(
                                    stream: queryWorkPlacesRecord(
                                      queryBuilder: (workPlacesRecord) =>
                                          workPlacesRecord.where(
                                        'owner',
                                        isEqualTo: currentUserReference,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<WorkPlacesRecord>
                                          isyeriSecWorkPlacesRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.isyeriSecValueController ??=
                                                FormFieldController<String>(
                                          _model.isyeriSecValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            isyeriSecWorkPlacesRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            isyeriSecWorkPlacesRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.isyeriSecValue = val);
                                          _model.workPlaceRef =
                                              await actions.getWorkPlaceDocRef(
                                            _model.isyeriSecValue!,
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
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
                                        hintText: 'İşyeri seç...',
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
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      StreamBuilder<List<CompanyUnitsRecord>>(
                                    stream: queryCompanyUnitsRecord(
                                      parent: _model.companyRef,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<CompanyUnitsRecord>
                                          birimDropDownCompanyUnitsRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .birimDropDownValueController ??=
                                            FormFieldController<String>(
                                          _model.birimDropDownValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            birimDropDownCompanyUnitsRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            birimDropDownCompanyUnitsRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.birimDropDownValue = val);
                                          _model.unitRef =
                                              await actions.getUnitDocRef(
                                            _model.birimDropDownValue!,
                                            _model.companyRef!.id,
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
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
                                        hintText: 'Birim seç...',
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
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: StreamBuilder<
                                      List<CompanyDepartmentsRecord>>(
                                    stream: queryCompanyDepartmentsRecord(
                                      parent: _model.companyRef,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<CompanyDepartmentsRecord>
                                          departmanDropDownCompanyDepartmentsRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .departmanDropDownValueController ??=
                                            FormFieldController<String>(
                                          _model.departmanDropDownValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            departmanDropDownCompanyDepartmentsRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            departmanDropDownCompanyDepartmentsRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() => _model
                                              .departmanDropDownValue = val);
                                          _model.departmentRef =
                                              await actions.getDepartmentDocRef(
                                            _model.departmanDropDownValue!,
                                            '',
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
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
                                        hintText: 'Departman seç...',
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
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      StreamBuilder<List<CompanyRolesRecord>>(
                                    stream: queryCompanyRolesRecord(
                                      parent: _model.companyRef,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<CompanyRolesRecord>
                                          rolDropDownCompanyRolesRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .rolDropDownValueController ??=
                                            FormFieldController<String>(
                                          _model.rolDropDownValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            rolDropDownCompanyRolesRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            rolDropDownCompanyRolesRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.rolDropDownValue = val);
                                          _model.roleREf =
                                              await actions.getRoleDocRef(
                                            _model.rolDropDownValue!,
                                            _model.companyRef!.id,
                                          );

                                          safeSetState(() {});
                                        },
                                        width: 280.0,
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
                                        hintText: 'Rol seç...',
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
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.gorevSecValueController1 ??=
                                            FormFieldController<String>(null),
                                    options: ['Option 1'],
                                    onChanged: (val) => safeSetState(
                                        () => _model.gorevSecValue1 = val),
                                    width: 280.0,
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
                                    hintText:
                                        'Kime raporlama yapacağını seç...',
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
                                  padding: EdgeInsets.all(8.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.gorevSecValueController2 ??=
                                            FormFieldController<String>(null),
                                    options: ['Option 1', 'Option 2', ''],
                                    onChanged: (val) => safeSetState(
                                        () => _model.gorevSecValue2 = val),
                                    width: 280.0,
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
                                    hintText: 'Neleri raporlayacak ?',
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.validateForm = true;
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            safeSetState(() =>
                                                _model.validateForm = false);
                                            return;
                                          }
                                          if (_model.kullaniciSecValue ==
                                              null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.sirketSecValue == null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.isyeriSecValue == null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.birimDropDownValue ==
                                              null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.departmanDropDownValue ==
                                              null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.rolDropDownValue == null) {
                                            _model.validateForm = false;
                                            safeSetState(() {});
                                            return;
                                          }
                                          if (_model.validateForm!) {
                                            _model.isEqual =
                                                await actions.isEqualRef(
                                              _model.kullaniciSecValue!,
                                              currentUserReference!,
                                            );
                                            if (_model.isEqual!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Kendinize davetiye gönderemezsiniz',
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

                                              var invitationsRecordReference1 =
                                                  InvitationsRecord.createDoc(
                                                      _model.userRef!);
                                              await invitationsRecordReference1
                                                  .set({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isAccept: false,
                                                  isReject: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              _model.docRef2 = InvitationsRecord
                                                  .getDocumentFromData({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isAccept: false,
                                                  isReject: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': DateTime.now(),
                                                  },
                                                ),
                                              }, invitationsRecordReference1);

                                              await NotificationsRecord
                                                      .createDoc(
                                                          _model.userRef!)
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  type: 'invitations',
                                                  content: 'İş Yeri Daveti',
                                                  relatedDoc: _model
                                                      .docRef2?.reference.id,
                                                  isRead: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'creationTime': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              await InvitationsRecord.createDoc(
                                                      currentUserReference!)
                                                  .set({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              var invitationsRecordReference3 =
                                                  InvitationsRecord.createDoc(
                                                      _model.userRef!);
                                              await invitationsRecordReference3
                                                  .set({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isAccept: false,
                                                  isReject: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              _model.docRef = InvitationsRecord
                                                  .getDocumentFromData({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isAccept: false,
                                                  isReject: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': DateTime.now(),
                                                  },
                                                ),
                                              }, invitationsRecordReference3);

                                              await NotificationsRecord
                                                      .createDoc(
                                                          _model.userRef!)
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  type: 'invitations',
                                                  content: 'İş Yeri Daveti',
                                                  relatedDoc: _model
                                                      .docRef?.reference.id,
                                                  isRead: false,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'creationTime': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              await InvitationsRecord.createDoc(
                                                      currentUserReference!)
                                                  .set({
                                                ...createInvitationsRecordData(
                                                  company: _model.companyRef,
                                                  workPlace:
                                                      _model.workPlaceRef,
                                                  sender: currentUserReference,
                                                  receiver: _model.userRef,
                                                  unit: _model.unitRef,
                                                  department:
                                                      _model.departmentRef,
                                                  role: _model.roleREf,
                                                  isDelete: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Davetiye Gönderildi',
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
                                              context.safePop();
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Davetiye Gönderilemedi.',
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
                                        text: 'Devam',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF0200FF),
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
                                          borderSide: BorderSide(
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          hoverColor: Color(0xFFFF0003),
                                          hoverTextColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
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
