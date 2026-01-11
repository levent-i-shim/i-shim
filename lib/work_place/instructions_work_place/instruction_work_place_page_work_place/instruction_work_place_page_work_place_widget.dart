import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'instruction_work_place_page_work_place_model.dart';
export 'instruction_work_place_page_work_place_model.dart';

class InstructionWorkPlacePageWorkPlaceWidget extends StatefulWidget {
  const InstructionWorkPlacePageWorkPlaceWidget({
    super.key,
    required this.workPlace,
    required this.company,
    required this.canCreateInstructions,
    required this.isPartner,
    required this.isWorker,
  });

  final DocumentReference? workPlace;
  final DocumentReference? company;
  final bool? canCreateInstructions;
  final bool? isPartner;
  final bool? isWorker;

  static String routeName = 'InstructionWorkPlacePageWorkPlace';
  static String routePath = '/instructionWorkPlacePageWorkPlace';

  @override
  State<InstructionWorkPlacePageWorkPlaceWidget> createState() =>
      _InstructionWorkPlacePageWorkPlaceWidgetState();
}

class _InstructionWorkPlacePageWorkPlaceWidgetState
    extends State<InstructionWorkPlacePageWorkPlaceWidget> {
  late InstructionWorkPlacePageWorkPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => InstructionWorkPlacePageWorkPlaceModel());

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                          width: 200.0,
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
                              hintText: 'Talimatı Girin',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            maxLines: null,
                            minLines: 3,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (widget!.isPartner!) {
                              if (!widget!.canCreateInstructions!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yetkiniz Yok',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              if (widget!.isWorker!) {
                                if (!widget!.canCreateInstructions!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Yetkiniz yok',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                            }

                            _model.validate = true;
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              safeSetState(() => _model.validate = false);
                              return;
                            }
                            _shouldSetState = true;
                            if (_model.validate!) {
                              _model.companyWorkers =
                                  await queryWorkPlaceWorkerRecordOnce(
                                parent: widget!.workPlace,
                                queryBuilder: (workPlaceWorkerRecord) =>
                                    workPlaceWorkerRecord
                                        .where(
                                          'isDelete',
                                          isEqualTo: false,
                                        )
                                        .where(
                                          'user',
                                          isNotEqualTo: currentUserReference,
                                        ),
                              );
                              _shouldSetState = true;

                              var instructionsRecordReference1 =
                                  InstructionsRecord.createDoc(
                                      currentUserReference!);
                              await instructionsRecordReference1.set({
                                ...createInstructionsRecordData(
                                  description: _model.textController.text,
                                  company: widget!.company,
                                  workPlace: widget!.workPlace,
                                  amISender: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.refInstruction =
                                  InstructionsRecord.getDocumentFromData({
                                ...createInstructionsRecordData(
                                  description: _model.textController.text,
                                  company: widget!.company,
                                  workPlace: widget!.workPlace,
                                  amISender: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationTime': DateTime.now(),
                                  },
                                ),
                              }, instructionsRecordReference1);
                              _shouldSetState = true;
                              for (int loop1Index = 0;
                                  loop1Index < _model.companyWorkers!.length;
                                  loop1Index++) {
                                final currentLoop1Item =
                                    _model.companyWorkers![loop1Index];

                                var instructionsRecordReference2 =
                                    InstructionsRecord.createDoc(
                                        currentLoop1Item.user!);
                                await instructionsRecordReference2.set({
                                  ...createInstructionsRecordData(
                                    description: _model.textController.text,
                                    company: widget!.company,
                                    workPlace: widget!.workPlace,
                                    amISender: false,
                                    id: _model.refInstruction?.reference.id,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.instruction =
                                    InstructionsRecord.getDocumentFromData({
                                  ...createInstructionsRecordData(
                                    description: _model.textController.text,
                                    company: widget!.company,
                                    workPlace: widget!.workPlace,
                                    amISender: false,
                                    id: _model.refInstruction?.reference.id,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime': DateTime.now(),
                                    },
                                  ),
                                }, instructionsRecordReference2);
                                _shouldSetState = true;

                                await NotificationsRecord.createDoc(
                                        currentLoop1Item.user!)
                                    .set({
                                  ...createNotificationsRecordData(
                                    type: NotificationTypes.instruction.name,
                                    content: 'Talimat Eklendi',
                                    relatedDoc:
                                        _model.instruction?.reference.id,
                                    isRead: false,
                                    isDelete: false,
                                    fullDescription: 'Yeni Talimat Eklendi',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationTime':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });

                                await currentLoop1Item.user!.update({
                                  ...mapToFirestore(
                                    {
                                      'notificationCount':
                                          FieldValue.increment(1),
                                    },
                                  ),
                                });
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'tüm Departman Çalışanlarına Gönderildi',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              context.safePop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Lütfen Talimat Giriniz',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: 'Talimat Gönderin',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
