import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'person_instructions_page_work_place_model.dart';
export 'person_instructions_page_work_place_model.dart';

class PersonInstructionsPageWorkPlaceWidget extends StatefulWidget {
  const PersonInstructionsPageWorkPlaceWidget({
    super.key,
    required this.company,
    required this.workPlace,
    required this.isPartner,
    required this.canCreate,
    required this.isWorker,
  });

  final DocumentReference? company;
  final DocumentReference? workPlace;
  final bool? isPartner;
  final bool? canCreate;
  final bool? isWorker;

  static String routeName = 'PersonInstructionsPageWorkPlace';
  static String routePath = '/personInstructionsPageWorkPlace';

  @override
  State<PersonInstructionsPageWorkPlaceWidget> createState() =>
      _PersonInstructionsPageWorkPlaceWidgetState();
}

class _PersonInstructionsPageWorkPlaceWidgetState
    extends State<PersonInstructionsPageWorkPlaceWidget> {
  late PersonInstructionsPageWorkPlaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonInstructionsPageWorkPlaceModel());

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
    return StreamBuilder<List<WorkPlaceWorkerRecord>>(
      stream: queryWorkPlaceWorkerRecord(
        parent: widget.workPlace,
        queryBuilder: (workPlaceWorkerRecord) => workPlaceWorkerRecord.where(
          'isDelete',
          isEqualTo: false,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<WorkPlaceWorkerRecord>
            personInstructionsPageWorkPlaceWorkPlaceWorkerRecordList =
            snapshot.data!;

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                      hintText: 'Talimatı Girin',
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
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                                    maxLines: null,
                                    minLines: 3,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= '',
                                ),
                                options: List<String>.from(
                                    personInstructionsPageWorkPlaceWorkPlaceWorkerRecordList
                                        .map((e) => e.user?.id)
                                        .withoutNulls
                                        .toList()),
                                optionLabels:
                                    personInstructionsPageWorkPlaceWorkPlaceWorkerRecordList
                                        .map((e) => e.userName)
                                        .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue = val),
                                width: 200.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
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
                                hintText: 'Kişi Seç',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (widget.isPartner!) {
                                      if (!widget.canCreate!) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Yetkiniz Yok',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      if (widget.isWorker!) {
                                        if (!widget.canCreate!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Yetkiniz yok',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                    }

                                    _model.validate = true;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      safeSetState(
                                          () => _model.validate = false);
                                      return;
                                    }
                                    if (_model.dropDownValue == null) {
                                      _model.validate = false;
                                      safeSetState(() {});
                                      return;
                                    }
                                    _shouldSetState = true;
                                    if (_model.validate!) {
                                      _model.depRef =
                                          await actions.getUserDocRef(
                                        _model.dropDownValue!,
                                      );
                                      _shouldSetState = true;

                                      var instructionsRecordReference1 =
                                          InstructionsRecord.createDoc(
                                              currentUserReference!);
                                      await instructionsRecordReference1.set({
                                        ...createInstructionsRecordData(
                                          description:
                                              _model.textController.text,
                                          company: widget.company,
                                          workPlace: widget.workPlace,
                                          amISender: true,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.refInstruction = InstructionsRecord
                                          .getDocumentFromData({
                                        ...createInstructionsRecordData(
                                          description:
                                              _model.textController.text,
                                          company: widget.company,
                                          workPlace: widget.workPlace,
                                          amISender: true,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime': DateTime.now(),
                                          },
                                        ),
                                      }, instructionsRecordReference1);
                                      _shouldSetState = true;

                                      var instructionsRecordReference2 =
                                          InstructionsRecord.createDoc(
                                              _model.depRef!);
                                      await instructionsRecordReference2.set({
                                        ...createInstructionsRecordData(
                                          description:
                                              _model.textController.text,
                                          company: widget.company,
                                          workPlace: widget.workPlace,
                                          amISender: false,
                                          id: _model
                                              .refInstruction?.reference.id,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.instruction = InstructionsRecord
                                          .getDocumentFromData({
                                        ...createInstructionsRecordData(
                                          description:
                                              _model.textController.text,
                                          company: widget.company,
                                          workPlace: widget.workPlace,
                                          amISender: false,
                                          id: _model
                                              .refInstruction?.reference.id,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime': DateTime.now(),
                                          },
                                        ),
                                      }, instructionsRecordReference2);
                                      _shouldSetState = true;

                                      await NotificationsRecord.createDoc(
                                              _model.depRef!)
                                          .set({
                                        ...createNotificationsRecordData(
                                          type: NotificationTypes
                                              .instruction.name,
                                          content: 'Talimat Eklendi',
                                          relatedDoc:
                                              _model.instruction?.reference.id,
                                          isRead: false,
                                          isDelete: false,
                                          fullDescription:
                                              'Yeni Talimat Eklendi',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'creationTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });

                                      await _model.depRef!.update({
                                        ...mapToFirestore(
                                          {
                                            'notificationCount':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'tüm Departman Çalışanlarına Gönderildi',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      context.safePop();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Lütfen Talimat Giriniz',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
