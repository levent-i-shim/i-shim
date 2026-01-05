import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phone_confirmations_create_confirmation_model.dart';
export 'phone_confirmations_create_confirmation_model.dart';

class PhoneConfirmationsCreateConfirmationWidget extends StatefulWidget {
  const PhoneConfirmationsCreateConfirmationWidget({super.key});

  static String routeName = 'PhoneConfirmationsCreateConfirmation';
  static String routePath = '/phoneConfirmationsCreateConfirmation';

  @override
  State<PhoneConfirmationsCreateConfirmationWidget> createState() =>
      _PhoneConfirmationsCreateConfirmationWidgetState();
}

class _PhoneConfirmationsCreateConfirmationWidgetState
    extends State<PhoneConfirmationsCreateConfirmationWidget> {
  late PhoneConfirmationsCreateConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => PhoneConfirmationsCreateConfirmationModel());

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
        backgroundColor: Color(0x563F0E57),
        appBar: AppBar(
          backgroundColor: Color(0x56440F5E),
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
            'Mesajlar',
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => StreamBuilder<List<PhonesRecord>>(
                stream: queryPhonesRecord(
                  parent: currentUserReference,
                  queryBuilder: (phonesRecord) => phonesRecord.where(
                    'phone',
                    isNotEqualTo: currentPhoneNumber,
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
                  List<PhonesRecord> containerPhonesRecordList = snapshot.data!;

                  return Container(
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final containerVar = containerPhonesRecordList.toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(containerVar.length,
                              (containerVarIndex) {
                            final containerVarItem =
                                containerVar[containerVarIndex];
                            return Padding(
                              padding: EdgeInsets.all(3.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    containerVarItem.linkedUserId!),
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

                                  final containerUsersRecord = snapshot.data!;

                                  return Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 44.0,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x4D9489F5),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color(0xFF6F61EF),
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
                                                    containerUsersRecord
                                                        .photoUrl,
                                                    width: 44.0,
                                                    height: 44.0,
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
                                                      containerVarItem.name,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF15161E),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
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
                                                        containerVarItem.phone,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF606A85),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
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
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.confirmation =
                                                                await actions
                                                                    .getOrCreateMessage(
                                                              currentUserReference!
                                                                  .id,
                                                              containerUsersRecord
                                                                  .reference.id,
                                                              currentUserDisplayName,
                                                              containerUsersRecord
                                                                  .displayName,
                                                              'phone',
                                                              false,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.conversationName =
                                                                await actions
                                                                    .getConversationName(
                                                              _model
                                                                  .confirmation!
                                                                  .reference,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.conversationId =
                                                                await SQLiteManager
                                                                    .instance
                                                                    .getConversationWithLastMessage(
                                                              conversationName:
                                                                  _model
                                                                      .conversationName!,
                                                              type: 'phone',
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (_model
                                                                    .confirmation!
                                                                    .isUser1Blocked ||
                                                                _model
                                                                    .confirmation!
                                                                    .isUser2Blocked) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
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
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            context.pushNamed(
                                                              MessageNewPageCopyWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'message':
                                                                    serializeParam(
                                                                  _model
                                                                      .confirmation,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'type':
                                                                    serializeParam(
                                                                  'phone',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'conversationId':
                                                                    serializeParam(
                                                                  _model
                                                                      .conversationId
                                                                      ?.lastOrNull
                                                                      ?.id,
                                                                  ParamType.int,
                                                                ),
                                                                'receiverUser':
                                                                    serializeParam(
                                                                  containerUsersRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'message': _model
                                                                    .confirmation,
                                                                'receiverUser':
                                                                    containerUsersRecord,
                                                              },
                                                            );

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: Color(
                                                                0xFF606A85),
                                                            size: 24.0,
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
                                  );
                                },
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
