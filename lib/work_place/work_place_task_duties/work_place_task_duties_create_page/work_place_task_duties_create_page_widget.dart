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
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'work_place_task_duties_create_page_model.dart';
export 'work_place_task_duties_create_page_model.dart';

class WorkPlaceTaskDutiesCreatePageWidget extends StatefulWidget {
  const WorkPlaceTaskDutiesCreatePageWidget({
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

  static String routeName = 'WorkPlaceTaskDutiesCreatePage';
  static String routePath = '/workPlaceTaskDutiesCreatePage';

  @override
  State<WorkPlaceTaskDutiesCreatePageWidget> createState() =>
      _WorkPlaceTaskDutiesCreatePageWidgetState();
}

class _WorkPlaceTaskDutiesCreatePageWidgetState
    extends State<WorkPlaceTaskDutiesCreatePageWidget> {
  late WorkPlaceTaskDutiesCreatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkPlaceTaskDutiesCreatePageModel());

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
        queryBuilder: (workPlaceWorkerRecord) => workPlaceWorkerRecord
            .where(
              'isDelete',
              isEqualTo: false,
            )
            .where(
              'isWorker',
              isEqualTo: true,
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
            workPlaceTaskDutiesCreatePageWorkPlaceWorkerRecordList =
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
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 36.0),
                            child: Text(
                              'Aşamalı görev özelliği sayesinde ekip üyelerine çok adımlı işler atayabilir, her adımı ayrı ayrı tanımlayarak görevlerin ilerleyişini sistem üzerinden kolayca takip edebilirsiniz.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                            padding: EdgeInsets.all(12.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: Text(
                                          'Görev Adı: ',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: 'Görev Adını Giriniz',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: Text(
                                          'Görevin Verileceği Çalışan: ',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue1 ??= '',
                                          ),
                                          options: List<String>.from(
                                              workPlaceTaskDutiesCreatePageWorkPlaceWorkerRecordList
                                                  .map((e) => e.user?.id)
                                                  .withoutNulls
                                                  .toList()),
                                          optionLabels:
                                              workPlaceTaskDutiesCreatePageWorkPlaceWorkerRecordList
                                                  .map((e) => e.userName)
                                                  .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownValue1 = val),
                                          width: 200.0,
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
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
                                          hintText:
                                              'Görevin Verileceği Kişiyi Seçiniz',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.black,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: Text(
                                          'Bu görevi siz ve atanan kişi dışında kimler görebilsin:',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: FlutterFlowDropDown<String>(
                                          multiSelectController: _model
                                                  .dropDownValueController2 ??=
                                              FormListFieldController<String>(
                                                  null),
                                          options: List<String>.from(
                                              workPlaceTaskDutiesCreatePageWorkPlaceWorkerRecordList
                                                  .map((e) => e.user?.id)
                                                  .withoutNulls
                                                  .toList()),
                                          optionLabels:
                                              workPlaceTaskDutiesCreatePageWorkPlaceWorkerRecordList
                                                  .map((e) => e.userName)
                                                  .toList(),
                                          width: 200.0,
                                          height: 40.0,
                                          textStyle: FlutterFlowTheme.of(
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
                                          hintText:
                                              'Kimler Raporu Görüntüleyebilir',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.black,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: true,
                                          onMultiSelectChanged: (val) =>
                                              safeSetState(() =>
                                                  _model.dropDownValue2 = val),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (widget.isPartner!) {
                                  if (!widget.canCreate!) {
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
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  if (widget.isWorker!) {
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
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }
                                }

                                _model.validate = true;
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  _model.validate = false;
                                }
                                if (_model.dropDownValue1 == null) {
                                  _model.validate = false;
                                }
                                _shouldSetState = true;
                                if (_model.validate!) {
                                  _model.userRef = await actions.getUserDocRef(
                                    _model.dropDownValue1!,
                                  );
                                  _shouldSetState = true;
                                  if (_model.dropDownValue2 != null &&
                                      (_model.dropDownValue2)!.isNotEmpty) {
                                    for (int loop1Index = 0;
                                        loop1Index < _model.whoCanSee.length;
                                        loop1Index++) {
                                      final currentLoop1Item =
                                          _model.whoCanSee[loop1Index];
                                      _model.userRefWhoCanSEe =
                                          await actions.getUserDocRef(
                                        currentLoop1Item.id,
                                      );
                                      _shouldSetState = true;
                                      _model.addToWhoCanSee(
                                          _model.userRefWhoCanSEe!);
                                    }
                                  }
                                  _model.companyDetail =
                                      await CompaniesRecord.getDocumentOnce(
                                          widget.company!);
                                  _shouldSetState = true;

                                  var dutiesForWorkPlaceRecordReference =
                                      DutiesForWorkPlaceRecord.createDoc(
                                          widget.workPlace!);
                                  await dutiesForWorkPlaceRecordReference.set({
                                    ...createDutiesForWorkPlaceRecordData(
                                      userRef: _model.userRef,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'visibleTo': _model.whoCanSee,
                                      },
                                    ),
                                  });
                                  _model.dutiesForWorkPlace =
                                      DutiesForWorkPlaceRecord
                                          .getDocumentFromData({
                                    ...createDutiesForWorkPlaceRecordData(
                                      userRef: _model.userRef,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'visibleTo': _model.whoCanSee,
                                      },
                                    ),
                                  }, dutiesForWorkPlaceRecordReference);
                                  _shouldSetState = true;

                                  var dutiesForCompanyRecordReference =
                                      DutiesForCompanyRecord.createDoc(
                                          widget.company!);
                                  await dutiesForCompanyRecordReference.set({
                                    ...createDutiesForCompanyRecordData(
                                      userRef: _model.userRef,
                                      companyRef: widget.company,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                      workPlaceRef: widget.workPlace,
                                      workPlaceDutiesForCompany:
                                          _model.dutiesForWorkPlace?.reference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'visibleTo': _model.whoCanSee,
                                      },
                                    ),
                                  });
                                  _model.dutiesForCompany =
                                      DutiesForCompanyRecord
                                          .getDocumentFromData({
                                    ...createDutiesForCompanyRecordData(
                                      userRef: _model.userRef,
                                      companyRef: widget.company,
                                      createdUserRef: currentUserReference,
                                      taskName: _model.textController.text,
                                      isComplete: false,
                                      isDelete: false,
                                      workPlaceRef: widget.workPlace,
                                      workPlaceDutiesForCompany:
                                          _model.dutiesForWorkPlace?.reference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'visibleTo': _model.whoCanSee,
                                      },
                                    ),
                                  }, dutiesForCompanyRecordReference);
                                  _shouldSetState = true;

                                  await NotificationsRecord.createDoc(
                                          _model.userRef!)
                                      .set({
                                    ...createNotificationsRecordData(
                                      type: NotificationTypes.dutiesTask.name,
                                      relatedDoc:
                                          _model.dutiesForCompany?.reference.id,
                                      isRead: false,
                                      isDelete: false,
                                      content: 'Sıralı Görev Eklendi',
                                      company: widget.company,
                                      fullDescription:
                                          '${_model.textController.text} isimli Sıralı Görev Eklendi',
                                      image: _model.companyDetail?.companyLogo,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'creationTime':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });

                                  await _model.userRef!.update({
                                    ...mapToFirestore(
                                      {
                                        'notificationCount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });

                                  await AjandaRecord.createDoc(
                                          currentUserReference!)
                                      .set({
                                    ...createAjandaRecordData(
                                      description: 'Aşamalı Görev Kuruldu',
                                      type: WorkHistoryTypes.createDuty.name,
                                      companyDuty:
                                          _model.dutiesForCompany?.reference,
                                      companyName: _model.companyDetail?.name,
                                      fullDescription:
                                          '${_model.dutiesForCompany?.taskName} Sıralı Görevi Oluşturuldu',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'dateTime':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });

                                  await AjandaRecord.createDoc(_model.userRef!)
                                      .set({
                                    ...createAjandaRecordData(
                                      description: 'Aşamalı Görev Eklendi',
                                      type: WorkHistoryTypes.startDuty.name,
                                      companyDuty:
                                          _model.dutiesForCompany?.reference,
                                      fullDescription:
                                          '${_model.dutiesForCompany?.taskName} Aşamalı Görevi Eklendi',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'dateTime':
                                            FieldValue.serverTimestamp(),
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
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );

                                  context.pushNamed(
                                    WorkPlaceTaskForDutyCreatePageWidget
                                        .routeName,
                                    queryParameters: {
                                      'company': serializeParam(
                                        widget.company,
                                        ParamType.DocumentReference,
                                      ),
                                      'workPlace': serializeParam(
                                        widget.workPlace,
                                        ParamType.DocumentReference,
                                      ),
                                      'isPartner': serializeParam(
                                        widget.isPartner,
                                        ParamType.bool,
                                      ),
                                      'canCreate': serializeParam(
                                        widget.canCreate,
                                        ParamType.bool,
                                      ),
                                      'dutiesForCompany': serializeParam(
                                        _model.dutiesForCompany?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'isWorker': serializeParam(
                                        widget.isWorker,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Görev Oluşturulamadı',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2750),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'Devam Et',
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
            ),
          ),
        );
      },
    );
  }
}
