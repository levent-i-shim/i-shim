import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'message_color_settings_page_model.dart';
export 'message_color_settings_page_model.dart';

class MessageColorSettingsPageWidget extends StatefulWidget {
  const MessageColorSettingsPageWidget({
    super.key,
    required this.message,
  });

  final MessageRecord? message;

  static String routeName = 'MessageColorSettingsPage';
  static String routePath = '/MessageColorSettingsPage';

  @override
  State<MessageColorSettingsPageWidget> createState() =>
      _MessageColorSettingsPageWidgetState();
}

class _MessageColorSettingsPageWidgetState
    extends State<MessageColorSettingsPageWidget> {
  late MessageColorSettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageColorSettingsPageModel());

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
        backgroundColor: Color(0xFF090620),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF090620),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    16.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 10.0, 4.0),
                                    child: GradientText(
                                      'Mesajlaşma Sayfası Renk Seçimi',
                                      textAlign: TextAlign.center,
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
                                            fontSize: 12.0,
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
                                      colors: [
                                        Color(0xFFCFEF06),
                                        Color(0xFF03F1E1),
                                        Color(0xFF29FA02),
                                        Colors.blue,
                                        Color(0xFF9391E6),
                                        Color(0xFFFFFF00),
                                        Color(0xFFECEBED)
                                      ],
                                      gradientDirection: GradientDirection.ltr,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 28,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.ColorSettingsWidget(
                                width: double.infinity,
                                height: double.infinity,
                                amIuser1: widget.message?.user1 ==
                                        currentUserReference
                                    ? true
                                    : false,
                                message: widget.message!.reference,
                              ),
                            ),
                          ),
                        ],
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
