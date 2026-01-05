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

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class DynamicFormWidget extends StatefulWidget {
  const DynamicFormWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.formFields,
      required this.formDocRef,
      this.companyTaskDuties,
      required this.companyDocRef,
      required this.reportsTo,
      required this.isDuty,
      required this.authUser,
      required this.userName,
      required this.taskName,
      this.task})
      : super(key: key);

  final double width;
  final double height;
  final List<FormFieldsRecord> formFields;
  final DocumentReference formDocRef;
  final DocumentReference? companyTaskDuties;
  final DocumentReference companyDocRef;
  final DocumentReference reportsTo;
  final bool isDuty;
  final DocumentReference? task;
  final DocumentReference authUser;
  final String userName;
  final String taskName;

  @override
  _DynamicFormWidgetState createState() => _DynamicFormWidgetState();
}

class _DynamicFormWidgetState extends State<DynamicFormWidget> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String> _switchValues = {};
  final Map<String, DateTime?> _dateValues = {};
  final Map<String, String?> _imageUrls = {};
  final Map<String, String?> _dropdownValues = {};

  @override
  void initState() {
    super.initState();
    for (var doc in widget.formFields) {
      String fieldName = doc.fieldName;
      String fieldType = doc.fieldValueType;

      if (fieldType == 'Boolean') {
        _switchValues[fieldName] = "false";
      } else if (fieldType == 'DateTime') {
        _dateValues[fieldName] = null;
      } else if (fieldType == 'Text' || fieldType == 'Number') {
        _controllers[fieldName] = TextEditingController();
      } else if (fieldType == 'DropDown') {
        _dropdownValues[fieldName] = null;
      }
    }
  }

  Future<void> _pickImageAndUpload(String fieldName, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(pickedFile.path)}';
      final imageRef = storageRef.child('images/$fileName');

      // Dosya uzantısına göre Content-Type belirle
      final extension = path.extension(pickedFile.path).toLowerCase();
      String contentType;
      switch (extension) {
        case '.png':
          contentType = 'image/png';
          break;
        case '.jpg':
        case '.jpeg':
          contentType = 'image/jpeg';
          break;
        case '.gif':
          contentType = 'image/gif';
          break;
        case '.bmp':
          contentType = 'image/bmp';
          break;
        case '.webp':
          contentType = 'image/webp';
          break;
        default:
          contentType = 'image/png'; // varsayılan image/png
      }

      if (kIsWeb) {
        final data = await pickedFile.readAsBytes();
        await imageRef.putData(
          data,
          SettableMetadata(contentType: contentType),
        );
      } else {
        await imageRef.putFile(
          File(pickedFile.path),
          SettableMetadata(contentType: contentType),
        );
      }

      final downloadUrl = await imageRef.getDownloadURL();

      setState(() {
        _imageUrls[fieldName] = downloadUrl;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fotoğraf başarıyla yüklendi.")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fotoğraf seçilmedi.")),
      );
    }
  }

  void _showImageSourceSheet(String fieldName) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Kamerayla Çek"),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImageAndUpload(fieldName, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Galeriden Seç"),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImageAndUpload(fieldName, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    List<DocumentReference> createdResponses = [];

    for (var doc in widget.formFields) {
      String fieldName = doc.fieldName;
      String fieldType = doc.fieldValueType;

      dynamic value;
      Map<String, dynamic> responseData = {
        'fieldName': fieldName,
        'fieldValueType': fieldType,
        'date': FieldValue.serverTimestamp(),
        'sentBy': widget.authUser
      };

      if (widget.isDuty) {
        responseData['companyTaskDuties'] = widget.companyTaskDuties;
      } else {
        responseData['companyTask'] = widget.task;
      }

      if (fieldType == 'Text' || fieldType == 'Number') {
        value = _controllers[fieldName]?.text;
        responseData['fieldValue'] = value;
      } else if (fieldType == 'Boolean') {
        value = _switchValues[fieldName];
        responseData['fieldValue'] = value;
      } else if (fieldType == 'DateTime') {
        value = _dateValues[fieldName]?.toIso8601String();
        responseData['fieldValue'] = value;
      } else if (fieldType == 'Image') {
        value = _imageUrls[fieldName];
        responseData['imagePath'] = value;
      } else if (fieldType == 'DropDown') {
        value = _dropdownValues[fieldName];
        responseData['fieldValue'] = value;
      }

      DocumentReference responseRef =
          await widget.formDocRef.collection('formResponses').add(responseData);

      createdResponses.add(responseRef);
    }

    String relatedDoc = "";
    // Create companyReports entry
    if (widget.isDuty) {
      await widget.companyDocRef.collection('companyReports').add({
        'reportsTo': widget.reportsTo,
        'duty': widget.companyTaskDuties,
        'isSendTransaction': false,
        'date': FieldValue.serverTimestamp(),
        'isDelete': false,
        'hasResponse': true,
        'responses': createdResponses,
        'sentBy': widget.authUser,
        'taskName': widget.taskName
      });
      relatedDoc = widget.companyTaskDuties!.id;
      await widget.authUser.collection('ajanda').add({
        'type': "sendReportDuty",
        'content': "Rapor Gönderildi",
        'dateTime': FieldValue.serverTimestamp(),
        'companyTaskDuties': widget.companyTaskDuties
      });
    } else {
      await widget.companyDocRef.collection('companyReports').add({
        'reportsTo': widget.reportsTo,
        'task': widget.task,
        'isSendTransaction': false,
        'date': FieldValue.serverTimestamp(),
        'isDelete': false,
        'hasResponse': true,
        'responses': createdResponses,
        'sentBy': widget.authUser,
        'taskName': widget.taskName
      });
      relatedDoc = widget.task!.id;
      await widget.authUser.collection('ajanda').add({
        'type': "sendReportTask",
        'description': "Rapor Gönderildi",
        'dateTime': FieldValue.serverTimestamp(),
        'companyTask': widget.task
      });
    }
    await widget.reportsTo.collection('notifications').add({
      'type': "taskReport",
      'content': "Rapor Gönderildi",
      'relatedDoc': relatedDoc,
      'isDelete': false,
      'isRead': false,
      'creationTime': FieldValue.serverTimestamp(),
      'isDuty': widget.isDuty,
      'company': widget.companyDocRef,
      'fullDescription':
          "${widget.userName} İsimli çalışan ${widget.taskName} isimli Görev için yeni bir rapor oluşturdu."
    });

    await widget.reportsTo.update({
      'notificationCount': FieldValue.increment(1),
    });

    final querySnapshot = await widget.authUser
        .collection('workHistory')
        .where('company', isEqualTo: widget.companyDocRef)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first.reference;

      final currentCount = querySnapshot.docs.first.data()['reportCount'] ?? 0;

      await doc.update({
        'reportCount': currentCount + 1,
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Form başarıyla gönderildi!")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ...widget.formFields.map((doc) {
              String fieldName = doc.fieldName;
              String fieldType = doc.fieldValueType;

              switch (fieldType) {
                case 'Text':
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          maxLines: 5,
                          minLines: 1,
                          controller: _controllers[fieldName],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.text_fields),
                          ),
                        ),
                      ],
                    ),
                  );
                case 'Number':
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _controllers[fieldName],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.dialpad),
                          ),
                        ),
                      ],
                    ),
                  );
                case 'Boolean':
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SwitchListTile(
                      title: Text(
                        fieldName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      value: bool.parse(_switchValues[fieldName] ?? "false"),
                      onChanged: (val) {
                        setState(() {
                          _switchValues[fieldName] = val.toString();
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Colors.grey[100],
                    ),
                  );
                case 'DateTime':
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              fieldName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.calendar_today),
                            label: Text(
                              _dateValues[fieldName] != null
                                  ? "${_dateValues[fieldName]!.day}/${_dateValues[fieldName]!.month}/${_dateValues[fieldName]!.year}"
                                  : "Tarih seçin",
                              style: TextStyle(
                                color: _dateValues[fieldName] != null
                                    ? Colors.black87
                                    : Colors.grey[600],
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (selectedDate != null) {
                                setState(() {
                                  _dateValues[fieldName] = selectedDate;
                                });
                              }
                            },
                          ),
                        ],
                      ));
                case 'Image':
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: _imageUrls[fieldName] != null
                              ? Image.network(
                                  _imageUrls[fieldName]!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                )
                              : Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.photo_camera),
                          onPressed: () {
                            _showImageSourceSheet(fieldName);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          label: const Text("Fotoğraf Seç"),
                        ),
                      ],
                    ),
                  );
                case 'DropDown':
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          value: _dropdownValues[fieldName],
                          items: doc.options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValues[fieldName] = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                  );

                default:
                  return const SizedBox.shrink();
              }
            }).toList(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.send),
                label: const Text("Gönder"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
