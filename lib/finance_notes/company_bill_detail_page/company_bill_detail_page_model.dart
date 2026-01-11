import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'company_bill_detail_page_widget.dart' show CompanyBillDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyBillDetailPageModel
    extends FlutterFlowModel<CompanyBillDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_companyBillUploadPDF21 = false;
  FFUploadedFile uploadedLocalFile_companyBillUploadPDF21 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
