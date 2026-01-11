import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_task_step5_for_task_duties_model.dart';
export 'create_task_step5_for_task_duties_model.dart';

class CreateTaskStep5ForTaskDutiesWidget extends StatefulWidget {
  const CreateTaskStep5ForTaskDutiesWidget({
    super.key,
    required this.company,
    required this.workPlace,
    required this.workPlaceWorker,
    required this.canCreateForm,
  });

  final DocumentReference? company;
  final DocumentReference? workPlace;
  final WorkPlaceWorkerRecord? workPlaceWorker;
  final bool? canCreateForm;

  static String routeName = 'CreateTaskStep5ForTaskDuties';
  static String routePath = '/CreateTaskStep5ForTaskDuties';

  @override
  State<CreateTaskStep5ForTaskDutiesWidget> createState() =>
      _CreateTaskStep5ForTaskDutiesWidgetState();
}

class _CreateTaskStep5ForTaskDutiesWidgetState
    extends State<CreateTaskStep5ForTaskDutiesWidget> {
  late CreateTaskStep5ForTaskDutiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTaskStep5ForTaskDutiesModel());

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
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
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
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Bu Aşamalı Görev İçin Genel Bir Başlık Girmeniz Gerekmektedir.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Text(
                        'Görev İsmi:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
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
                            hintText: 'Görev Adını Giriniz',
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var dutiesForWorkPlaceRecordReference =
                                DutiesForWorkPlaceRecord.createDoc(
                                    widget!.workPlace!);
                            await dutiesForWorkPlaceRecordReference
                                .set(createDutiesForWorkPlaceRecordData(
                              userRef: widget!.workPlaceWorker?.user,
                              createdUserRef: currentUserReference,
                              taskName: _model.textController.text,
                              isComplete: false,
                              isDelete: false,
                            ));
                            _model.dutiesForWorkPlace =
                                DutiesForWorkPlaceRecord.getDocumentFromData(
                                    createDutiesForWorkPlaceRecordData(
                                      userRef: widget!.workPlaceWorker?.user,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                    ),
                                    dutiesForWorkPlaceRecordReference);

                            var dutiesForCompanyRecordReference =
                                DutiesForCompanyRecord.createDoc(
                                    widget!.company!);
                            await dutiesForCompanyRecordReference
                                .set(createDutiesForCompanyRecordData(
                              userRef: widget!.workPlaceWorker?.user,
                              companyRef: widget!.company,
                              createdUserRef: currentUserReference,
                              taskName: _model.textController.text,
                              isComplete: false,
                              isDelete: false,
                              workPlaceRef: widget!.workPlace,
                              workPlaceDutiesForCompany:
                                  _model.dutiesForWorkPlace?.reference,
                            ));
                            _model.dutiesForCompany =
                                DutiesForCompanyRecord.getDocumentFromData(
                                    createDutiesForCompanyRecordData(
                                      userRef: widget!.workPlaceWorker?.user,
                                      companyRef: widget!.company,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                      workPlaceRef: widget!.workPlace,
                                      workPlaceDutiesForCompany:
                                          _model.dutiesForWorkPlace?.reference,
                                    ),
                                    dutiesForCompanyRecordReference);
                            _model.companyDetail =
                                await CompaniesRecord.getDocumentOnce(
                                    widget!.company!);

                            await NotificationsRecord.createDoc(
                                    widget!.workPlaceWorker!.user!)
                                .set({
                              ...createNotificationsRecordData(
                                type: NotificationTypes.dutiesTask.name,
                                relatedDoc:
                                    _model.dutiesForCompany?.reference.id,
                                isRead: false,
                                isDelete: false,
                                content: 'Sıralı Görev Eklendi',
                                company: widget!.company,
                                fullDescription:
                                    '${_model.textController.text} isimli Sıralı Görev Eklendi',
                                image: _model.companyDetail?.companyLogo,
                              ),
                              ...mapToFirestore(
                                {
                                  'creationTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });

                            await widget!.workPlaceWorker!.user!.update({
                              ...mapToFirestore(
                                {
                                  'notificationCount': FieldValue.increment(1),
                                },
                              ),
                            });

                            await AjandaRecord.createDoc(currentUserReference!)
                                .set({
                              ...createAjandaRecordData(
                                description: 'Aşamalı Görev Kuruldu',
                                type: WorkHistoryTypes.createDuty.name,
                                companyDuty: _model.dutiesForCompany?.reference,
                                companyName: _model.companyDetail?.name,
                                fullDescription:
                                    '${_model.textController.text} Sıralı Görevi Oluşturuldu',
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });

                            await AjandaRecord.createDoc(
                                    widget!.workPlaceWorker!.user!)
                                .set({
                              ...createAjandaRecordData(
                                description: 'Aşamalı Görev Eklendi',
                                type: WorkHistoryTypes.startDuty.name,
                                companyDuty: _model.dutiesForCompany?.reference,
                                fullDescription:
                                    '${_model.textController.text} Aşamalı Görevi Eklendi',
                              ),
                              ...mapToFirestore(
                                {
                                  'dateTime': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Görev Başarı ile Oluşturuldu',
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

                            context.pushNamed(
                              CreateTaskStep6ForTaskDutiesWidget.routeName,
                              queryParameters: {
                                'companyName': serializeParam(
                                  _model.companyDetail?.name,
                                  ParamType.String,
                                ),
                                'dutiesForCompany': serializeParam(
                                  _model.dutiesForCompany?.reference,
                                  ParamType.DocumentReference,
                                ),
                                'company': serializeParam(
                                  widget!.company,
                                  ParamType.DocumentReference,
                                ),
                                'canCreateForm': serializeParam(
                                  widget!.canCreateForm,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            safeSetState(() {});
                          },
                          text: 'Görevi Oluştur',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
