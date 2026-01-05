// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<void> getAllMessages(DocumentReference authUser) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final user1Query = await firestore
      .collection('Message')
      .where('user1', isEqualTo: authUser)
      .get();

  final user2Query = await firestore
      .collection('Message')
      .where('user2', isEqualTo: authUser)
      .get();

  final allDocs = [...user1Query.docs, ...user2Query.docs];

  for (var doc in allDocs) {
    final data = doc.data() as Map<String, dynamic>;
    final user1Ref = data['user1'] as DocumentReference;
    final user2Ref = data['user2'] as DocumentReference;

    final bool amIUser1 = user1Ref == authUser;

    if (data['lastMessageTimeWorkplace'] != null) {
      await SQLiteManager.instance.addConversation(
          conversationName: doc.id,
          type: "workplace",
          user1Ref: user1Ref.toString(),
          user2Ref: user2Ref.toString());
      final result = await SQLiteManager.instance
          .getConversationWithLastMessage(
              conversationName: doc.id, type: "workplace");

      final workPlaceMessagesSnapshot = await firestore
          .collection('Message')
          .doc(doc.id)
          .collection('workPlaceMessages')
          .get();

      for (var messageDoc in workPlaceMessagesSnapshot.docs) {
        final messageData = messageDoc.data();
        final date = messageData['date'];
        final dateStr = (date is Timestamp)
            ? date.toDate().toIso8601String()
            : date.toString();
        final isDeleted = amIUser1
            ? messageData['isUser1Delete'] ?? false
            : messageData['isUser2Delete'] ?? false;
        final mapName = amIUser1
            ? messageData['mapNameUser1'] ?? ""
            : messageData['mapNameUser2'] ?? "";

        _saveToLocalSQL(
            message: messageData["message"] ?? "",
            conversationId: result.last.id,
            sender: messageData["senderRef"].toString(),
            isPerson: messageData["isPerson"] ?? false,
            personName: messageData["personName"] ?? "",
            personNumber: messageData["personNumber"] ?? "",
            receiver: messageData["receiverRef"].toString(),
            editMessage: messageData["editMessage"] ?? "",
            date: dateStr,
            isMap: messageData["isMap"] ?? false,
            latitude: messageData["latitude"] ?? 0,
            longitude: messageData["longitude"] ?? 0,
            mapName: mapName,
            isStared: amIUser1
                ? messageData["isStaredFromUser1"] ?? false
                : messageData["isStaredFromUser2"] ?? false,
            reactionFromMe: amIUser1
                ? messageData["reactionFromUser1"] ?? ""
                : messageData["reactionFromUser2"] ?? "",
            reactionFromOther: amIUser1
                ? messageData["reactionFromUser2"] ?? ""
                : messageData["reactionFromUser1"] ?? "",
            answeredMessage: messageData["answeredMessage"] ?? "",
            firebaseId: messageDoc.id,
            isDeleted: isDeleted,
            pdfUrl: messageData["pdfUrl"] ?? "",
            isFile: messageData["isFile"] ?? false,
            fileUrl: messageData["fileUrl"] ?? "",
            fileName: messageData["fileName"] ?? "",
            imagePath: messageData["imageUrl"] ?? "");
      }
    }
    if (data['lastMessageTimeCompany'] != null) {
      await SQLiteManager.instance.addConversation(
          conversationName: doc.id,
          type: "company",
          user1Ref: user1Ref.toString(),
          user2Ref: user2Ref.toString());
      final result = await SQLiteManager.instance
          .getConversationWithLastMessage(
              conversationName: doc.id, type: "company");

      final workPlaceMessagesSnapshot = await firestore
          .collection('Message')
          .doc(doc.id)
          .collection('companyMessages')
          .get();

      for (var messageDoc in workPlaceMessagesSnapshot.docs) {
        final messageData = messageDoc.data();
        final date = messageData['date'];
        final dateStr = (date is Timestamp)
            ? date.toDate().toIso8601String()
            : date.toString();

        final isDeleted = amIUser1
            ? messageData['isUser1Delete'] ?? false
            : messageData['isUser2Delete'] ?? false;
        final mapName = amIUser1
            ? messageData['mapNameUser1'] ?? ""
            : messageData['mapNameUser2'] ?? "";
        if (isDeleted) {
          continue;
        }

        _saveToLocalSQL(
            message: messageData["message"] ?? "",
            conversationId: result.last.id,
            sender: messageData["senderRef"].toString(),
            receiver: messageData["receiverRef"].toString(),
            editMessage: messageData["editMessage"] ?? "",
            date: dateStr,
            isStared: amIUser1
                ? messageData["isStaredFromUser1"] ?? false
                : messageData["isStaredFromUser2"] ?? false,
            answeredMessage: messageData["answeredMessage"] ?? "",
            isPerson: messageData["isPerson"] ?? false,
            personName: messageData["personName"] ?? "",
            personNumber: messageData["personNumber"] ?? "",
            reactionFromMe: amIUser1
                ? messageData["reactionFromUser1"] ?? ""
                : messageData["reactionFromUser2"] ?? "",
            reactionFromOther: amIUser1
                ? messageData["reactionFromUser2"] ?? ""
                : messageData["reactionFromUser1"] ?? "",
            firebaseId: messageDoc.id,
            pdfUrl: messageData["pdfUrl"] ?? "",
            isDeleted: isDeleted,
            isMap: messageData["isMap"] ?? false,
            latitude: messageData["latitude"] ?? 0,
            longitude: messageData["longitude"] ?? 0,
            mapName: mapName,
            isFile: messageData["isFile"] ?? false,
            fileUrl: messageData["fileUrl"] ?? "",
            fileName: messageData["fileName"] ?? "",
            imagePath: messageData["imageUrl"] ?? "");
      }
    }
    if (data['lastMessageTimePhone'] != null) {
      await SQLiteManager.instance.addConversation(
          conversationName: doc.id,
          type: "phone",
          user1Ref: user1Ref.toString(),
          user2Ref: user2Ref.toString());
      final result = await SQLiteManager.instance
          .getConversationWithLastMessage(
              conversationName: doc.id, type: "phone");

      final workPlaceMessagesSnapshot = await firestore
          .collection('Message')
          .doc(doc.id)
          .collection('phoneMessages')
          .get();

      for (var messageDoc in workPlaceMessagesSnapshot.docs) {
        final messageData = messageDoc.data();
        final date = messageData['date'];
        final dateStr = (date is Timestamp)
            ? date.toDate().toIso8601String()
            : date.toString();

        final isDeleted = amIUser1
            ? messageData['isUser1Delete'] ?? false
            : messageData['isUser2Delete'] ?? false;
        final mapName = amIUser1
            ? messageData['mapNameUser1'] ?? ""
            : messageData['mapNameUser2'] ?? "";
        if (isDeleted) {
          continue;
        }
        _saveToLocalSQL(
            message: messageData["message"] ?? "",
            conversationId: result.last.id,
            sender: messageData["senderRef"].toString(),
            receiver: messageData["receiverRef"].toString(),
            editMessage: messageData["editMessage"] ?? "",
            date: dateStr,
            isStared: amIUser1
                ? messageData["isStaredFromUser1"] ?? false
                : messageData["isStaredFromUser2"] ?? false,
            answeredMessage: messageData["answeredMessage"] ?? "",
            reactionFromMe: amIUser1
                ? messageData["reactionFromUser1"] ?? ""
                : messageData["reactionFromUser2"] ?? "",
            reactionFromOther: amIUser1
                ? messageData["reactionFromUser2"] ?? ""
                : messageData["reactionFromUser1"] ?? "",
            firebaseId: messageDoc.id,
            pdfUrl: messageData["pdfUrl"] ?? "",
            isDeleted: isDeleted,
            isMap: messageData["isMap"] ?? false,
            latitude: messageData["latitude"] ?? 0,
            longitude: messageData["longitude"] ?? 0,
            mapName: mapName,
            isPerson: messageData["isPerson"] ?? false,
            personName: messageData["personName"] ?? "",
            personNumber: messageData["personNumber"] ?? "",
            isFile: messageData["isFile"] ?? false,
            fileUrl: messageData["fileUrl"] ?? "",
            fileName: messageData["fileName"] ?? "",
            imagePath: messageData["imageUrl"] ?? "");
      }
    }
    if (data['lastMessageTimeSocial'] != null) {
      await SQLiteManager.instance.addConversation(
          conversationName: doc.id,
          type: "social",
          user1Ref: user1Ref.toString(),
          user2Ref: user2Ref.toString());
      final result = await SQLiteManager.instance
          .getConversationWithLastMessage(
              conversationName: doc.id, type: "social");

      final workPlaceMessagesSnapshot = await firestore
          .collection('Message')
          .doc(doc.id)
          .collection('socialMessages')
          .get();

      for (var messageDoc in workPlaceMessagesSnapshot.docs) {
        final messageData = messageDoc.data();
        final date = messageData['date'];
        final dateStr = (date is Timestamp)
            ? date.toDate().toIso8601String()
            : date.toString();

        final isDeleted = amIUser1
            ? messageData['isUser1Delete'] ?? false
            : messageData['isUser2Delete'] ?? false;
        final mapName = amIUser1
            ? messageData['mapNameUser1'] ?? ""
            : messageData['mapNameUser2'] ?? "";
        if (isDeleted) {
          continue;
        }
        _saveToLocalSQL(
            message: messageData["message"] ?? "",
            conversationId: result.last.id,
            sender: messageData["senderRef"].toString(),
            receiver: messageData["receiverRef"].toString(),
            editMessage: messageData["editMessage"] ?? "",
            date: dateStr,
            isMap: messageData["isMap"] ?? false,
            latitude: messageData["latitude"] ?? 0,
            longitude: messageData["longitude"] ?? 0,
            mapName: mapName,
            isStared: amIUser1
                ? messageData["isStaredFromUser1"] ?? false
                : messageData["isStaredFromUser2"] ?? false,
            reactionFromMe: amIUser1
                ? messageData["reactionFromUser1"] ?? ""
                : messageData["reactionFromUser2"] ?? "",
            reactionFromOther: amIUser1
                ? messageData["reactionFromUser2"] ?? ""
                : messageData["reactionFromUser1"] ?? "",
            answeredMessage: messageData["answeredMessage"] ?? "",
            firebaseId: messageDoc.id,
            pdfUrl: messageData["pdfUrl"] ?? "",
            isDeleted: isDeleted,
            isFile: messageData["isFile"] ?? false,
            fileUrl: messageData["fileUrl"] ?? "",
            fileName: messageData["fileName"] ?? "",
            isPerson: messageData["isPerson"] ?? false,
            personName: messageData["personName"] ?? "",
            personNumber: messageData["personNumber"] ?? "",
            imagePath: messageData["imageUrl"] ?? "");
      }
    }
  }

  final newMessagesSnapshot = await authUser.collection('newMessages').get();

  for (final doc in newMessagesSnapshot.docs) {
    await doc.reference.delete();
  }

  await authUser.update({"messageCount": 0});
}

Future<bool> _saveToLocalSQL(
    {required String message,
    required int conversationId,
    required String sender,
    required String receiver,
    required String date,
    required String pdfUrl,
    required String answeredMessage,
    required String firebaseId,
    required String reactionFromMe,
    required String reactionFromOther,
    required bool isStared,
    required bool isDeleted,
    required String editMessage,
    required bool isPerson,
    required String personName,
    required String personNumber,
    required bool isFile,
    required bool isMap,
    required double latitude,
    required double longitude,
    required String mapName,
    required String fileName,
    required String fileUrl,
    required String imagePath}) async {
  if (pdfUrl.isNotEmpty) {
    final pathPdf = await _downloadPdf(pdfUrl);
    if (pathPdf == null || !(await File(pathPdf).exists())) {
      print('PDF dosyası indirilemedi veya bulunamadı.');
      return false;
    }

    try {
      await SQLiteManager.instance.addMessageWithPdf(
          conversationId: conversationId,
          date: date,
          isRead: 1,
          pdfUrl: pathPdf,
          message: message.isEmpty ? "" : message,
          receiverRef: receiver,
          answeredMessage: answeredMessage,
          reactionFromMe: reactionFromMe,
          isDeleted: isDeleted ? 1 : 0,
          isDeletedFromMe: 0,
          isEdited: editMessage.isNotEmpty ? 1 : 0,
          editedMessage: editMessage,
          isFullyDeleted: isDeleted ? 1 : 0,
          reactionFromOther: reactionFromOther,
          isStared: isStared ? 1 : 0,
          firebaseId: firebaseId,
          answeredMessageUserName: "",
          senderRef: sender);
    } catch (e) {
      return false;
    }
  } else if (imagePath.isNotEmpty) {
    final imagePathLocal = await _downloadImage(imagePath);
    if (imagePathLocal == null || !(await File(imagePathLocal).exists())) {
      print('Görsel dosyası indirilemedi veya bulunamadı.');
      return false;
    }
    try {
      await SQLiteManager.instance.addMessageWithImage(
          conversationId: conversationId,
          date: date,
          isRead: 1,
          imagePath: imagePathLocal,
          message: message.isEmpty ? "" : message,
          receiverRef: receiver,
          answeredMessage: answeredMessage,
          reactionFromMe: reactionFromMe,
          isDeleted: isDeleted ? 1 : 0,
          isDeletedFromMe: 0,
          isEdited: editMessage.isNotEmpty ? 1 : 0,
          editedMessage: editMessage,
          isFullyDeleted: isDeleted ? 1 : 0,
          reactionFromOther: reactionFromOther,
          isStared: isStared ? 1 : 0,
          firebaseId: firebaseId,
          answeredMessageUserName: "",
          senderRef: sender);
    } catch (e) {
      return false;
    }
  } else if (isFile) {
    final pathPdf = await _downloadPdf(fileUrl);
    if (pathPdf == null || !(await File(pathPdf).exists())) {
      print('PDF dosyası indirilemedi veya bulunamadı.');
      return false;
    }
    try {
      await SQLiteManager.instance.addMessage(
          conversationId: conversationId,
          date: date,
          isRead: 1,
          message: message.toString(),
          receiverRef: receiver,
          answeredMessage: answeredMessage,
          reactionFromMe: reactionFromMe,
          isDeleted: isDeleted ? 1 : 0,
          isDeletedFromMe: 0,
          isEdited: editMessage.isNotEmpty ? 1 : 0,
          editedMessage: editMessage,
          isFullyDeleted: isDeleted ? 1 : 0,
          reactionFromOther: reactionFromOther,
          isFile: 1,
          isMap: isMap ? 1 : 0,
          latitude: latitude,
          longitude: longitude,
          mapName: mapName,
          fileName: fileName,
          fileUrl: pathPdf,
          isStared: isStared ? 1 : 0,
          firebaseId: firebaseId,
          answeredMessageUserName: "",
          senderRef: sender);
    } catch (e) {
      return false;
    }
  } else {
    try {
      await SQLiteManager.instance.addMessage(
          conversationId: conversationId,
          date: date,
          isRead: 1,
          message: message.toString(),
          receiverRef: receiver,
          answeredMessage: answeredMessage,
          reactionFromMe: reactionFromMe,
          isDeleted: isDeleted ? 1 : 0,
          isDeletedFromMe: 0,
          isEdited: editMessage.isNotEmpty ? 1 : 0,
          editedMessage: editMessage,
          isFullyDeleted: isDeleted ? 1 : 0,
          reactionFromOther: reactionFromOther,
          isMap: isMap ? 1 : 0,
          latitude: latitude,
          longitude: longitude,
          mapName: mapName,
          isStared: isStared ? 1 : 0,
          isPerson: isPerson ? 1 : 0,
          personName: personName,
          personNumber: personNumber,
          firebaseId: firebaseId,
          answeredMessageUserName: "",
          senderRef: sender);
    } catch (e) {
      return false;
    }
  }

  return true;
}

Future<String?> _downloadPdf(String pdfUrl) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = _generateSafeFileName(pdfUrl);
    final filePath = '${dir.path}/$fileName';
    final file = File(filePath);

    if (await file.exists()) {
      return filePath;
    }

    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes, flush: true);

      int retry = 0;
      while (!(await file.exists()) && retry < 5) {
        await Future.delayed(const Duration(milliseconds: 50));
        retry++;
      }

      if (await file.exists()) {
        return filePath;
      } else {
        print('PDF dosyası kaydedilemedi: $filePath');
        return null;
      }
    } else {
      print('PDF indirme hatası: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('PDF indirme istisnası: $e');
    return null;
  }
}

Future<String?> _downloadImage(String imageUrl) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = _generateSafeFileName(imageUrl);
    final filePath = '${dir.path}/$fileName';
    final file = File(filePath);

    if (await file.exists()) {
      return filePath;
    }

    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes, flush: true);

      int retry = 0;
      while (!(await file.exists()) && retry < 5) {
        await Future.delayed(Duration(milliseconds: 50));
        retry++;
      }

      if (await file.exists()) {
        return filePath;
      } else {
        print('Görsel kaydedilemedi: $filePath');
        return null;
      }
    } else {
      print('Görsel indirme hatası: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Görsel indirme istisnası: $e');
    return null;
  }
}

String _generateSafeFileName(String url) {
  final encoded = base64Url.encode(utf8.encode(url));
  final extension = Uri.parse(url).path.split('.').last.split('?').first;
  return '$encoded.$extension';
}
