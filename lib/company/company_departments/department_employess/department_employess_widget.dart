import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/choose_new_department/choose_new_department_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'department_employess_model.dart';
export 'department_employess_model.dart';

class DepartmentEmployessWidget extends StatefulWidget {
  const DepartmentEmployessWidget({
    super.key,
    required this.department,
    required this.departmentName,
    required this.company,
    required this.canManageEmployee,
    required this.canViewTask,
    this.canManageTask,
    required this.canSendMoney,
    required this.isOwner,
  });

  final CompanyDepartmentsRecord? department;
  final String? departmentName;
  final DocumentReference? company;
  final bool? canManageEmployee;
  final bool? canViewTask;
  final bool? canManageTask;
  final bool? canSendMoney;
  final bool? isOwner;

  static String routeName = 'DepartmentEmployess';
  static String routePath = '/departmentEmployess';

  @override
  State<DepartmentEmployessWidget> createState() =>
      _DepartmentEmployessWidgetState();
}

class _DepartmentEmployessWidgetState extends State<DepartmentEmployessWidget> {
  late DepartmentEmployessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepartmentEmployessModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompanyWorkersRecord>>(
      stream: queryCompanyWorkersRecord(
        parent: widget.company,
        queryBuilder: (companyWorkersRecord) => companyWorkersRecord
            .where(
              'departmentRefs',
              arrayContains: widget.department?.reference,
            )
            .where(
              'isDelete',
              isEqualTo: false,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
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
          );
        }
        List<CompanyWorkersRecord> departmentEmployessCompanyWorkersRecordList =
            snapshot.data!;

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
                valueOrDefault<String>(
                  widget.departmentName,
                  'Departman Adı',
                ),
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
              actions: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.companyDetailCopy =
                              await CompaniesRecord.getDocumentOnce(
                                  widget.company!);
                          if (_model.companyDetailCopy?.owner ==
                              currentUserReference) {
                            if (widget.department?.name ==
                                'Makine ve Ekipman Yönetimi') {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Bu Departman Araçlardan Yetkili Departmnadır'),
                                            content: Text(
                                                'Bu Departman Yetkilisi Araçlar üzerinde işlem yapabilme yetkisine sahiptir. Bu departmanı silmek istediğinize emin misiniz?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('İptal Et'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Sil'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ChooseNewDepartmentWidget(
                                          company: widget.company!,
                                          department: widget.department!,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } else {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Silmek İstediğinize Emin misiniz?'),
                                            content: Text(
                                                'Bu Departmanı silmek istediğinize Emin misiniz?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('İptal Et'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Sil'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ChooseNewDepartmentWidget(
                                          company: widget.company!,
                                          department: widget.department!,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Sadece Şirket Sahibi Yetkili Atayabilir',
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
                          }

                          safeSetState(() {});
                        },
                        child: FaIcon(
                          FontAwesomeIcons.trash,
                          color: Color(0xFFF70303),
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                    colors: [Color(0xFF060418), Color(0xF4300232)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, -0.34),
                    end: AlignmentDirectional(1.0, 0.34),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Departman Yetkilisi',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??=
                                widget.department?.authorized?.id,
                          ),
                          options: List<String>.from(
                              departmentEmployessCompanyWorkersRecordList
                                  .map((e) => e.userRef?.id)
                                  .withoutNulls
                                  .toList()),
                          optionLabels:
                              departmentEmployessCompanyWorkersRecordList
                                  .map((e) => e.userName)
                                  .toList(),
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue = val),
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
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.companyDetail =
                                await CompaniesRecord.getDocumentOnce(
                                    widget.company!);
                            if (_model.companyDetail?.owner ==
                                currentUserReference) {
                              _model.userRef = await actions.getUserDocRef(
                                _model.dropDownValue!,
                              );
                              _model.userRefOldAuth =
                                  await queryCompanyWorkersRecordOnce(
                                parent: widget.company,
                                queryBuilder: (companyWorkersRecord) =>
                                    companyWorkersRecord
                                        .where(
                                          'userRef',
                                          isEqualTo:
                                              widget.department?.authorized,
                                        )
                                        .where(
                                          'departmentRefs',
                                          arrayContains:
                                              widget.department?.reference,
                                        ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.userRefOldAuth!.hasUserRef()) {
                                await _model.userRefOldAuth!.reference.update({
                                  ...createCompanyWorkersRecordData(
                                    canAcceptTransaction: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'authorizedByDepartment':
                                          FieldValue.delete(),
                                    },
                                  ),
                                });
                                _model.workPlaceWorker =
                                    await queryWorkPlaceWorkerRecordOnce(
                                  parent: widget.department?.workPlace,
                                  queryBuilder: (workPlaceWorkerRecord) =>
                                      workPlaceWorkerRecord.where(
                                    'user',
                                    isEqualTo: _model.userRefOldAuth?.userRef,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await _model.workPlaceWorker!.reference.update({
                                  ...createWorkPlaceWorkerRecordData(
                                    canAcceptTransaction: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'authorizedByDepartment':
                                          FieldValue.delete(),
                                    },
                                  ),
                                });
                              }
                              _model.companyWorker =
                                  await queryCompanyWorkersRecordOnce(
                                parent: widget.company,
                                queryBuilder: (companyWorkersRecord) =>
                                    companyWorkersRecord.where(
                                  'userRef',
                                  isEqualTo: _model.userRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.companyWorker!.reference
                                  .update(createCompanyWorkersRecordData(
                                authorizedByDepartment:
                                    widget.department?.reference,
                                canAcceptTransaction: true,
                              ));

                              await widget.department!.reference
                                  .update(createCompanyDepartmentsRecordData(
                                authorized: _model.userRef,
                              ));
                              _model.workPlaceWorkerNewUser =
                                  await queryWorkPlaceWorkerRecordOnce(
                                parent: widget.department?.workPlace,
                                queryBuilder: (workPlaceWorkerRecord) =>
                                    workPlaceWorkerRecord.where(
                                  'user',
                                  isEqualTo: _model.userRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.workPlaceWorkerNewUser!.reference
                                  .update(createWorkPlaceWorkerRecordData(
                                canAcceptTransaction: true,
                                authorizedByDepartment:
                                    widget.department?.reference,
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Atandı',
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
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sadece Şirket Sahibi Departman Silebilir',
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
                            }

                            safeSetState(() {});
                          },
                          text: 'Yetkiliyi Seç',
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
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        constraints: BoxConstraints(
                          maxWidth: 430.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Çalışanlar',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 430.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final companyDepartments =
                                departmentEmployessCompanyWorkersRecordList
                                    .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: companyDepartments.length,
                              itemBuilder: (context, companyDepartmentsIndex) {
                                final companyDepartmentsItem =
                                    companyDepartments[companyDepartmentsIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          EmployeeDetailFirstPageWidget
                                              .routeName,
                                          queryParameters: {
                                            'userRef': serializeParam(
                                              companyDepartmentsItem.userRef,
                                              ParamType.DocumentReference,
                                            ),
                                            'company': serializeParam(
                                              widget.company,
                                              ParamType.DocumentReference,
                                            ),
                                            'canManageEmployee': serializeParam(
                                              widget.canManageEmployee,
                                              ParamType.bool,
                                            ),
                                            'canViewTask': serializeParam(
                                              widget.canViewTask,
                                              ParamType.bool,
                                            ),
                                            'canManageTask': serializeParam(
                                              widget.canManageTask,
                                              ParamType.bool,
                                            ),
                                            'canSendMoney': serializeParam(
                                              widget.canSendMoney,
                                              ParamType.bool,
                                            ),
                                            'isOwner': serializeParam(
                                              widget.isOwner,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 16.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      companyDepartmentsItem
                                                          .userName,
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
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
