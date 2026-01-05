import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'work_place_add_vehicle_payment_page_model.dart';
export 'work_place_add_vehicle_payment_page_model.dart';

class WorkPlaceAddVehiclePaymentPageWidget extends StatefulWidget {
  const WorkPlaceAddVehiclePaymentPageWidget({
    super.key,
    required this.company,
    required this.vehicle,
    required this.isPartner,
    required this.canCreate,
    required this.workPlace,
    required this.isWorker,
    required this.type,
  });

  final DocumentReference? company;
  final CompanyVehiclesRecord? vehicle;
  final bool? isPartner;
  final bool? canCreate;
  final DocumentReference? workPlace;
  final bool? isWorker;
  final String? type;

  static String routeName = 'WorkPlaceAddVehiclePaymentPage';
  static String routePath = '/workPlaceAddVehiclePaymentPage';

  @override
  State<WorkPlaceAddVehiclePaymentPageWidget> createState() =>
      _WorkPlaceAddVehiclePaymentPageWidgetState();
}

class _WorkPlaceAddVehiclePaymentPageWidgetState
    extends State<WorkPlaceAddVehiclePaymentPageWidget> {
  late WorkPlaceAddVehiclePaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkPlaceAddVehiclePaymentPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.isWorker ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      'Onaylayacak Kişi:',
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
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<
                                          List<WorkPlaceWorkerRecord>>(
                                        stream: queryWorkPlaceWorkerRecord(
                                          parent: widget.workPlace,
                                          queryBuilder:
                                              (workPlaceWorkerRecord) =>
                                                  workPlaceWorkerRecord
                                                      .where(
                                                        'canAcceptTransaction',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'isDelete',
                                                        isEqualTo: false,
                                                      ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<WorkPlaceWorkerRecord>
                                              dropDownWorkPlaceWorkerRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                dropDownWorkPlaceWorkerRecordList
                                                    .map((e) => e.user?.id)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownWorkPlaceWorkerRecordList
                                                    .map((e) => e.userName)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            hintText: 'Select...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Color(0xFE000000),
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'Açıklama:',
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
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
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
                                        hintText: 'Açıklama',
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textController1Validator
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'Tutar:',
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
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
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
                                        hintText: 'Tutar',
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
                                      keyboardType: TextInputType.number,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textController2Validator
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'Tür:',
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
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownTypeValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownTypeValue ??= 'Bakım',
                                    ),
                                    options:
                                        List<String>.from(['Yakıt', 'Bakım']),
                                    optionLabels: ['Yakıt', 'Bakım'],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownTypeValue = val);
                                      _model.isFuel =
                                          _model.dropDownTypeValue == 'Yakıt'
                                              ? true
                                              : false;
                                      safeSetState(() {});
                                    },
                                    width: 200.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                    hintText: 'Select...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.black,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
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
                    if (!widget.isWorker!)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      'Ödeme Kime Yapıldı',
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
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController3,
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Ödeme Kime Yapıldı',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textController3Validator
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
                    if (widget.type != 'construction')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      'KM:',
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
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController4,
                                        focusNode: _model.textFieldFocusNode4,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Kilometre',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textController4Validator
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
                    if (widget.type == 'construction')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      'Çalışma Saati:',
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
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController5,
                                        focusNode: _model.textFieldFocusNode5,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Çalışma Saati',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textController5Validator
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
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fotoğraf:',
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() => _model
                                              .isDataUploading_uploadDataRshddf =
                                          true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading_uploadDataRshddf =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadDataRshddf =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  text: 'SEÇ',
                                  options: FFButtonOptions(
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.memory(
                        _model.uploadedLocalFile_uploadDataRshddf.bytes ??
                            Uint8List.fromList([]),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.validate = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(() => _model.validate = false);
                            return;
                          }
                          if (_model.dropDownTypeValue == null) {
                            _model.validate = false;
                            safeSetState(() {});
                            return;
                          }
                          _shouldSetState = true;
                          if (_model.validate!) {
                            if (_model.isFuel) {
                              if (widget.type == 'construction') {
                                if (widget.vehicle!.workingHours >=
                                    (double.parse(
                                        _model.textController5.text))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Girilen çalışma saati, önceki toplam çalışma süresinden daha düşük olamaz. Lütfen geçerli bir saat değeri giriniz',
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
                                if (widget.vehicle!.km >=
                                    (double.parse(valueOrDefault<String>(
                                      _model.textController4.text,
                                      '0',
                                    )))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Girilen Kilometre, önceki Kilometreden daha düşük olamaz. Lütfen geçerli bir Kilometre değeri giriniz.',
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
                            {
                              safeSetState(() => _model
                                  .isDataUploading_uploadDataMrxlo = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = _model
                                        .uploadedLocalFile_uploadDataRshddf
                                        .bytes!
                                        .isNotEmpty
                                    ? [
                                        _model
                                            .uploadedLocalFile_uploadDataRshddf
                                      ]
                                    : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadDataMrxlo = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadDataMrxlo =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadDataMrxlo =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            if (widget.isWorker!) {
                              var workPlaceVehiclePaymentsRecordReference1 =
                                  WorkPlaceVehiclePaymentsRecord.createDoc(
                                      widget.workPlace!);
                              await workPlaceVehiclePaymentsRecordReference1
                                  .set(createWorkPlaceVehiclePaymentsRecordData(
                                type: _model.dropDownTypeValue,
                                description: _model.textController1.text,
                                value: double.tryParse(
                                    _model.textController2.text),
                                image: _model.uploadedFileUrl_uploadDataMrxlo,
                                isAccept: false,
                                vehicle: widget.vehicle?.reference,
                                createdByUser: currentUserReference,
                                km: double.tryParse(
                                    _model.textController4.text),
                                workingHour: double.tryParse(
                                    _model.textController5.text),
                              ));
                              _model.workPlaceVehiclePayment =
                                  WorkPlaceVehiclePaymentsRecord.getDocumentFromData(
                                      createWorkPlaceVehiclePaymentsRecordData(
                                        type: _model.dropDownTypeValue,
                                        description:
                                            _model.textController1.text,
                                        value: double.tryParse(
                                            _model.textController2.text),
                                        image: _model
                                            .uploadedFileUrl_uploadDataMrxlo,
                                        isAccept: false,
                                        vehicle: widget.vehicle?.reference,
                                        createdByUser: currentUserReference,
                                        km: double.tryParse(
                                            _model.textController4.text),
                                        workingHour: double.tryParse(
                                            _model.textController5.text),
                                      ),
                                      workPlaceVehiclePaymentsRecordReference1);
                              _shouldSetState = true;

                              var companyVehiclePaymentsRecordReference1 =
                                  CompanyVehiclePaymentsRecord.createDoc(
                                      widget.company!);
                              await companyVehiclePaymentsRecordReference1
                                  .set(createCompanyVehiclePaymentsRecordData(
                                type: _model.dropDownTypeValue,
                                description: _model.textController1.text,
                                value: double.tryParse(
                                    _model.textController2.text),
                                image: _model.uploadedFileUrl_uploadDataMrxlo,
                                isAccept: false,
                                vehicle: widget.vehicle?.reference,
                                createdByUser: currentUserReference,
                                workPlaceVehiclePayment:
                                    _model.workPlaceVehiclePayment?.reference,
                                km: double.tryParse(
                                    _model.textController4.text),
                                workingHour: double.tryParse(
                                    _model.textController5.text),
                              ));
                              _model.companyVehiclePayment =
                                  CompanyVehiclePaymentsRecord.getDocumentFromData(
                                      createCompanyVehiclePaymentsRecordData(
                                        type: _model.dropDownTypeValue,
                                        description:
                                            _model.textController1.text,
                                        value: double.tryParse(
                                            _model.textController2.text),
                                        image: _model
                                            .uploadedFileUrl_uploadDataMrxlo,
                                        isAccept: false,
                                        vehicle: widget.vehicle?.reference,
                                        createdByUser: currentUserReference,
                                        workPlaceVehiclePayment: _model
                                            .workPlaceVehiclePayment?.reference,
                                        km: double.tryParse(
                                            _model.textController4.text),
                                        workingHour: double.tryParse(
                                            _model.textController5.text),
                                      ),
                                      companyVehiclePaymentsRecordReference1);
                              _shouldSetState = true;
                              _model.userRef = await actions.getUserDocRef(
                                _model.dropDownValue!,
                              );
                              _shouldSetState = true;

                              await WorkPlaceTransactionRecord.createDoc(
                                      widget.workPlace!)
                                  .set({
                                ...createWorkPlaceTransactionRecordData(
                                  name: 'Araç Gideri',
                                  description: _model.textController1.text,
                                  senderRef: currentUserReference,
                                  receiverRef: _model.userRef,
                                  totalAmount: double.tryParse(
                                      _model.textController2.text),
                                  isConfirmed: false,
                                  isRejected: false,
                                  vehiclePayment:
                                      _model.companyVehiclePayment?.reference,
                                  isConfirmedFromWorkPlace: false,
                                  isRejectedFromWorkPlace: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Onay için Gönderildi',
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

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Araç Gideri Eklendi',
                                  type: WorkHistoryTypes.addVehiclePayment.name,
                                  company: widget.company,
                                  fullDescription:
                                      '${_model.textController2.text} Tutarında ${_model.dropDownTypeValue} Masrafı Onaya Gönderildi.',
                                  vehiclePayment:
                                      _model.companyVehiclePayment?.reference,
                                  companyVehicle: widget.vehicle?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateTime': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              var workPlaceVehiclePaymentsRecordReference2 =
                                  WorkPlaceVehiclePaymentsRecord.createDoc(
                                      widget.workPlace!);
                              await workPlaceVehiclePaymentsRecordReference2
                                  .set(createWorkPlaceVehiclePaymentsRecordData(
                                type: _model.dropDownTypeValue,
                                description: _model.textController1.text,
                                value: double.tryParse(
                                    _model.textController2.text),
                                image: _model.uploadedFileUrl_uploadDataMrxlo,
                                isAccept: true,
                                vehicle: widget.vehicle?.reference,
                                createdByUser: currentUserReference,
                                km: double.tryParse(
                                    _model.textController4.text),
                                workingHour: double.tryParse(
                                    _model.textController5.text),
                              ));
                              _model.vehiclePaymentWorkPlaceOwner =
                                  WorkPlaceVehiclePaymentsRecord.getDocumentFromData(
                                      createWorkPlaceVehiclePaymentsRecordData(
                                        type: _model.dropDownTypeValue,
                                        description:
                                            _model.textController1.text,
                                        value: double.tryParse(
                                            _model.textController2.text),
                                        image: _model
                                            .uploadedFileUrl_uploadDataMrxlo,
                                        isAccept: true,
                                        vehicle: widget.vehicle?.reference,
                                        createdByUser: currentUserReference,
                                        km: double.tryParse(
                                            _model.textController4.text),
                                        workingHour: double.tryParse(
                                            _model.textController5.text),
                                      ),
                                      workPlaceVehiclePaymentsRecordReference2);
                              _shouldSetState = true;

                              var companyVehiclePaymentsRecordReference2 =
                                  CompanyVehiclePaymentsRecord.createDoc(
                                      widget.company!);
                              await companyVehiclePaymentsRecordReference2
                                  .set(createCompanyVehiclePaymentsRecordData(
                                type: _model.dropDownTypeValue,
                                description: _model.textController1.text,
                                value: double.tryParse(
                                    _model.textController2.text),
                                image: _model.uploadedFileUrl_uploadDataMrxlo,
                                isAccept: true,
                                vehicle: widget.vehicle?.reference,
                                createdByUser: currentUserReference,
                                workPlaceVehiclePayment: _model
                                    .vehiclePaymentWorkPlaceOwner?.reference,
                                km: double.tryParse(
                                    _model.textController4.text),
                                workingHour: double.tryParse(
                                    _model.textController5.text),
                              ));
                              _model.vehiclePaymentOwner =
                                  CompanyVehiclePaymentsRecord.getDocumentFromData(
                                      createCompanyVehiclePaymentsRecordData(
                                        type: _model.dropDownTypeValue,
                                        description:
                                            _model.textController1.text,
                                        value: double.tryParse(
                                            _model.textController2.text),
                                        image: _model
                                            .uploadedFileUrl_uploadDataMrxlo,
                                        isAccept: true,
                                        vehicle: widget.vehicle?.reference,
                                        createdByUser: currentUserReference,
                                        workPlaceVehiclePayment: _model
                                            .vehiclePaymentWorkPlaceOwner
                                            ?.reference,
                                        km: double.tryParse(
                                            _model.textController4.text),
                                        workingHour: double.tryParse(
                                            _model.textController5.text),
                                      ),
                                      companyVehiclePaymentsRecordReference2);
                              _shouldSetState = true;

                              var workPlacePayments2025RecordReference =
                                  WorkPlacePayments2025Record.createDoc(
                                      widget.workPlace!);
                              await workPlacePayments2025RecordReference.set({
                                ...createWorkPlacePayments2025RecordData(
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  type: _model.dropDownTypeValue,
                                  toWhom: _model.textController3.text,
                                  description: _model.textController1.text,
                                  vehicle: widget.vehicle?.reference,
                                  isExpected: false,
                                  isDelete: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.payment2workPlaceOwner =
                                  WorkPlacePayments2025Record
                                      .getDocumentFromData({
                                ...createWorkPlacePayments2025RecordData(
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  type: _model.dropDownTypeValue,
                                  toWhom: _model.textController3.text,
                                  description: _model.textController1.text,
                                  vehicle: widget.vehicle?.reference,
                                  isExpected: false,
                                  isDelete: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': DateTime.now(),
                                  },
                                ),
                              }, workPlacePayments2025RecordReference);
                              _shouldSetState = true;

                              var companyPayments2025RecordReference =
                                  CompanyPayments2025Record.createDoc(
                                      widget.company!);
                              await companyPayments2025RecordReference.set({
                                ...createCompanyPayments2025RecordData(
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  type: _model.dropDownTypeValue,
                                  toWhom: _model.textController3.text,
                                  description: _model.textController1.text,
                                  vehicle: widget.vehicle?.reference,
                                  isExpected: false,
                                  isDelete: false,
                                  workPlacePayment:
                                      _model.payment2workPlaceOwner?.reference,
                                  workPlace: widget.workPlace,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.payment2Owner = CompanyPayments2025Record
                                  .getDocumentFromData({
                                ...createCompanyPayments2025RecordData(
                                  value: double.tryParse(
                                      _model.textController2.text),
                                  type: _model.dropDownTypeValue,
                                  toWhom: _model.textController3.text,
                                  description: _model.textController1.text,
                                  vehicle: widget.vehicle?.reference,
                                  isExpected: false,
                                  isDelete: false,
                                  workPlacePayment:
                                      _model.payment2workPlaceOwner?.reference,
                                  workPlace: widget.workPlace,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': DateTime.now(),
                                  },
                                ),
                              }, companyPayments2025RecordReference);
                              _shouldSetState = true;

                              await widget.company!.update({
                                ...mapToFirestore(
                                  {
                                    'yearlyMoney': FieldValue.increment(
                                        -(double.parse(
                                            _model.textController2.text))),
                                    'totalMoney': FieldValue.increment(
                                        -(double.parse(
                                            _model.textController2.text))),
                                  },
                                ),
                              });

                              await widget.workPlace!.update({
                                ...mapToFirestore(
                                  {
                                    'yearlyMoney': FieldValue.increment(
                                        -(double.parse(
                                            _model.textController2.text))),
                                    'totalMoney': FieldValue.increment(
                                        -(double.parse(
                                            _model.textController2.text))),
                                  },
                                ),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Gider  Olarak Girildi',
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
                              if (_model.dropDownTypeValue == 'Yakıt') {
                                if (widget.vehicle?.type == 'construction') {
                                  _model.average =
                                      await actions.calculateCostVehicle(
                                    double.parse(_model.textController5.text),
                                    widget.vehicle!.workingHours,
                                    double.parse(_model.textController2.text),
                                    widget.vehicle!.averageLitersPerHour,
                                    widget.vehicle!.averageCounter,
                                  );
                                  _shouldSetState = true;

                                  await widget.vehicle!.reference.update({
                                    ...createCompanyVehiclesRecordData(
                                      workingHours: double.tryParse(
                                          _model.textController5.text),
                                      litersPerHour:
                                          _model.average?.firstOrNull,
                                      averageLitersPerHour:
                                          _model.average?.lastOrNull,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'totalPayment': FieldValue.increment(
                                            double.parse(
                                                _model.textController2.text)),
                                        'averageCounter':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });

                                  await widget.vehicle!.workPlaceVehicles!
                                      .update({
                                    ...createWorkPlaceVehicleRecordData(
                                      workingHours: double.tryParse(
                                          _model.textController5.text),
                                      litersPerHour:
                                          _model.average?.firstOrNull,
                                      averageLitersPerHour:
                                          _model.average?.lastOrNull,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'totalPayment': FieldValue.increment(
                                            double.parse(
                                                _model.textController2.text)),
                                        'averageCounter':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                } else {
                                  _model.average2 =
                                      await actions.calculateCostVehicle(
                                    double.parse(_model.textController4.text),
                                    widget.vehicle!.km,
                                    double.parse(_model.textController2.text),
                                    widget.vehicle!.averageLitersPerKm,
                                    widget.vehicle!.averageCounter,
                                  );
                                  _shouldSetState = true;

                                  await widget.vehicle!.reference.update({
                                    ...createCompanyVehiclesRecordData(
                                      km: double.tryParse(
                                          _model.textController4.text),
                                      litersPerKm: _model.average2?.firstOrNull,
                                      averageLitersPerKm:
                                          _model.average2?.lastOrNull,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'totalPayment': FieldValue.increment(
                                            double.parse(
                                                _model.textController2.text)),
                                        'averageCounter':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });

                                  await widget.vehicle!.workPlaceVehicles!
                                      .update({
                                    ...createWorkPlaceVehicleRecordData(
                                      km: double.tryParse(
                                          _model.textController4.text),
                                      litersPerKm: _model.average2?.firstOrNull,
                                      averageLitersPerKm:
                                          _model.average2?.lastOrNull,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'totalPayment': FieldValue.increment(
                                            double.parse(
                                                _model.textController2.text)),
                                        'averageCounter':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                }
                              } else {
                                await widget.vehicle!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'totalPayment': FieldValue.increment(
                                          double.parse(
                                              _model.textController2.text)),
                                    },
                                  ),
                                });

                                await widget.vehicle!.workPlaceVehicles!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'totalPayment': FieldValue.increment(
                                          double.parse(
                                              _model.textController2.text)),
                                    },
                                  ),
                                });
                              }
                            }

                            context.safePop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Tüm alanları Doldurunuz',
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
                        text: 'EKLE',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                            shadows: [
                              Shadow(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                              )
                            ],
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
        ),
      ),
    );
  }
}
