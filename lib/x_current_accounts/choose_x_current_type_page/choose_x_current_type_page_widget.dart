import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_x_current_type_page_model.dart';
export 'choose_x_current_type_page_model.dart';

class ChooseXCurrentTypePageWidget extends StatefulWidget {
  const ChooseXCurrentTypePageWidget({super.key});

  static String routeName = 'chooseXCurrentTypePage';
  static String routePath = '/chooseXCurrentTypePage';

  @override
  State<ChooseXCurrentTypePageWidget> createState() =>
      _ChooseXCurrentTypePageWidgetState();
}

class _ChooseXCurrentTypePageWidgetState
    extends State<ChooseXCurrentTypePageWidget> {
  late ChooseXCurrentTypePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseXCurrentTypePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
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
        List<UsersRecord> chooseXCurrentTypePageUsersRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final chooseXCurrentTypePageUsersRecord =
            chooseXCurrentTypePageUsersRecordList.isNotEmpty
                ? chooseXCurrentTypePageUsersRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF060418),
            appBar: AppBar(
              backgroundColor: Color(0xFF060418),
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
                  HapticFeedback.heavyImpact();
                },
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 0.0, 2.0),
                      child: Text(
                        'Finansal Planlama',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 4.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.heavyImpact();
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF613EEA),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x7F613EEA),
                              )
                            ],
                            borderRadius: BorderRadius.circular(32.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 44.0,
                              height: 44.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/01.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF0D00DC),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Icon(
                        Icons.settings_sharp,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 80.0, 20.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        XCurrentAccountsPersonelWidget.routeName,
                        queryParameters: {
                          'activePageUserRef': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                          'activePageUserDocument': serializeParam(
                            chooseXCurrentTypePageUsersRecord,
                            ParamType.Document,
                          ),
                          'activeUserAuthorizedToMonitorCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToMonitor,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'activeUserAuthorizedToModifyCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToModify,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'activePageUserDocument':
                              chooseXCurrentTypePageUsersRecord,
                        },
                      );

                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      height: 72.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3C48), Color(0xFF060418)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF88FF00),
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                6.0,
                                0.0,
                                6.0),
                            child: Text(
                              'Kişisel Carilerim',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0),
                            child: FaIcon(
                              FontAwesomeIcons.userCheck,
                              color: Colors.white,
                              size: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        XCurrentAccountsIAmAuthorizedWorkerWidget.routeName,
                        queryParameters: {
                          'activePageUserRef': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                          'activePageUserDocument': serializeParam(
                            chooseXCurrentTypePageUsersRecord,
                            ParamType.Document,
                          ),
                          'activeUserAuthorizedToMonitorCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToMonitor,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'activeUserAuthorizedToModifyCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToModify,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'activePageUserDocument':
                              chooseXCurrentTypePageUsersRecord,
                        },
                      );

                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      height: 72.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3C48), Color(0xFF060418)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF88FF00),
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                6.0,
                                0.0,
                                6.0),
                            child: Text(
                              'Yetkilisi Olduğum Şirket Carileri',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0),
                            child: FaIcon(
                              FontAwesomeIcons.userShield,
                              color: Colors.white,
                              size: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        XCurrentAccountsWidget.routeName,
                        queryParameters: {
                          'activePageUserRef': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                          'activePageUserDocument': serializeParam(
                            chooseXCurrentTypePageUsersRecord,
                            ParamType.Document,
                          ),
                          'activeUserAuthorizedToMonitorCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToMonitor,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'activeUserAuthorizedToModifyCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToModify,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'activePageUserDocument':
                              chooseXCurrentTypePageUsersRecord,
                        },
                      );

                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      height: 72.0,
                      decoration: BoxDecoration(
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
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3C48), Color(0xFF060418)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF88FF00),
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                6.0,
                                0.0,
                                6.0),
                            child: Text(
                              'Ortağı Olduğum Şirket Carileri',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0),
                            child: FaIcon(
                              FontAwesomeIcons.usersCog,
                              color: Colors.white,
                              size: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        XCurrentAccountsWidget.routeName,
                        queryParameters: {
                          'activePageUserRef': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                          'activePageUserDocument': serializeParam(
                            chooseXCurrentTypePageUsersRecord,
                            ParamType.Document,
                          ),
                          'activeUserAuthorizedToMonitorCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToMonitor,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'activeUserAuthorizedToModifyCurrentAccounts':
                              serializeParam(
                            chooseXCurrentTypePageUsersRecord
                                ?.currentAccountsIAmAuthorizedToModify,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'activePageUserDocument':
                              chooseXCurrentTypePageUsersRecord,
                        },
                      );

                      HapticFeedback.heavyImpact();
                    },
                    child: Container(
                      height: 72.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3C48), Color(0xFF060418)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF88FF00),
                          width: 1.0,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                6.0,
                                0.0,
                                6.0),
                            child: Text(
                              'Sahibi Olduğum Şirket Carileri',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 20.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 100.0;
                                    } else {
                                      return 200.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0),
                            child: FaIcon(
                              FontAwesomeIcons.houseUser,
                              color: Colors.white,
                              size: 36.0,
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
        );
      },
    );
  }
}
