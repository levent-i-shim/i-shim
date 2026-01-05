import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'invitation_detail_model.dart';
export 'invitation_detail_model.dart';

class InvitationDetailWidget extends StatefulWidget {
  const InvitationDetailWidget({
    super.key,
    required this.invitations,
  });

  final InvitationsRecord? invitations;

  static String routeName = 'InvitationDetail';
  static String routePath = '/invitationDetail';

  @override
  State<InvitationDetailWidget> createState() => _InvitationDetailWidgetState();
}

class _InvitationDetailWidgetState extends State<InvitationDetailWidget> {
  late InvitationDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitationDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.departmentName = await actions.getDepartmentName(
        widget.invitations!.company!.id,
        widget.invitations!.department!.id,
      );
      _model.unitName = await actions.getUnitName(
        widget.invitations!.company!.id,
        widget.invitations!.unit!.id,
      );
      _model.roleName = await actions.getRoleName(
        widget.invitations!.company!.id,
        widget.invitations!.role!.id,
      );
      _model.unitNameVariable = _model.unitName!;
      _model.departmentNameVariable = _model.departmentName!;
      _model.rolNameVariable = _model.roleName!;
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
          title: Text(
            'Gelen Davetiye Detayı',
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
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: StreamBuilder<UsersRecord>(
                    stream:
                        UsersRecord.getDocument(widget.invitations!.sender!),
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

                      final rowUsersRecord = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gönderen:',
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
                          Text(
                            rowUsersRecord.displayName,
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
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: StreamBuilder<CompaniesRecord>(
                    stream: CompaniesRecord.getDocument(
                        widget.invitations!.company!),
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

                      final rowCompaniesRecord = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Şirket Adı:',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              rowCompaniesRecord.name,
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
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Birim Adı:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        _model.unitNameVariable,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Departman Adı:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        _model.departmentNameVariable,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rol:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                        _model.rolNameVariable,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Çalışma Yeri:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          widget.invitations?.workPlaceName,
                          'Çalışma Yeri',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Maaş:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.invitations?.salary.toString(),
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mesai Ücreti',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.invitations?.shiftSalary.toString(),
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (widget.invitations?.isAccept ?? false) {
                        return Text(
                          'Kabul Edildi',
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
                        );
                      } else if (widget.invitations?.isReject ?? false) {
                        return Text(
                          'Reddedildi',
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
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var companyWorkersRecordReference =
                                          CompanyWorkersRecord.createDoc(
                                              widget.invitations!.company!);
                                      await companyWorkersRecordReference.set({
                                        ...createCompanyWorkersRecordData(
                                          userRef: currentUserReference,
                                          userName: currentUserDisplayName,
                                          expanditureAuthority: false,
                                          formCreationAuthority: false,
                                          roleCreationAuthority: false,
                                          unitCreationAuthority: false,
                                          departmentCreationAuthority: false,
                                          allowence: 0.0,
                                          stockAuthority: false,
                                          departmenName:
                                              _model.departmentNameVariable,
                                          roleName: _model.rolNameVariable,
                                          unitName: _model.unitNameVariable,
                                          canAcceptTransaction: false,
                                          currentAccountAuthority: false,
                                          isDelete: false,
                                          canSendMoney: false,
                                          canManageReports: false,
                                          canCreateTask: false,
                                          canManageUsers: false,
                                          vehicleCreationAuthority: false,
                                          canViewIncomeExpense: false,
                                          workPlace:
                                              widget.invitations?.workPlace,
                                          isWorker: true,
                                          canSendInstruction: false,
                                          canAddManuelIncomeExpense: false,
                                          canViewEmployee: false,
                                          salary: widget.invitations?.salary,
                                          workingHour:
                                              widget.invitations?.workingHour,
                                          shiftSalary:
                                              widget.invitations?.shiftSalary,
                                          canViewNotes: false,
                                          canAddCostAccount: false,
                                          canManageNotes: false,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'departmentRefs': [
                                              widget.invitations?.department
                                            ],
                                            'unitRefs': [
                                              widget.invitations?.unit
                                            ],
                                            'roleRefs': [
                                              widget.invitations?.role
                                            ],
                                            'updatedAt':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.copmanyWorkerRef =
                                          CompanyWorkersRecord
                                              .getDocumentFromData({
                                        ...createCompanyWorkersRecordData(
                                          userRef: currentUserReference,
                                          userName: currentUserDisplayName,
                                          expanditureAuthority: false,
                                          formCreationAuthority: false,
                                          roleCreationAuthority: false,
                                          unitCreationAuthority: false,
                                          departmentCreationAuthority: false,
                                          allowence: 0.0,
                                          stockAuthority: false,
                                          departmenName:
                                              _model.departmentNameVariable,
                                          roleName: _model.rolNameVariable,
                                          unitName: _model.unitNameVariable,
                                          canAcceptTransaction: false,
                                          currentAccountAuthority: false,
                                          isDelete: false,
                                          canSendMoney: false,
                                          canManageReports: false,
                                          canCreateTask: false,
                                          canManageUsers: false,
                                          vehicleCreationAuthority: false,
                                          canViewIncomeExpense: false,
                                          workPlace:
                                              widget.invitations?.workPlace,
                                          isWorker: true,
                                          canSendInstruction: false,
                                          canAddManuelIncomeExpense: false,
                                          canViewEmployee: false,
                                          salary: widget.invitations?.salary,
                                          workingHour:
                                              widget.invitations?.workingHour,
                                          shiftSalary:
                                              widget.invitations?.shiftSalary,
                                          canViewNotes: false,
                                          canAddCostAccount: false,
                                          canManageNotes: false,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'departmentRefs': [
                                              widget.invitations?.department
                                            ],
                                            'unitRefs': [
                                              widget.invitations?.unit
                                            ],
                                            'roleRefs': [
                                              widget.invitations?.role
                                            ],
                                            'updatedAt': DateTime.now(),
                                          },
                                        ),
                                      }, companyWorkersRecordReference);

                                      await widget.invitations!.reference
                                          .update(createInvitationsRecordData(
                                        isAccept: true,
                                      ));

                                      await AjandaRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createAjandaRecordData(
                                          description: 'İşe Başlandı',
                                          type: WorkHistoryTypes.startJob.name,
                                          invitation:
                                              widget.invitations?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'dateTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });

                                      await WorkPlaceWorkerRecord.createDoc(
                                              widget.invitations!.workPlace!)
                                          .set(createWorkPlaceWorkerRecordData(
                                        userName: currentUserDisplayName,
                                        isDelete: false,
                                        user: currentUserReference,
                                        companyWorkerRef:
                                            _model.copmanyWorkerRef?.reference,
                                        canAcceptTransaction: false,
                                        departmentName: _model.departmentName,
                                        unitName: _model.unitName,
                                        roleName: _model.roleName,
                                        isWorker: true,
                                        salary: widget.invitations?.salary,
                                      ));

                                      await MyWorkedWorkPlaceRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createMyWorkedWorkPlaceRecordData(
                                          company: widget.invitations?.company,
                                          isWorking: true,
                                          isDelete: false,
                                          copmanyName:
                                              widget.invitations?.companyName,
                                          salary: widget.invitations?.salary,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date':
                                                FieldValue.serverTimestamp(),
                                            'workPlaceIds': [
                                              widget.invitations?.workPlace
                                            ],
                                          },
                                        ),
                                      });

                                      await NotificationsRecord.createDoc(
                                              widget.invitations!.sender!)
                                          .set({
                                        ...createNotificationsRecordData(
                                          type: NotificationTypes
                                              .acceptInvitation.name,
                                          content: 'Davetiye Kabul Edildi',
                                          relatedDoc:
                                              widget.invitations?.reference.id,
                                          isRead: false,
                                          isDelete: false,
                                          company: widget.invitations?.company,
                                          workplace:
                                              widget.invitations?.workPlace,
                                          image: currentUserPhoto,
                                          fullDescription:
                                              '${currentUserDisplayName} Adlı Kişi Davetiyenizi Kabul Etti ${widget.invitations?.companyName} İsimli Şirkette ${widget.invitations?.workPlaceName} isimli İş Yerinde Çalışmaya Başladı.',
                                          isDuty: false,
                                          triggeredUser: currentUserReference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Kabul Edildi',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
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

                                      await WorkHistoryRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createWorkHistoryRecordData(
                                          role: _model.rolNameVariable,
                                          company: widget.invitations?.company,
                                          workPlace:
                                              widget.invitations?.workPlace,
                                          unit: _model.unitNameVariable,
                                          department:
                                              _model.departmentNameVariable,
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
                                      context.safePop();

                                      safeSetState(() {});
                                    },
                                    text: 'Kabul et',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF0C3BDB),
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await widget.invitations!.reference
                                          .update(createInvitationsRecordData(
                                        isReject: true,
                                      ));

                                      await NotificationsRecord.createDoc(
                                              widget.invitations!.sender!)
                                          .set({
                                        ...createNotificationsRecordData(
                                          type: NotificationTypes
                                              .rejectInvitation.name,
                                          content: 'Davetiye Reddedildi',
                                          relatedDoc:
                                              widget.invitations?.reference.id,
                                          isRead: false,
                                          isDelete: false,
                                          company: widget.invitations?.company,
                                          workplace:
                                              widget.invitations?.workPlace,
                                          image: currentUserPhoto,
                                          fullDescription:
                                              '${currentUserDisplayName} Adlı Kişi Davetiyenizi Reddedildi',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Reddildi',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                    },
                                    text: 'Reddet',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFEC0C0F),
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
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
