import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sent_money_for_allowence_page_model.dart';
export 'sent_money_for_allowence_page_model.dart';

class SentMoneyForAllowencePageWidget extends StatefulWidget {
  const SentMoneyForAllowencePageWidget({
    super.key,
    required this.companyWorker,
    required this.company,
    required this.receiver,
  });

  final DocumentReference? companyWorker;
  final DocumentReference? company;
  final DocumentReference? receiver;

  static String routeName = 'sentMoneyForAllowencePage';
  static String routePath = '/sentMoneyForAllowencePage';

  @override
  State<SentMoneyForAllowencePageWidget> createState() =>
      _SentMoneyForAllowencePageWidgetState();
}

class _SentMoneyForAllowencePageWidgetState
    extends State<SentMoneyForAllowencePageWidget> {
  late SentMoneyForAllowencePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SentMoneyForAllowencePageModel());

    _model.priceTextController ??= TextEditingController();
    _model.priceFocusNode ??= FocusNode();

    _model.noteTextController ??= TextEditingController();
    _model.noteFocusNode ??= FocusNode();

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
            'Para Gönder',
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
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF060418), Color(0xF4300232)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 0.0),
                          child: Container(
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
                                    flex: 4,
                                    child: Text(
                                      'Gönderilecek Para Tutarı:',
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
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.priceTextController,
                                        focusNode: _model.priceFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Tutar',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF070707),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: EdgeInsets.all(8.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: _model
                                            .priceTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 0.0),
                          child: Container(
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
                                    flex: 4,
                                    child: Text(
                                      'Not:',
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
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.noteTextController,
                                        focusNode: _model.noteFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          hintText: 'Not',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF070707),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: EdgeInsets.all(8.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        validator: _model
                                            .noteTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 0.0),
                          child: Container(
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
                                    flex: 8,
                                    child: Text(
                                      'PDF Eklemek için:',
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
                                    flex: 4,
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          allowedExtensions: ['pdf'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataHqc =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataHqc =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataHqc =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.isUploadPdf = true;
                                      },
                                      text: 'Tıklayınız',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.copmanyDetailMoney =
                                  await CompaniesRecord.getDocumentOnce(
                                      widget.company!);
                              _model.companyWorkerDetail =
                                  await CompanyWorkersRecord.getDocumentOnce(
                                      widget.companyWorker!);
                              if (_model.isUploadPdf) {
                                {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadDataA64 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var selectedFiles = <SelectedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = _model
                                            .uploadedLocalFile_uploadDataHqc
                                            .bytes!
                                            .isNotEmpty
                                        ? [
                                            _model
                                                .uploadedLocalFile_uploadDataHqc
                                          ]
                                        : <FFUploadedFile>[];
                                    selectedFiles =
                                        selectedFilesFromUploadedFiles(
                                      selectedUploadedFiles,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedFiles.map(
                                        (f) async => await uploadData(
                                            f.storagePath, f.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading_uploadDataA64 =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedFiles.length &&
                                      downloadUrls.length ==
                                          selectedFiles.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadDataA64 =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadDataA64 =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }
                              }
                              if (_model.copmanyDetailMoney?.owner ==
                                  currentUserReference) {
                                _model.validate = true;
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  safeSetState(() => _model.validate = false);
                                  return;
                                }
                                if (_model.validate!) {
                                  await widget.companyWorker!.update({
                                    ...mapToFirestore(
                                      {
                                        'allowence': FieldValue.increment(
                                            double.parse(_model
                                                .priceTextController.text)),
                                      },
                                    ),
                                  });

                                  await widget.company!.update({
                                    ...mapToFirestore(
                                      {
                                        'yearlyMoney': FieldValue.increment(
                                            -(double.parse(_model
                                                .priceTextController.text))),
                                        'totalMoney': FieldValue.increment(
                                            -(double.parse(_model
                                                .priceTextController.text))),
                                      },
                                    ),
                                  });

                                  await _model.companyWorkerDetail!.workPlace!
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'yearlyMoney': FieldValue.increment(
                                            -(double.parse(_model
                                                .priceTextController.text))),
                                        'totalMoney': FieldValue.increment(
                                            -(double.parse(_model
                                                .priceTextController.text))),
                                      },
                                    ),
                                  });
                                  if (_model.isUploadPdf) {
                                    var sentMoneyForAllowenceWorkPlaceRecordReference =
                                        SentMoneyForAllowenceWorkPlaceRecord
                                            .createDoc(_model
                                                .companyWorkerDetail!
                                                .workPlace!);
                                    await sentMoneyForAllowenceWorkPlaceRecordReference
                                        .set({
                                      ...createSentMoneyForAllowenceWorkPlaceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        pdfUrl: _model
                                            .uploadedFileUrl_uploadDataA64,
                                        senderName: currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.sent1WorkPlace =
                                        SentMoneyForAllowenceWorkPlaceRecord
                                            .getDocumentFromData({
                                      ...createSentMoneyForAllowenceWorkPlaceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        pdfUrl: _model
                                            .uploadedFileUrl_uploadDataA64,
                                        senderName: currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': DateTime.now(),
                                        },
                                      ),
                                    }, sentMoneyForAllowenceWorkPlaceRecordReference);

                                    var sentMoneyForAllowenceRecordReference1 =
                                        SentMoneyForAllowenceRecord.createDoc(
                                            widget.company!);
                                    await sentMoneyForAllowenceRecordReference1
                                        .set({
                                      ...createSentMoneyForAllowenceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        pdfUrl: _model
                                            .uploadedFileUrl_uploadDataA64,
                                        senderName: currentUserDisplayName,
                                        sentMoneyWorkPlace:
                                            _model.sent1WorkPlace?.reference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.sent1 = SentMoneyForAllowenceRecord
                                        .getDocumentFromData({
                                      ...createSentMoneyForAllowenceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        pdfUrl: _model
                                            .uploadedFileUrl_uploadDataA64,
                                        senderName: currentUserDisplayName,
                                        sentMoneyWorkPlace:
                                            _model.sent1WorkPlace?.reference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': DateTime.now(),
                                        },
                                      ),
                                    }, sentMoneyForAllowenceRecordReference1);

                                    await AjandaRecord.createDoc(
                                            currentUserReference!)
                                        .set({
                                      ...createAjandaRecordData(
                                        description: 'Para Gönderildi',
                                        type: WorkHistoryTypes
                                            .sentExpanditury.name,
                                        sentMoneyForAllowence:
                                            _model.sent1?.reference,
                                        fullDescription:
                                            '${_model.sent1WorkPlace?.sentMoney.toString()} TL Gönderildi',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'dateTime':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                  } else {
                                    var sentMoneyForAllowenceRecordReference2 =
                                        SentMoneyForAllowenceRecord.createDoc(
                                            widget.company!);
                                    await sentMoneyForAllowenceRecordReference2
                                        .set({
                                      ...createSentMoneyForAllowenceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        senderName: currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.sent2 = SentMoneyForAllowenceRecord
                                        .getDocumentFromData({
                                      ...createSentMoneyForAllowenceRecordData(
                                        sender: currentUserReference,
                                        receiver: widget.receiver,
                                        sentMoney: double.tryParse(
                                            _model.priceTextController.text),
                                        note: _model.noteTextController.text,
                                        senderName: currentUserDisplayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': DateTime.now(),
                                        },
                                      ),
                                    }, sentMoneyForAllowenceRecordReference2);

                                    await AjandaRecord.createDoc(
                                            currentUserReference!)
                                        .set({
                                      ...createAjandaRecordData(
                                        description: 'Para Gönderildi',
                                        type: WorkHistoryTypes
                                            .sentExpanditury.name,
                                        sentMoneyForAllowence:
                                            _model.sent2?.reference,
                                        fullDescription:
                                            '${_model.sent2?.sentMoney.toString()} TL Gönderildi',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'dateTime':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Para Gönderildi',
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
                                  context.safePop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Bir Değer Giriniz',
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
                                }
                              } else {
                                _model.companyWorkerAuthUserMoney =
                                    await queryCompanyWorkersRecordOnce(
                                  parent: widget.company,
                                  queryBuilder: (companyWorkersRecord) =>
                                      companyWorkersRecord.where(
                                    'userRef',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.companyWorkerAuthUserMoney!
                                        .canSendMoney ||
                                    _model.companyWorkerAuthUserMoney!
                                        .hasAuthorizedByDepartment()) {
                                  _model.validate1 = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    safeSetState(
                                        () => _model.validate1 = false);
                                    return;
                                  }
                                  if (_model.validate1!) {
                                    await widget.companyWorker!.update({
                                      ...mapToFirestore(
                                        {
                                          'allowence': FieldValue.increment(
                                              double.parse(_model
                                                  .priceTextController.text)),
                                        },
                                      ),
                                    });

                                    await _model
                                        .companyWorkerAuthUserMoney!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'allowence': FieldValue.increment(
                                              -(double.parse(_model
                                                  .priceTextController.text))),
                                        },
                                      ),
                                    });
                                    if (_model.isUploadPdf) {
                                      var spentMonetForAllowenceWorkPlaceRecordReference1 =
                                          SpentMonetForAllowenceWorkPlaceRecord
                                              .createDoc(_model
                                                  .companyWorkerDetail!
                                                  .workPlace!);
                                      await spentMonetForAllowenceWorkPlaceRecordReference1
                                          .set({
                                        ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          pdfUrl: _model
                                              .uploadedFileUrl_uploadDataA64,
                                          senderName: currentUserDisplayName,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.spend3WorkPlace =
                                          SpentMonetForAllowenceWorkPlaceRecord
                                              .getDocumentFromData({
                                        ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          pdfUrl: _model
                                              .uploadedFileUrl_uploadDataA64,
                                          senderName: currentUserDisplayName,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date': DateTime.now(),
                                          },
                                        ),
                                      }, spentMonetForAllowenceWorkPlaceRecordReference1);

                                      var spentMoneyForAllowenceRecordReference1 =
                                          SpentMoneyForAllowenceRecord
                                              .createDoc(widget.company!);
                                      await spentMoneyForAllowenceRecordReference1
                                          .set({
                                        ...createSpentMoneyForAllowenceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          pdfUrl: _model
                                              .uploadedFileUrl_uploadDataA64,
                                          senderName: currentUserDisplayName,
                                          spentMoneyForAllowenceWorkPlace:
                                              _model.spend3WorkPlace?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.spend3 =
                                          SpentMoneyForAllowenceRecord
                                              .getDocumentFromData({
                                        ...createSpentMoneyForAllowenceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          pdfUrl: _model
                                              .uploadedFileUrl_uploadDataA64,
                                          senderName: currentUserDisplayName,
                                          spentMoneyForAllowenceWorkPlace:
                                              _model.spend3WorkPlace?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date': DateTime.now(),
                                          },
                                        ),
                                      }, spentMoneyForAllowenceRecordReference1);

                                      await AjandaRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createAjandaRecordData(
                                          description: 'Harcama Yapıldı',
                                          type: WorkHistoryTypes
                                              .spentExpanditury.name,
                                          spendMoneyForAllowence:
                                              _model.spend3?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'dateTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                    } else {
                                      var spentMonetForAllowenceWorkPlaceRecordReference2 =
                                          SpentMonetForAllowenceWorkPlaceRecord
                                              .createDoc(_model
                                                  .companyWorkerDetail!
                                                  .workPlace!);
                                      await spentMonetForAllowenceWorkPlaceRecordReference2
                                          .set({
                                        ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          senderName: currentUserDisplayName,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.spend4WorkPlace =
                                          SpentMonetForAllowenceWorkPlaceRecord
                                              .getDocumentFromData({
                                        ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          senderName: currentUserDisplayName,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date': DateTime.now(),
                                          },
                                        ),
                                      }, spentMonetForAllowenceWorkPlaceRecordReference2);

                                      var spentMoneyForAllowenceRecordReference2 =
                                          SpentMoneyForAllowenceRecord
                                              .createDoc(widget.company!);
                                      await spentMoneyForAllowenceRecordReference2
                                          .set({
                                        ...createSpentMoneyForAllowenceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          senderName: currentUserDisplayName,
                                          spentMoneyForAllowenceWorkPlace:
                                              _model.spend4WorkPlace?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.spend4 =
                                          SpentMoneyForAllowenceRecord
                                              .getDocumentFromData({
                                        ...createSpentMoneyForAllowenceRecordData(
                                          sender: currentUserReference,
                                          receiver: widget.receiver,
                                          spendMoney: double.tryParse(
                                              _model.priceTextController.text),
                                          note: _model.noteTextController.text,
                                          senderName: currentUserDisplayName,
                                          spentMoneyForAllowenceWorkPlace:
                                              _model.spend4WorkPlace?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'date': DateTime.now(),
                                          },
                                        ),
                                      }, spentMoneyForAllowenceRecordReference2);

                                      await AjandaRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createAjandaRecordData(
                                          description: 'Harcama Yapıldı',
                                          type: WorkHistoryTypes
                                              .spentExpanditury.name,
                                          spendMoneyForAllowence:
                                              _model.spend4?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'dateTime':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Para Gönderildi',
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
                                    context.safePop();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Bir Değer Giriniz',
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
                                  }
                                } else {
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
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Gönder',
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
                        if (_model.isUploadPdf)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: FlutterFlowPdfViewer(
                              fileBytes:
                                  _model.uploadedLocalFile_uploadDataHqc.bytes,
                              height: 300.0,
                              horizontalScroll: false,
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
      ),
    );
  }
}
