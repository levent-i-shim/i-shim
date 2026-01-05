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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:open_file/open_file.dart';

class FileMessage extends StatelessWidget {
  final String pdfUrl;
  final String pdfName;
  final double width;
  final double height;

  const FileMessage({
    Key? key,
    required this.pdfUrl,
    required this.pdfName,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openFileExternally(pdfUrl);
      },
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              _getFileIcon(pdfName),
              size: 32,
              color: Colors.black,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pdfName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getFileTypeLabel(pdfName),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openFileExternally(String filePath) async {
    final result = await OpenFile.open(filePath);
    if (result.type == ResultType.noAppToOpen) {
      debugPrint("PDF açmak için uygun uygulama bulunamadı.");
    } else if (result.type == ResultType.error) {
      debugPrint("Dosya açılamadı: ${result.message}");
    }
  }

  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();

    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.grid_on;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
        return Icons.notes;
      default:
        return Icons.insert_drive_file;
    }
  }

  String _getFileTypeLabel(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return 'PDF Belgesi';
      case 'doc':
      case 'docx':
        return 'Word Belgesi';
      case 'xls':
      case 'xlsx':
        return 'Excel Çalışma Sayfası';
      case 'ppt':
      case 'pptx':
        return 'PowerPoint Sunumu';
      case 'txt':
        return 'Metin Dosyası';
      default:
        return 'Dosya';
    }
  }
}
