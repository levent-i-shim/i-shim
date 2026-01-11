import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_new_page_copy_model.dart';
export 'message_new_page_copy_model.dart';

class MessageNewPageCopyWidget extends StatefulWidget {
  const MessageNewPageCopyWidget({
    super.key,
    required this.message,
    required this.type,
    required this.conversationId,
    required this.receiverUser,
  });

  final MessageRecord? message;
  final String? type;
  final int? conversationId;
  final UsersRecord? receiverUser;

  static String routeName = 'MessageNewPageCopy';
  static String routePath = '/MessageNewPageCopy';

  @override
  State<MessageNewPageCopyWidget> createState() =>
      _MessageNewPageCopyWidgetState();
}

class _MessageNewPageCopyWidgetState extends State<MessageNewPageCopyWidget> {
  late MessageNewPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageNewPageCopyModel());

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
        backgroundColor: valueOrDefault<Color>(
          widget!.message?.user1 == currentUserReference
              ? functions.getBackgroundColor(widget!.message?.backgroundUser1)
              : functions.getBackgroundColor(widget!.message?.backgroundUser2),
          Color(0xFF090620),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            widget!.message?.user1 == currentUserReference
                                ? functions.getBackgroundColor(
                                    widget!.message?.backgroundUser1)
                                : functions.getBackgroundColor(
                                    widget!.message?.backgroundUser2),
                            Color(0xFF090620),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          widget!.receiverUser!.photoUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: StreamBuilder<MessageRecord>(
                                        stream: MessageRecord.getDocument(
                                            widget!.message!.reference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
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

                                          final containerMessageRecord =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ConfirmationUserDetailPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'receiverUser':
                                                      serializeParam(
                                                    widget!.receiverUser,
                                                    ParamType.Document,
                                                  ),
                                                  'conversationId':
                                                      serializeParam(
                                                    widget!.conversationId,
                                                    ParamType.int,
                                                  ),
                                                  'message': serializeParam(
                                                    widget!.message,
                                                    ParamType.Document,
                                                  ),
                                                  'conversationType':
                                                      serializeParam(
                                                    widget!.type,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'receiverUser':
                                                      widget!.receiverUser,
                                                  'message': widget!.message,
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF003D81),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 1.0,
                                                    color: Color(0xFF00A3C7),
                                                    spreadRadius: 1.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 2.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget!.receiverUser
                                                            ?.displayName,
                                                        'İsim',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
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
                                                            fontSize: 16.0,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (containerMessageRecord
                                                                  .user1 ==
                                                              currentUserReference
                                                          ? !containerMessageRecord
                                                              .isWritingUser2
                                                          : !containerMessageRecord
                                                              .isWritingUser1)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      6.0,
                                                                      4.0),
                                                          child: Text(
                                                            containerMessageRecord
                                                                        .user1 ==
                                                                    currentUserReference
                                                                ? (containerMessageRecord
                                                                        .isOnlineUser2
                                                                    ? 'Çevrimiçi'
                                                                    : 'Çevrimdışı')
                                                                : (containerMessageRecord
                                                                        .isOnlineUser1
                                                                    ? 'Çevrimiçi'
                                                                    : 'Çevrimdışı'),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF2BAFFF),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      if (containerMessageRecord
                                                                  .user1 ==
                                                              currentUserReference
                                                          ? containerMessageRecord
                                                              .isWritingUser2
                                                          : containerMessageRecord
                                                              .isWritingUser1)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      6.0,
                                                                      4.0),
                                                          child: Text(
                                                            'Yazıyor...',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF00FF23),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 2.0, 16.0, 2.0),
                                      child: Container(
                                        width: 44.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002E61),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 1.0,
                                              color: Color(0xFF00A3C7),
                                              spreadRadius: 1.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              MessageColorSettingsPageWidget
                                                  .routeName,
                                              queryParameters: {
                                                'message': serializeParam(
                                                  widget!.message,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'message': widget!.message,
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.settings_sharp,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 28,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: custom_widgets.MessageSyncListener(
                                      width: double.infinity,
                                      height: double.infinity,
                                      conversationId: widget!.conversationId!,
                                      conversationType: widget!.type!,
                                      currentUserDisplayName:
                                          currentUserDisplayName,
                                      authUser: currentUserReference!,
                                      messageRef: widget!.message!.reference,
                                      receiverUser: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!.message!.user2!
                                          : widget!.message!.user1!,
                                      addImageToGalery: widget!
                                                  .message?.user1 ==
                                              currentUserReference
                                          ? widget!.message!.user1AllowMediaSave
                                          : widget!
                                              .message!.user2AllowMediaSave,
                                      amIUser1: widget!.message?.user1 ==
                                              currentUserReference
                                          ? true
                                          : false,
                                      backGround: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!.message?.backgroundUser1
                                          : widget!.message?.backgroundUser2,
                                      ballon1: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!.message?.balloon1User1
                                          : widget!.message?.balloon1User2,
                                      ballon1Text: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!
                                              .message?.balloon1TextColorUser1
                                          : widget!
                                              .message?.balloon1TextColorUser2,
                                      ballon2: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!.message?.balloon2User1
                                          : widget!.message?.balloon2User2,
                                      ballon2Text: widget!.message?.user1 ==
                                              currentUserReference
                                          ? widget!
                                              .message?.balloon2TextColorUser1
                                          : widget!
                                              .message?.balloon2TextColorUser2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
