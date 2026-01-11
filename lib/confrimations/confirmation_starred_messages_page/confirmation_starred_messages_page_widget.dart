import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirmation_starred_messages_page_model.dart';
export 'confirmation_starred_messages_page_model.dart';

class ConfirmationStarredMessagesPageWidget extends StatefulWidget {
  const ConfirmationStarredMessagesPageWidget({
    super.key,
    required this.conversationId,
    required this.receiverUser,
  });

  final int? conversationId;
  final UsersRecord? receiverUser;

  static String routeName = 'ConfirmationStarredMessagesPage';
  static String routePath = '/confirmationStarredMessagesPage';

  @override
  State<ConfirmationStarredMessagesPageWidget> createState() =>
      _ConfirmationStarredMessagesPageWidgetState();
}

class _ConfirmationStarredMessagesPageWidgetState
    extends State<ConfirmationStarredMessagesPageWidget> {
  late ConfirmationStarredMessagesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationStarredMessagesPageModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xEF000000),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xE7000000),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Text(
                            'Yıldızlı',
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
                                  color: Colors.white,
                                  fontSize: 16.0,
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
                  ),
                ),
                FutureBuilder<List<GetStarredMessagesRow>>(
                  future: SQLiteManager.instance.getStarredMessages(
                    conversationId: widget!.conversationId!.toString(),
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
                    final listViewGetStarredMessagesRowList = snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewGetStarredMessagesRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewGetStarredMessagesRow =
                            listViewGetStarredMessagesRowList[listViewIndex];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      functions.amISenderMessage(
                                              currentUserReference!,
                                              listViewGetStarredMessagesRow
                                                  .senderRef!)
                                          ? 'Siz'
                                          : valueOrDefault<String>(
                                              widget!.receiverUser?.displayName,
                                              'Karşı',
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
                                            color: Colors.white,
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
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 150.0,
                                      maxWidth: 300.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: functions.amISenderMessage(
                                              currentUserReference!,
                                              listViewGetStarredMessagesRow
                                                  .senderRef!)
                                          ? Colors.white
                                          : Color(0xFF00499C),
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 0.4,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              listViewGetStarredMessagesRow
                                                          .isEdited ==
                                                      0
                                                  ? listViewGetStarredMessagesRow
                                                      .message!
                                                  : listViewGetStarredMessagesRow
                                                      .editedMessage!,
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
                                                        color: Colors.black,
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
                                          if (listViewGetStarredMessagesRow
                                                      .imagePath !=
                                                  null &&
                                              listViewGetStarredMessagesRow
                                                      .imagePath !=
                                                  '')
                                            Container(
                                              width: 200.0,
                                              height: 200.0,
                                              child: custom_widgets
                                                  .MessageImageViewer(
                                                width: 200.0,
                                                height: 200.0,
                                                imagePath:
                                                    listViewGetStarredMessagesRow
                                                        .imagePath!,
                                              ),
                                            ),
                                          if (listViewGetStarredMessagesRow
                                                      .pdfUrl !=
                                                  null &&
                                              listViewGetStarredMessagesRow
                                                      .pdfUrl !=
                                                  '')
                                            Container(
                                              width: 200.0,
                                              height: 200.0,
                                              child: custom_widgets
                                                  .CustomPdfViewer(
                                                width: 200.0,
                                                height: 200.0,
                                                pdfUrl:
                                                    listViewGetStarredMessagesRow
                                                        .pdfUrl!,
                                              ),
                                            ),
                                          if (listViewGetStarredMessagesRow
                                                  .isFile ==
                                              1)
                                            Container(
                                              width: 200.0,
                                              height: 100.0,
                                              child: custom_widgets.FileMessage(
                                                width: 200.0,
                                                height: 100.0,
                                                pdfUrl:
                                                    listViewGetStarredMessagesRow
                                                        .fileUrl!,
                                                pdfName:
                                                    listViewGetStarredMessagesRow
                                                        .fileName!,
                                              ),
                                            ),
                                          if (listViewGetStarredMessagesRow
                                                  .isPerson ==
                                              1)
                                            Container(
                                              width: 200.0,
                                              height: 100.0,
                                              child:
                                                  custom_widgets.ContactMessage(
                                                width: 200.0,
                                                height: 100.0,
                                                phoneName:
                                                    listViewGetStarredMessagesRow
                                                        .personName!,
                                                phoneNumber:
                                                    listViewGetStarredMessagesRow
                                                        .personNumber!,
                                              ),
                                            ),
                                          if (listViewGetStarredMessagesRow
                                                  .isMap ==
                                              1)
                                            Container(
                                              width: 200.0,
                                              height: 200.0,
                                              child: custom_widgets
                                                  .LocationMessage(
                                                width: 200.0,
                                                height: 200.0,
                                                latitude:
                                                    listViewGetStarredMessagesRow
                                                        .latitude!,
                                                longitude:
                                                    listViewGetStarredMessagesRow
                                                        .longitude!,
                                                locationName:
                                                    listViewGetStarredMessagesRow
                                                        .mapName!,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
