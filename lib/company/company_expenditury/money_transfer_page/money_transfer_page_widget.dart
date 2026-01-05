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
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'money_transfer_page_model.dart';
export 'money_transfer_page_model.dart';

class MoneyTransferPageWidget extends StatefulWidget {
  const MoneyTransferPageWidget({
    super.key,
    required this.companyWorker,
  });

  final CompanyWorkersRecord? companyWorker;

  static String routeName = 'MoneyTransferPage';
  static String routePath = '/moneyTransferPage';

  @override
  State<MoneyTransferPageWidget> createState() =>
      _MoneyTransferPageWidgetState();
}

class _MoneyTransferPageWidgetState extends State<MoneyTransferPageWidget> {
  late MoneyTransferPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoneyTransferPageModel());

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
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<CompanyWorkersRecord>>(
                      stream: queryCompanyWorkersRecord(
                        parent: widget.companyWorker?.parentReference,
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
                        List<CompanyWorkersRecord>
                            formCompanyWorkersRecordList = snapshot.data!;

                        return Form(
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
                                          flex: 2,
                                          child: Text(
                                            'Alıcı:',
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
                                          ),
                                        ),
                                        Flexible(
                                          flex: 8,
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                formCompanyWorkersRecordList
                                                    .map((e) => e.userRef?.id)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                formCompanyWorkersRecordList
                                                    .map((e) => e.userName)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 200.0,
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
                                          flex: 2,
                                          child: Text(
                                            'Harcanan Tutar:',
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
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.priceTextController,
                                              focusNode: _model.priceFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Tutar',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF070707),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsets.all(8.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
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
                                          flex: 2,
                                          child: Text(
                                            'Not:',
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
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.noteTextController,
                                              focusNode: _model.noteFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Not',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF070707),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsets.all(8.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final selectedFiles =
                                                  await selectFiles(
                                                allowedExtensions: ['pdf'],
                                                multiFile: false,
                                              );
                                              if (selectedFiles != null) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadData3tgx =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
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

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedFiles.map(
                                                      (f) async =>
                                                          await uploadData(
                                                              f.storagePath,
                                                              f.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadData3tgx =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedFiles.length &&
                                                    downloadUrls.length ==
                                                        selectedFiles.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadData3tgx =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl_uploadData3tgx =
                                                        downloadUrls.first;
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            'Fotoğraf Eklemek İçin :',
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
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 80,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadDataJeox =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
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

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadDataJeox =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadDataJeox =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl_uploadDataJeox =
                                                        downloadUrls.first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }

                                              _model.isUploadImage = true;
                                            },
                                            text: 'Tıklayınız',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                    0.0, 20.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.validation = true;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      safeSetState(
                                          () => _model.validation = false);
                                      return;
                                    }
                                    if (_model.dropDownValue == null) {
                                      _model.validation = false;
                                      safeSetState(() {});
                                      return;
                                    }
                                    if (_model.validation!) {
                                      if (_model.isUploadImage) {
                                        _model.userRef =
                                            await actions.getUserDocRef(
                                          _model.dropDownValue!,
                                        );
                                        if (_model.isUploadPdf) {
                                          var spentMonetForAllowenceWorkPlaceRecordReference1 =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .workPlace!);
                                          await spentMonetForAllowenceWorkPlaceRecordReference1
                                              .set({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend1WorkPlace =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': DateTime.now(),
                                              },
                                            ),
                                          }, spentMonetForAllowenceWorkPlaceRecordReference1);

                                          var spentMoneyForAllowenceRecordReference1 =
                                              SpentMoneyForAllowenceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .parentReference);
                                          await spentMoneyForAllowenceRecordReference1
                                              .set({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend1WorkPlace
                                                      ?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend1 =
                                              SpentMoneyForAllowenceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend1WorkPlace
                                                      ?.reference,
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
                                                  _model.spend1?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'dateTime': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                        } else {
                                          var spentMonetForAllowenceWorkPlaceRecordReference2 =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .workPlace!);
                                          await spentMonetForAllowenceWorkPlaceRecordReference2
                                              .set({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend2WorkPlace =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': DateTime.now(),
                                              },
                                            ),
                                          }, spentMonetForAllowenceWorkPlaceRecordReference2);

                                          var spentMoneyForAllowenceRecordReference2 =
                                              SpentMoneyForAllowenceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .parentReference);
                                          await spentMoneyForAllowenceRecordReference2
                                              .set({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend2WorkPlace
                                                      ?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend2 =
                                              SpentMoneyForAllowenceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              imageUrl: _model
                                                  .uploadedFileUrl_uploadDataJeox,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend2WorkPlace
                                                      ?.reference,
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
                                                  _model.spend2?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'dateTime': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                        }

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Harcama Tamamlandı',
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

                                        await widget.companyWorker!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'allowence': FieldValue.increment(
                                                  -(double.parse(_model
                                                      .priceTextController
                                                      .text))),
                                            },
                                          ),
                                        });
                                        context.safePop();
                                      } else {
                                        if (_model.isUploadPdf) {
                                          _model.userRef2 =
                                              await actions.getUserDocRef(
                                            _model.dropDownValue!,
                                          );

                                          var spentMonetForAllowenceWorkPlaceRecordReference3 =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .workPlace!);
                                          await spentMonetForAllowenceWorkPlaceRecordReference3
                                              .set({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef2,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend3WorkPlace =
                                              SpentMonetForAllowenceWorkPlaceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMonetForAllowenceWorkPlaceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef2,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': DateTime.now(),
                                              },
                                            ),
                                          }, spentMonetForAllowenceWorkPlaceRecordReference3);

                                          var spentMoneyForAllowenceRecordReference3 =
                                              SpentMoneyForAllowenceRecord
                                                  .createDoc(widget
                                                      .companyWorker!
                                                      .parentReference);
                                          await spentMoneyForAllowenceRecordReference3
                                              .set({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef2,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend3WorkPlace
                                                      ?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.spend3 =
                                              SpentMoneyForAllowenceRecord
                                                  .getDocumentFromData({
                                            ...createSpentMoneyForAllowenceRecordData(
                                              sender: currentUserReference,
                                              receiver: _model.userRef2,
                                              spendMoney: double.tryParse(_model
                                                  .priceTextController.text),
                                              note: _model
                                                  .noteTextController.text,
                                              pdfUrl: _model
                                                  .uploadedFileUrl_uploadData3tgx,
                                              senderName:
                                                  currentUserDisplayName,
                                              spentMoneyForAllowenceWorkPlace:
                                                  _model.spend3WorkPlace
                                                      ?.reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'date': DateTime.now(),
                                              },
                                            ),
                                          }, spentMoneyForAllowenceRecordReference3);

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
                                                'dateTime': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Harcama Tamamlandı',
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

                                          await widget.companyWorker!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'allowence':
                                                    FieldValue.increment(
                                                        -(double.parse(_model
                                                            .priceTextController
                                                            .text))),
                                              },
                                            ),
                                          });
                                          context.safePop();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'PDF veya Resim Yükleyiniz',
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
                                        }
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Tüm Alanları Doldurunuz',
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

                                    safeSetState(() {});
                                  },
                                  text: 'Harcamayı Gönder',
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
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  if (_model.isUploadImage)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        _model.uploadedFileUrl_uploadDataJeox,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (_model.isUploadPdf)
                    FlutterFlowPdfViewer(
                      networkPath: _model.uploadedFileUrl_uploadData3tgx,
                      height: 300.0,
                      horizontalScroll: false,
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
