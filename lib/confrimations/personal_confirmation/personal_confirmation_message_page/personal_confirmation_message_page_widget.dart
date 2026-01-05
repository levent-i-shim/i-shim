import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/attachments_message_component/attachments_message_component_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'personal_confirmation_message_page_model.dart';
export 'personal_confirmation_message_page_model.dart';

class PersonalConfirmationMessagePageWidget extends StatefulWidget {
  const PersonalConfirmationMessagePageWidget({
    super.key,
    required this.personalConfirmation,
  });

  final PersonalConfirmationsRecord? personalConfirmation;

  static String routeName = 'PersonalConfirmationMessagePage';
  static String routePath = '/personalConfirmationMessagePage';

  @override
  State<PersonalConfirmationMessagePageWidget> createState() =>
      _PersonalConfirmationMessagePageWidgetState();
}

class _PersonalConfirmationMessagePageWidgetState
    extends State<PersonalConfirmationMessagePageWidget> {
  late PersonalConfirmationMessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalConfirmationMessagePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.personalConfirmation?.sender == currentUserReference) {
        _model.receiver = widget.personalConfirmation?.receiver;
      } else {
        _model.receiver = widget.personalConfirmation?.sender;
      }
    });

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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1771D3), Color(0xFF002E61)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: StreamBuilder<List<PersonalConfirmationsMessagesRecord>>(
                  stream: queryPersonalConfirmationsMessagesRecord(
                    queryBuilder: (personalConfirmationsMessagesRecord) =>
                        personalConfirmationsMessagesRecord.where(
                      'receiverRef',
                      isEqualTo: widget.personalConfirmation?.sender,
                    ),
                    singleRecord: true,
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
                    List<PersonalConfirmationsMessagesRecord>
                        rowPersonalConfirmationsMessagesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final rowPersonalConfirmationsMessagesRecord =
                        rowPersonalConfirmationsMessagesRecordList.isNotEmpty
                            ? rowPersonalConfirmationsMessagesRecordList.first
                            : null;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 20.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.personalConfirmation?.sender ==
                                      currentUserReference
                                  ? widget.personalConfirmation?.receiverName
                                  : widget.personalConfirmation?.senderName,
                              'Alıcı',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
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
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 6.0),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              rowPersonalConfirmationsMessagesRecord!.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1771D3), Color(0xFF002E61)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, 0.0),
                end: AlignmentDirectional(1.0, 0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 9,
                  child:
                      StreamBuilder<List<PersonalConfirmationsMessagesRecord>>(
                    stream: queryPersonalConfirmationsMessagesRecord(
                      parent: widget.personalConfirmation?.reference,
                      queryBuilder: (personalConfirmationsMessagesRecord) =>
                          personalConfirmationsMessagesRecord
                              .orderBy('dateTime', descending: true),
                    )..listen((snapshot) {
                        List<PersonalConfirmationsMessagesRecord>
                            listViewPersonalConfirmationsMessagesRecordList =
                            snapshot;
                        if (_model.listViewPreviousSnapshot != null &&
                            !const ListEquality(
                                    PersonalConfirmationsMessagesRecordDocumentEquality())
                                .equals(
                                    listViewPersonalConfirmationsMessagesRecordList,
                                    _model.listViewPreviousSnapshot)) {
                          () async {
                            await actions
                                .safelyMarkMessagesReadAndUpdateCountPersonal(
                              currentUserReference!,
                              widget.personalConfirmation!.reference,
                            );

                            safeSetState(() {});
                          }();
                        }
                        _model.listViewPreviousSnapshot = snapshot;
                      }),
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
                      List<PersonalConfirmationsMessagesRecord>
                          listViewPersonalConfirmationsMessagesRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            listViewPersonalConfirmationsMessagesRecordList
                                .length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPersonalConfirmationsMessagesRecord =
                              listViewPersonalConfirmationsMessagesRecordList[
                                  listViewIndex];
                          return Stack(
                            children: [
                              if (listViewPersonalConfirmationsMessagesRecord
                                      .senderRef ==
                                  currentUserReference)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  listViewPersonalConfirmationsMessagesRecord
                                                      .message));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Mesaj Kopyalandı',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 500),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 300.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1771D3),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFFF0FF00),
                                              width: 0.4,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 8.0, 4.0, 4.0),
                                                  child: Text(
                                                    listViewPersonalConfirmationsMessagesRecord
                                                        .message,
                                                    textAlign: TextAlign.start,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 15.0,
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
                                                if (listViewPersonalConfirmationsMessagesRecord
                                                            .imagePath !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                listViewPersonalConfirmationsMessagesRecord
                                                                    .imagePath,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: listViewPersonalConfirmationsMessagesRecord
                                                                  .imagePath,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewPersonalConfirmationsMessagesRecord
                                                                .imagePath,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            listViewPersonalConfirmationsMessagesRecord
                                                                .imagePath,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewPersonalConfirmationsMessagesRecord
                                                    .hasPdfUrl())
                                                  FlutterFlowPdfViewer(
                                                    networkPath:
                                                        listViewPersonalConfirmationsMessagesRecord
                                                            .hasPdfUrl()
                                                            .toString(),
                                                    height: 300.0,
                                                    horizontalScroll: false,
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        listViewPersonalConfirmationsMessagesRecord
                                                                .hasDateTime()
                                                            ? dateTimeFormat(
                                                                "Hm",
                                                                listViewPersonalConfirmationsMessagesRecord
                                                                    .dateTime!)
                                                            : '     ',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                          fontSize: 10.0,
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
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              offset: Offset(
                                                                  2.0, 2.0),
                                                              blurRadius: 2.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12.0,
                                                    ),
                                                    Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (listViewPersonalConfirmationsMessagesRecord
                                      .receiverRef ==
                                  currentUserReference)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  listViewPersonalConfirmationsMessagesRecord
                                                      .message));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Mesaj Kopyalandı',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 500),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minWidth: 150.0,
                                            maxWidth: 300.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF002E61),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFFF0FF00),
                                              width: 0.4,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 8.0, 4.0, 4.0),
                                                  child: Text(
                                                    listViewPersonalConfirmationsMessagesRecord
                                                        .message,
                                                    textAlign: TextAlign.start,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 15.0,
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
                                                if (listViewPersonalConfirmationsMessagesRecord
                                                    .hasImagePath())
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                listViewPersonalConfirmationsMessagesRecord
                                                                    .imagePath,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: listViewPersonalConfirmationsMessagesRecord
                                                                  .imagePath,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewPersonalConfirmationsMessagesRecord
                                                                .imagePath,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            listViewPersonalConfirmationsMessagesRecord
                                                                .imagePath,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewPersonalConfirmationsMessagesRecord
                                                    .hasPdfUrl())
                                                  FlutterFlowPdfViewer(
                                                    networkPath:
                                                        listViewPersonalConfirmationsMessagesRecord
                                                            .hasPdfUrl()
                                                            .toString(),
                                                    height: 300.0,
                                                    horizontalScroll: false,
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewPersonalConfirmationsMessagesRecord
                                                            .hasDateTime()
                                                        ? dateTimeFormat(
                                                            "Hm",
                                                            listViewPersonalConfirmationsMessagesRecord
                                                                .dateTime!)
                                                        : '     ',
                                                    textAlign: TextAlign.end,
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
                                                      fontSize: 10.0,
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
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 2.0,
                                                        )
                                                      ],
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
                                ),
                            ],
                          );
                        },
                        controller: _model.listViewController,
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(-1.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(-1.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child:
                                                  AttachmentsMessageComponentWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.returnValue = value));

                                      if (_model.returnValue != null &&
                                          _model.returnValue != '') {
                                        if (FFAppState().isSelectedImage) {
                                          _model.selectedImage = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.selectedPdf = true;
                                          safeSetState(() {});
                                        }
                                      } else {
                                        _model.selectedImage = false;
                                        _model.selectedPdf = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.attach_file,
                                      color: Color(0xFF0202F9),
                                      size: 36.0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
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
                                        hintText: 'Mesajınızı Giriniz',
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
                                            color: Color(0xFF080000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFE1DEDE),
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
                                            color: Color(0xFF080808),
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
                                      maxLines: 2,
                                      minLines: 1,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.send,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.soundPlayer ??= AudioPlayer();
                                        if (_model.soundPlayer!.playing) {
                                          await _model.soundPlayer!.stop();
                                        }
                                        _model.soundPlayer!.setVolume(1.0);
                                        _model.soundPlayer!
                                            .setAsset(
                                                'assets/audios/sendMessageAudio.mp3')
                                            .then((_) =>
                                                _model.soundPlayer!.play());

                                        await _model.listViewController
                                            ?.animateTo(
                                          0,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );

                                        await _model.receiver!.update({
                                          ...mapToFirestore(
                                            {
                                              'messageCount':
                                                  FieldValue.increment(1),
                                              'notificationCount':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });

                                        await widget
                                            .personalConfirmation!.reference
                                            .update({
                                          ...createPersonalConfirmationsRecordData(
                                            lastMessage:
                                                _model.textController.text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'lastMessageTime':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        safeSetState(() {
                                          _model.textController?.text = '';
                                        });

                                        await NotificationsRecord.createDoc(
                                                _model.receiver!)
                                            .set({
                                          ...createNotificationsRecordData(
                                            type: NotificationTypes
                                                .confirmationPersonal.name,
                                            content: '1 Yeni Mesaj',
                                            relatedDoc: widget
                                                .personalConfirmation
                                                ?.reference
                                                .id,
                                            isRead: false,
                                            isDelete: false,
                                            fullDescription:
                                                '${currentUserDisplayName} Kişisinden Yeni Bir Mesajınız Var',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'creationTime':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        triggerPushNotification(
                                          notificationTitle:
                                              '${currentUserDisplayName}',
                                          notificationText:
                                              _model.textController.text,
                                          userRefs: [_model.receiver!],
                                          initialPageName:
                                              'PersonalConfirmationMessagePage',
                                          parameterData: {
                                            'personalConfirmation':
                                                widget.personalConfirmation,
                                          },
                                        );
                                        _model.selectedImage = false;
                                        _model.selectedPdf = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
