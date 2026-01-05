// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:i_shim/flutter_flow/flutter_flow_pdf_viewer.dart';
import 'package:open_file/open_file.dart';

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!
class CustomPdfViewer extends StatefulWidget {
  final String pdfUrl;
  final double height;
  final double width;

  const CustomPdfViewer({
    Key? key,
    required this.pdfUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _CustomPdfViewerState createState() => _CustomPdfViewerState();
}

class _CustomPdfViewerState extends State<CustomPdfViewer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: loadPdfBytes(widget.pdfUrl),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: widget.height,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == null) {
          return SizedBox(
            height: widget.height,
            child: const Center(child: Text("PDF yüklenemedi")),
          );
        }

        return InkWell(
          onTap: () {
            openPdfExternally(widget.pdfUrl);
          },
          child: FlutterFlowPdfViewer(
            fileBytes: snapshot.data!,
            width: widget.width,
            height: widget.height,
            horizontalScroll: false,
          ),
        );
      },
    );
  }

  Future<Uint8List?> loadPdfBytes(String filePath) async {
    try {
      final file = File(filePath);
      return await file.readAsBytes();
    } catch (e) {
      print("PDF okuma hatası : $e");
      return null;
    }
  }

  void openPdfExternally(String filePath) async {
    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.noAppToOpen) {
      print("PDF açmak için uygun uygulama bulunamadı.");
    } else if (result.type == ResultType.error) {
      print("Dosya açılamadı: ${result.message}");
    }
  }
}
