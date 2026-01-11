import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'company_confirmations_create_confirmation_model.dart';
export 'company_confirmations_create_confirmation_model.dart';

class CompanyConfirmationsCreateConfirmationWidget extends StatefulWidget {
  const CompanyConfirmationsCreateConfirmationWidget({
    super.key,
    this.company,
  });

  final DocumentReference? company;

  static String routeName = 'CompanyConfirmationsCreateConfirmation';
  static String routePath = '/companyConfirmationsCreateConfirmation';

  @override
  State<CompanyConfirmationsCreateConfirmationWidget> createState() =>
      _CompanyConfirmationsCreateConfirmationWidgetState();
}

class _CompanyConfirmationsCreateConfirmationWidgetState
    extends State<CompanyConfirmationsCreateConfirmationWidget> {
  late CompanyConfirmationsCreateConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => CompanyConfirmationsCreateConfirmationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.users = await queryCompanyWorkersRecordOnce(
        parent: widget!.company,
        queryBuilder: (companyWorkersRecord) => companyWorkersRecord.where(
          'isDelete',
          isEqualTo: false,
        ),
      );
      for (int loop1Index = 0;
          loop1Index < _model.users!.length;
          loop1Index++) {
        final currentLoop1Item = _model.users![loop1Index];
        _model.addToUsersForDropdown(UserDetailDataStruct(
          id: _model.users?.elementAtOrNull(loop1Index)?.userRef,
          name: _model.users?.elementAtOrNull(loop1Index)?.userName,
          roleName: _model.users?.elementAtOrNull(loop1Index)?.roleName,
          unitName: _model.users?.elementAtOrNull(loop1Index)?.unitName,
          departmentName:
              _model.users?.elementAtOrNull(loop1Index)?.departmenName,
          companyRef: currentLoop1Item.parentReference,
        ));
      }
      _model.companyDetail =
          await CompaniesRecord.getDocumentOnce(widget!.company!);
      _model.owner =
          await UsersRecord.getDocumentOnce(_model.companyDetail!.owner!);
      _model.addToUsersForDropdown(UserDetailDataStruct(
        id: _model.owner?.reference,
        name: _model.owner?.displayName,
        roleName: 'Şirket Sahibi',
      ));
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
            'Konuşma Başlat',
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
          child: Builder(
            builder: (context) {
              final user = _model.usersForDropdown.toList();

              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: user.length,
                itemBuilder: (context, userIndex) {
                  final userItem = user[userIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          bottomLeft: Radius.circular(28.0),
                          bottomRight: Radius.circular(28.0),
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userItem.name,
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
                                  ),
                                  Text(
                                    userItem.roleName,
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
                                  ),
                                  Text(
                                    userItem.unitName,
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
                                  ),
                                  Text(
                                    userItem.departmentName,
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
                                  ),
                                ],
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.receiverUserRefCopy =
                                      await actions.getUserDocRef(
                                    userItem.id!.id,
                                  );
                                  _shouldSetState = true;
                                  if (_model.receiverUserRefCopy ==
                                      currentUserReference) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Kendinize mesaj gönderemezsiniz',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    _model.receiverUserCopy =
                                        await UsersRecord.getDocumentOnce(
                                            _model.receiverUserRefCopy!);
                                    _shouldSetState = true;
                                    if (_model.companyDetail?.owner ==
                                        currentUserReference) {
                                      _model.confirmation =
                                          await actions.getOrCreateMessage(
                                        currentUserReference!.id,
                                        _model.receiverUserCopy!.reference.id,
                                        currentUserDisplayName,
                                        _model.receiverUserCopy!.displayName,
                                        'company',
                                        true,
                                      );
                                      _shouldSetState = true;
                                      _model.conversationName =
                                          await actions.getConversationName(
                                        _model.confirmation!.reference,
                                      );
                                      _shouldSetState = true;

                                      await AllConfirmationsRecord.createDoc(
                                              currentUserReference!)
                                          .set(createAllConfirmationsRecordData(
                                        isAccept: true,
                                        receiverName: _model
                                            .receiverUserCopy?.displayName,
                                        createdRef: currentUserReference,
                                        confirmationImage:
                                            _model.companyDetail?.companyLogo,
                                        message: _model.confirmation?.reference,
                                        messageType: 'company',
                                      ));

                                      await AllConfirmationsRecord.createDoc(
                                              _model.receiverUserRefCopy!)
                                          .set(createAllConfirmationsRecordData(
                                        isAccept: true,
                                        receiverName: currentUserDisplayName,
                                        createdRef: currentUserReference,
                                        confirmationImage:
                                            _model.companyDetail?.companyLogo,
                                        message: _model.confirmation?.reference,
                                        messageType: 'company',
                                      ));

                                      await NotificationsRecord.createDoc(
                                              _model.receiverUserRefCopy!)
                                          .set({
                                        ...createNotificationsRecordData(
                                          type: NotificationTypes
                                              .confirmationCompany.name,
                                          content:
                                              'Şirket İçi Mesajlaşma Açıldı',
                                          relatedDoc:
                                              _model.confirmation?.reference.id,
                                          isRead: false,
                                          isDelete: false,
                                          company: widget!.company,
                                          fullDescription:
                                              '${_model.companyDetail?.name} isimli şirketteki${_model.receiverUserCopy?.displayName} isimli kişi Mesajlaşma Başlattı',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.coversationDetailSql =
                                          await SQLiteManager.instance
                                              .getConversationWithLastMessage(
                                        type: 'workplace',
                                        conversationName:
                                            _model.conversationName!,
                                      );
                                      _shouldSetState = true;
                                      if (_model.confirmation!.isUser1Blocked ||
                                          _model.confirmation!.isUser2Blocked) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
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
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      context.pushNamed(
                                        MessageNewPageCopyWidget.routeName,
                                        queryParameters: {
                                          'message': serializeParam(
                                            _model.confirmation,
                                            ParamType.Document,
                                          ),
                                          'type': serializeParam(
                                            'company',
                                            ParamType.String,
                                          ),
                                          'conversationId': serializeParam(
                                            _model.coversationDetailSql
                                                ?.lastOrNull?.id,
                                            ParamType.int,
                                          ),
                                          'receiverUser': serializeParam(
                                            _model.receiverUserCopy,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'message': _model.confirmation,
                                          'receiverUser':
                                              _model.receiverUserCopy,
                                        },
                                      );
                                    } else {
                                      _model.confirmationCopy =
                                          await actions.getOrCreateMessage(
                                        currentUserReference!.id,
                                        _model.receiverUserCopy!.reference.id,
                                        currentUserDisplayName,
                                        _model.receiverUserCopy!.displayName,
                                        'company',
                                        false,
                                      );
                                      _shouldSetState = true;
                                      _model.conversationNameCopy =
                                          await actions.getConversationName(
                                        _model.confirmationCopy!.reference,
                                      );
                                      _shouldSetState = true;
                                      if (_model
                                          .confirmationCopy!.isAcceptCompany) {
                                        _model.coversationDetailSqlCopy =
                                            await SQLiteManager.instance
                                                .getConversationWithLastMessage(
                                          type: 'workplace',
                                          conversationName:
                                              _model.conversationNameCopy!,
                                        );
                                        _shouldSetState = true;
                                        if (_model.confirmationCopy!
                                                .isUser1Blocked ||
                                            _model.confirmationCopy!
                                                .isUser2Blocked) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
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
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        context.pushNamed(
                                          MessageNewPageCopyWidget.routeName,
                                          queryParameters: {
                                            'message': serializeParam(
                                              _model.confirmationCopy,
                                              ParamType.Document,
                                            ),
                                            'type': serializeParam(
                                              'company',
                                              ParamType.String,
                                            ),
                                            'conversationId': serializeParam(
                                              _model.coversationDetailSqlCopy
                                                  ?.lastOrNull?.id,
                                              ParamType.int,
                                            ),
                                            'receiverUser': serializeParam(
                                              _model.receiverUserCopy,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'message': _model.confirmationCopy,
                                            'receiverUser':
                                                _model.receiverUserCopy,
                                          },
                                        );
                                      } else {
                                        context.safePop();

                                        await AllConfirmationsRecord.createDoc(
                                                currentUserReference!)
                                            .set(
                                                createAllConfirmationsRecordData(
                                          isAccept: false,
                                          receiverName: _model
                                              .receiverUserCopy?.displayName,
                                          createdRef: currentUserReference,
                                          confirmationImage:
                                              _model.companyDetail?.companyLogo,
                                          message: _model
                                              .confirmationCopy?.reference,
                                          messageType: 'company',
                                        ));

                                        await AllConfirmationsRecord.createDoc(
                                                _model.receiverUserRefCopy!)
                                            .set(
                                                createAllConfirmationsRecordData(
                                          isAccept: false,
                                          receiverName: currentUserDisplayName,
                                          createdRef: currentUserReference,
                                          confirmationImage:
                                              _model.companyDetail?.companyLogo,
                                          message: _model
                                              .confirmationCopy?.reference,
                                          messageType: 'company',
                                        ));

                                        await NotificationsRecord.createDoc(
                                                _model.receiverUserRefCopy!)
                                            .set({
                                          ...createNotificationsRecordData(
                                            type: NotificationTypes
                                                .confirmationCompanyRequest
                                                .name,
                                            content:
                                                'Şirket İçi Mesajlaşma Talebi',
                                            relatedDoc: _model
                                                .confirmationCopy?.reference.id,
                                            isRead: false,
                                            isDelete: false,
                                            fullDescription:
                                                '${_model.companyDetail?.name} isimli şirketteki${_model.receiverUserCopy?.displayName} isimli kişi size şirket içi mesajlaşma isteği gönderdi',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'creationTime':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                      }

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Talep Gönderild',
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
                                    }

                                    await _model.receiverUserRefCopy!.update({
                                      ...mapToFirestore(
                                        {
                                          'notificationCount':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Seç',
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
        ),
      ),
    );
  }
}
