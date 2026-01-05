import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sirket_kur_model.dart';
export 'sirket_kur_model.dart';

class SirketKurWidget extends StatefulWidget {
  const SirketKurWidget({
    super.key,
    bool? invitation,
  }) : this.invitation = invitation ?? false;

  final bool invitation;

  static String routeName = 'SirketKur';
  static String routePath = '/KurCopy';

  @override
  State<SirketKurWidget> createState() => _SirketKurWidgetState();
}

class _SirketKurWidgetState extends State<SirketKurWidget> {
  late SirketKurModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SirketKurModel());

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
            'Giriş',
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
          child: Column(
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
                        colors: [Color(0xFF060418), Color(0xFF45050D)],
                        stops: [0.0, 0.6],
                        begin: AlignmentDirectional(-1.0, -0.34),
                        end: AlignmentDirectional(1.0, 0.34),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  LimitedSirketKurWidget.routeName,
                                  queryParameters: {
                                    'companyType': serializeParam(
                                      CompanyType.sahis.name,
                                      ParamType.String,
                                    ),
                                    'invitation': serializeParam(
                                      widget.invitation,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Şahıs Şirketi Kur',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF0200FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                hoverColor: Color(0xFFFF0003),
                                hoverTextColor: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  LimitedSirketKurWidget.routeName,
                                  queryParameters: {
                                    'companyType': serializeParam(
                                      CompanyType.limited.name,
                                      ParamType.String,
                                    ),
                                    'invitation': serializeParam(
                                      widget.invitation,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Limited Şirketi Kur',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF0200FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                hoverColor: Color(0xFF3FFF00),
                                hoverTextColor: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  LimitedSirketKurWidget.routeName,
                                  queryParameters: {
                                    'companyType': serializeParam(
                                      CompanyType.anonim.name,
                                      ParamType.String,
                                    ),
                                    'invitation': serializeParam(
                                      widget.invitation,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Anonim Şirketi Kur',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF0200FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                hoverColor: Color(0xFF3FFF00),
                                hoverTextColor: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
