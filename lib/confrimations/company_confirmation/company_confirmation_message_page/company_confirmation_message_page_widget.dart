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
import 'company_confirmation_message_page_model.dart';
export 'company_confirmation_message_page_model.dart';

class CompanyConfirmationMessagePageWidget extends StatefulWidget {
  const CompanyConfirmationMessagePageWidget({
    super.key,
    required this.companyConfirmation,
  });

  final CompanyConfirmationsRecord? companyConfirmation;

  static String routeName = 'CompanyConfirmationMessagePage';
  static String routePath = '/companyConfirmationMessagePage';

  @override
  State<CompanyConfirmationMessagePageWidget> createState() =>
      _CompanyConfirmationMessagePageWidgetState();
}

class _CompanyConfirmationMessagePageWidgetState
    extends State<CompanyConfirmationMessagePageWidget> {
  late CompanyConfirmationMessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompanyConfirmationMessagePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.companyConfirmation?.senderRef == currentUserReference) {
        _model.receiverRef = widget.companyConfirmation?.receiverRef;
      } else {
        _model.receiverRef = widget.companyConfirmation?.senderRef;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
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
            '',
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
          child: Container(
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
                Expanded(
                  flex: 9,
                  child: StreamBuilder<List<CompanyConfirmationMessagesRecord>>(
                    stream: queryCompanyConfirmationMessagesRecord(
                      parent: widget.companyConfirmation?.reference,
                      queryBuilder: (companyConfirmationMessagesRecord) =>
                          companyConfirmationMessagesRecord.orderBy('date',
                              descending: true),
                    )..listen((snapshot) {
                        List<CompanyConfirmationMessagesRecord>
                            listViewCompanyConfirmationMessagesRecordList =
                            snapshot;
                        if (_model.listViewPreviousSnapshot != null &&
                            !const ListEquality(
                                    CompanyConfirmationMessagesRecordDocumentEquality())
                                .equals(
                                    listViewCompanyConfirmationMessagesRecordList,
                                    _model.listViewPreviousSnapshot)) {
                          () async {
                            await actions
                                .safelyMarkMessagesReadAndUpdateCountCompanyConfirmation(
                              currentUserReference!,
                              widget.companyConfirmation!.reference,
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
                      List<CompanyConfirmationMessagesRecord>
                          listViewCompanyConfirmationMessagesRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCompanyConfirmationMessagesRecordList
                            .length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCompanyConfirmationMessagesRecord =
                              listViewCompanyConfirmationMessagesRecordList[
                                  listViewIndex];
                          return Stack(
                            children: [
                              if (listViewCompanyConfirmationMessagesRecord
                                      .receiverRef ==
                                  currentUserReference)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onLongPress: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  listViewCompanyConfirmationMessagesRecord
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
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF0E046F),
                                                Color(0xFF03011F)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  -1.0, -0.34),
                                              end: AlignmentDirectional(
                                                  1.0, 0.34),
                                            ),
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 36.0,
                                                      height: 36.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        listViewCompanyConfirmationMessagesRecord
                                                            .senderImageRef,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
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
                                                                  8.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        listViewCompanyConfirmationMessagesRecord
                                                            .message,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                                if (listViewCompanyConfirmationMessagesRecord
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
                                                                listViewCompanyConfirmationMessagesRecord
                                                                    .imagePath,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: listViewCompanyConfirmationMessagesRecord
                                                                  .imagePath,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .imagePath,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .imagePath,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewCompanyConfirmationMessagesRecord
                                                            .pdfUrl !=
                                                        '')
                                                  FlutterFlowPdfViewer(
                                                    networkPath:
                                                        listViewCompanyConfirmationMessagesRecord
                                                            .pdfUrl,
                                                    height: 300.0,
                                                    horizontalScroll: false,
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewCompanyConfirmationMessagesRecord
                                                            .hasDate()
                                                        ? dateTimeFormat(
                                                            "Hm",
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .date!)
                                                        : '     ',
                                                    textAlign: TextAlign.start,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
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
                              if (listViewCompanyConfirmationMessagesRecord
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
                                                  listViewCompanyConfirmationMessagesRecord
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
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF03011F),
                                                Color(0xFF390203)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  -1.0, -0.34),
                                              end: AlignmentDirectional(
                                                  1.0, 0.34),
                                            ),
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
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          currentUserPhoto,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        listViewCompanyConfirmationMessagesRecord
                                                            .message,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                                if (listViewCompanyConfirmationMessagesRecord
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
                                                                listViewCompanyConfirmationMessagesRecord
                                                                    .imagePath,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: listViewCompanyConfirmationMessagesRecord
                                                                  .imagePath,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .imagePath,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .imagePath,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewCompanyConfirmationMessagesRecord
                                                            .pdfUrl !=
                                                        '')
                                                  FlutterFlowPdfViewer(
                                                    networkPath:
                                                        listViewCompanyConfirmationMessagesRecord
                                                            .pdfUrl,
                                                    height: 300.0,
                                                    horizontalScroll: false,
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewCompanyConfirmationMessagesRecord
                                                            .hasDate()
                                                        ? dateTimeFormat(
                                                            "Hm",
                                                            listViewCompanyConfirmationMessagesRecord
                                                                .date!)
                                                        : '     ',
                                                    textAlign: TextAlign.start,
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
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
                                        _model.selectedPdf = false;
                                        _model.selectedImage = false;
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
                                            color: Colors.black,
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

                                        await widget
                                            .companyConfirmation!.reference
                                            .update({
                                          ...createCompanyConfirmationsRecordData(
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

                                        await _model.receiverRef!.update({
                                          ...mapToFirestore(
                                            {
                                              'messageCount':
                                                  FieldValue.increment(1),
                                              'notificationCount':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                        await _model.listViewController
                                            ?.animateTo(
                                          0,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );

                                        await NotificationsRecord.createDoc(
                                                _model.receiverRef!)
                                            .set({
                                          ...createNotificationsRecordData(
                                            type: NotificationTypes
                                                .confirmationCompany.name,
                                            content: '1 Yeni Mesaj',
                                            relatedDoc: widget
                                                .companyConfirmation
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
                                          userRefs: [_model.receiverRef!],
                                          initialPageName:
                                              'CompanyConfirmationMessagePage',
                                          parameterData: {
                                            'companyConfirmation':
                                                widget.companyConfirmation,
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
