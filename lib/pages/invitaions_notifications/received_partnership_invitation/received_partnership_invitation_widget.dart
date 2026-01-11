import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'received_partnership_invitation_model.dart';
export 'received_partnership_invitation_model.dart';

class ReceivedPartnershipInvitationWidget extends StatefulWidget {
  const ReceivedPartnershipInvitationWidget({super.key});

  static String routeName = 'receivedPartnershipInvitation';
  static String routePath = '/receivedPartnershipInvitation';

  @override
  State<ReceivedPartnershipInvitationWidget> createState() =>
      _ReceivedPartnershipInvitationWidgetState();
}

class _ReceivedPartnershipInvitationWidgetState
    extends State<ReceivedPartnershipInvitationWidget> {
  late ReceivedPartnershipInvitationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceivedPartnershipInvitationModel());

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
            'Gelen Ortaklık davetiyelerim',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 16.0,
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
                        colors: [Color(0x56160720), Color(0xF4300232)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, -0.34),
                        end: AlignmentDirectional(1.0, 0.34),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        PartnershipInvitationRecord>(
                      pagingController: _model.setListViewController(
                        PartnershipInvitationRecord.collection()
                            .where(
                              'receiver',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'isDelete',
                              isEqualTo: false,
                            )
                            .orderBy('date', descending: true),
                      ),
                      padding: EdgeInsets.zero,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<
                          PartnershipInvitationRecord>(
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
                          final listViewPartnershipInvitationRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF0F1113),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewPartnershipInvitationRecord
                                        .sender!),
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

                                  final rowUsersRecord = snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 4.0, 2.0),
                                                child: Text(
                                                  listViewPartnershipInvitationRecord
                                                          .isCompanyPartnership
                                                      ? 'Şirket Ortaklığı Daveti'
                                                      : 'İşyeri Ortaklığı Daveti',
                                                  style: FlutterFlowTheme.of(
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: Text(
                                                  '${rowUsersRecord.displayName}',
                                                  style: FlutterFlowTheme.of(
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                              if (listViewPartnershipInvitationRecord
                                                  .isCompanyPartnership)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 2.0, 4.0, 0.0),
                                                  child: Text(
                                                    listViewPartnershipInvitationRecord
                                                        .companyName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          color: Colors.white,
                                                          fontSize: 12.0,
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
                                              if (!listViewPartnershipInvitationRecord
                                                  .isCompanyPartnership)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 2.0, 4.0, 0.0),
                                                  child: Text(
                                                    listViewPartnershipInvitationRecord
                                                        .workPlaceName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          color: Colors.white,
                                                          fontSize: 12.0,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 2.0, 4.0, 12.0),
                                                child: Text(
                                                  formatNumber(
                                                    listViewPartnershipInvitationRecord
                                                        .sharePercent,
                                                    formatType:
                                                        FormatType.percent,
                                                  ),
                                                  style: FlutterFlowTheme.of(
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
                                                        color: Colors.white,
                                                        fontSize: 12.0,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (listViewPartnershipInvitationRecord
                                              .isAccept) {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Text(
                                                'Kabul Edildi',
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
                                                          color: Colors.white,
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
                                            );
                                          } else if (listViewPartnershipInvitationRecord
                                              .isReject) {
                                            return Text(
                                              'Reddedildi',
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
                                                        color:
                                                            Color(0xFFFDFEFE),
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
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (listViewPartnershipInvitationRecord
                                                          .isCompanyPartnership) {
                                                        var partnershipsRecordReference =
                                                            PartnershipsRecord
                                                                .createDoc(
                                                                    currentUserReference!);
                                                        await partnershipsRecordReference
                                                            .set({
                                                          ...createPartnershipsRecordData(
                                                            isPartenerCompany:
                                                                true,
                                                            companyName:
                                                                listViewPartnershipInvitationRecord
                                                                    .companyName,
                                                            companyRef:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            userRef:
                                                                currentUserReference,
                                                            userName:
                                                                currentUserDisplayName,
                                                            canViewIncomeExpenses:
                                                                false,
                                                            canManageUnits:
                                                                false,
                                                            canCreateInstructions:
                                                                false,
                                                            canViewInstructions:
                                                                false,
                                                            canManageStock:
                                                                false,
                                                            canViewVehicles:
                                                                false,
                                                            canManageDepartments:
                                                                false,
                                                            canViewForms: false,
                                                            canViewStock: false,
                                                            canManageForms:
                                                                false,
                                                            canCreateTasks:
                                                                false,
                                                            canManageTasks:
                                                                false,
                                                            canViewTasks: false,
                                                            canManageVehicles:
                                                                false,
                                                            canViewEmployeeExpenses:
                                                                false,
                                                            canViewCurrentAccounts:
                                                                false,
                                                            canManageEmployeeExpenses:
                                                                false,
                                                            canManageWorkers:
                                                                false,
                                                            canManageRoles:
                                                                false,
                                                            canManageCurrentAccounts:
                                                                false,
                                                            canManagePendingIncomeExpenses:
                                                                false,
                                                            status: '',
                                                            canAddManuelIncomeExpense:
                                                                false,
                                                            canCalculateCost:
                                                                false,
                                                            canViewWorkers:
                                                                false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'startDate':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                        _model.partnerShip =
                                                            PartnershipsRecord
                                                                .getDocumentFromData({
                                                          ...createPartnershipsRecordData(
                                                            isPartenerCompany:
                                                                true,
                                                            companyName:
                                                                listViewPartnershipInvitationRecord
                                                                    .companyName,
                                                            companyRef:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            userRef:
                                                                currentUserReference,
                                                            userName:
                                                                currentUserDisplayName,
                                                            canViewIncomeExpenses:
                                                                false,
                                                            canManageUnits:
                                                                false,
                                                            canCreateInstructions:
                                                                false,
                                                            canViewInstructions:
                                                                false,
                                                            canManageStock:
                                                                false,
                                                            canViewVehicles:
                                                                false,
                                                            canManageDepartments:
                                                                false,
                                                            canViewForms: false,
                                                            canViewStock: false,
                                                            canManageForms:
                                                                false,
                                                            canCreateTasks:
                                                                false,
                                                            canManageTasks:
                                                                false,
                                                            canViewTasks: false,
                                                            canManageVehicles:
                                                                false,
                                                            canViewEmployeeExpenses:
                                                                false,
                                                            canViewCurrentAccounts:
                                                                false,
                                                            canManageEmployeeExpenses:
                                                                false,
                                                            canManageWorkers:
                                                                false,
                                                            canManageRoles:
                                                                false,
                                                            canManageCurrentAccounts:
                                                                false,
                                                            canManagePendingIncomeExpenses:
                                                                false,
                                                            status: '',
                                                            canAddManuelIncomeExpense:
                                                                false,
                                                            canCalculateCost:
                                                                false,
                                                            canViewWorkers:
                                                                false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'startDate':
                                                                  DateTime
                                                                      .now(),
                                                            },
                                                          ),
                                                        }, partnershipsRecordReference);

                                                        await listViewPartnershipInvitationRecord
                                                            .company!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'partnerships':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .partnerShip
                                                                    ?.reference
                                                              ]),
                                                              'partners':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await NotificationsRecord
                                                                .createDoc(
                                                                    rowUsersRecord
                                                                        .reference)
                                                            .set({
                                                          ...createNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .acceptPartnership
                                                                .name,
                                                            content:
                                                                'Ortaklık Kabul Edildi',
                                                            relatedDoc: _model
                                                                .partnerShip
                                                                ?.reference
                                                                .id,
                                                            isRead: false,
                                                            isDelete: false,
                                                            company:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            fullDescription:
                                                                '${listViewPartnershipInvitationRecord.companyName} İsimli Şirkete ${currentUserDisplayName} İsimli Kişi Ortak Olarak atandı',
                                                            triggeredUser:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });

                                                        await listViewPartnershipInvitationRecord
                                                            .reference
                                                            .update(
                                                                createPartnershipInvitationRecordData(
                                                          isAccept: true,
                                                        ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Başarıyla Ortaklık Kabul Edildi',
                                                              style: TextStyle(
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
                                                      } else {
                                                        var workPlacePartnershipRecordReference =
                                                            WorkPlacePartnershipRecord
                                                                .createDoc(
                                                                    currentUserReference!);
                                                        await workPlacePartnershipRecordReference
                                                            .set({
                                                          ...createWorkPlacePartnershipRecordData(
                                                            canManageUnits:
                                                                false,
                                                            canViewInstructions:
                                                                false,
                                                            canManageStock:
                                                                false,
                                                            canViewVehicles:
                                                                false,
                                                            canManageDepartments:
                                                                false,
                                                            canViewForms: false,
                                                            canViewStock: false,
                                                            canManageForms:
                                                                false,
                                                            canViewTasks: false,
                                                            canManageVehicles:
                                                                false,
                                                            canManageWorkers:
                                                                false,
                                                            canManageRoles:
                                                                false,
                                                            isUser: true,
                                                            workPlaceRef:
                                                                listViewPartnershipInvitationRecord
                                                                    .workPlace,
                                                            canViewIncomeExpense:
                                                                false,
                                                            canViewEmployeeExpense:
                                                                false,
                                                            canManageEmployeeExpense:
                                                                false,
                                                            canCreateTask:
                                                                false,
                                                            canManageTask:
                                                                false,
                                                            canManageInstructions:
                                                                false,
                                                            canManagePendingIncomeExpense:
                                                                false,
                                                            partnerName:
                                                                currentUserDisplayName,
                                                            workPlaceName:
                                                                listViewPartnershipInvitationRecord
                                                                    .workPlaceName,
                                                            canAddManuelExpenseIncome:
                                                                false,
                                                            canViewEmployee:
                                                                false,
                                                            company:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            canCalculateCost:
                                                                false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'startDate':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                        _model.partnerShipWorkPlace =
                                                            WorkPlacePartnershipRecord
                                                                .getDocumentFromData({
                                                          ...createWorkPlacePartnershipRecordData(
                                                            canManageUnits:
                                                                false,
                                                            canViewInstructions:
                                                                false,
                                                            canManageStock:
                                                                false,
                                                            canViewVehicles:
                                                                false,
                                                            canManageDepartments:
                                                                false,
                                                            canViewForms: false,
                                                            canViewStock: false,
                                                            canManageForms:
                                                                false,
                                                            canViewTasks: false,
                                                            canManageVehicles:
                                                                false,
                                                            canManageWorkers:
                                                                false,
                                                            canManageRoles:
                                                                false,
                                                            isUser: true,
                                                            workPlaceRef:
                                                                listViewPartnershipInvitationRecord
                                                                    .workPlace,
                                                            canViewIncomeExpense:
                                                                false,
                                                            canViewEmployeeExpense:
                                                                false,
                                                            canManageEmployeeExpense:
                                                                false,
                                                            canCreateTask:
                                                                false,
                                                            canManageTask:
                                                                false,
                                                            canManageInstructions:
                                                                false,
                                                            canManagePendingIncomeExpense:
                                                                false,
                                                            partnerName:
                                                                currentUserDisplayName,
                                                            workPlaceName:
                                                                listViewPartnershipInvitationRecord
                                                                    .workPlaceName,
                                                            canAddManuelExpenseIncome:
                                                                false,
                                                            canViewEmployee:
                                                                false,
                                                            company:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            canCalculateCost:
                                                                false,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'startDate':
                                                                  DateTime
                                                                      .now(),
                                                            },
                                                          ),
                                                        }, workPlacePartnershipRecordReference);

                                                        await listViewPartnershipInvitationRecord
                                                            .workPlace!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'partnerships':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .partnerShipWorkPlace
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await NotificationsRecord
                                                                .createDoc(
                                                                    rowUsersRecord
                                                                        .reference)
                                                            .set({
                                                          ...createNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .acceptPartnership
                                                                .name,
                                                            content:
                                                                'Ortaklık Kabul Edildi',
                                                            relatedDoc: _model
                                                                .partnerShipWorkPlace
                                                                ?.reference
                                                                .id,
                                                            isRead: false,
                                                            isDelete: false,
                                                            fullDescription:
                                                                '${listViewPartnershipInvitationRecord.workPlaceName} İsimli Şirkete ${currentUserDisplayName} İsimli Kişi Ortak Olarak atandı',
                                                            workplace:
                                                                listViewPartnershipInvitationRecord
                                                                    .workPlace,
                                                            triggeredUser:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });

                                                        await listViewPartnershipInvitationRecord
                                                            .reference
                                                            .update(
                                                                createPartnershipInvitationRecordData(
                                                          isReject: true,
                                                        ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Başarıyla Eklendi',
                                                              style: TextStyle(
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
                                                        context.safePop();
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: 'Kabul et',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 36.0,
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
                                                      color: Color(0xFF0C3BDB),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (listViewPartnershipInvitationRecord
                                                          .isCompanyPartnership) {
                                                        await listViewPartnershipInvitationRecord
                                                            .reference
                                                            .update(
                                                                createPartnershipInvitationRecordData(
                                                          isReject: true,
                                                        ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Reddedildi',
                                                              style: TextStyle(
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

                                                        await NotificationsRecord
                                                                .createDoc(
                                                                    listViewPartnershipInvitationRecord
                                                                        .sender!)
                                                            .set({
                                                          ...createNotificationsRecordData(
                                                            type: NotificationTypes
                                                                .rejectPartnership
                                                                .name,
                                                            content:
                                                                'Davetiye Reddedildi',
                                                            relatedDoc:
                                                                listViewPartnershipInvitationRecord
                                                                    .reference
                                                                    .id,
                                                            isRead: false,
                                                            isDelete: false,
                                                            company:
                                                                listViewPartnershipInvitationRecord
                                                                    .company,
                                                            image:
                                                                currentUserPhoto,
                                                            fullDescription:
                                                                '${currentUserDisplayName} Adlı Kişi Davetiyenizi Reddetti',
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'creationTime':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                        context.safePop();
                                                      }
                                                    },
                                                    text: 'Reddet',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 36.0,
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
                                                      color: Color(0xFFEC0C0F),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        },
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
