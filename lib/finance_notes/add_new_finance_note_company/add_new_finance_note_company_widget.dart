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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_finance_note_company_model.dart';
export 'add_new_finance_note_company_model.dart';

class AddNewFinanceNoteCompanyWidget extends StatefulWidget {
  const AddNewFinanceNoteCompanyWidget({
    super.key,
    required this.isEdit,
    this.noteFinanceCompany,
  });

  final bool? isEdit;
  final FinancialMonitoringNotesRecord? noteFinanceCompany;

  static String routeName = 'AddNewFinanceNoteCompany';
  static String routePath = '/addNewFinanceNoteCompany';

  @override
  State<AddNewFinanceNoteCompanyWidget> createState() =>
      _AddNewFinanceNoteCompanyWidgetState();
}

class _AddNewFinanceNoteCompanyWidgetState
    extends State<AddNewFinanceNoteCompanyWidget> {
  late AddNewFinanceNoteCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewFinanceNoteCompanyModel());

    _model.paymentOrCollectionValueTextController ??= TextEditingController();
    _model.paymentOrCollectionValueFocusNode ??= FocusNode();

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
          backgroundColor: Color(0xFF060020),
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                child: Text(
                  'Şirket ödeme/tahsilat',
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
                        HapticFeedback.mediumImpact();
                        if (_model.validate!) {
                          if (widget.isEdit!) {
                            await widget.noteFinanceCompany!.reference.update(
                                createFinancialMonitoringNotesRecordData(
                              content:
                                  _model.textFieldContentTextController.text,
                            ));
                          } else {
                            {
                              safeSetState(() => _model
                                      .isDataUploading_uploadCompanyPDFToFirebaseCheck =
                                  true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedFiles = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = _model
                                        .uploadedLocalFile_companyUploadPDFCheck
                                        .bytes!
                                        .isNotEmpty
                                    ? [
                                        _model
                                            .uploadedLocalFile_companyUploadPDFCheck
                                      ]
                                    : <FFUploadedFile>[];
                                selectedFiles = selectedFilesFromUploadedFiles(
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
                                _model.isDataUploading_uploadCompanyPDFToFirebaseCheck =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedFiles.length &&
                                  downloadUrls.length == selectedFiles.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadCompanyPDFToFirebaseCheck =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadCompanyPDFToFirebaseCheck =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            if (_model.ownerOrWorkerValue == 'ownerOrPartner') {
                              _model.companyRefFromDropDownId =
                                  await actions.getCompanyDocRef(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceRefFromDropDownIdx =
                                  await actions.getWorkPlaceDocRef(
                                _model.workPlacesDropDownValue!,
                              );
                              _model.companyNameFromDropDownId =
                                  await actions.getCompanyName(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceNameFromDropDownId =
                                  await actions.getWorkPlaceName(
                                _model.workPlacesDropDownValue!,
                              );

                              var financialMonitoringNotesRecordReference1 =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference1
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId,
                                  companyName: _model.companyNameFromDropDownId,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownIdx,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
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
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId,
                                  companyName: _model.companyNameFromDropDownId,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownIdx,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Kişisel kayıtlara başarı ile eklendi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await FinancialNoteCompanyRecord.createDoc(
                                      _model.companyRefFromDropDownId!)
                                  .set(createFinancialNoteCompanyRecordData(
                                value: double.tryParse(_model
                                    .paymentOrCollectionValueTextController
                                    .text),
                                creator: currentUserReference,
                                creatorName: currentUserDisplayName,
                                companyName: _model.companyNameFromDropDownId,
                                companyRef: _model.companyRefFromDropDownId,
                                creationDate: getCurrentTimestamp,
                                incomeOrExpense:
                                    _model.incomeOrExpenseDropDownValue,
                                content:
                                    _model.textFieldContentTextController.text,
                                doesHaveBill:
                                    _model.doesHaveBillValue?.toString(),
                                companyId: _model.ownerOrWorkerValue,
                                creatorTitle: 'owner',
                                pdfUrl: _model
                                    .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                paidFromWhichAccount: _model.whichAccountValue,
                                workPlaceRef:
                                    _model.workPlaceRefFromDropDownIdx,
                                workPlaceName:
                                    _model.workPlaceNameFromDropDownId,
                                workPlaceId: _model.workPlacesDropDownValue,
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Şirket ödeme kayıtlarına eklendi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription: _model
                                      .paymentOrCollectionValueTextController
                                      .text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
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
                                    'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );
                              if (_model.doesHaveBillValue == true) {
                                await CompanyBillRecord.createDoc(
                                        _model.companyRefFromDropDownId!)
                                    .set(createCompanyBillRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName: _model.companyNameFromDropDownId,
                                  companyRef: _model.companyRefFromDropDownId,
                                  creationDate: getCurrentTimestamp,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                  companyId: _model.companiesDropDownValue,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  creatorTitle: 'owner/partner',
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownIdx,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  billPdfUrl: '',
                                  paymentDocumentPdfUrl: '',
                                  paymentDocumentImageUrl: '',
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına ekleme işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              }
                            } else {
                              if (_model.ownerOrWorkerValue == 'worker') {
                                _model.companyRefFromDropDownId9 =
                                    await actions.getCompanyDocRef(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceRefFromDropDownId9 =
                                    await actions.getWorkPlaceDocRef(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );
                                _model.companyNameFromDropDownId9 =
                                    await actions.getCompanyName(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceNameFromDropDownId9 =
                                    await actions.getWorkPlaceName(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );

                                var financialMonitoringNotesRecordReference2 =
                                    FinancialMonitoringNotesRecord.createDoc(
                                        currentUserReference!);
                                await financialMonitoringNotesRecordReference2
                                    .set({
                                  ...createFinancialMonitoringNotesRecordData(
                                    content: _model
                                        .textFieldContentTextController.text,
                                    isDeleted: false,
                                    financeType: FinanceNoteType.company,
                                    value: double.tryParse(_model
                                        .paymentOrCollectionValueTextController
                                        .text),
                                    incomeOrExpense:
                                        _model.incomeOrExpenseDropDownValue,
                                    companyRef:
                                        _model.companyRefFromDropDownId9,
                                    companyName:
                                        _model.companyNameFromDropDownId9,
                                    pdfUrl: _model
                                        .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                    doesHaveBill: _model.doesHaveBillValue,
                                    whoCreated: currentUserReference,
                                    workplaceRef:
                                        _model.workPlaceRefFromDropDownId9,
                                    workPlaceName:
                                        _model.workPlaceNameFromDropDownId9,
                                    workPlaceId: _model
                                        .authorizingWorkPlaceDropDownValue,
                                    companyId: _model
                                        .authorizingCompaniesDropDownValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationDate':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.addedNote9 =
                                    FinancialMonitoringNotesRecord
                                        .getDocumentFromData({
                                  ...createFinancialMonitoringNotesRecordData(
                                    content: _model
                                        .textFieldContentTextController.text,
                                    isDeleted: false,
                                    financeType: FinanceNoteType.company,
                                    value: double.tryParse(_model
                                        .paymentOrCollectionValueTextController
                                        .text),
                                    incomeOrExpense:
                                        _model.incomeOrExpenseDropDownValue,
                                    companyRef:
                                        _model.companyRefFromDropDownId9,
                                    companyName:
                                        _model.companyNameFromDropDownId9,
                                    pdfUrl: _model
                                        .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                    doesHaveBill: _model.doesHaveBillValue,
                                    whoCreated: currentUserReference,
                                    workplaceRef:
                                        _model.workPlaceRefFromDropDownId9,
                                    workPlaceName:
                                        _model.workPlaceNameFromDropDownId9,
                                    workPlaceId: _model
                                        .authorizingWorkPlaceDropDownValue,
                                    companyId: _model
                                        .authorizingCompaniesDropDownValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'creationDate': DateTime.now(),
                                    },
                                  ),
                                }, financialMonitoringNotesRecordReference2);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yapılan ödeme/finans işlemi kişisel kayıtlara başarı ile eklendi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await FinancialNoteCompanyRecord.createDoc(
                                        _model.companyRefFromDropDownId9!)
                                    .set(createFinancialNoteCompanyRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName:
                                      _model.companyNameFromDropDownId9,
                                  companyRef: _model.companyRefFromDropDownId9,
                                  creationDate: getCurrentTimestamp,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  doesHaveBill:
                                      _model.doesHaveBillValue?.toString(),
                                  companyId:
                                      _model.authorizingCompaniesDropDownValue,
                                  creatorTitle: 'Yetkili',
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownId9,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId9,
                                  workPlaceId:
                                      _model.authorizingWorkPlaceDropDownValue,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket ödeme/finans kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await AjandaRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createAjandaRecordData(
                                    description: 'Yeni Not Eklendi',
                                    type: WorkHistoryTypes.createNote.name,
                                    fullDescription: _model
                                        .paymentOrCollectionValueTextController
                                        .text,
                                    noteFinance:
                                        widget.noteFinanceCompany?.reference,
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
                                      'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                                if (_model.doesHaveBillValue == true) {
                                  await CompanyBillRecord.createDoc(
                                          _model.companyRefFromDropDownId9!)
                                      .set(createCompanyBillRecordData(
                                    value: double.tryParse(_model
                                        .paymentOrCollectionValueTextController
                                        .text),
                                    creator: currentUserReference,
                                    creatorName: currentUserDisplayName,
                                    companyName:
                                        _model.companyNameFromDropDownId9,
                                    companyRef:
                                        _model.companyRefFromDropDownId9,
                                    creationDate: getCurrentTimestamp,
                                    content: _model
                                        .textFieldContentTextController.text,
                                    pdfUrl: _model
                                        .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                    companyId: _model
                                        .authorizingCompaniesDropDownValue,
                                    incomeOrExpense:
                                        _model.incomeOrExpenseDropDownValue,
                                    creatorTitle: 'owner/partner',
                                    paidFromWhichAccount:
                                        _model.whichAccountValue,
                                    workPlaceRef:
                                        _model.workPlaceRefFromDropDownId9,
                                    workPlaceName:
                                        _model.workPlaceNameFromDropDownId9,
                                    workPlaceId: _model
                                        .authorizingWorkPlaceDropDownValue,
                                    billPdfUrl: '',
                                    paymentDocumentPdfUrl: '',
                                    paymentDocumentImageUrl: '',
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına ekleme işlemi başarı ile gerçekleştirildi.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                }
                              }
                            }
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Kayıt süreci başarı ile tamamlandı.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1500),
                              backgroundColor: Color(0xFFFFFF00),
                            ),
                          );
                          context.safePop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Validation Unsuccessfull',
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

                        safeSetState(() {});
                      },
                      text: 'Kaydet',
                      icon: Icon(
                        Icons.save_as,
                        size: 12.0,
                      ),
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 44.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                        _model.validate8 = true;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          safeSetState(() => _model.validate8 = false);
                          return;
                        }
                        HapticFeedback.mediumImpact();
                        if (_model.validate8!) {
                          if (widget.isEdit!) {
                            await widget.noteFinanceCompany!.reference.update(
                                createFinancialMonitoringNotesRecordData(
                              content:
                                  _model.textFieldContentTextController.text,
                            ));
                          } else {
                            {
                              safeSetState(() => _model
                                      .isDataUploading_uploadCompanyMediaToFirebase8Check =
                                  true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = _model
                                        .uploadedLocalFile_uploadMediaPaymentForCompany
                                        .bytes!
                                        .isNotEmpty
                                    ? [
                                        _model
                                            .uploadedLocalFile_uploadMediaPaymentForCompany
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
                                _model.isDataUploading_uploadCompanyMediaToFirebase8Check =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_uploadCompanyMediaToFirebase8Check =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_uploadCompanyMediaToFirebase8Check =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            if (_model.ownerOrWorkerValue == 'ownerOrPartner') {
                              _model.companyRefFromDropDownId2 =
                                  await actions.getCompanyDocRef(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceRefFromDropDownId2 =
                                  await actions.getWorkPlaceDocRef(
                                _model.workPlacesDropDownValue!,
                              );
                              _model.companyNameFromDropDownId2 =
                                  await actions.getCompanyName(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceNameFromDropDownId2 =
                                  await actions.getWorkPlaceName(
                                _model.workPlacesDropDownValue!,
                              );

                              var financialMonitoringNotesRecordReference1 =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference1
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId2,
                                  companyName:
                                      _model.companyNameFromDropDownId2,
                                  imagePath: _model
                                      .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId2,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId2,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.addedNote2 = FinancialMonitoringNotesRecord
                                  .getDocumentFromData({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId2,
                                  companyName:
                                      _model.companyNameFromDropDownId2,
                                  imagePath: _model
                                      .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId2,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId2,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Yapılan ödeme/finans işlemi kişisel kayıtlara başarı ile eklendi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await FinancialNoteCompanyRecord.createDoc(
                                      _model.companyRefFromDropDownId2!)
                                  .set(createFinancialNoteCompanyRecordData(
                                value: double.tryParse(_model
                                    .paymentOrCollectionValueTextController
                                    .text),
                                creator: currentUserReference,
                                creatorName: currentUserDisplayName,
                                companyName: _model.companyNameFromDropDownId2,
                                companyRef: _model.companyRefFromDropDownId2,
                                creationDate: getCurrentTimestamp,
                                incomeOrExpense:
                                    _model.incomeOrExpenseDropDownValue,
                                content:
                                    _model.textFieldContentTextController.text,
                                doesHaveBill:
                                    _model.doesHaveBillValue?.toString(),
                                companyId: _model.companiesDropDownValue,
                                creatorTitle: 'owner/partner',
                                imageUrl: _model
                                    .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                paidFromWhichAccount: _model.whichAccountValue,
                                workPlaceRef:
                                    _model.workPlaceRefFromDropDownId2,
                                workPlaceName:
                                    _model.workPlaceNameFromDropDownId2,
                                workPlaceId: _model.workPlacesDropDownValue,
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Şirket ödeme/finans kayıt işlemi başarı ile gerçekleştirildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription: _model
                                      .paymentOrCollectionValueTextController
                                      .text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
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
                                    'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );
                              if (_model.doesHaveBillValue == true) {
                                await CompanyBillRecord.createDoc(
                                        _model.companyRefFromDropDownId2!)
                                    .set(createCompanyBillRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName:
                                      _model.companyNameFromDropDownId2,
                                  companyRef:
                                      widget.noteFinanceCompany?.companyRef,
                                  creationDate: getCurrentTimestamp,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  pdfUrl: _model
                                      .uploadedFileUrl_uploadCompanyPDFToFirebaseCheck,
                                  companyId: _model.companiesDropDownValue,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  imageUrl: _model
                                      .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                  creatorTitle: 'partner/Owner',
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownId2,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId2,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  billPdfUrl: '',
                                  paymentDocumentPdfUrl: '',
                                  paymentDocumentImageUrl: '',
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına ekleme işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              }
                            } else {
                              if (_model.ownerOrWorkerValue == 'worker') {
                                _model.companyRefFromDropDownId8 =
                                    await actions.getCompanyDocRef(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceRefFromDropDownId8 =
                                    await actions.getWorkPlaceDocRef(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );
                                _model.companyNameFromDropDownId8 =
                                    await actions.getCompanyName(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceNameFromDropDownId8 =
                                    await actions.getWorkPlaceName(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );

                                var financialMonitoringNotesRecordReference2 =
                                    FinancialMonitoringNotesRecord.createDoc(
                                        currentUserReference!);
                                await financialMonitoringNotesRecordReference2
                                    .set(
                                        createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  creationDate: getCurrentTimestamp,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId8,
                                  companyName:
                                      _model.companyNameFromDropDownId8,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  imagePath: _model
                                      .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId8,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId8,
                                  workPlaceId:
                                      _model.authorizingWorkPlaceDropDownValue,
                                  companyId:
                                      _model.authorizingCompaniesDropDownValue,
                                ));
                                _model.addedNote8 = FinancialMonitoringNotesRecord
                                    .getDocumentFromData(
                                        createFinancialMonitoringNotesRecordData(
                                          content: _model
                                              .textFieldContentTextController
                                              .text,
                                          creationDate: getCurrentTimestamp,
                                          isDeleted: false,
                                          financeType: FinanceNoteType.company,
                                          value: double.tryParse(_model
                                              .paymentOrCollectionValueTextController
                                              .text),
                                          incomeOrExpense: _model
                                              .incomeOrExpenseDropDownValue,
                                          companyRef:
                                              _model.companyRefFromDropDownId8,
                                          companyName:
                                              _model.companyNameFromDropDownId8,
                                          doesHaveBill:
                                              _model.doesHaveBillValue,
                                          whoCreated: currentUserReference,
                                          imagePath: _model
                                              .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                          paidFromWhichAccount:
                                              _model.whichAccountValue,
                                          workplaceRef: _model
                                              .workPlaceRefFromDropDownId8,
                                          workPlaceName: _model
                                              .workPlaceNameFromDropDownId8,
                                          workPlaceId: _model
                                              .authorizingWorkPlaceDropDownValue,
                                          companyId: _model
                                              .authorizingCompaniesDropDownValue,
                                        ),
                                        financialMonitoringNotesRecordReference2);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yapılan ödeme/finans işlemi kişisel kayıtlara başarı ile eklendi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await FinancialNoteCompanyRecord.createDoc(
                                        _model.companyRefFromDropDownId8!)
                                    .set(createFinancialNoteCompanyRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName:
                                      _model.companyNameFromDropDownId8,
                                  companyRef: _model.companyRefFromDropDownId8,
                                  creationDate: getCurrentTimestamp,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  doesHaveBill:
                                      _model.doesHaveBillValue?.toString(),
                                  companyId:
                                      _model.authorizingCompaniesDropDownValue,
                                  creatorTitle: 'Yetkili',
                                  imageUrl: _model
                                      .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownId8,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId8,
                                  workPlaceId:
                                      _model.authorizingWorkPlaceDropDownValue,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await AjandaRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createAjandaRecordData(
                                    description: 'Yeni Not Eklendi',
                                    type: WorkHistoryTypes.createNote.name,
                                    fullDescription: _model
                                        .paymentOrCollectionValueTextController
                                        .text,
                                    noteFinance:
                                        widget.noteFinanceCompany?.reference,
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
                                      'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                                if (_model.doesHaveBillValue == true) {
                                  await CompanyBillRecord.createDoc(
                                          _model.companyRefFromDropDownId8!)
                                      .set(createCompanyBillRecordData(
                                    value: double.tryParse(_model
                                        .paymentOrCollectionValueTextController
                                        .text),
                                    creator: currentUserReference,
                                    creatorName: currentUserDisplayName,
                                    companyName:
                                        _model.companyNameFromDropDownId8,
                                    companyRef:
                                        _model.companyRefFromDropDownId8,
                                    creationDate: getCurrentTimestamp,
                                    content: _model
                                        .textFieldContentTextController.text,
                                    companyId: _model
                                        .authorizingCompaniesDropDownValue,
                                    incomeOrExpense:
                                        _model.incomeOrExpenseDropDownValue,
                                    imageUrl: _model
                                        .uploadedFileUrl_uploadCompanyMediaToFirebase8Check,
                                    creatorTitle: 'Yetkili',
                                    paidFromWhichAccount:
                                        _model.whichAccountValue,
                                    workPlaceRef:
                                        _model.workPlaceRefFromDropDownId8,
                                    workPlaceName:
                                        _model.workPlaceNameFromDropDownId8,
                                    workPlaceId: _model
                                        .authorizingWorkPlaceDropDownValue,
                                    pdfUrl: '',
                                    billPdfUrl: '',
                                    paymentDocumentPdfUrl: '',
                                    paymentDocumentImageUrl: '',
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına başarı ile eklendi.gerçekleştirildi.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                }
                              }
                            }
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Kayıt süreci başarı ile tamamlandı.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1500),
                              backgroundColor: Color(0xFFFFFF00),
                            ),
                          );
                          context.safePop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Validation Unsuccessfull',
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

                        safeSetState(() {});
                      },
                      text: 'Kaydet',
                      icon: Icon(
                        Icons.save_as,
                        size: 12.0,
                      ),
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 44.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                        _model.validate5 = true;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          safeSetState(() => _model.validate5 = false);
                          return;
                        }
                        HapticFeedback.mediumImpact();
                        if (_model.validate5!) {
                          if (widget.isEdit!) {
                            await widget.noteFinanceCompany!.reference.update(
                                createFinancialMonitoringNotesRecordData(
                              content:
                                  _model.textFieldContentTextController.text,
                            ));
                          } else {
                            if (_model.ownerOrWorkerValue == 'ownerOrPartner') {
                              _model.companyRefFromDropDownId3 =
                                  await actions.getCompanyDocRef(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceRefFromDropDownId3 =
                                  await actions.getWorkPlaceDocRef(
                                _model.workPlacesDropDownValue!,
                              );
                              _model.companyNameFromDropDownId3 =
                                  await actions.getCompanyName(
                                _model.companiesDropDownValue!,
                              );
                              _model.workPlaceNameFromDropDownId3 =
                                  await actions.getWorkPlaceName(
                                _model.workPlacesDropDownValue!,
                              );

                              var financialMonitoringNotesRecordReference1 =
                                  FinancialMonitoringNotesRecord.createDoc(
                                      currentUserReference!);
                              await financialMonitoringNotesRecordReference1
                                  .set({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId3,
                                  companyName:
                                      _model.companyNameFromDropDownId3,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId3,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId3,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.addedNote5 = FinancialMonitoringNotesRecord
                                  .getDocumentFromData({
                                ...createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId3,
                                  companyName:
                                      _model.companyNameFromDropDownId3,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId3,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId3,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  companyId: _model.companiesDropDownValue,
                                ),
                                ...mapToFirestore(
                                  {
                                    'creationDate': DateTime.now(),
                                  },
                                ),
                              }, financialMonitoringNotesRecordReference1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Yapılan ödeme/finans işlemi kişisel kayıtlara başarı ile eklendi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await FinancialNoteCompanyRecord.createDoc(
                                      _model.companyRefFromDropDownId3!)
                                  .set(createFinancialNoteCompanyRecordData(
                                value: double.tryParse(_model
                                    .paymentOrCollectionValueTextController
                                    .text),
                                creator: currentUserReference,
                                creatorName: currentUserDisplayName,
                                companyName: _model.companyNameFromDropDownId3,
                                companyRef: _model.companyRefFromDropDownId3,
                                creationDate: getCurrentTimestamp,
                                incomeOrExpense:
                                    _model.incomeOrExpenseDropDownValue,
                                content:
                                    _model.textFieldContentTextController.text,
                                doesHaveBill:
                                    _model.doesHaveBillValue?.toString(),
                                companyId: _model.companiesDropDownValue,
                                creatorTitle: 'ownerOrpartner',
                                paidFromWhichAccount: _model.whichAccountValue,
                                workPlaceRef:
                                    _model.workPlaceRefFromDropDownId3,
                                workPlaceName:
                                    _model.workPlaceNameFromDropDownId3,
                                workPlaceId: _model.workPlacesDropDownValue,
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Şirket ödeme/finans kayıt işlemi başarı ile gerçekleştirildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );

                              await AjandaRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createAjandaRecordData(
                                  description: 'Yeni Not Eklendi',
                                  type: WorkHistoryTypes.createNote.name,
                                  fullDescription: _model
                                      .paymentOrCollectionValueTextController
                                      .text,
                                  noteFinance:
                                      widget.noteFinanceCompany?.reference,
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
                                    'Kişisel ajandaya başarı ile kayıt edildi.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Color(0xFFFFFF00),
                                ),
                              );
                              if (_model.doesHaveBillValue == true) {
                                await CompanyBillRecord.createDoc(
                                        _model.companyRefFromDropDownId3!)
                                    .set(createCompanyBillRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName:
                                      _model.companyNameFromDropDownId3,
                                  companyRef: _model.companyRefFromDropDownId3,
                                  creationDate: getCurrentTimestamp,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  companyId: _model.companiesDropDownValue,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  creatorTitle: 'partnerOrOwner',
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownId3,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId3,
                                  workPlaceId: _model.workPlacesDropDownValue,
                                  pdfUrl: '',
                                  imageUrl: '',
                                  billPdfUrl: '',
                                  paymentDocumentPdfUrl: '',
                                  paymentDocumentImageUrl: '',
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına ekleme işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                              }
                            } else {
                              if (_model.ownerOrWorkerValue == 'worker') {
                                _model.companyRefFromDropDownId7 =
                                    await actions.getCompanyDocRef(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceRefFromDropDownId7 =
                                    await actions.getWorkPlaceDocRef(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );
                                _model.companyNameFromDropDownId7 =
                                    await actions.getCompanyName(
                                  _model.authorizingCompaniesDropDownValue!,
                                );
                                _model.workPlaceNameFromDropDownId7 =
                                    await actions.getWorkPlaceName(
                                  _model.authorizingWorkPlaceDropDownValue!,
                                );

                                await FinancialMonitoringNotesRecord.createDoc(
                                        currentUserReference!)
                                    .set(
                                        createFinancialMonitoringNotesRecordData(
                                  content: _model
                                      .textFieldContentTextController.text,
                                  creationDate: getCurrentTimestamp,
                                  isDeleted: false,
                                  financeType: FinanceNoteType.company,
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  companyRef: _model.companyRefFromDropDownId7,
                                  companyName:
                                      _model.companyNameFromDropDownId7,
                                  doesHaveBill: _model.doesHaveBillValue,
                                  whoCreated: currentUserReference,
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workplaceRef:
                                      _model.workPlaceRefFromDropDownId7,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId7,
                                  workPlaceId:
                                      _model.authorizingWorkPlaceDropDownValue,
                                  companyId:
                                      _model.authorizingCompaniesDropDownValue,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Yapılan ödeme/finans işlemi kişisel kayıtlara başarı ile eklendi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await FinancialNoteCompanyRecord.createDoc(
                                        _model.companyRefFromDropDownId7!)
                                    .set(createFinancialNoteCompanyRecordData(
                                  value: double.tryParse(_model
                                      .paymentOrCollectionValueTextController
                                      .text),
                                  creator: currentUserReference,
                                  creatorName: currentUserDisplayName,
                                  companyName:
                                      _model.companyNameFromDropDownId7,
                                  companyRef: _model.companyRefFromDropDownId7,
                                  creationDate: getCurrentTimestamp,
                                  incomeOrExpense:
                                      _model.incomeOrExpenseDropDownValue,
                                  content: _model
                                      .textFieldContentTextController.text,
                                  doesHaveBill:
                                      _model.doesHaveBillValue?.toString(),
                                  companyId:
                                      _model.authorizingCompaniesDropDownValue,
                                  creatorTitle: 'Yetkili',
                                  paidFromWhichAccount:
                                      _model.whichAccountValue,
                                  workPlaceRef:
                                      _model.workPlaceRefFromDropDownId7,
                                  workPlaceName:
                                      _model.workPlaceNameFromDropDownId7,
                                  workPlaceId:
                                      _model.authorizingWorkPlaceDropDownValue,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Şirket ödeme/finans kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );

                                await AjandaRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createAjandaRecordData(
                                    description: 'Yeni Not Eklendi',
                                    type: WorkHistoryTypes.createNote.name,
                                    fullDescription: _model
                                        .paymentOrCollectionValueTextController
                                        .text,
                                    noteFinance:
                                        widget.noteFinanceCompany?.reference,
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
                                      'Kişisel ajandaya  kayıt işlemi başarı ile gerçekleştirildi.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Color(0xFFFFFF00),
                                  ),
                                );
                                if (_model.doesHaveBillValue == true) {
                                  await CompanyBillRecord.createDoc(
                                          _model.companyRefFromDropDownId7!)
                                      .set(createCompanyBillRecordData(
                                    value: double.tryParse(_model
                                        .paymentOrCollectionValueTextController
                                        .text),
                                    creator: currentUserReference,
                                    creatorName: currentUserDisplayName,
                                    companyName:
                                        _model.companyNameFromDropDownId7,
                                    companyRef:
                                        _model.companyRefFromDropDownId7,
                                    creationDate: getCurrentTimestamp,
                                    content: _model
                                        .textFieldContentTextController.text,
                                    companyId: _model
                                        .authorizingCompaniesDropDownValue,
                                    incomeOrExpense:
                                        _model.incomeOrExpenseDropDownValue,
                                    creatorTitle: 'Yetkili',
                                    paidFromWhichAccount:
                                        _model.whichAccountValue,
                                    workPlaceRef:
                                        _model.workPlaceRefFromDropDownId7,
                                    workPlaceName:
                                        _model.workPlaceNameFromDropDownId7,
                                    workPlaceId: _model
                                        .authorizingWorkPlaceDropDownValue,
                                    pdfUrl: '',
                                    imageUrl: '',
                                    paymentDocumentPdfUrl: '',
                                    paymentDocumentImageUrl: '',
                                    billPdfUrl: '',
                                    billImageUrl: '',
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına ekleme işlemi başarı ile gerçekleştirildi.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Şirket faturalarına eklenmedi. Mali müşavir sayfasından daha sonra ekleyebilirsiniz.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Color(0xFFFFFF00),
                                    ),
                                  );
                                }
                              }
                            }
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Kayıt süreci başarı ile tamamlandı.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1500),
                              backgroundColor: Color(0xFFFFFF00),
                            ),
                          );
                          context.safePop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Validation Unsuccessfull',
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

                        safeSetState(() {});
                      },
                      text: 'Kaydet',
                      icon: Icon(
                        Icons.save_as,
                        size: 12.0,
                      ),
                      options: FFButtonOptions(
                        width: 110.0,
                        height: 44.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: 140.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF0000),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 2.0),
                        child: Text(
                          'Belge Türü Seçtikten Sonra Kaydet Aktifleşecek.',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 10.0),
                      child: StreamBuilder<List<CompaniesRecord>>(
                        stream: queryCompaniesRecord(
                          queryBuilder: (companiesRecord) =>
                              companiesRecord.where(Filter.or(
                            Filter(
                              'owner',
                              isEqualTo: currentUserReference,
                            ),
                            Filter(
                              'partners',
                              arrayContains: currentUserReference,
                            ),
                          )),
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
                              ownerOrWorkerCompaniesRecordList = snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.ownerOrWorkerValueController ??=
                                FormFieldController<String>(null),
                            options:
                                List<String>.from(['ownerOrPartner', 'worker']),
                            optionLabels: [
                              'Sahibi veya ortağı olduğun şirket',
                              'Yetkilisi olduğun şirket'
                            ],
                            onChanged: (val) => safeSetState(
                                () => _model.ownerOrWorkerValue = val),
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
                            hintText: 'Şirket türü ?',
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
                    if (_model.ownerOrWorkerValue == 'ownerOrPartner')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: StreamBuilder<List<CompaniesRecord>>(
                          stream: queryCompaniesRecord(
                            queryBuilder: (companiesRecord) =>
                                companiesRecord.where(Filter.or(
                              Filter(
                                'owner',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'partners',
                                arrayContains: currentUserReference,
                              ),
                            )),
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
                                      FormFieldController<String>(
                                _model.companiesDropDownValue ??= 'Other',
                              ),
                              options: List<String>.from(
                                  companiesDropDownCompaniesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels: companiesDropDownCompaniesRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) async {
                                safeSetState(
                                    () => _model.companiesDropDownValue = val);
                                _model.ownerCompaniesFDD =
                                    await actions.getCompanyDocRef(
                                  _model.companiesDropDownValue!,
                                );

                                safeSetState(() {});
                              },
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
                              hintText: 'Hangi şirketin ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                    if (_model.ownerOrWorkerValue == 'ownerOrPartner')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<WorkPlacesRecord>>(
                          stream: queryWorkPlacesRecord(
                            queryBuilder: (workPlacesRecord) =>
                                workPlacesRecord.where(Filter.or(
                              Filter(
                                'owner',
                                isEqualTo: currentUserReference,
                              ),
                              Filter(
                                'partners',
                                arrayContains: currentUserReference,
                              ),
                            )),
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
                            List<WorkPlacesRecord>
                                workPlacesDropDownWorkPlacesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.workPlacesDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.workPlacesDropDownValue ??= 'Other',
                              ),
                              options: List<String>.from(
                                  workPlacesDropDownWorkPlacesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  workPlacesDropDownWorkPlacesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) => safeSetState(
                                  () => _model.workPlacesDropDownValue = val),
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
                              hintText: 'Hangi işyerin ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                    if (_model.ownerOrWorkerValue == 'worker')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<CompaniesRecord>>(
                          stream: queryCompaniesRecord(
                            queryBuilder: (companiesRecord) =>
                                companiesRecord.where(
                              'expenditureAuthorizedOfficers',
                              arrayContains: currentUserReference,
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
                                authorizingCompaniesDropDownCompaniesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller: _model
                                      .authorizingCompaniesDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.authorizingCompaniesDropDownValue ??=
                                    'Other',
                              ),
                              options: List<String>.from(
                                  authorizingCompaniesDropDownCompaniesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  authorizingCompaniesDropDownCompaniesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) async {
                                safeSetState(() => _model
                                    .authorizingCompaniesDropDownValue = val);
                                _model.authorizingCompanyFDD =
                                    await actions.getCompanyDocRef(
                                  _model.authorizingCompaniesDropDownValue!,
                                );

                                safeSetState(() {});
                              },
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
                              hintText: 'Yetkilisi olduğun şirket ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                    if (_model.ownerOrWorkerValue == 'worker')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: StreamBuilder<List<WorkPlacesRecord>>(
                          stream: queryWorkPlacesRecord(
                            queryBuilder: (workPlacesRecord) =>
                                workPlacesRecord.where(
                              'expenditureAuthorizedOfficers',
                              arrayContains: currentUserReference,
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
                            List<WorkPlacesRecord>
                                authorizingWorkPlaceDropDownWorkPlacesRecordList =
                                snapshot.data!;

                            return FlutterFlowDropDown<String>(
                              controller: _model
                                      .authorizingWorkPlaceDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.authorizingWorkPlaceDropDownValue ??=
                                    'Other',
                              ),
                              options: List<String>.from(
                                  authorizingWorkPlaceDropDownWorkPlacesRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels:
                                  authorizingWorkPlaceDropDownWorkPlacesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                              onChanged: (val) => safeSetState(() => _model
                                  .authorizingWorkPlaceDropDownValue = val),
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
                              hintText: 'Yetkilisi olduğun işyeri ?',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          hintText: 'Belge Türü Seç',
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
                                                      .isDataUploading_companyUploadPDFCheck =
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
                                                _model.isDataUploading_companyUploadPDFCheck =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedFiles.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_companyUploadPDFCheck =
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
                                                      .uploadedLocalFile_companyUploadPDFCheck
                                                      .bytes,
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
                                                      .isDataUploading_uploadMediaPaymentForCompany =
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
                                                _model.isDataUploading_uploadMediaPaymentForCompany =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_uploadMediaPaymentForCompany =
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
                                                if ((_model.uploadedLocalFile_uploadMediaPaymentForCompany
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
                                                        _model.uploadedLocalFile_uploadMediaPaymentForCompany
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
                                              .paymentOrCollectionValueTextController,
                                          focusNode: _model
                                              .paymentOrCollectionValueFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.paymentOrCollectionValueTextController',
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
                                                    .paymentOrCollectionValueTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .paymentOrCollectionValueTextController
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
                                              .paymentOrCollectionValueTextControllerValidator
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
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .incomeOrExpenseDropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: List<String>.from(
                                              ['income', 'expense']),
                                          optionLabels: ['Gelir', 'Gider'],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.incomeOrExpenseDropDownValue =
                                                  val),
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
                                    if (_model.incomeOrExpenseDropDownValue ==
                                        'expense')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .expenseTypeValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: List<String>.from([
                                              'oneTime',
                                              'current',
                                              'worker',
                                              'tax',
                                              'socialSecurity'
                                            ]),
                                            optionLabels: [
                                              'Tek seferlik ödeme',
                                              'Devam eden cari hesap ödemesi',
                                              'Personel maaş/mesai ödemesi',
                                              'Vergi ödemesi',
                                              'Sigorta ödemesi'
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.expenseTypeValue =
                                                    val),
                                            width: double.infinity,
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
                                            hintText: 'Gider türü ?',
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
                                      ),
                                    if (_model.expenseTypeValue == 'current')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .whichTypeCurrentValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: List<String>.from(
                                                ['person', 'company']),
                                            optionLabels: ['Kişi', 'Şirket'],
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .whichTypeCurrentValue =
                                                    val),
                                            width: double.infinity,
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
                                            hintText: 'Cari tipi ?',
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
                                      ),
                                    if ((_model.whichTypeCurrentValue ==
                                            'person') &&
                                        (_model.ownerOrWorkerValue ==
                                            'ownerOrPartner'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<CompaniesCurrentsRecord>>(
                                            stream:
                                                queryCompaniesCurrentsRecord(
                                              parent: _model.ownerCompaniesFDD,
                                              queryBuilder:
                                                  (companiesCurrentsRecord) =>
                                                      companiesCurrentsRecord
                                                          .where(
                                                            'personOrCompany',
                                                            isEqualTo: 'person',
                                                          )
                                                          .where(
                                                            'supplierOrCustomer',
                                                            isEqualTo:
                                                                'supplier',
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompaniesCurrentsRecord>
                                                  whichCurrentPersonForOwnerCompaniesCurrentsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .whichCurrentPersonForOwnerValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from(
                                                    <String>[]),
                                                optionLabels:
                                                    whichCurrentPersonForOwnerCompaniesCurrentsRecordList
                                                        .map((e) => e
                                                            .supplierPersonName)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .whichCurrentPersonForOwnerValue =
                                                        val),
                                                width: double.infinity,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                hintText:
                                                    'Hangi kişisel cari ?',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                    if ((_model.whichTypeCurrentValue ==
                                            'person') &&
                                        (_model.ownerOrWorkerValue == 'worker'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<CompaniesCurrentsRecord>>(
                                            stream:
                                                queryCompaniesCurrentsRecord(
                                              parent:
                                                  _model.authorizingCompanyFDD,
                                              queryBuilder:
                                                  (companiesCurrentsRecord) =>
                                                      companiesCurrentsRecord
                                                          .where(
                                                            'personOrCompany',
                                                            isEqualTo: 'person',
                                                          )
                                                          .where(
                                                            'supplierOrCustomer',
                                                            isEqualTo:
                                                                'supplier',
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompaniesCurrentsRecord>
                                                  whichCurrentPersonForWorkerCompaniesCurrentsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .whichCurrentPersonForWorkerValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from(
                                                    <String>[]),
                                                optionLabels:
                                                    whichCurrentPersonForWorkerCompaniesCurrentsRecordList
                                                        .map((e) => e
                                                            .supplierPersonName)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .whichCurrentPersonForWorkerValue =
                                                        val),
                                                width: double.infinity,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                hintText:
                                                    'Hangi kişisel cari ?',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                    if ((_model.whichTypeCurrentValue ==
                                            'company') &&
                                        (_model.ownerOrWorkerValue ==
                                            'ownerOrPartner'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<CompaniesCurrentsRecord>>(
                                            stream:
                                                queryCompaniesCurrentsRecord(
                                              queryBuilder:
                                                  (companiesCurrentsRecord) =>
                                                      companiesCurrentsRecord
                                                          .where(
                                                            'companyRef',
                                                            isEqualTo: _model
                                                                .ownerCompaniesFDD,
                                                          )
                                                          .where(
                                                            'companyRef',
                                                            isEqualTo: _model
                                                                .authorizingCompanyFDD,
                                                          )
                                                          .where(
                                                            'personOrCompany',
                                                            isEqualTo:
                                                                'company',
                                                          )
                                                          .where(
                                                            'supplierOrCustomer',
                                                            isEqualTo:
                                                                'supplier',
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompaniesCurrentsRecord>
                                                  whichCurrentCompanyForOwnerCompaniesCurrentsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .whichCurrentCompanyForOwnerValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from(
                                                    <String>[]),
                                                optionLabels:
                                                    whichCurrentCompanyForOwnerCompaniesCurrentsRecordList
                                                        .map((e) => e
                                                            .supplierCompanyName)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .whichCurrentCompanyForOwnerValue =
                                                        val),
                                                width: double.infinity,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                hintText:
                                                    'Hangi şirket carisi ?',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                    if ((_model.whichTypeCurrentValue ==
                                            'company') &&
                                        (_model.ownerOrWorkerValue == 'worker'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: StreamBuilder<
                                              List<CompaniesCurrentsRecord>>(
                                            stream:
                                                queryCompaniesCurrentsRecord(
                                              queryBuilder:
                                                  (companiesCurrentsRecord) =>
                                                      companiesCurrentsRecord
                                                          .where(
                                                            'companyRef',
                                                            isEqualTo: _model
                                                                .ownerCompaniesFDD,
                                                          )
                                                          .where(
                                                            'companyRef',
                                                            isEqualTo: _model
                                                                .authorizingCompanyFDD,
                                                          )
                                                          .where(
                                                            'personOrCompany',
                                                            isEqualTo:
                                                                'company',
                                                          )
                                                          .where(
                                                            'supplierOrCustomer',
                                                            isEqualTo:
                                                                'supplier',
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompaniesCurrentsRecord>
                                                  whichCurrentCompanyForWorkerCompaniesCurrentsRecordList =
                                                  snapshot.data!;

                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .whichCurrentCompanyForWorkerValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from(
                                                    <String>[]),
                                                optionLabels:
                                                    whichCurrentCompanyForWorkerCompaniesCurrentsRecordList
                                                        .map((e) => e
                                                            .supplierCompanyName)
                                                        .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .whichCurrentCompanyForWorkerValue =
                                                        val),
                                                width: double.infinity,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                hintText:
                                                    'Hangi şirket carisi ?',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                    if (_model.incomeOrExpenseDropDownValue ==
                                        IncomeOrExpense.gider.name)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 16.0, 4.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .whichAccountValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: List<String>.from([
                                              'vault',
                                              'personalAccount',
                                              'companyAccount',
                                              'someoneElse'
                                            ]),
                                            optionLabels: [
                                              'Kasamdan',
                                              'Şahsi hesabımdan',
                                              'Şirket Hesabından',
                                              'Başka birinden'
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.whichAccountValue =
                                                    val),
                                            width: double.infinity,
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
                                            hintText:
                                                'Hangi hesaptan ödeme yapılıyor ?',
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
