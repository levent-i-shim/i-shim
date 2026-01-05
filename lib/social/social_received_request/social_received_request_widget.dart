import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_received_request_model.dart';
export 'social_received_request_model.dart';

class SocialReceivedRequestWidget extends StatefulWidget {
  const SocialReceivedRequestWidget({super.key});

  static String routeName = 'SocialReceivedRequest';
  static String routePath = '/socialReceivedRequest';

  @override
  State<SocialReceivedRequestWidget> createState() =>
      _SocialReceivedRequestWidgetState();
}

class _SocialReceivedRequestWidgetState
    extends State<SocialReceivedRequestWidget> {
  late SocialReceivedRequestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialReceivedRequestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FriendRequestRecord>>(
      stream: queryFriendRequestRecord(
        parent: currentUserReference,
        queryBuilder: (friendRequestRecord) => friendRequestRecord
            .where(
              'isAccept',
              isEqualTo: false,
            )
            .where(
              'isReject',
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
        List<FriendRequestRecord> socialReceivedRequestFriendRequestRecordList =
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
                'Gelen İstekler',
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
                child: Builder(
                  builder: (context) {
                    final users =
                        socialReceivedRequestFriendRequestRecordList.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                      itemBuilder: (context, usersIndex) {
                        final usersItem = users[usersIndex];
                        return Padding(
                          padding: EdgeInsets.all(12.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(usersItem.sender!),
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

                              final containerUsersRecord = snapshot.data!;

                              return Material(
                                color: Colors.transparent,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                containerUsersRecord.photoUrl,
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerUsersRecord
                                                      .displayName,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat("relative",
                                                        usersItem.date!),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await usersItem.reference.update(
                                                      createFriendRequestRecordData(
                                                    isAccept: true,
                                                  ));
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.socialCount,
                                                          0) >
                                                      0) {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'friendsCount':
                                                              FieldValue
                                                                  .increment(1),
                                                          'socialCount':
                                                              FieldValue
                                                                  .increment(
                                                                      -(1)),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'friendsCount':
                                                              FieldValue
                                                                  .increment(1),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  await usersItem.sender!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'friendsCount':
                                                            FieldValue
                                                                .increment(1),
                                                      },
                                                    ),
                                                  });

                                                  await FriendsRecord.createDoc(
                                                          usersItem.sender!)
                                                      .set({
                                                    ...createFriendsRecordData(
                                                      userRef:
                                                          currentUserReference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'createdAt': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });

                                                  await FriendsRecord.createDoc(
                                                          currentUserReference!)
                                                      .set({
                                                    ...createFriendsRecordData(
                                                      userRef: usersItem.sender,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'createdAt': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });

                                                  await SocialNotificationRecord
                                                          .createDoc(
                                                              usersItem.sender!)
                                                      .set({
                                                    ...createSocialNotificationRecordData(
                                                      type: NotificationTypes
                                                          .acceptFriendRequest
                                                          .name,
                                                      isRead: false,
                                                      triggeredBy:
                                                          currentUserReference,
                                                      title:
                                                          'Yeni Bir Arkdaşınız Var',
                                                      description:
                                                          '${currentUserDisplayName} Ardakaşlık İsteğinizi Kabul Etti',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'date': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text: 'Kabul Et',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF0200FF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  borderSide: BorderSide(
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  hoverColor: Color(0xFFFF0003),
                                                  hoverTextColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                await usersItem.reference.update(
                                                    createFriendRequestRecordData(
                                                  isReject: true,
                                                ));
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.socialCount,
                                                        0) >
                                                    0) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'socialCount':
                                                            FieldValue
                                                                .increment(
                                                                    -(1)),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              text: 'Reddet',
                                              options: FFButtonOptions(
                                                width: 100.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF0200FF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                borderSide: BorderSide(
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                hoverColor: Color(0xFFFF0003),
                                                hoverTextColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
