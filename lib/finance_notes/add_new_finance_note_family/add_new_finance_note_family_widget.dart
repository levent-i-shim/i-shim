import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_finance_note_family_model.dart';
export 'add_new_finance_note_family_model.dart';

class AddNewFinanceNoteFamilyWidget extends StatefulWidget {
  const AddNewFinanceNoteFamilyWidget({
    super.key,
    required this.isEdit,
    this.noteFinanceCompany,
  });

  final bool? isEdit;
  final FinancialMonitoringNotesRecord? noteFinanceCompany;

  static String routeName = 'addNewFinanceNoteFamily';
  static String routePath = '/addNewFinanceNoteFamily';

  @override
  State<AddNewFinanceNoteFamilyWidget> createState() =>
      _AddNewFinanceNoteFamilyWidgetState();
}

class _AddNewFinanceNoteFamilyWidgetState
    extends State<AddNewFinanceNoteFamilyWidget> {
  late AddNewFinanceNoteFamilyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewFinanceNoteFamilyModel());

    _model.textFieldTitleTextController ??= TextEditingController();
    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldContentTextController ??= TextEditingController(
        text: widget.isEdit! ? widget.noteFinanceCompany?.content : '');
    _model.textFieldContentFocusNode ??= FocusNode();

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
          actions: [
            FlutterFlowIconButton(
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                  child: Text(
                    'Aile ödeme/tahsilat',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ),
                if (_model.fileTypeValue == 'PDF')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 12.0, 4.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.validate = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(() => _model.validate = false);
                            return;
                          }
                          if (_model.validate!) {
                            if (widget.isEdit!) {
                              await widget.noteFinanceCompany!.reference
                                  .update(
                                      createFinancialMonitoringNotesRecordData(
                                content:
                                    _model.textFieldContentTextController.text,
                              ));
                            } else {
                              {
                                safeSetState(() => _model
                                        .isDataUploading_uploadFamilyPDFToFirebase =
                                    true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedFiles = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile_familyUploadPDF
                                          .bytes!
                                          .isNotEmpty
                                      ? [
                                          _model
                                              .uploadedLocalFile_familyUploadPDF
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
                                  _model.isDataUploading_uploadFamilyPDFToFirebase =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadFamilyPDFToFirebase =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadFamilyPDFToFirebase =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              var financialMonitoringNotesRecordReference =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadFamilyPDFToFirebase,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.addedNote = FinancialMonitoringNotesRecord
                                  .getDocumentFromData({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadFamilyPDFToFirebase,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference);

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription:
                                      _model.textFieldTitleTextController.text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateTime': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Başarıyla Kaydedildi',
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
                                  'Validation Unsuccessfull',
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

                          safeSetState(() {});
                        },
                        text: 'Kaydet',
                        icon: Icon(
                          Icons.save_as,
                          size: 12.0,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 36.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF0007FF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                if (_model.fileTypeValue == 'Resim')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 12.0, 4.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.validate2 = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(() => _model.validate2 = false);
                            return;
                          }
                          if (_model.validate2!) {
                            if (widget.isEdit!) {
                              await widget.noteFinanceCompany!.reference
                                  .update(
                                      createFinancialMonitoringNotesRecordData(
                                content:
                                    _model.textFieldContentTextController.text,
                              ));
                            } else {
                              {
                                safeSetState(() => _model
                                        .isDataUploading_uploadeCompanyMediaToFirebase =
                                    true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var selectedMedia = <SelectedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = _model
                                          .uploadedLocalFile_familyUploadeMedia
                                          .bytes!
                                          .isNotEmpty
                                      ? [
                                          _model
                                              .uploadedLocalFile_familyUploadeMedia
                                        ]
                                      : <FFUploadedFile>[];
                                  selectedMedia =
                                      selectedFilesFromUploadedFiles(
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
                                  _model.isDataUploading_uploadeCompanyMediaToFirebase =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadeCompanyMediaToFirebase =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadeCompanyMediaToFirebase =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              var financialMonitoringNotesRecordReference =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  imagePath: _model
                                      .uploadedFileUrl_uploadeCompanyMediaToFirebase,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.addedNote1 = FinancialMonitoringNotesRecord
                                  .getDocumentFromData({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  imagePath: _model
                                      .uploadedFileUrl_uploadeCompanyMediaToFirebase,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference);

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription:
                                      _model.textFieldTitleTextController.text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateTime': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Başarıyla Kaydedildi',
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
                                  'Validation Unsuccessfull',
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

                          safeSetState(() {});
                        },
                        text: 'Kaydet',
                        icon: Icon(
                          Icons.save_as,
                          size: 12.0,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 36.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF0007FF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                if (_model.fileTypeValue == 'Belge Yok')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 12.0, 4.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.validate3 = true;
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            safeSetState(() => _model.validate3 = false);
                            return;
                          }
                          if (_model.validate3!) {
                            if (widget.isEdit!) {
                              await widget.noteFinanceCompany!.reference
                                  .update(
                                      createFinancialMonitoringNotesRecordData(
                                content:
                                    _model.textFieldContentTextController.text,
                              ));
                            } else {
                              var financialMonitoringNotesRecordReference =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  doesHaveBill: false,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.addedNote3 = FinancialMonitoringNotesRecord
                                  .getDocumentFromData({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.family,
                                  value: double.tryParse(
                                      _model.textFieldTitleTextController.text),
                                  incomeOrExpense: _model.dropDownValue?.name,
                                  doesHaveBill: false,
                                  familName: 'Ailevi',
                                  whoCreated: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference);

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription:
                                      _model.textFieldTitleTextController.text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateTime': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Başarıyla Kaydedildi',
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
                                  'Validation Unsuccessfull',
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

                          safeSetState(() {});
                        },
                        text: 'Kaydet',
                        icon: Icon(
                          Icons.save_as,
                          size: 12.0,
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 36.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF0007FF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                if ((_model.fileTypeValue != 'PDF') &&
                    (_model.fileTypeValue != 'Resim') &&
                    (_model.fileTypeValue != 'Belge Yok'))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Container(
                        width: 150.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 2.0, 6.0, 2.0),
                          child: Text(
                            'Belge Türü Seçtikten Sonra Kaydet Aktifleşecek.',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 9.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
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
                colors: [Color(0xFF060418), Color(0xFF45050D)],
                stops: [0.2, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                      child: StreamBuilder<List<CompaniesRecord>>(
                        stream: queryCompaniesRecord(
                          queryBuilder: (companiesRecord) => companiesRecord
                              .where(
                                'owner',
                                isEqualTo: currentUserReference,
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
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CompaniesRecord>
                              companiesDropDownCompaniesRecordList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller:
                                _model.companiesDropDownValueController ??=
                                    FormFieldController<String>(null),
                            options: List<String>.from(<String>[]),
                            optionLabels: <String>[],
                            onChanged: (val) => safeSetState(
                                () => _model.companiesDropDownValue = val),
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
                            hintText: 'Hangi aile ?',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 16.0, 30.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.fileTypeValueController ??=
                              FormFieldController<String>(null),
                          options: ['PDF', 'Resim', 'Belge Yok'],
                          onChanged: (val) =>
                              safeSetState(() => _model.fileTypeValue = val),
                          width: double.infinity,
                          height: 40.0,
                          textStyle:
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
                          hintText: 'Belge türü seç',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.fileTypeValue == 'PDF')
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'PDF Ekle',
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedFiles =
                                                await selectFiles(
                                              allowedExtensions: ['pdf'],
                                              multiFile: false,
                                            );
                                            if (selectedFiles != null) {
                                              safeSetState(() => _model
                                                      .isDataUploading_familyUploadPDF =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedFiles
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              originalFilename:
                                                                  m.originalFilename,
                                                            ))
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading_familyUploadPDF =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedFiles.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_familyUploadPDF =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                                showUploadMessage(
                                                  context,
                                                  'Success!',
                                                );
                                              } else {
                                                safeSetState(() {});
                                                showUploadMessage(
                                                  context,
                                                  'Failed to upload file',
                                                );
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 250.0,
                                            height: 250.0,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Icon(
                                                  Icons.picture_as_pdf_sharp,
                                                  color: Colors.white,
                                                  size: 36.0,
                                                ),
                                                FlutterFlowPdfViewer(
                                                  fileBytes: _model
                                                      .uploadedLocalFile_familyUploadPDF
                                                      .bytes,
                                                  width: 300.0,
                                                  height: 300.0,
                                                  horizontalScroll: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.fileTypeValue == 'Resim')
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Media Ekle',
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              imageQuality: 50,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                      .isDataUploading_familyUploadeMedia =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                              originalFilename:
                                                                  m.originalFilename,
                                                            ))
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading_familyUploadeMedia =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_familyUploadeMedia =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                safeSetState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload data');
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 250.0,
                                            height: 250.0,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Icon(
                                                  Icons.camera_alt_sharp,
                                                  color: Colors.white,
                                                  size: 36.0,
                                                ),
                                                if ((_model.uploadedLocalFile_familyUploadeMedia
                                                            .bytes?.isNotEmpty ??
                                                        false))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile_familyUploadeMedia
                                                                .bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width: 300.0,
                                                        height: 300.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        'Parasal Değer ?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 10.0, 4.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldTitleTextController,
                                          focusNode:
                                              _model.textFieldTitleFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textFieldTitleTextController',
                                            Duration(milliseconds: 2000),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Ödeme veya Tahsilat Tutarı',
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
                                            fillColor: Color(0xC4F0F2F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            suffixIcon: _model
                                                    .textFieldTitleTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .textFieldTitleTextController
                                                          ?.clear();
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.black,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: 2,
                                          minLines: 1,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textFieldTitleTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .none),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 16.0, 4.0, 0.0),
                                        child: FlutterFlowDropDown<
                                            IncomeOrExpense>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<
                                                      IncomeOrExpense>(null),
                                          options: List<IncomeOrExpense>.from(
                                              IncomeOrExpense.values),
                                          optionLabels: ['Gelir', 'Gider'],
                                          onChanged: (val) => safeSetState(
                                              () => _model.dropDownValue = val),
                                          width: double.infinity,
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
                                          hintText: 'Gelir mi, gider mi?',
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
                                          borderColor: Colors.transparent,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Açıklama',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 8.0, 4.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldContentTextController,
                                          focusNode:
                                              _model.textFieldContentFocusNode,
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
                                            fillColor: Color(0xC4F0F2F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: 15,
                                          minLines: 4,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textFieldContentTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 16.0, 4.0, 0.0),
                                        child: FlutterFlowDropDown<bool>(
                                          controller: _model
                                                  .doesHaveBillValueController ??=
                                              FormFieldController<bool>(null),
                                          options:
                                              List<bool>.from([true, false]),
                                          optionLabels: ['Var', 'Yok'],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.doesHaveBillValue = val),
                                          width: double.infinity,
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
                                          hintText: 'Faturası var mı?',
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
                                          borderColor: Colors.transparent,
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 500.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Visibility(
                                visible: _model.doesHaveBillValue == true,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 16.0, 4.0, 4.0),
                                  child: Container(
                                    width: 300.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '* Faturayı \"Şirket Giderleri\" veya \"Mali Müşavir\" sayfalarından ekleyebilrsiniz.',
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
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
                                ),
                              ),
                            ),
                          ],
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
