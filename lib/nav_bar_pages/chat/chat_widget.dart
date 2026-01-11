import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.messageForSync = await queryMessageRecordOnce(
        queryBuilder: (messageRecord) => messageRecord.where(Filter.or(
          Filter(
            'user1',
            isEqualTo: currentUserReference,
          ),
          Filter(
            'user2',
            isEqualTo: currentUserReference,
          ),
        )),
      );
      await actions.syncConversation(
        _model.messageForSync?.toList(),
      );
      _model.ownerCompanies = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
      );
      if (_model.ownerCompanies != null &&
          (_model.ownerCompanies)!.isNotEmpty) {
        for (int loop1Index = 0;
            loop1Index < _model.ownerCompanies!.length;
            loop1Index++) {
          final currentLoop1Item = _model.ownerCompanies![loop1Index];
          _model.addToCompanies(currentLoop1Item.reference);
        }
      }
      _model.myWorkedCompany = await queryMyWorkedWorkPlaceRecordOnce(
        parent: currentUserReference,
        queryBuilder: (myWorkedWorkPlaceRecord) =>
            myWorkedWorkPlaceRecord.where(
          'isWorking',
          isEqualTo: true,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.myWorkedCompany?.reference != null) {
        for (int loop2Index = 0;
            loop2Index < _model.myWorkedCompany!.workPlaceIds.length;
            loop2Index++) {
          final currentLoop2Item =
              _model.myWorkedCompany!.workPlaceIds[loop2Index];
          _model.addToWorkPlaces(currentLoop2Item);
        }
        _model.addToCompanies(_model.myWorkedCompany!.company!);
      }
      _model.workersList =
          await SQLiteManager.instance.getWorkersWithoutSpeech();
      _model.phonesWithoutSpeech =
          await SQLiteManager.instance.getPhonesWithoutSpeech();
      _model.nonUserPhones = await SQLiteManager.instance.getNonUserPhones();
      await actions.syncCompanyWorker(
        _model.companies.toList(),
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 4,
    )..addListener(() => safeSetState(() {}));

    _model.textFieldPhoneTextController ??= TextEditingController();
    _model.textFieldPhoneFocusNode ??= FocusNode();

    _model.textFieldWorkplaceTextController ??= TextEditingController();
    _model.textFieldWorkplaceFocusNode ??= FocusNode();

    _model.textFieldCompanyTextController ??= TextEditingController();
    _model.textFieldCompanyFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MessageRecord>>(
      stream: queryMessageRecord(
        queryBuilder: (messageRecord) => messageRecord.where(Filter.or(
          Filter(
            'user1',
            isEqualTo: currentUserReference,
          ),
          Filter(
            'user2',
            isEqualTo: currentUserReference,
          ),
        )),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF060418),
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
        List<MessageRecord> chatMessageRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF060418),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(46.0),
              child: AppBar(
                backgroundColor: Color(0xFF060418),
                automaticallyImplyLeading: false,
                title: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 6.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_model.tabBarCurrentIndex != 4)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 6.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.tabBarCurrentIndex == 1) {
                                    context.pushNamed(
                                        WorkplaceConfirmationChooseWorkplacePageWidget
                                            .routeName);
                                  } else {
                                    if (_model.tabBarCurrentIndex == 2) {
                                      context.pushNamed(
                                          CompanyConfirmationChooseCompanyPageWidget
                                              .routeName);
                                    } else {
                                      if (_model.tabBarCurrentIndex == 3) {
                                        context.pushNamed(
                                            PersonalConfirmationChoosePersonPageWidget
                                                .routeName);
                                      } else {
                                        if (_model.tabBarCurrentIndex == 0) {
                                          context.pushNamed(
                                              PhoneConfirmationsCreateConfirmationWidget
                                                  .routeName);
                                        }
                                      }
                                    }
                                  }
                                },
                                child: Container(
                                  width: 88.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF0FF00),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: Text(
                                          'Yeni',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.envelope,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 6.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                    AllConfirmaitonsRequestPageWidget
                                        .routeName);
                              },
                              child: Container(
                                width: 88.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A00FF),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        'İstekler',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                  BlockedConversationPageWidget.routeName);
                            },
                            child: Container(
                              width: 88.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF0000),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 2.0),
                                    child: Text(
                                      'Engellenen',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.block,
                                    color: Colors.white,
                                    size: 16.0,
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
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              ),
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
                              gradient: LinearGradient(
                                colors: [Color(0xFF060418), Color(0xF4300232)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(-1.0, -0.34),
                                end: AlignmentDirectional(1.0, 0.34),
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 10,
                                      child: Container(
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor: Colors.white,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          unselectedLabelStyle: FlutterFlowTheme
                                                  .of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          tabs: [
                                            Tab(
                                              text: 'Rehber',
                                              icon: Icon(
                                                Icons.person_rounded,
                                              ),
                                            ),
                                            Tab(
                                              text: 'İşyeri',
                                              icon: FaIcon(
                                                FontAwesomeIcons.store,
                                              ),
                                            ),
                                            Tab(
                                              text: 'Şirket',
                                              icon: FaIcon(
                                                FontAwesomeIcons.city,
                                              ),
                                            ),
                                            Tab(
                                              text: 'Sosyal',
                                              icon: FaIcon(
                                                FontAwesomeIcons
                                                    .phoenixFramework,
                                              ),
                                            ),
                                            Tab(
                                              text: 'Tümü',
                                              icon: FaIcon(
                                                FontAwesomeIcons.battleNet,
                                              ),
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [
                                              () async {},
                                              () async {},
                                              () async {},
                                              () async {},
                                              () async {}
                                            ][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  8.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (currentPhoneNumber !=
                                                                  null &&
                                                              currentPhoneNumber !=
                                                                  '') {
                                                            await actions
                                                                .getContactsBasicInfo(
                                                              currentUserUid,
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Telefon Numaranız Sistemde kayıtlı değil',
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
                                                          }
                                                        },
                                                        text: 'Rehberi Yenile',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 32.0,
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
                                                          color:
                                                              Color(0xFF4400FF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                                    fontSize:
                                                                        12.0,
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
                                                              BorderRadius
                                                                  .circular(
                                                                      32.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  8.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldPhoneTextController,
                                                          focusNode: _model
                                                              .textFieldPhoneFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textFieldPhoneTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              _model.searchResultPhoneNonUser =
                                                                  await SQLiteManager
                                                                      .instance
                                                                      .searchPhoneNonUserByName(
                                                                name: _model
                                                                    .textFieldPhoneTextController
                                                                    .text,
                                                              );
                                                              _model.searchResultPhoneUser =
                                                                  await SQLiteManager
                                                                      .instance
                                                                      .searchPhoneByName(
                                                                name: _model
                                                                    .textFieldPhoneTextController
                                                                    .text,
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            hintText:
                                                                'rehberde ara ....',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF644646),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
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
                                                                color: Colors
                                                                    .white,
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
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textFieldPhoneTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final workplaceMessage = chatMessageRecordList
                                                              .where((e) =>
                                                                  e.hasLastMessageTimePhone() &&
                                                                  !e
                                                                      .isUser1Blocked &&
                                                                  !e
                                                                      .isUser2Blocked)
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.lastMessageTimePhone!,
                                                                  desc: true)
                                                              .toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                workplaceMessage
                                                                    .length,
                                                            itemBuilder: (context,
                                                                workplaceMessageIndex) {
                                                              final workplaceMessageItem =
                                                                  workplaceMessage[
                                                                      workplaceMessageIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.conversationNamePhone =
                                                                        await actions
                                                                            .getConversationName(
                                                                      workplaceMessageItem
                                                                          .reference,
                                                                    );
                                                                    _model.conversationIdPhone =
                                                                        await SQLiteManager
                                                                            .instance
                                                                            .getConversationWithLastMessage(
                                                                      conversationName:
                                                                          _model
                                                                              .conversationNamePhone!,
                                                                      type:
                                                                          'phone',
                                                                    );
                                                                    if (workplaceMessageItem
                                                                            .user1 ==
                                                                        currentUserReference) {
                                                                      _model.user2Phone =
                                                                          await UsersRecord.getDocumentOnce(
                                                                              workplaceMessageItem.user2!);

                                                                      context
                                                                          .pushNamed(
                                                                        MessageNewPageCopyWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'message':
                                                                              serializeParam(
                                                                            workplaceMessageItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'type':
                                                                              serializeParam(
                                                                            'phone',
                                                                            ParamType.String,
                                                                          ),
                                                                          'conversationId':
                                                                              serializeParam(
                                                                            _model.conversationIdPhone?.lastOrNull?.id,
                                                                            ParamType.int,
                                                                          ),
                                                                          'receiverUser':
                                                                              serializeParam(
                                                                            _model.user2Phone,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'message':
                                                                              workplaceMessageItem,
                                                                          'receiverUser':
                                                                              _model.user2Phone,
                                                                        },
                                                                      );
                                                                    } else {
                                                                      _model.user1Phone =
                                                                          await UsersRecord.getDocumentOnce(
                                                                              workplaceMessageItem.user1!);

                                                                      context
                                                                          .pushNamed(
                                                                        MessageNewPageCopyWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'message':
                                                                              serializeParam(
                                                                            workplaceMessageItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'type':
                                                                              serializeParam(
                                                                            'phone',
                                                                            ParamType.String,
                                                                          ),
                                                                          'conversationId':
                                                                              serializeParam(
                                                                            _model.conversationIdPhone?.lastOrNull?.id,
                                                                            ParamType.int,
                                                                          ),
                                                                          'receiverUser':
                                                                              serializeParam(
                                                                            _model.user1Phone,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'message':
                                                                              workplaceMessageItem,
                                                                          'receiverUser':
                                                                              _model.user1Phone,
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            StreamBuilder<UsersRecord>(
                                                                              stream: UsersRecord.getDocument(workplaceMessageItem.user1 == currentUserReference ? workplaceMessageItem.user2! : workplaceMessageItem.user1!),
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

                                                                                return Container(
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
                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                      child: Image.network(
                                                                                        containerUsersRecord.photoUrl,
                                                                                        width: 44.0,
                                                                                        height: 44.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 6,
                                                                                          child: Text(
                                                                                            workplaceMessageItem.user1 == currentUserReference ? workplaceMessageItem.user2Name : workplaceMessageItem.user1Name,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF15161E),
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 4,
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                            child: Container(
                                                                                              height: 20.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                    child: Text(
                                                                                                      dateTimeFormat("relative", workplaceMessageItem.lastMessageTimePhone!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 8,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              workplaceMessageItem.lastMessagePhone.maybeHandleOverflow(
                                                                                                maxChars: 50,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.outfit(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: Color(0xFF606A85),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        FutureBuilder<int>(
                                                                                          future: queryNewMessagesRecordCount(
                                                                                            parent: currentUserReference,
                                                                                            queryBuilder: (newMessagesRecord) => newMessagesRecord
                                                                                                .where(
                                                                                                  'messageRef',
                                                                                                  isEqualTo: workplaceMessageItem.reference,
                                                                                                )
                                                                                                .where(
                                                                                                  'type',
                                                                                                  isEqualTo: 'phone',
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
                                                                                            int containerCount = snapshot.data!;

                                                                                            return Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Visibility(
                                                                                                visible: containerCount > 0,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 24.0,
                                                                                                    height: 24.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFFFEE00),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Visibility(
                                                                                                      visible: containerCount > 0,
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          containerCount.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: Colors.black,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
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
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (_model.textFieldPhoneTextController
                                                                .text ==
                                                            null ||
                                                        _model.textFieldPhoneTextController
                                                                .text ==
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final phoneWithoutSpeech =
                                                              _model.phonesWithoutSpeech
                                                                      ?.toList() ??
                                                                  [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                phoneWithoutSpeech
                                                                    .length,
                                                            itemBuilder: (context,
                                                                phoneWithoutSpeechIndex) {
                                                              final phoneWithoutSpeechItem =
                                                                  phoneWithoutSpeech[
                                                                      phoneWithoutSpeechIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.confirmationPhone =
                                                                        await actions
                                                                            .getOrCreateMessage(
                                                                      currentUserReference!
                                                                          .id,
                                                                      phoneWithoutSpeechItem
                                                                          .userId!,
                                                                      currentUserDisplayName,
                                                                      phoneWithoutSpeechItem
                                                                          .name,
                                                                      'phone',
                                                                      false,
                                                                    );
                                                                    _model.conversationNamePhoneCopy =
                                                                        await actions
                                                                            .getConversationName(
                                                                      _model
                                                                          .confirmationPhone!
                                                                          .reference,
                                                                    );
                                                                    _model.conversationIdCopy =
                                                                        await SQLiteManager
                                                                            .instance
                                                                            .getConversationWithLastMessage(
                                                                      conversationName:
                                                                          _model
                                                                              .conversationNamePhoneCopy!,
                                                                      type:
                                                                          'phone',
                                                                    );
                                                                    _model.userPhoneDocumentRef =
                                                                        await actions
                                                                            .getUserDocRef(
                                                                      phoneWithoutSpeechItem
                                                                          .userId!,
                                                                    );
                                                                    _model.userPhoneDocumentFB =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            _model.userPhoneDocumentRef!);
                                                                    if (_model
                                                                            .confirmationPhone!
                                                                            .isUser1Blocked ||
                                                                        _model
                                                                            .confirmationPhone!
                                                                            .isUser2Blocked) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        MessageNewPageCopyWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'message':
                                                                              serializeParam(
                                                                            _model.confirmationPhone,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'type':
                                                                              serializeParam(
                                                                            'phone',
                                                                            ParamType.String,
                                                                          ),
                                                                          'conversationId':
                                                                              serializeParam(
                                                                            _model.conversationIdCopy?.lastOrNull?.id,
                                                                            ParamType.int,
                                                                          ),
                                                                          'receiverUser':
                                                                              serializeParam(
                                                                            _model.userPhoneDocumentFB,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'message':
                                                                              _model.confirmationPhone,
                                                                          'receiverUser':
                                                                              _model.userPhoneDocumentFB,
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      phoneWithoutSpeechItem.name,
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF15161E),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            phoneWithoutSpeechItem.phoneNumber,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.outfit(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF606A85),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.chevron_right_rounded,
                                                                                          color: Color(0xFF606A85),
                                                                                          size: 24.0,
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
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    if (_model.textFieldPhoneTextController
                                                                .text ==
                                                            null ||
                                                        _model.textFieldPhoneTextController
                                                                .text ==
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final nonUser = _model
                                                                  .nonUserPhones
                                                                  ?.toList() ??
                                                              [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                nonUser.length,
                                                            itemBuilder: (context,
                                                                nonUserIndex) {
                                                              final nonUserItem =
                                                                  nonUser[
                                                                      nonUserIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  nonUserItem.name,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.plusJakartaSans(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15161E),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    nonUserItem.phoneNumber,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF606A85),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await actions.sendWhatsappInvite(
                                                                                  nonUserItem.phoneNumber,
                                                                                );
                                                                              },
                                                                              text: 'Davet Et',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                                    if (_model.textFieldPhoneTextController
                                                                .text !=
                                                            null &&
                                                        _model.textFieldPhoneTextController
                                                                .text !=
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final phoneUser = _model
                                                                  .searchResultPhoneUser
                                                                  ?.toList() ??
                                                              [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: phoneUser
                                                                .length,
                                                            itemBuilder: (context,
                                                                phoneUserIndex) {
                                                              final phoneUserItem =
                                                                  phoneUser[
                                                                      phoneUserIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.confirmationPhoneCopy =
                                                                        await actions
                                                                            .getOrCreateMessage(
                                                                      currentUserReference!
                                                                          .id,
                                                                      phoneUserItem
                                                                          .userId,
                                                                      currentUserDisplayName,
                                                                      phoneUserItem
                                                                          .name,
                                                                      'phone',
                                                                      false,
                                                                    );
                                                                    _model.conversationNamePhoneCopy2 =
                                                                        await actions
                                                                            .getConversationName(
                                                                      _model
                                                                          .confirmationPhoneCopy!
                                                                          .reference,
                                                                    );
                                                                    _model.conversationIdCopy2 =
                                                                        await SQLiteManager
                                                                            .instance
                                                                            .getConversationWithLastMessage(
                                                                      conversationName:
                                                                          _model
                                                                              .conversationNamePhoneCopy2!,
                                                                      type:
                                                                          'phone',
                                                                    );
                                                                    _model.userPhoneDocumentRef2 =
                                                                        await actions
                                                                            .getUserDocRef(
                                                                      phoneUserItem
                                                                          .userId,
                                                                    );
                                                                    _model.userPhoneDocumentFB2 =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            _model.userPhoneDocumentRef2!);
                                                                    if (_model
                                                                            .confirmationPhone!
                                                                            .isUser1Blocked ||
                                                                        _model
                                                                            .confirmationPhone!
                                                                            .isUser2Blocked) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        MessageNewPageCopyWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'message':
                                                                              serializeParam(
                                                                            _model.confirmationPhoneCopy,
                                                                            ParamType.Document,
                                                                          ),
                                                                          'type':
                                                                              serializeParam(
                                                                            'phone',
                                                                            ParamType.String,
                                                                          ),
                                                                          'conversationId':
                                                                              serializeParam(
                                                                            _model.conversationIdCopy2?.lastOrNull?.id,
                                                                            ParamType.int,
                                                                          ),
                                                                          'receiverUser':
                                                                              serializeParam(
                                                                            _model.userPhoneDocumentFB2,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'message':
                                                                              _model.confirmationPhoneCopy,
                                                                          'receiverUser':
                                                                              _model.userPhoneDocumentFB2,
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      phoneUserItem.name,
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            font: GoogleFonts.plusJakartaSans(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                            color: Color(0xFF15161E),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            phoneUserItem.phoneNumber,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.outfit(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF606A85),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.chevron_right_rounded,
                                                                                          color: Color(0xFF606A85),
                                                                                          size: 24.0,
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
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    if (_model.textFieldPhoneTextController
                                                                .text !=
                                                            null &&
                                                        _model.textFieldPhoneTextController
                                                                .text !=
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final nonUserItem = _model
                                                                  .searchResultPhoneNonUser
                                                                  ?.toList() ??
                                                              [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                nonUserItem
                                                                    .length,
                                                            itemBuilder: (context,
                                                                nonUserItemIndex) {
                                                              final nonUserItemItem =
                                                                  nonUserItem[
                                                                      nonUserItemIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  nonUserItemItem.name,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.plusJakartaSans(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xFF15161E),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    nonUserItemItem.phoneNumber,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF606A85),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await actions.sendWhatsappInvite(
                                                                                  nonUserItemItem.phoneNumber,
                                                                                );
                                                                              },
                                                                              text: 'Davet Et',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 8.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldWorkplaceTextController,
                                                        focusNode: _model
                                                            .textFieldWorkplaceFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldWorkplaceTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            _model.searchResultWorkplace =
                                                                await SQLiteManager
                                                                    .instance
                                                                    .searchCompanyWorkersByName(
                                                              userName: _model
                                                                  .textFieldWorkplaceTextController
                                                                  .text,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              'İşyerinde ara ....',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF644646),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
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
                                                                  color: Colors
                                                                      .white,
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
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textFieldWorkplaceTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final workPlaceMessage =
                                                            chatMessageRecordList
                                                                .where((e) =>
                                                                    e.hasLastMessageTimeWorkplace() &&
                                                                    !e
                                                                        .isUser1Blocked &&
                                                                    !e
                                                                        .isUser2Blocked)
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.lastMessageTimeWorkplace!,
                                                                    desc: true)
                                                                .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              workPlaceMessage
                                                                  .length,
                                                          itemBuilder: (context,
                                                              workPlaceMessageIndex) {
                                                            final workPlaceMessageItem =
                                                                workPlaceMessage[
                                                                    workPlaceMessageIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.conversationName =
                                                                      await actions
                                                                          .getConversationName(
                                                                    workPlaceMessageItem
                                                                        .reference,
                                                                  );
                                                                  _model.conversationId =
                                                                      await SQLiteManager
                                                                          .instance
                                                                          .getConversationWithLastMessage(
                                                                    conversationName:
                                                                        _model
                                                                            .conversationName!,
                                                                    type:
                                                                        'workplace',
                                                                  );
                                                                  if (workPlaceMessageItem
                                                                          .user1 ==
                                                                      currentUserReference) {
                                                                    _model.user2Workplace =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            workPlaceMessageItem.user2!);

                                                                    context
                                                                        .pushNamed(
                                                                      MessageNewPageCopyWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'message':
                                                                            serializeParam(
                                                                          workPlaceMessageItem,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'type':
                                                                            serializeParam(
                                                                          'workplace',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'conversationId':
                                                                            serializeParam(
                                                                          _model
                                                                              .conversationId
                                                                              ?.lastOrNull
                                                                              ?.id,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'receiverUser':
                                                                            serializeParam(
                                                                          _model
                                                                              .user2Workplace,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'message':
                                                                            workPlaceMessageItem,
                                                                        'receiverUser':
                                                                            _model.user2Workplace,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    _model.user1Workplace =
                                                                        await UsersRecord.getDocumentOnce(
                                                                            workPlaceMessageItem.user1!);

                                                                    context
                                                                        .pushNamed(
                                                                      MessageNewPageCopyWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'message':
                                                                            serializeParam(
                                                                          workPlaceMessageItem,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                        'type':
                                                                            serializeParam(
                                                                          'workplace',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'conversationId':
                                                                            serializeParam(
                                                                          _model
                                                                              .conversationId
                                                                              ?.lastOrNull
                                                                              ?.id,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'receiverUser':
                                                                            serializeParam(
                                                                          _model
                                                                              .user1Workplace,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'message':
                                                                            workPlaceMessageItem,
                                                                        'receiverUser':
                                                                            _model.user1Workplace,
                                                                      },
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              UsersRecord>(
                                                                            stream: UsersRecord.getDocument(workPlaceMessageItem.user1 == currentUserReference
                                                                                ? workPlaceMessageItem.user2!
                                                                                : workPlaceMessageItem.user1!),
                                                                            builder:
                                                                                (context, snapshot) {
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

                                                                              return Container(
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
                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                    child: Image.network(
                                                                                      containerUsersRecord.photoUrl,
                                                                                      width: 44.0,
                                                                                      height: 44.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        flex: 6,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Text(
                                                                                            workPlaceMessageItem.user1 == currentUserReference ? workPlaceMessageItem.user2Name : workPlaceMessageItem.user1Name,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.plusJakartaSans(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF15161E),
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        flex: 4,
                                                                                        child: Container(
                                                                                          height: 20.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", workPlaceMessageItem.lastMessageTimeWorkplace!),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        flex: 8,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            workPlaceMessageItem.lastMessageWorkplace.maybeHandleOverflow(
                                                                                              maxChars: 50,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  font: GoogleFonts.outfit(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF606A85),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FutureBuilder<int>(
                                                                                        future: queryNewMessagesRecordCount(
                                                                                          parent: currentUserReference,
                                                                                          queryBuilder: (newMessagesRecord) => newMessagesRecord
                                                                                              .where(
                                                                                                'messageRef',
                                                                                                isEqualTo: workPlaceMessageItem.reference,
                                                                                              )
                                                                                              .where(
                                                                                                'type',
                                                                                                isEqualTo: 'workplace',
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
                                                                                          int containerCount = snapshot.data!;

                                                                                          return Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Visibility(
                                                                                              visible: containerCount > 0,
                                                                                              child: Container(
                                                                                                width: 24.0,
                                                                                                height: 24.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFFFEE00),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Visibility(
                                                                                                  visible: containerCount > 0,
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      containerCount.toString(),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.black,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
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
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  if (_model.textFieldWorkplaceTextController
                                                              .text ==
                                                          null ||
                                                      _model.textFieldWorkplaceTextController
                                                              .text ==
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              GetWorkersWithoutSpeechRow>>(
                                                        future: SQLiteManager
                                                            .instance
                                                            .getWorkersWithoutSpeech(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final listViewGetWorkersWithoutSpeechRowList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewGetWorkersWithoutSpeechRowList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewGetWorkersWithoutSpeechRow =
                                                                  listViewGetWorkersWithoutSpeechRowList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    listViewGetWorkersWithoutSpeechRow.userName,
                                                                                    'İsim',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'rolü: ${listViewGetWorkersWithoutSpeechRow.roleName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'birimi: ${listViewGetWorkersWithoutSpeechRow.unitName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'departmanı: ${listViewGetWorkersWithoutSpeechRow.departmentName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                if (listViewGetWorkersWithoutSpeechRow.userId == currentUserReference?.id) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Kendinize mesaj gönderemezsiniz',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  _model.receiverUserRef = await actions.getUserDocRef(
                                                                                    listViewGetWorkersWithoutSpeechRow.userId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.receiverUser = await UsersRecord.getDocumentOnce(_model.receiverUserRef!);
                                                                                  _shouldSetState = true;
                                                                                  _model.companyRef = await actions.getCompanyDocRef(
                                                                                    listViewGetWorkersWithoutSpeechRow.companyId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.companyDetail = await CompaniesRecord.getDocumentOnce(_model.companyRef!);
                                                                                  _shouldSetState = true;
                                                                                  if (_model.companyDetail?.owner == currentUserReference) {
                                                                                    _model.confirmationWorkplace = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      listViewGetWorkersWithoutSpeechRow.userId,
                                                                                      currentUserDisplayName,
                                                                                      listViewGetWorkersWithoutSpeechRow.userName!,
                                                                                      'workplace',
                                                                                      true,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameWorkplace = await actions.getConversationName(
                                                                                      _model.confirmationWorkplace!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUser!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkPlace.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Başladı',
                                                                                        relatedDoc: _model.confirmationWorkplace?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetail?.name} isimli şirketteki${currentUserDisplayName} isimli kişi mesajlaşma başlattı',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });

                                                                                    await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: listViewGetWorkersWithoutSpeechRow.userName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationWorkplace?.reference,
                                                                                      messageType: 'workplace',
                                                                                    ));

                                                                                    await AllConfirmationsRecord.createDoc(_model.receiverUser!.reference).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: currentUserDisplayName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationWorkplace?.reference,
                                                                                      messageType: 'workplace',
                                                                                    ));
                                                                                    _model.coversationDetailSqlWorkplace = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                      type: 'workplace',
                                                                                      conversationName: _model.conversationNameWorkplace!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.confirmationWorkplace!.isUser1Blocked || _model.confirmationWorkplace!.isUser2Blocked) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.pushNamed(
                                                                                      MessageNewPageCopyWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'message': serializeParam(
                                                                                          _model.confirmationWorkplace,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'type': serializeParam(
                                                                                          'workplace',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'conversationId': serializeParam(
                                                                                          _model.coversationDetailSqlWorkplace?.lastOrNull?.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'receiverUser': serializeParam(
                                                                                          _model.receiverUser,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'message': _model.confirmationWorkplace,
                                                                                        'receiverUser': _model.receiverUser,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    _model.confirmationWorkplaceCopy = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      listViewGetWorkersWithoutSpeechRow.userId,
                                                                                      currentUserDisplayName,
                                                                                      listViewGetWorkersWithoutSpeechRow.userName!,
                                                                                      'workplace',
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameWorkplaceCopy = await actions.getConversationName(
                                                                                      _model.confirmationWorkplaceCopy!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUser!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkplaceRequest.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Talebi',
                                                                                        relatedDoc: _model.confirmationWorkplaceCopy?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetail?.name} isimli şirketteki${currentUserDisplayName} isimli kişi size İşyeri içi mesajlaşma isteği gönderdi',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Talep Gönderildi',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    if (_model.confirmationWorkplaceCopy!.isAcceptWorkPlace) {
                                                                                      _model.coversationDetailSqlWorkplaceCopy = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                        type: 'workplace',
                                                                                        conversationName: _model.conversationNameWorkplaceCopy!,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (_model.confirmationWorkplaceCopy!.isUser1Blocked || _model.confirmationWorkplaceCopy!.isUser2Blocked) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }

                                                                                      context.pushNamed(
                                                                                        MessageNewPageCopyWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'message': serializeParam(
                                                                                            _model.confirmationWorkplaceCopy,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'type': serializeParam(
                                                                                            'workplace',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'conversationId': serializeParam(
                                                                                            _model.coversationDetailSqlWorkplaceCopy?.lastOrNull?.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'receiverUser': serializeParam(
                                                                                            _model.receiverUser,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'message': _model.confirmationWorkplaceCopy,
                                                                                          'receiverUser': _model.receiverUser,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      context.safePop();

                                                                                      await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: listViewGetWorkersWithoutSpeechRow.userName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationWorkplaceCopy?.reference,
                                                                                        messageType: 'workplace',
                                                                                      ));

                                                                                      await AllConfirmationsRecord.createDoc(_model.receiverUser!.reference).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: currentUserDisplayName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationWorkplaceCopy?.reference,
                                                                                        messageType: 'workplace',
                                                                                      ));
                                                                                    }
                                                                                  }

                                                                                  await _model.receiverUser!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'Seç',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                                  if (_model.textFieldWorkplaceTextController
                                                              .text !=
                                                          null &&
                                                      _model.textFieldWorkplaceTextController
                                                              .text !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final searchResultWorkplaceItem =
                                                              _model.searchResultWorkplace
                                                                      ?.toList() ??
                                                                  [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                searchResultWorkplaceItem
                                                                    .length,
                                                            itemBuilder: (context,
                                                                searchResultWorkplaceItemIndex) {
                                                              final searchResultWorkplaceItemItem =
                                                                  searchResultWorkplaceItem[
                                                                      searchResultWorkplaceItemIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  searchResultWorkplaceItemItem.userName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'rolü: ${searchResultWorkplaceItemItem.roleName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'birimi: ${searchResultWorkplaceItemItem.unitName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'departmanı: ${searchResultWorkplaceItemItem.departmentName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                if (searchResultWorkplaceItemItem.userId == currentUserReference?.id) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Kendinize mesaj gönderemezsiniz',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  _model.receiverUserRefCopy = await actions.getUserDocRef(
                                                                                    searchResultWorkplaceItemItem.userId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.receiverUserCopy = await UsersRecord.getDocumentOnce(_model.receiverUserRefCopy!);
                                                                                  _shouldSetState = true;
                                                                                  _model.companyRefCopy = await actions.getCompanyDocRef(
                                                                                    searchResultWorkplaceItemItem.companyId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.companyDetailCopy = await CompaniesRecord.getDocumentOnce(_model.companyRefCopy!);
                                                                                  _shouldSetState = true;
                                                                                  if (_model.companyDetailCopy?.owner == currentUserReference) {
                                                                                    _model.confirmationWorkplaceCopy2 = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      searchResultWorkplaceItemItem.userId,
                                                                                      currentUserDisplayName,
                                                                                      searchResultWorkplaceItemItem.userName,
                                                                                      'workplace',
                                                                                      true,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameWorkplaceCopy2 = await actions.getConversationName(
                                                                                      _model.confirmationWorkplaceCopy2!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCopy!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkPlace.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Başladı',
                                                                                        relatedDoc: _model.confirmationWorkplaceCopy2?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCopy?.name} isimli şirketteki${currentUserDisplayName} isimli kişi mesajlaşma başlattı',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });

                                                                                    await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: searchResultWorkplaceItemItem.userName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationWorkplaceCopy2?.reference,
                                                                                      messageType: 'workplace',
                                                                                    ));

                                                                                    await AllConfirmationsRecord.createDoc(_model.receiverUserCopy!.reference).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: currentUserDisplayName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationWorkplaceCopy2?.reference,
                                                                                      messageType: 'workplace',
                                                                                    ));
                                                                                    _model.coversationDetailSqlWorkplaceCopy2 = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                      type: 'workplace',
                                                                                      conversationName: _model.conversationNameWorkplaceCopy2!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.confirmationWorkplaceCopy2!.isUser1Blocked || _model.confirmationWorkplaceCopy2!.isUser2Blocked) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.pushNamed(
                                                                                      MessageNewPageCopyWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'message': serializeParam(
                                                                                          _model.confirmationWorkplaceCopy2,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'type': serializeParam(
                                                                                          'workplace',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'conversationId': serializeParam(
                                                                                          _model.coversationDetailSqlWorkplaceCopy2?.lastOrNull?.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'receiverUser': serializeParam(
                                                                                          _model.receiverUserCopy,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'message': _model.confirmationWorkplaceCopy2,
                                                                                        'receiverUser': _model.receiverUserCopy,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    _model.confirmationWorkplaceCopy3 = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      searchResultWorkplaceItemItem.userId,
                                                                                      currentUserDisplayName,
                                                                                      searchResultWorkplaceItemItem.userName,
                                                                                      'workplace',
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameWorkplaceCopy3 = await actions.getConversationName(
                                                                                      _model.confirmationWorkplaceCopy3!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCopy!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkplaceRequest.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Talebi',
                                                                                        relatedDoc: _model.confirmationWorkplaceCopy3?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCopy?.name} isimli şirketteki${currentUserDisplayName} isimli kişi size İşyeri içi mesajlaşma isteği gönderdi',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Talep Gönderildi',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    if (_model.confirmationWorkplaceCopy3!.isAcceptWorkPlace) {
                                                                                      _model.coversationDetailSqlWorkplaceCopy3 = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                        type: 'workplace',
                                                                                        conversationName: _model.conversationNameWorkplaceCopy3!,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (_model.confirmationWorkplaceCopy3!.isUser1Blocked || _model.confirmationWorkplaceCopy3!.isUser2Blocked) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }

                                                                                      context.pushNamed(
                                                                                        MessageNewPageCopyWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'message': serializeParam(
                                                                                            _model.confirmationWorkplaceCopy3,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'type': serializeParam(
                                                                                            'workplace',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'conversationId': serializeParam(
                                                                                            _model.coversationDetailSqlWorkplaceCopy3?.lastOrNull?.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'receiverUser': serializeParam(
                                                                                            _model.receiverUserCopy,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'message': _model.confirmationWorkplaceCopy3,
                                                                                          'receiverUser': _model.receiverUserCopy,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      context.safePop();

                                                                                      await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: searchResultWorkplaceItemItem.userName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationWorkplaceCopy3?.reference,
                                                                                        messageType: 'workplace',
                                                                                      ));

                                                                                      await AllConfirmationsRecord.createDoc(_model.receiverUserCopy!.reference).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: currentUserDisplayName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationWorkplaceCopy3?.reference,
                                                                                        messageType: 'workplace',
                                                                                      ));
                                                                                    }
                                                                                  }

                                                                                  await _model.receiverUserCopy!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'Seç',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 8.0,
                                                                10.0, 8.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldCompanyTextController,
                                                        focusNode: _model
                                                            .textFieldCompanyFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldCompanyTextController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () async {
                                                            _model.searchResultCompany =
                                                                await SQLiteManager
                                                                    .instance
                                                                    .searchCompanyWorkersByName(
                                                              userName: _model
                                                                  .textFieldCompanyTextController
                                                                  .text,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              'şirkette ara ....',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF644646),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
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
                                                                  color: Colors
                                                                      .white,
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
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textFieldCompanyTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final workPlaceMessage =
                                                          chatMessageRecordList
                                                              .where((e) =>
                                                                  e.hasLastMessageTimeCompany() &&
                                                                  !e
                                                                      .isUser1Blocked &&
                                                                  !e
                                                                      .isUser2Blocked)
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.lastMessageTimeCompany!,
                                                                  desc: true)
                                                              .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            workPlaceMessage
                                                                .length,
                                                        itemBuilder: (context,
                                                            workPlaceMessageIndex) {
                                                          final workPlaceMessageItem =
                                                              workPlaceMessage[
                                                                  workPlaceMessageIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.conversationNameCompany =
                                                                    await actions
                                                                        .getConversationName(
                                                                  workPlaceMessageItem
                                                                      .reference,
                                                                );
                                                                _model.conversationIdCompany =
                                                                    await SQLiteManager
                                                                        .instance
                                                                        .getConversationWithLastMessage(
                                                                  conversationName:
                                                                      _model
                                                                          .conversationNameCompany!,
                                                                  type:
                                                                      'company',
                                                                );
                                                                if (workPlaceMessageItem
                                                                        .user1 ==
                                                                    currentUserReference) {
                                                                  _model.user2Company =
                                                                      await UsersRecord.getDocumentOnce(
                                                                          workPlaceMessageItem
                                                                              .user2!);

                                                                  context
                                                                      .pushNamed(
                                                                    MessageNewPageCopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'message':
                                                                          serializeParam(
                                                                        workPlaceMessageItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'company',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'conversationId':
                                                                          serializeParam(
                                                                        _model
                                                                            .conversationIdCompany
                                                                            ?.lastOrNull
                                                                            ?.id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'receiverUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .user2Company,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'message':
                                                                          workPlaceMessageItem,
                                                                      'receiverUser':
                                                                          _model
                                                                              .user2Company,
                                                                    },
                                                                  );
                                                                } else {
                                                                  _model.user1Company =
                                                                      await UsersRecord.getDocumentOnce(
                                                                          workPlaceMessageItem
                                                                              .user1!);

                                                                  context
                                                                      .pushNamed(
                                                                    MessageNewPageCopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'message':
                                                                          serializeParam(
                                                                        workPlaceMessageItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'company',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'conversationId':
                                                                          serializeParam(
                                                                        _model
                                                                            .conversationIdCompany
                                                                            ?.lastOrNull
                                                                            ?.id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'receiverUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .user1Company,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'message':
                                                                          workPlaceMessageItem,
                                                                      'receiverUser':
                                                                          _model
                                                                              .user1Company,
                                                                    },
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream: UsersRecord.getDocument(workPlaceMessageItem.user1 == currentUserReference
                                                                              ? workPlaceMessageItem.user2!
                                                                              : workPlaceMessageItem.user1!),
                                                                          builder:
                                                                              (context, snapshot) {
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

                                                                            final containerUsersRecord =
                                                                                snapshot.data!;

                                                                            return Container(
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
                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                  child: Image.network(
                                                                                    containerUsersRecord.photoUrl,
                                                                                    width: 44.0,
                                                                                    height: 44.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 6,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Text(
                                                                                          workPlaceMessageItem.user1 == currentUserReference ? workPlaceMessageItem.user2Name : workPlaceMessageItem.user1Name,
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.plusJakartaSans(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF15161E),
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                        child: Container(
                                                                                          height: 20.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat("relative", workPlaceMessageItem.lastMessageTimeCompany!),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 8,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          workPlaceMessageItem.lastMessageCompany.maybeHandleOverflow(
                                                                                            maxChars: 50,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.outfit(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF606A85),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    FutureBuilder<int>(
                                                                                      future: queryNewMessagesRecordCount(
                                                                                        parent: currentUserReference,
                                                                                        queryBuilder: (newMessagesRecord) => newMessagesRecord
                                                                                            .where(
                                                                                              'messageRef',
                                                                                              isEqualTo: workPlaceMessageItem.reference,
                                                                                            )
                                                                                            .where(
                                                                                              'type',
                                                                                              isEqualTo: 'company',
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
                                                                                        int containerCount = snapshot.data!;

                                                                                        return Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Visibility(
                                                                                            visible: containerCount > 0,
                                                                                            child: Container(
                                                                                              width: 24.0,
                                                                                              height: 24.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFFFFEE00),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Visibility(
                                                                                                visible: containerCount > 0,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerCount.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Colors.black,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
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
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  if (_model.textFieldCompanyTextController
                                                              .text ==
                                                          null ||
                                                      _model.textFieldCompanyTextController
                                                              .text ==
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              GetWorkersWithoutSpeechRow>>(
                                                        future: SQLiteManager
                                                            .instance
                                                            .getWorkersWithoutSpeech(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final listViewGetWorkersWithoutSpeechRowList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewGetWorkersWithoutSpeechRowList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewGetWorkersWithoutSpeechRow =
                                                                  listViewGetWorkersWithoutSpeechRowList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    listViewGetWorkersWithoutSpeechRow.userName,
                                                                                    'İsim',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'rolü: ${listViewGetWorkersWithoutSpeechRow.roleName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'birimi: ${listViewGetWorkersWithoutSpeechRow.unitName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'departmanı: ${listViewGetWorkersWithoutSpeechRow.departmentName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                if (listViewGetWorkersWithoutSpeechRow.userId == currentUserReference?.id) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Kendinize mesaj gönderemezsiniz',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  _model.userRefCompany = await actions.getUserDocRef(
                                                                                    listViewGetWorkersWithoutSpeechRow.userId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.companyRefCompany = await actions.getCompanyDocRef(
                                                                                    listViewGetWorkersWithoutSpeechRow.companyId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.receiverUserCompany = await UsersRecord.getDocumentOnce(_model.userRefCompany!);
                                                                                  _shouldSetState = true;
                                                                                  _model.companyDetailCompany = await CompaniesRecord.getDocumentOnce(_model.companyRefCompany!);
                                                                                  _shouldSetState = true;
                                                                                  if (_model.companyDetailCompany?.owner == currentUserReference) {
                                                                                    _model.confirmationCompany = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      listViewGetWorkersWithoutSpeechRow.userId,
                                                                                      currentUserDisplayName,
                                                                                      listViewGetWorkersWithoutSpeechRow.userName!,
                                                                                      'company',
                                                                                      true,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameCompanySelect = await actions.getConversationName(
                                                                                      _model.confirmationCompany!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCompany!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkPlace.name,
                                                                                        content: 'Şirket İçi Mesajlaşma Başladı',
                                                                                        relatedDoc: _model.confirmationCompany?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCompany?.name} isimli şirketteki${currentUserDisplayName} isimli kişi mesajlaşma başlattı',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });

                                                                                    await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: listViewGetWorkersWithoutSpeechRow.userName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationCompany?.reference,
                                                                                      messageType: 'company',
                                                                                    ));

                                                                                    await AllConfirmationsRecord.createDoc(_model.receiverUserCompany!.reference).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: currentUserDisplayName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationCompany?.reference,
                                                                                      messageType: 'company',
                                                                                    ));
                                                                                    _model.coversationDetailSqlCompany = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                      type: 'company',
                                                                                      conversationName: _model.conversationNameCompanySelect!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.confirmationCompany!.isUser1Blocked || _model.confirmationCompany!.isUser2Blocked) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.pushNamed(
                                                                                      MessageNewPageCopyWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'message': serializeParam(
                                                                                          _model.confirmationCompany,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'type': serializeParam(
                                                                                          'company',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'conversationId': serializeParam(
                                                                                          _model.coversationDetailSqlCompany?.lastOrNull?.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'receiverUser': serializeParam(
                                                                                          _model.receiverUserCompany,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'message': _model.confirmationCompany,
                                                                                        'receiverUser': _model.receiverUserCompany,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    _model.confirmationCompanyCopy = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      listViewGetWorkersWithoutSpeechRow.userId,
                                                                                      currentUserDisplayName,
                                                                                      listViewGetWorkersWithoutSpeechRow.userName!,
                                                                                      'company',
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameCompanyCopy = await actions.getConversationName(
                                                                                      _model.confirmationCompanyCopy!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCompany!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkplaceRequest.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Talebi',
                                                                                        relatedDoc: _model.confirmationCompanyCopy?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCompany?.name} isimli şirketteki${currentUserDisplayName} isimli kişi size İşyeri içi mesajlaşma isteği gönderdi',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Talep Gönderildi',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    if (_model.confirmationCompanyCopy!.isAcceptWorkPlace) {
                                                                                      _model.coversationDetailSqlCompanyCopy = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                        type: 'company',
                                                                                        conversationName: _model.conversationNameCompanyCopy!,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (_model.confirmationCompanyCopy!.isUser1Blocked && _model.confirmationCompanyCopy!.isUser2Blocked) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }

                                                                                      context.pushNamed(
                                                                                        MessageNewPageCopyWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'message': serializeParam(
                                                                                            _model.confirmationCompanyCopy,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'type': serializeParam(
                                                                                            'company',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'conversationId': serializeParam(
                                                                                            _model.coversationDetailSqlCompanyCopy?.lastOrNull?.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'receiverUser': serializeParam(
                                                                                            _model.receiverUserCompany,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'message': _model.confirmationCompanyCopy,
                                                                                          'receiverUser': _model.receiverUserCompany,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      context.safePop();

                                                                                      await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: listViewGetWorkersWithoutSpeechRow.userName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationCompanyCopy?.reference,
                                                                                        messageType: 'company',
                                                                                      ));

                                                                                      await AllConfirmationsRecord.createDoc(_model.receiverUserCompany!.reference).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: currentUserDisplayName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationCompanyCopy?.reference,
                                                                                        messageType: 'company',
                                                                                      ));
                                                                                    }
                                                                                  }

                                                                                  await _model.receiverUserCompany!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'Seç',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                                  if (_model.textFieldCompanyTextController
                                                              .text !=
                                                          null &&
                                                      _model.textFieldCompanyTextController
                                                              .text !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final searchResultCompanyItem =
                                                              _model.searchResultCompany
                                                                      ?.toList() ??
                                                                  [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                searchResultCompanyItem
                                                                    .length,
                                                            itemBuilder: (context,
                                                                searchResultCompanyItemIndex) {
                                                              final searchResultCompanyItemItem =
                                                                  searchResultCompanyItem[
                                                                      searchResultCompanyItemIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          12.0,
                                                                          12.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  searchResultCompanyItemItem.userName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'rolü: ${searchResultCompanyItemItem.roleName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'birimi: ${searchResultCompanyItemItem.unitName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'departmanı: ${searchResultCompanyItemItem.departmentName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                var _shouldSetState = false;
                                                                                if (searchResultCompanyItemItem.userId == currentUserReference?.id) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Kendinize mesaj gönderemezsiniz',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  _model.userRefCompanyCopy = await actions.getUserDocRef(
                                                                                    searchResultCompanyItemItem.userId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.companyRefCompanyCopy = await actions.getCompanyDocRef(
                                                                                    searchResultCompanyItemItem.companyId,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  _model.receiverUserCompanyCopy = await UsersRecord.getDocumentOnce(_model.userRefCompanyCopy!);
                                                                                  _shouldSetState = true;
                                                                                  _model.companyDetailCompanyCopy = await CompaniesRecord.getDocumentOnce(_model.companyRefCompanyCopy!);
                                                                                  _shouldSetState = true;
                                                                                  if (_model.companyDetailCompanyCopy?.owner == currentUserReference) {
                                                                                    _model.confirmationCompanyCopy2 = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      searchResultCompanyItemItem.userId,
                                                                                      currentUserDisplayName,
                                                                                      searchResultCompanyItemItem.userName,
                                                                                      'company',
                                                                                      true,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameCompanySelectCopy = await actions.getConversationName(
                                                                                      _model.confirmationCompanyCopy2!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCompanyCopy!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkPlace.name,
                                                                                        content: 'Şirket İçi Mesajlaşma Başladı',
                                                                                        relatedDoc: _model.confirmationCompanyCopy2?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCompanyCopy?.name} isimli şirketteki${currentUserDisplayName} isimli kişi mesajlaşma başlattı',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });

                                                                                    await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: searchResultCompanyItemItem.userName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationCompanyCopy2?.reference,
                                                                                      messageType: 'company',
                                                                                    ));

                                                                                    await AllConfirmationsRecord.createDoc(_model.receiverUserCompanyCopy!.reference).set(createAllConfirmationsRecordData(
                                                                                      isAccept: true,
                                                                                      receiverName: currentUserDisplayName,
                                                                                      createdRef: currentUserReference,
                                                                                      message: _model.confirmationCompanyCopy2?.reference,
                                                                                      messageType: 'company',
                                                                                    ));
                                                                                    _model.coversationDetailSqlCompanyCopy2 = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                      type: 'company',
                                                                                      conversationName: _model.conversationNameCompanySelectCopy!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (_model.confirmationCompanyCopy2!.isUser1Blocked || _model.confirmationCompanyCopy2!.isUser2Blocked) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.pushNamed(
                                                                                      MessageNewPageCopyWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'message': serializeParam(
                                                                                          _model.confirmationCompanyCopy2,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'type': serializeParam(
                                                                                          'company',
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'conversationId': serializeParam(
                                                                                          _model.coversationDetailSqlCompanyCopy2?.lastOrNull?.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'receiverUser': serializeParam(
                                                                                          _model.receiverUserCompany,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'message': _model.confirmationCompanyCopy2,
                                                                                        'receiverUser': _model.receiverUserCompany,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    _model.confirmationCompanyCopy3 = await actions.getOrCreateMessage(
                                                                                      currentUserReference!.id,
                                                                                      searchResultCompanyItemItem.userId,
                                                                                      currentUserDisplayName,
                                                                                      searchResultCompanyItemItem.userName,
                                                                                      'company',
                                                                                      false,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.conversationNameCompanyCopy2 = await actions.getConversationName(
                                                                                      _model.confirmationCompanyCopy3!.reference,
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await NotificationsRecord.createDoc(_model.receiverUserCompanyCopy!.reference).set({
                                                                                      ...createNotificationsRecordData(
                                                                                        type: NotificationTypes.confirmationWorkplaceRequest.name,
                                                                                        content: 'İşyeri İçi Mesajlaşma Talebi',
                                                                                        relatedDoc: _model.confirmationCompanyCopy3?.reference.id,
                                                                                        isRead: false,
                                                                                        isDelete: false,
                                                                                        fullDescription: '${_model.companyDetailCompanyCopy?.name} isimli şirketteki${currentUserDisplayName} isimli kişi size İşyeri içi mesajlaşma isteği gönderdi',
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'creationTime': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Talep Gönderildi',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                      ),
                                                                                    );
                                                                                    if (_model.confirmationCompanyCopy3!.isAcceptWorkPlace) {
                                                                                      _model.coversationDetailSqlCompanyCopy3 = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                        type: 'company',
                                                                                        conversationName: _model.conversationNameCompanyCopy2!,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (_model.confirmationCompanyCopy3!.isUser1Blocked || _model.confirmationCompanyCopy3!.isUser2Blocked) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }

                                                                                      context.pushNamed(
                                                                                        MessageNewPageCopyWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'message': serializeParam(
                                                                                            _model.confirmationCompanyCopy3,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'type': serializeParam(
                                                                                            'company',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'conversationId': serializeParam(
                                                                                            _model.coversationDetailSqlCompanyCopy3?.lastOrNull?.id,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'receiverUser': serializeParam(
                                                                                            _model.receiverUserCompany,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'message': _model.confirmationCompanyCopy3,
                                                                                          'receiverUser': _model.receiverUserCompany,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      context.safePop();

                                                                                      await AllConfirmationsRecord.createDoc(currentUserReference!).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: searchResultCompanyItemItem.userName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationCompanyCopy3?.reference,
                                                                                        messageType: 'company',
                                                                                      ));

                                                                                      await AllConfirmationsRecord.createDoc(_model.receiverUserCompanyCopy!.reference).set(createAllConfirmationsRecordData(
                                                                                        isAccept: false,
                                                                                        receiverName: currentUserDisplayName,
                                                                                        createdRef: currentUserReference,
                                                                                        message: _model.confirmationCompanyCopy3?.reference,
                                                                                        messageType: 'company',
                                                                                      ));
                                                                                    }
                                                                                  }

                                                                                  await _model.receiverUserCompanyCopy!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'notificationCount': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              text: 'Seç',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
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
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final workPlaceMessage =
                                                          chatMessageRecordList
                                                              .where((e) =>
                                                                  e.hasLastMessageTimeSocial() &&
                                                                  !e
                                                                      .isUser1Blocked &&
                                                                  !e
                                                                      .isUser2Blocked)
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.lastMessageTimeSocial!,
                                                                  desc: true)
                                                              .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            workPlaceMessage
                                                                .length,
                                                        itemBuilder: (context,
                                                            workPlaceMessageIndex) {
                                                          final workPlaceMessageItem =
                                                              workPlaceMessage[
                                                                  workPlaceMessageIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.conversationNameSocial =
                                                                    await actions
                                                                        .getConversationName(
                                                                  workPlaceMessageItem
                                                                      .reference,
                                                                );
                                                                _model.conversationIdSocial =
                                                                    await SQLiteManager
                                                                        .instance
                                                                        .getConversationWithLastMessage(
                                                                  conversationName:
                                                                      _model
                                                                          .conversationNameSocial!,
                                                                  type:
                                                                      'social',
                                                                );
                                                                if (workPlaceMessageItem
                                                                        .user1 ==
                                                                    currentUserReference) {
                                                                  _model.user2Social =
                                                                      await UsersRecord.getDocumentOnce(
                                                                          workPlaceMessageItem
                                                                              .user2!);

                                                                  context
                                                                      .pushNamed(
                                                                    MessageNewPageCopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'message':
                                                                          serializeParam(
                                                                        workPlaceMessageItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'social',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'conversationId':
                                                                          serializeParam(
                                                                        _model
                                                                            .conversationIdSocial
                                                                            ?.firstOrNull
                                                                            ?.id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'receiverUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .user2Social,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'message':
                                                                          workPlaceMessageItem,
                                                                      'receiverUser':
                                                                          _model
                                                                              .user2Social,
                                                                    },
                                                                  );
                                                                } else {
                                                                  _model.user1Social =
                                                                      await UsersRecord.getDocumentOnce(
                                                                          workPlaceMessageItem
                                                                              .user1!);

                                                                  context
                                                                      .pushNamed(
                                                                    MessageNewPageCopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'message':
                                                                          serializeParam(
                                                                        workPlaceMessageItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'type':
                                                                          serializeParam(
                                                                        'social',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'conversationId':
                                                                          serializeParam(
                                                                        _model
                                                                            .conversationIdSocial
                                                                            ?.firstOrNull
                                                                            ?.id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'receiverUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .user1Social,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'message':
                                                                          workPlaceMessageItem,
                                                                      'receiverUser':
                                                                          _model
                                                                              .user1Social,
                                                                    },
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream: UsersRecord.getDocument(workPlaceMessageItem.user1 == currentUserReference
                                                                              ? workPlaceMessageItem.user2!
                                                                              : workPlaceMessageItem.user1!),
                                                                          builder:
                                                                              (context, snapshot) {
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

                                                                            final containerUsersRecord =
                                                                                snapshot.data!;

                                                                            return Container(
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
                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                  child: Image.network(
                                                                                    containerUsersRecord.photoUrl,
                                                                                    width: 44.0,
                                                                                    height: 44.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 6,
                                                                                      child: Text(
                                                                                        workPlaceMessageItem.user1 == currentUserReference ? workPlaceMessageItem.user2Name : workPlaceMessageItem.user1Name,
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              font: GoogleFonts.plusJakartaSans(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF15161E),
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Container(
                                                                                        height: 20.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: Text(
                                                                                                dateTimeFormat("relative", workPlaceMessageItem.lastMessageTimeSocial!),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 8,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          workPlaceMessageItem.lastMessageSocial.maybeHandleOverflow(
                                                                                            maxChars: 50,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.outfit(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                color: Color(0xFF606A85),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    FutureBuilder<int>(
                                                                                      future: queryNewMessagesRecordCount(
                                                                                        parent: currentUserReference,
                                                                                        queryBuilder: (newMessagesRecord) => newMessagesRecord
                                                                                            .where(
                                                                                              'messageRef',
                                                                                              isEqualTo: workPlaceMessageItem.reference,
                                                                                            )
                                                                                            .where(
                                                                                              'type',
                                                                                              isEqualTo: 'social',
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
                                                                                        int containerCount = snapshot.data!;

                                                                                        return Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Visibility(
                                                                                            visible: containerCount > 0,
                                                                                            child: Container(
                                                                                              width: 24.0,
                                                                                              height: 24.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFFFFEE00),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Visibility(
                                                                                                visible: containerCount > 0,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerCount.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Colors.black,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
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
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: PagedListView<
                                                        DocumentSnapshot<
                                                            Object?>?,
                                                        FriendsRecord>(
                                                      pagingController: _model
                                                          .setListViewController13(
                                                              FriendsRecord
                                                                  .collection(
                                                                      currentUserReference),
                                                              parent:
                                                                  currentUserReference),
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      reverse: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      builderDelegate:
                                                          PagedChildBuilderDelegate<
                                                              FriendsRecord>(
                                                        // Customize what your widget looks like when it's loading the first page.
                                                        firstPageProgressIndicatorBuilder:
                                                            (_) => Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        // Customize what your widget looks like when it's loading another page.
                                                        newPageProgressIndicatorBuilder:
                                                            (_) => Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        itemBuilder: (context,
                                                            _, listViewIndex) {
                                                          final listViewFriendsRecord =
                                                              _model.listViewPagingController13!
                                                                      .itemList![
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        12.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      listViewFriendsRecord
                                                                          .userRef!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerUsersRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  containerUsersRecord.displayName,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var _shouldSetState = false;
                                                                                _model.confirmationSocial = await actions.getOrCreateMessage(
                                                                                  currentUserReference!.id,
                                                                                  containerUsersRecord.reference.id,
                                                                                  currentUserDisplayName,
                                                                                  containerUsersRecord.displayName,
                                                                                  'social',
                                                                                  false,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.confirmationNameSocial = await actions.getConversationName(
                                                                                  _model.confirmationSocial!.reference,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                _model.conversationIdSocialCopy = await SQLiteManager.instance.getConversationWithLastMessage(
                                                                                  conversationName: _model.confirmationNameSocial!,
                                                                                  type: 'social',
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if (_model.confirmationSocial!.isUser1Blocked || _model.confirmationSocial!.isUser2Blocked) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Bu mesajlaşmaya erişiminiz kısıtlanmıştır.',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                                  );
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }

                                                                                context.pushNamed(
                                                                                  MessageNewPageCopyWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'message': serializeParam(
                                                                                      _model.confirmationSocial,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                    'type': serializeParam(
                                                                                      'social',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'conversationId': serializeParam(
                                                                                      _model.conversationIdSocialCopy?.lastOrNull?.id,
                                                                                      ParamType.int,
                                                                                    ),
                                                                                    'receiverUser': serializeParam(
                                                                                      containerUsersRecord,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'message': _model.confirmationSocial,
                                                                                    'receiverUser': containerUsersRecord,
                                                                                  },
                                                                                );

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.chevron_right_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
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
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets
                                                  .UserChatsWidget(
                                                width: double.infinity,
                                                height: double.infinity,
                                                authUser: currentUserReference!,
                                              ),
                                            ),
                                          ],
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
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.newNavBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NewNavBarWidget(
                            pageIndex: 4,
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
      },
    );
  }
}
