import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirmation_media_save_location_model.dart';
export 'confirmation_media_save_location_model.dart';

class ConfirmationMediaSaveLocationWidget extends StatefulWidget {
  const ConfirmationMediaSaveLocationWidget({
    super.key,
    required this.message,
  });

  final MessageRecord? message;

  @override
  State<ConfirmationMediaSaveLocationWidget> createState() =>
      _ConfirmationMediaSaveLocationWidgetState();
}

class _ConfirmationMediaSaveLocationWidgetState
    extends State<ConfirmationMediaSaveLocationWidget> {
  late ConfirmationMediaSaveLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationMediaSaveLocationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bu sohbetten indirilen yeni medya dosyaları cihazınızın galerisinde görüntülensin mi?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FlutterFlowRadioButton(
                    options: ['Evet', 'Hayır'].toList(),
                    onChanged: (val) async {
                      safeSetState(() {});
                      if (_model.radioButtonValue == 'Evet') {
                        _model.result =
                            await actions.requestGalleryPermission();
                        if (_model.result!) {
                          if (widget!.message?.user1 == currentUserReference) {
                            await widget!.message!.reference
                                .update(createMessageRecordData(
                              user1AllowMediaSave: true,
                            ));
                          } else {
                            await widget!.message!.reference
                                .update(createMessageRecordData(
                              user2AllowMediaSave: true,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Lütfen Gerekli izinleri verin.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          if (widget!.message?.user1 == currentUserReference) {
                            await widget!.message!.reference
                                .update(createMessageRecordData(
                              user1AllowMediaSave: false,
                            ));
                          } else {
                            await widget!.message!.reference
                                .update(createMessageRecordData(
                              user2AllowMediaSave: false,
                            ));
                          }
                        }
                      } else {
                        if (widget!.message?.user1 == currentUserReference) {
                          await widget!.message!.reference
                              .update(createMessageRecordData(
                            user1AllowMediaSave: false,
                          ));
                        } else {
                          await widget!.message!.reference
                              .update(createMessageRecordData(
                            user2AllowMediaSave: false,
                          ));
                        }
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tercihiniz Kaydedildi',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 1000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      context.safePop();
                      context.safePop();
                      context.safePop();

                      safeSetState(() {});
                    },
                    controller: _model.radioButtonValueController ??=
                        FormFieldController<String>(
                            widget!.message?.user1 == currentUserReference
                                ? (widget!.message!.user1AllowMediaSave
                                    ? 'Evet'
                                    : 'Hayır')
                                : (widget!.message!.user2AllowMediaSave
                                    ? 'Evet'
                                    : 'Hayır')),
                    optionHeight: 32.0,
                    textStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                    selectedTextStyle: FlutterFlowTheme.of(context)
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
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    buttonPosition: RadioButtonPosition.left,
                    direction: Axis.vertical,
                    radioButtonColor: Color(0xFF3AA800),
                    inactiveRadioButtonColor: Color(0xBA575757),
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
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
