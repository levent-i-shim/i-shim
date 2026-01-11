import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_confirmaitons_request_page_model.dart';
export 'all_confirmaitons_request_page_model.dart';

class AllConfirmaitonsRequestPageWidget extends StatefulWidget {
  const AllConfirmaitonsRequestPageWidget({super.key});

  static String routeName = 'AllConfirmaitonsRequestPage';
  static String routePath = '/allConfirmaitonsRequestPage';

  @override
  State<AllConfirmaitonsRequestPageWidget> createState() =>
      _AllConfirmaitonsRequestPageWidgetState();
}

class _AllConfirmaitonsRequestPageWidgetState
    extends State<AllConfirmaitonsRequestPageWidget> {
  late AllConfirmaitonsRequestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllConfirmaitonsRequestPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AllConfirmationsRecord>>(
      stream: queryAllConfirmationsRecord(
        parent: currentUserReference,
        queryBuilder: (allConfirmationsRecord) => allConfirmationsRecord
            .where(
              'isAccept',
              isEqualTo: false,
            )
            .where(
              'createdRef',
              isNotEqualTo: currentUserReference,
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
        List<AllConfirmationsRecord>
            allConfirmaitonsRequestPageAllConfirmationsRecordList =
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
                'Davetiyelerim',
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
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
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
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'İstekler',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                      child: Builder(
                        builder: (context) {
                          final confirmation =
                              allConfirmaitonsRequestPageAllConfirmationsRecordList
                                  .toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: confirmation.length,
                            itemBuilder: (context, confirmationIndex) {
                              final confirmationItem =
                                  confirmation[confirmationIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 16.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  confirmationItem.receiverName,
                                                  'receiverName',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await confirmationItem.reference
                                                  .update(
                                                      createAllConfirmationsRecordData(
                                                isAccept: true,
                                              ));
                                              _model.receiverUser =
                                                  await UsersRecord
                                                      .getDocumentOnce(
                                                          confirmationItem
                                                              .createdRef!);
                                              _model.confirmationMessage =
                                                  await actions
                                                      .getOrCreateMessage(
                                                currentUserReference!.id,
                                                confirmationItem.createdRef!.id,
                                                currentUserDisplayName,
                                                _model
                                                    .receiverUser!.displayName,
                                                confirmationItem.messageType,
                                                true,
                                              );
                                              _model.allConfirmation =
                                                  await queryAllConfirmationsRecordOnce(
                                                parent:
                                                    confirmationItem.createdRef,
                                                queryBuilder:
                                                    (allConfirmationsRecord) =>
                                                        allConfirmationsRecord
                                                            .where(
                                                              'message',
                                                              isEqualTo:
                                                                  confirmationItem
                                                                      .message,
                                                            )
                                                            .where(
                                                              'messageType',
                                                              isEqualTo:
                                                                  confirmationItem
                                                                      .messageType,
                                                            ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);

                                              await _model
                                                  .allConfirmation!.reference
                                                  .update(
                                                      createAllConfirmationsRecordData(
                                                isAccept: true,
                                              ));

                                              await NotificationsRecord
                                                      .createDoc(
                                                          confirmationItem
                                                              .createdRef!)
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  type: NotificationTypes
                                                      .confirmation.name,
                                                  content: 'İstek Kabul Edildi',
                                                  relatedDoc: _model
                                                      .confirmationMessage
                                                      ?.reference
                                                      .id,
                                                  isRead: false,
                                                  isDelete: false,
                                                  fullDescription:
                                                      '${currentUserDisplayName} Kişisi Mesaj Davetinizi Kabul Etti',
                                                  image: currentUserPhoto,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'creationTime': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });

                                              await confirmationItem.createdRef!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'notificationCount':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                              if (confirmationItem
                                                      .messageType ==
                                                  'company') {
                                                await _model
                                                    .confirmationMessage!
                                                    .reference
                                                    .update({
                                                  ...createMessageRecordData(
                                                    isAcceptCompany: true,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'lastMessageTimeCompany':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              } else if (confirmationItem
                                                      .messageType ==
                                                  'workplace') {
                                                await _model
                                                    .confirmationMessage!
                                                    .reference
                                                    .update({
                                                  ...createMessageRecordData(
                                                    isAcceptWorkPlace: true,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'lastMessageTimeWorkplace':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              } else if (confirmationItem
                                                      .messageType ==
                                                  'social') {
                                                await _model
                                                    .confirmationMessage!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'lastMessageTimeSocial':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                await _model
                                                    .confirmationMessage!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'lastMessageTimePhone':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              _model.conversationId =
                                                  await SQLiteManager.instance
                                                      .getConversationWithLastMessage(
                                                conversationName: _model
                                                    .confirmationMessage!
                                                    .reference
                                                    .id,
                                                type: confirmationItem
                                                    .messageType,
                                              );

                                              context.pushNamed(
                                                MessageNewPageCopyWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'message': serializeParam(
                                                    _model.confirmationMessage,
                                                    ParamType.Document,
                                                  ),
                                                  'type': serializeParam(
                                                    confirmationItem
                                                        .messageType,
                                                    ParamType.String,
                                                  ),
                                                  'conversationId':
                                                      serializeParam(
                                                    _model.conversationId
                                                        ?.lastOrNull?.id,
                                                    ParamType.int,
                                                  ),
                                                  'receiverUser':
                                                      serializeParam(
                                                    _model.receiverUser,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'message': _model
                                                      .confirmationMessage,
                                                  'receiverUser':
                                                      _model.receiverUser,
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'Kabul Et',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
