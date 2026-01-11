import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_manual_payment_page_model.dart';
export 'add_manual_payment_page_model.dart';

class AddManualPaymentPageWidget extends StatefulWidget {
  const AddManualPaymentPageWidget({
    super.key,
    required this.company,
    required this.isEdit,
    this.companyPayment,
  });

  final DocumentReference? company;
  final bool? isEdit;
  final CompanyPayments2025Record? companyPayment;

  static String routeName = 'AddManualPaymentPage';
  static String routePath = '/addManualPaymentPage';

  @override
  State<AddManualPaymentPageWidget> createState() =>
      _AddManualPaymentPageWidgetState();
}

class _AddManualPaymentPageWidgetState
    extends State<AddManualPaymentPageWidget> {
  late AddManualPaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddManualPaymentPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.isEdit!) {
        safeSetState(() {
          _model.textFieldKaynakTextController?.text =
              widget!.companyPayment!.toWhom;
        });
        safeSetState(() {
          _model.textFieldDetailTextController?.text =
              widget!.companyPayment!.description;
        });
        safeSetState(() {
          _model.textFieldValueTextController?.text =
              widget!.companyPayment!.value.toString();
        });
        safeSetState(() {
          _model.dropDownTypeValueController?.value =
              widget!.companyPayment!.type;
          _model.dropDownTypeValue = widget!.companyPayment!.type;
        });
        safeSetState(() {
          _model.dropDownPeriodValueController?.value =
              widget!.companyPayment!.paymentPeriodTime;
          _model.dropDownPeriodValue =
              widget!.companyPayment!.paymentPeriodTime;
        });
        safeSetState(() {
          _model.dropDownWorkPlaceValueController?.value =
              widget!.companyPayment!.workPlace!.id;
          _model.dropDownWorkPlaceValue = widget!.companyPayment!.workPlace!.id;
        });
      }
    });

    _model.textFieldKaynakTextController ??= TextEditingController();
    _model.textFieldKaynakFocusNode ??= FocusNode();

    _model.textFieldDetailTextController ??= TextEditingController();
    _model.textFieldDetailFocusNode ??= FocusNode();

    _model.textFieldValueTextController ??= TextEditingController();
    _model.textFieldValueFocusNode ??= FocusNode();

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
          backgroundColor: Color(0xF4300232),
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
            'Gider Ekle',
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
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF060418), Color(0xF4300232)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Gider Kaynağı',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.textFieldKaynakTextController,
                                  focusNode: _model.textFieldKaynakFocusNode,
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
                                    hintText: 'Maaş, Kira vb.',
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
                                          color: Color(0xCF57636C),
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFBCD6DE),
                                    contentPadding: EdgeInsets.all(18.0),
                                  ),
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
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .textFieldKaynakTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 18.0, 0.0, 0.0),
                              child: Text(
                                'Gider Türü',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownTypeValueController ??=
                                        FormFieldController<String>(null),
                                options: [
                                  'Malzeme Giderleri',
                                  'İşçi Maaşları',
                                  'Yemek ve Servis Giderleri',
                                  'Makine ve Ekipman Giderleri',
                                  'Nakliye Giderleri',
                                  'Şantiye Kurulum Giderleri',
                                  'Resmi İzin ve Ruhsat Giderleri',
                                  'Yönetim ve İdari Giderler',
                                  'Güvenlik ve Sağlık Giderleri',
                                  'Vergi ve Yasal Giderler',
                                  'Akaryakıt',
                                  'Enerji & Elektrik',
                                  'Diğer'
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownTypeValue = val),
                                width: double.infinity,
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
                                hintText: 'Seçiniz',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Color(0xFFBCD6DE),
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 18.0, 0.0, 0.0),
                              child: Text(
                                'Gider Açıklaması',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.textFieldDetailTextController,
                                  focusNode: _model.textFieldDetailFocusNode,
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
                                    hintText: 'Gelir Detayları',
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
                                          color: Color(0xCF57636C),
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFBCD6DE),
                                    contentPadding: EdgeInsets.all(18.0),
                                  ),
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
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .textFieldDetailTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 18.0, 0.0, 0.0),
                              child: Text(
                                'Dönem',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownPeriodValueController ??=
                                        FormFieldController<String>(null),
                                options: ['Günlük', 'Haftalık', 'Aylık'],
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownPeriodValue = val),
                                width: double.infinity,
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
                                hintText: 'Seçiniz',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Color(0xFFBCD6DE),
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 18.0, 0.0, 0.0),
                              child: Text(
                                'Gider Tutarı',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.textFieldValueTextController,
                                  focusNode: _model.textFieldValueFocusNode,
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
                                    hintText: '0,00',
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
                                          color: Color(0xCF57636C),
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFBCD6DE),
                                    contentPadding: EdgeInsets.all(18.0),
                                  ),
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
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .textFieldValueTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (!widget!.isEdit!)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 18.0, 0.0, 0.0),
                                child: Text(
                                  'İş Yeri',
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            if (!widget!.isEdit!)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: StreamBuilder<List<WorkPlacesRecord>>(
                                  stream: queryWorkPlacesRecord(
                                    queryBuilder: (workPlacesRecord) =>
                                        workPlacesRecord
                                            .where(
                                              'isDelete',
                                              isEqualTo: false,
                                            )
                                            .where(
                                              'companyRef',
                                              isEqualTo: widget!.company,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<WorkPlacesRecord>
                                        dropDownWorkPlaceWorkPlacesRecordList =
                                        snapshot.data!;

                                    return FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownWorkPlaceValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownWorkPlaceValue ??= '',
                                      ),
                                      options: List<String>.from(
                                          dropDownWorkPlaceWorkPlacesRecordList
                                              .map((e) => e.reference.id)
                                              .toList()),
                                      optionLabels:
                                          dropDownWorkPlaceWorkPlacesRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                          _model.dropDownWorkPlaceValue = val),
                                      width: double.infinity,
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
                                      hintText: 'Seçiniz',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: Color(0xFFBCD6DE),
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
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget!.isEdit!) {
                          if (widget!.companyPayment!.hasPaymentPeriodTime()) {
                            _model.dailyOld = await actions.hesapla(
                              widget!.companyPayment!.paymentPeriodTime,
                              widget!.companyPayment!.value,
                            );
                            _model.dailynew = await actions.hesapla(
                              _model.dropDownPeriodValue!,
                              double.parse(
                                  _model.textFieldValueTextController.text),
                            );

                            await widget!.company!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'yearlyMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'dailyPayment': FieldValue.increment(
                                      (_model.dailynew!) - (_model.dailyOld!)),
                                },
                              ),
                            });

                            await widget!.companyPayment!.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'yearlyMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'dailyPayment': FieldValue.increment(
                                      (_model.dailynew!) - (_model.dailyOld!)),
                                },
                              ),
                            });
                          } else {
                            await widget!.company!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'yearlyMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                },
                              ),
                            });

                            await widget!.companyPayment!.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                  'yearlyMoney': FieldValue.increment(
                                      double.parse(_model
                                              .textFieldValueTextController
                                              .text) -
                                          widget!.companyPayment!.value),
                                },
                              ),
                            });
                          }

                          await widget!.companyPayment!.reference
                              .update(createCompanyPayments2025RecordData(
                            value: double.tryParse(
                                _model.textFieldValueTextController.text),
                            type: _model.dropDownTypeValue,
                            description:
                                _model.textFieldDetailTextController.text,
                            toWhom: _model.textFieldKaynakTextController.text,
                            paymentPeriodTime: _model.dropDownPeriodValue,
                          ));

                          await widget!.companyPayment!.workPlacePayment!
                              .update(createWorkPlacePayments2025RecordData(
                            value: double.tryParse(
                                _model.textFieldValueTextController.text),
                            type: _model.dropDownTypeValue,
                            description:
                                _model.textFieldDetailTextController.text,
                            toWhom: _model.textFieldKaynakTextController.text,
                            paymentPeriodTime: _model.dropDownPeriodValue,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Başarıyla Güncellendi',
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
                        } else {
                          _model.workPlace = await actions.getWorkPlaceDocRef(
                            _model.dropDownWorkPlaceValue!,
                          );

                          var workPlacePayments2025RecordReference =
                              WorkPlacePayments2025Record.createDoc(
                                  _model.workPlace!);
                          await workPlacePayments2025RecordReference.set({
                            ...createWorkPlacePayments2025RecordData(
                              value: double.tryParse(
                                  _model.textFieldValueTextController.text),
                              type: _model.dropDownTypeValue,
                              description:
                                  _model.textFieldDetailTextController.text,
                              isExpected: false,
                              isDelete: false,
                              paymentPeriodTime: _model.dropDownPeriodValue,
                              toWhom: _model.textFieldKaynakTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'date': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          _model.workPlacePaymnet =
                              WorkPlacePayments2025Record.getDocumentFromData({
                            ...createWorkPlacePayments2025RecordData(
                              value: double.tryParse(
                                  _model.textFieldValueTextController.text),
                              type: _model.dropDownTypeValue,
                              description:
                                  _model.textFieldDetailTextController.text,
                              isExpected: false,
                              isDelete: false,
                              paymentPeriodTime: _model.dropDownPeriodValue,
                              toWhom: _model.textFieldKaynakTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'date': DateTime.now(),
                              },
                            ),
                          }, workPlacePayments2025RecordReference);

                          await CompanyPayments2025Record.createDoc(
                                  widget!.company!)
                              .set({
                            ...createCompanyPayments2025RecordData(
                              value: double.tryParse(
                                  _model.textFieldValueTextController.text),
                              type: _model.dropDownTypeValue,
                              description:
                                  _model.textFieldDetailTextController.text,
                              isExpected: false,
                              isDelete: false,
                              paymentPeriodTime: _model.dropDownPeriodValue,
                              toWhom: _model.textFieldKaynakTextController.text,
                              workPlace: _model.workPlace,
                              workPlacePayment:
                                  _model.workPlacePaymnet?.reference,
                            ),
                            ...mapToFirestore(
                              {
                                'date': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          if (_model.dropDownPeriodValue != null &&
                              _model.dropDownPeriodValue != '') {
                            _model.daily = await actions.hesapla(
                              _model.dropDownPeriodValue!,
                              double.parse(
                                  _model.textFieldValueTextController.text),
                            );

                            await widget!.company!.update({
                              ...mapToFirestore(
                                {
                                  'dailyPayment':
                                      FieldValue.increment(_model.daily!),
                                  'totalMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                  'yearlyMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                },
                              ),
                            });

                            await _model.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'dailyPayment':
                                      FieldValue.increment(_model.daily!),
                                  'totalMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                  'yearlyMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                },
                              ),
                            });
                          } else {
                            await widget!.company!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                  'yearlyMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                },
                              ),
                            });

                            await _model.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                  'yearlyMoney': FieldValue.increment(
                                      -(double.parse(_model
                                          .textFieldValueTextController.text))),
                                },
                              ),
                            });
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Başarıyla Eklendi',
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
                        }

                        context.safePop();

                        safeSetState(() {});
                      },
                      text: 'Kaydet',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4E8BA3),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
