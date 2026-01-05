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

import 'dart:async';

import 'index.dart'; // Imports other custom widgets

import '/backend/backend.dart' hide LatLng;
import '/flutter_flow/flutter_flow_util.dart' hide LatLng;

import 'package:geolocator/geolocator.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:i_shim/flutter_flow/upload_data.dart';

import 'package:i_shim/auth/firebase_auth/auth_util.dart';

import 'package:i_shim/components/delete_message_component/delete_message_component_widget.dart';

import 'package:flutter/services.dart';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_shim/backend/push_notifications/push_notifications_util.dart';
import 'package:i_shim/components/attachments_message_component/attachments_message_component_widget.dart';
import 'package:i_shim/components/confirmation_reaction_component/confirmation_reaction_component_widget.dart';
import 'package:i_shim/flutter_flow/flutter_flow_expanded_image_view.dart';
import 'package:i_shim/flutter_flow/flutter_flow_icon_button.dart';
import 'package:i_shim/flutter_flow/flutter_flow_pdf_viewer.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_manager/photo_manager.dart' hide LatLng;

import '/custom_code/actions/index.dart'; // Imports other custom actions
// Begin custom action code

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

class _MessageList {
  final String message;
  bool isRead;
  final String firebaseId;
  final String pdfUrl;
  final String imagePath;
  final DateTime date;
  final String sender;
  final String answeredMessage;
  final String answeredMessageUserName;
  String reactionFromOther;
  String reactionFromMe;
  bool isDeleted;
  bool isFullyDeleted;
  bool isDeletedFromMe;
  bool isEdited;
  String editedMessage;
  bool isStared;
  bool isPhone;
  String phoneName;
  String phoneNumber;
  bool isFile;
  bool isMap;
  double latitude;
  double longitude;
  String mapName;
  String fileName;
  String fileUrl;
  _MessageList(
      {required this.message,
      required this.isRead,
      required this.pdfUrl,
      required this.imagePath,
      required this.date,
      required this.isStared,
      required this.isDeleted,
      required this.isFullyDeleted,
      required this.isDeletedFromMe,
      required this.isEdited,
      required this.editedMessage,
      required this.sender,
      required this.firebaseId,
      required this.isFile,
      required this.fileName,
      required this.isPhone,
      required this.phoneName,
      required this.phoneNumber,
      required this.isMap,
      required this.latitude,
      required this.longitude,
      required this.mapName,
      required this.fileUrl,
      required this.answeredMessage,
      required this.answeredMessageUserName,
      required this.reactionFromOther,
      required this.reactionFromMe});
}

class MessageSyncListener extends StatefulWidget {
  final DocumentReference authUser;
  final DocumentReference messageRef;
  final DocumentReference receiverUser;
  final String currentUserDisplayName;
  final int conversationId;
  final String conversationType;
  final bool addImageToGalery;
  final double width;
  final double height;
  final bool amIUser1;
  final String? backGround;
  final String? ballon1;
  final String? ballon1Text;
  final String? ballon2;
  final String? ballon2Text;

  MessageSyncListener(
      {Key? key,
      required this.authUser,
      required this.addImageToGalery,
      required this.conversationId,
      required this.conversationType,
      required this.width,
      required this.height,
      required this.amIUser1,
      required this.messageRef,
      required this.currentUserDisplayName,
      required this.receiverUser,
      this.backGround,
      this.ballon1,
      this.ballon1Text,
      this.ballon2,
      this.ballon2Text})
      : super(key: key);

  @override
  _MessageSyncListenerState createState() => _MessageSyncListenerState();
}

class _MessageSyncListenerState extends State<MessageSyncListener>
    with WidgetsBindingObserver {
  StreamSubscription<QuerySnapshot>? _subscription;
  StreamSubscription<QuerySnapshot>? _isNotReaded;
  StreamSubscription<QuerySnapshot>? _updatedMessage;
  _MessageList? replyMessage;
  bool isWriting = false;
  bool isOnline = false;
  late Color backgroundColor;
  late Color ballon1Color;
  late Color balloon1TextColor;
  late Color ballon2Color;
  late Color balloon2TextColor;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Uygulama arka plana alındı (Home tuşu, ekran değişimi vs.)
      updateOnlineStatus(false);
      setFalseWritingStatus();
    } else if (state == AppLifecycleState.detached) {
      // Android'de uygulama öldürülmeden hemen önceki durum
      updateOnlineStatus(false);
      setFalseWritingStatus();
    } else if (state == AppLifecycleState.resumed) {
      updateOnlineStatus(true);
      updateWritingStatus();
    }
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
    _subscription?.cancel();
    _updatedMessage?.cancel();
    _isNotReaded?.cancel();
    updateOnlineStatus(false);
    setFalseWritingStatus();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool selectedImage = false;
  bool selectedPdf = false;

  final formKey = GlobalKey<FormState>();
  ScrollController? listViewController;
  FFUploadedFile? returnValue;

  late FocusNode textFieldFocusNode;
  TextEditingController textController = TextEditingController();
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mesajınızı Giriniz is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  bool isDataUploading_uploadDataLsxzy = false;
  FFUploadedFile uploadedLocalFile_uploadDataLsxzy =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataLsxzy = '';

  bool? validation;
  String? reaction;

  final List<_MessageList> messages = [];
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    String backGroundColor = widget.backGround?.trim().isNotEmpty == true
        ? widget.backGround!
        : '0xFF090620';

    // Renk kodunun geçerliliğini kontrol et
    try {
      backgroundColor = Color(int.parse(backGroundColor));
    } catch (e) {
      print('Geçersiz renk kodu, varsayılan renk kullanılıyor: $e');
      backgroundColor = Color(0xFF090620); // Varsayılan renk
    }

    // ballon1Color için null kontrolü
    try {
      ballon1Color = Color(int.parse(widget.ballon1?.trim().isNotEmpty == true
          ? widget.ballon1!
          : '0xFFFFFFFF'));
    } catch (e) {
      print('Geçersiz ballon1Color kodu, varsayılan renk kullanılıyor: $e');
      ballon1Color = Color(0xFFFFFFFF); // Varsayılan renk
    }

    // ballon2Color için null kontrolü
    try {
      ballon2Color = Color(int.parse(widget.ballon2?.trim().isNotEmpty == true
          ? widget.ballon2!
          : '0xFF00499C'));
    } catch (e) {
      print('Geçersiz ballon2Color kodu, varsayılan renk kullanılıyor: $e');
      ballon2Color = Color(0xFF00499C); // Varsayılan renk
    }

    // balloon1TextColor için null kontrolü
    try {
      balloon1TextColor = Color(int.parse(
          widget.ballon1Text?.trim().isNotEmpty == true
              ? widget.ballon1Text!
              : '0x00000000'));
    } catch (e) {
      print(
          'Geçersiz balloon1TextColor kodu, varsayılan renk kullanılıyor: $e');
      balloon1TextColor = Color(0x00000000); // Varsayılan renk
    }

    // balloon2TextColor için null kontrolü
    try {
      balloon2TextColor = Color(int.parse(
          widget.ballon2Text?.trim().isNotEmpty == true
              ? widget.ballon2Text!
              : '0xFFFFFFFF'));
    } catch (e) {
      print(
          'Geçersiz balloon2TextColor kodu, varsayılan renk kullanılıyor: $e');
      balloon2TextColor = Color(0xFFFFFFFF); // Varsayılan renk
    }

    WidgetsBinding.instance.addObserver(this);
    listViewController = ScrollController();
    textControllerValidator = _textControllerValidator;

    getAllMessages();

    final Set<String> _processedMessageIds = {};
    final Set<String> _processedMessageIdsUpdate = {};

    player.setAudioContext(AudioContext(
      android: const AudioContextAndroid(
        isSpeakerphoneOn: false,
        stayAwake: false,
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.media,
        audioFocus: AndroidAudioFocus.none,
      ),
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.ambient,
      ),
    ));

    _isNotReaded = widget.receiverUser
        .collection('newMessages')
        .where("messageRef", isEqualTo: widget.messageRef)
        .where("type", isEqualTo: widget.conversationType)
        .snapshots()
        .listen((snapshot) async {
      final unreadCount = snapshot.docs.length;

      await Future.delayed(const Duration(milliseconds: 1000));

      bool shouldUpdate = false;
      int markedUnread = 0;

      for (int i = 0; i < messages.length; i++) {
        final message = messages[i];

        if (message.sender == widget.authUser.toString()) {
          if (markedUnread < unreadCount) {
            markedUnread++;
            if (message.isRead != false) {
              message.isRead = false;
              shouldUpdate = true;
            }
          } else {
            if (message.isRead == false) {
              message.isRead = true;
              shouldUpdate = true;
            }
          }
        }
      }

      if (!mounted) {
        return;
      }

      if (shouldUpdate) {
        setState(() {});
      }
    });

    _subscription = widget.authUser
        .collection('newMessages')
        .where("messageRef", isEqualTo: widget.messageRef)
        .where("type", isEqualTo: widget.conversationType)
        .orderBy("date", descending: true)
        .snapshots()
        .listen((snapshot) async {
      final futures = snapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;

        if (_processedMessageIds.contains(doc.id)) return;

        _processedMessageIds.add(doc.id);

        final message = data['message'] ?? '';
        final sender = data['senderRef'] ?? '';
        final date = data["date"] ?? Timestamp.now();
        final pdfUrl = data["pdfUrl"] ?? '';
        final imagePath = data["imagePath"] ?? '';
        final firebaseId = data["firebaseId"] ?? '';
        final answeredMessage = data["answeredMessage"] ?? '';
        final fileUrlFirebase = data["filePath"] ?? '';
        final fileName = data["fileName"] ?? '';
        final personName = data["personName"] ?? '';
        final personNumber = data["personNumber"] ?? '';
        final latitude = (data["latitude"] ?? 0.0) as double;
        final longitude = (data["longitude"] ?? 0.0) as double;

        await doc.reference.delete();

        final dateStr = formatDateForSQLite(date);

        final result = await saveToLocalSQL(
            date: dateStr,
            imagePath: imagePath,
            message: message,
            pdfUrl: pdfUrl,
            sender: sender.toString(),
            answeredMessage: answeredMessage,
            fileName: fileName,
            fileUrl: fileUrlFirebase,
            phoneName: personName,
            latitude: latitude,
            longitude: longitude,
            phoneNumber: personNumber,
            firebaseId: firebaseId);

        await widget.authUser
            .update({"messageCount": FieldValue.increment(-1)});
      }).toList();

      await Future.wait(futures);
    });

    _updatedMessage = widget.authUser
        .collection('messageUpdate')
        .where("messageRef", isEqualTo: widget.messageRef)
        .where("messageType", isEqualTo: widget.conversationType)
        .snapshots()
        .listen((snapshot) async {
      final futures = snapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;

        if (_processedMessageIdsUpdate.contains(doc.id)) {
          return;
        }

        _processedMessageIdsUpdate.add(doc.id);

        Future.delayed(Duration(milliseconds: 500));

        final messageId = data['messageId'] ?? '';
        final senderRef = data['senderRef'] ?? '';
        final date = data["date"] ?? Timestamp.now();
        final updateType = data["updateType"] ?? '';
        final reaction = data["reaction"] ?? '';
        final editMessage = data["editMessage"] ?? '';
        await doc.reference.delete();

        if (updateType == "reaction") {
          await SQLiteManager.instance.updateReactionFromOther(
            firebaseId: messageId,
            reactionFromOther: reaction,
          );

          setState(() {
            final _MessageList? messageReply = messages
                .where((msg) => msg.firebaseId == messageId)
                .toList()
                .cast<_MessageList?>()
                .firstWhere(
                  (element) => true,
                  orElse: () => null,
                );

            if (messageReply != null) {
              messageReply.reactionFromOther = reaction;
            } else {}
          });
        } else if (updateType == "delete") {
          await SQLiteManager.instance
              .updateMessageStarStatus(firebaseId: messageId, isStared: 0);
          await SQLiteManager.instance
              .softDeleteMessage(firebaseId: messageId, isDeletedFromMe: 0);
          setState(() {
            final _MessageList? messageDelete = messages
                .where((msg) => msg.firebaseId == messageId)
                .toList()
                .cast<_MessageList?>()
                .firstWhere(
                  (element) => true,
                  orElse: () => null,
                );

            if (messageDelete != null) {
              messageDelete.isDeleted = true;
              messageDelete.isDeletedFromMe = false;
            } else {}
          });
        } else if (updateType == "edit") {
          await SQLiteManager.instance
              .editMessage(editedMessage: editMessage, firebaseId: messageId);
          setState(() {
            final _MessageList? messageEdit = messages
                .where((msg) => msg.firebaseId == messageId)
                .toList()
                .cast<_MessageList?>()
                .firstWhere(
                  (element) => true,
                  orElse: () => null,
                );

            if (messageEdit != null) {
              messageEdit.isEdited = true;
              messageEdit.editedMessage = editMessage;
            } else {}
          });
        }
      }).toList();

      await Future.wait(futures);
    });

    updateOnlineStatus(true);

    textFieldFocusNode = FocusNode();

    textFieldFocusNode.addListener(() {
      updateWritingStatus();
    });
  }

  Future<void> _showContactDialog(BuildContext context) async {
    List<_Contact> dummyContacts = [];

    final phones = await SQLiteManager.instance.getAllPhones();
    for (var i in phones) {
      dummyContacts
          .add(_Contact(name: i.name ?? "", phone: i.phoneNumber ?? ""));
    }
    final selectedContact = await showDialog<_Contact>(
      context: context,
      builder: (context) => _ContactSelectorDialog(
          contacts: dummyContacts, backGroundColor: backgroundColor),
    );

    if (selectedContact != null) {
      sendPhone(selectedContact.name, selectedContact.phone);
    }
  }

  Future<void> updateWritingStatus() async {
    final hasText = textController.text.trim().isNotEmpty;
    final hasFocus = textFieldFocusNode.hasFocus;

    final shouldBeWriting = hasText && hasFocus;

    if (isWriting != shouldBeWriting) {
      isWriting = shouldBeWriting;
      if (widget.amIUser1) {
        await widget.messageRef.update({'isWritingUser1': shouldBeWriting});
      } else {
        await widget.messageRef.update({'isWritingUser2': shouldBeWriting});
      }
    }
  }

  Future<void> setFalseWritingStatus() async {
    if (isWriting == false) {
      return;
    }
    isWriting = false;
    if (widget.amIUser1) {
      await widget.messageRef.update({'isWritingUser1': false});
    } else {
      await widget.messageRef.update({'isWritingUser2': false});
    }
  }

  Future<void> sendPhone(String personName, String personNumber) async {
    String subCollectionName = '';
    switch (widget.conversationType) {
      case 'workplace':
        subCollectionName = 'workPlaceMessages';
        break;
      case 'company':
        subCollectionName = 'companyMessages';
        break;
      case 'social':
        subCollectionName = 'socialMessages';
        break;
      case 'phone':
        subCollectionName = 'phoneMessages';
        break;
      default:
        subCollectionName = 'messages';
    }

    final firebaseId = await FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .add({
      'message': textController.text,
      'senderRef': widget.authUser,
      'receiverRef': widget.receiverUser,
      'answeredMessage': replyMessage?.firebaseId ?? "",
      'isRead': true,
      'date': Timestamp.now(),
      'isPerson': true,
      'personName': personName,
      'personNumber': personNumber
    });

    await sendMessageToUser(
        replyMessage: replyMessage,
        receiverRef: widget.receiverUser,
        messageRef: widget.messageRef,
        message: textController.text,
        firebaseId: firebaseId.id,
        senderRef: widget.authUser.toString(),
        pdfUrlLocal: '',
        pdfUrlFirebase: '',
        imagePathLocal: '',
        imagePathFirebase: '',
        fileName: "",
        personName: personName,
        personNumber: personNumber,
        fileUrLocal: "",
        fileUrlFirebase: "");
  }

  Future<void> uploadSelectedFileToFirebase() async {
    final selectedFiles = await selectFiles(
      allowedExtensions: [
        'docx',
        'xlsx',
        'pptx',
        'xls',
        'doc',
        'ppt',
      ],
      multiFile: false,
    );

    if (selectedFiles != null && selectedFiles.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Dosya Gönderiliyor"),
          duration: Duration(seconds: 1),
        ),
      );
      final file = selectedFiles.first;
      final fileName = file.storagePath.split('/').last;
      final extension = fileName.split('.').last.toLowerCase();

      if (file.bytes == null || file.bytes!.isEmpty) {
        print("Dosya içeriği boş!");
        return;
      }

      try {
        final localUrl = await saveFileToAppDirectory(file.bytes, fileName);
        final storageRef =
            FirebaseStorage.instance.ref().child('uploads/$fileName');

        final uploadTask = await storageRef.putData(
          file.bytes!,
          SettableMetadata(contentType: _getContentType(extension)),
        );

        final downloadUrl = await uploadTask.ref.getDownloadURL();

        String subCollectionName = '';
        switch (widget.conversationType) {
          case 'workplace':
            subCollectionName = 'workPlaceMessages';
            break;
          case 'company':
            subCollectionName = 'companyMessages';
            break;
          case 'social':
            subCollectionName = 'socialMessages';
            break;
          case 'phone':
            subCollectionName = 'phoneMessages';
            break;
          default:
            subCollectionName = 'messages';
        }

        final firebaseId = await FirebaseFirestore.instance
            .collection('Message')
            .doc(widget.messageRef.id)
            .collection(subCollectionName)
            .add({
          'message': textController.text,
          'senderRef': widget.authUser,
          'receiverRef': widget.receiverUser,
          'answeredMessage': replyMessage?.firebaseId ?? "",
          'isRead': true,
          'date': Timestamp.now(),
          'pdfUrl': '',
          'imageUrl': '',
          'isFile': true,
          'fileUrl': downloadUrl,
          'fileName': fileName
        });

        await sendMessageToUser(
            replyMessage: replyMessage,
            receiverRef: widget.receiverUser,
            messageRef: widget.messageRef,
            message: textController.text,
            firebaseId: firebaseId.id,
            senderRef: widget.authUser.toString(),
            pdfUrlLocal: '',
            pdfUrlFirebase: '',
            imagePathLocal: '',
            imagePathFirebase: '',
            fileName: fileName,
            fileUrLocal: localUrl ?? "",
            fileUrlFirebase: downloadUrl);

        print('Dosya başarıyla yüklendi! URL: $downloadUrl');
      } catch (e) {
        print('Yükleme sırasında hata oluştu: $e');
      }
    }
  }

  String _getContentType(String extension) {
    switch (extension) {
      case 'doc':
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'ppt':
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      default:
        return 'application/octet-stream';
    }
  }

  Future<void> updateOnlineStatus(bool newIsOnlineStatus) async {
    if (isOnline == newIsOnlineStatus) {
      return;
    }
    isOnline = newIsOnlineStatus;

    if (widget.amIUser1) {
      await widget.messageRef.update({'isOnlineUser1': isOnline});
    } else {
      await widget.messageRef.update({'isOnlineUser2': isOnline});
    }
  }

  void onChangedText(String value) {
    updateWritingStatus();
  }

  String formatDateForSQLite(dynamic date) {
    DateTime parsed;
    if (date is Timestamp) {
      parsed = date.toDate();
    } else if (date is DateTime) {
      parsed = date;
    } else {
      parsed = DateTime.tryParse(date.toString()) ?? DateTime.now();
    }

    return parsed.toIso8601String().split('.').first.replaceFirst('T', ' ');
  }

  Future<String?> saveFileToAppDirectory(
      Uint8List fileBytes, String fileName) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final file = File('${appDir.path}/$fileName');
      await file.writeAsBytes(fileBytes);
      return file.path;
    } catch (e) {
      print('Dosya kaydetme hatası: $e');
      return null;
    }
  }

  Future<String?> uploadFileToFirebaseStorage(
      Uint8List fileBytes, String fileName) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      await storageRef.putData(fileBytes);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Firebase Storage yükleme hatası: $e');
      return null;
    }
  }

  Future<void> addReaction(String messageFirebaseId, String reaction) async {
    final now = DateTime.now();
    final messageUpdate = widget.receiverUser.collection('messageUpdate').doc();

    WriteBatch buildBatch() {
      final batch = FirebaseFirestore.instance.batch();

      batch.set(messageUpdate, {
        'messageRef': widget.messageRef,
        'senderRef': widget.receiverUser,
        'messageType': widget.conversationType,
        'messageId': messageFirebaseId,
        'reaction': reaction,
        'updateType': "reaction",
      });

      final updates = <String, dynamic>{};

      final subCollectionName;
      switch (widget.conversationType) {
        case "workplace":
          updates['lastMessageTimeWorkplace'] = now;
          updates['lastMessageWorkplace'] = "Added Reaction";
          subCollectionName = 'workPlaceMessages';
          break;
        case "company":
          updates['lastMessageTimeCompany'] = now;
          updates['lastMessageCompany'] = "Added Reaction";
          subCollectionName = 'companyMessages';
          break;
        case "phone":
          updates['lastMessageTimePhone'] = now;
          updates['lastMessagePhone'] = "Added Reaction";
          subCollectionName = 'phoneMessages';
          break;
        case "social":
          updates['lastMessageTimeSocial'] = now;
          updates['lastMessageSocial'] = "Added Reaction";
          subCollectionName = 'socialMessages';
          break;
        default:
          throw Exception(
              "Geçersiz conversationType: ${widget.conversationType}");
      }

      batch.update(widget.messageRef, updates);

      final messageDocRef = FirebaseFirestore.instance
          .collection('Message')
          .doc(widget.messageRef.id)
          .collection(subCollectionName)
          .doc(messageFirebaseId);

      if (widget.amIUser1) {
        batch.update(messageDocRef, {
          'reactionFromUser1': reaction,
        });
      } else {
        batch.update(messageDocRef, {
          'reactionFromUser2': reaction,
        });
      }

      return batch;
    }

    bool success = false;

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final batch = buildBatch();
        await batch.commit();
        success = true;
        break;
      } catch (e) {
        print('Batch commit hatası (deneme ${attempt + 1}): $e');
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    if (!success) {
      return;
    }

    await SQLiteManager.instance.updateReactionFromMe(
        firebaseId: messageFirebaseId, reactionFromMe: reaction);
    setState(() {
      final _MessageList? messageReply = messages
          .where((msg) => msg.firebaseId == messageFirebaseId)
          .toList()
          .cast<_MessageList?>()
          .firstWhere(
            (element) => true,
            orElse: () => null,
          );

      messageReply?.reactionFromMe = reaction;
    });
  }

  Future<bool> saveToLocalSQL(
      {required String message,
      required String sender,
      required String date,
      required String pdfUrl,
      required String imagePath,
      required String firebaseId,
      required String fileName,
      required String fileUrl,
      required String phoneName,
      required String phoneNumber,
      required double latitude,
      required double longitude,
      String? answeredMessage}) async {
    final parsedDate = DateTime.tryParse(date) ?? DateTime.now();
    final senderRef = sender;
    final receiverRef = widget.authUser.toString();

    try {
      if (pdfUrl.isNotEmpty) {
        final pathPdf = await downloadPdf(pdfUrl);
        if (pathPdf == null || !(await File(pathPdf).exists())) {
          print('PDF dosyası indirilemedi veya bulunamadı.');
          return false;
        }

        await SQLiteManager.instance.addMessageWithPdf(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            pdfUrl: pathPdf,
            message: message,
            receiverRef: receiverRef,
            senderRef: senderRef,
            reactionFromMe: "",
            reactionFromOther: "",
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            firebaseId: firebaseId,
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: "");

        addSortedMessage(_MessageList(
            date: parsedDate,
            imagePath: imagePath,
            isRead: true,
            message: message,
            pdfUrl: pathPdf,
            sender: sender,
            reactionFromMe: "",
            isStared: false,
            editedMessage: "",
            isDeleted: false,
            isDeletedFromMe: false,
            isEdited: false,
            isFullyDeleted: false,
            reactionFromOther: "",
            isMap: false,
            latitude: 0,
            longitude: 0,
            mapName: "",
            fileName: "",
            fileUrl: "",
            isFile: false,
            firebaseId: firebaseId,
            isPhone: false,
            phoneName: "",
            phoneNumber: "",
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: ""));
      } else if (imagePath.isNotEmpty) {
        final imagePathLocal = await downloadAndSaveImage(imagePath);
        if (imagePathLocal == null || !(await File(imagePathLocal).exists())) {
          print('Görsel dosyası indirilemedi veya bulunamadı.');
          return false;
        }

        await SQLiteManager.instance.addMessageWithImage(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            imagePath: imagePathLocal,
            message: message,
            receiverRef: receiverRef,
            senderRef: senderRef,
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: "");

        addSortedMessage(_MessageList(
            date: parsedDate,
            imagePath: imagePathLocal,
            isRead: true,
            message: message,
            pdfUrl: '',
            sender: sender,
            editedMessage: "",
            isMap: false,
            latitude: 0,
            longitude: 0,
            mapName: "",
            isDeleted: false,
            isDeletedFromMe: false,
            isEdited: false,
            isPhone: false,
            phoneName: "",
            phoneNumber: "",
            isFullyDeleted: false,
            firebaseId: firebaseId,
            isStared: false,
            fileName: "",
            fileUrl: "",
            isFile: false,
            reactionFromMe: "",
            reactionFromOther: "",
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: ""));
      } else if (fileName.isNotEmpty) {
        final pathFile = await downloadPdf(fileUrl);
        if (pathFile == null || !(await File(pathFile).exists())) {
          print('PDF dosyası indirilemedi veya bulunamadı.');
          return false;
        }
        await SQLiteManager.instance.addMessage(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            message: message,
            receiverRef: receiverRef,
            senderRef: senderRef,
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            fileName: fileName,
            fileUrl: pathFile ?? "",
            isFile: 1,
            answeredMessage: answeredMessage ?? "",
            firebaseId: firebaseId,
            answeredMessageUserName: "");

        addSortedMessage(_MessageList(
            date: parsedDate,
            imagePath: '',
            isRead: true,
            message: message,
            pdfUrl: '',
            reactionFromOther: "",
            isStared: false,
            editedMessage: "",
            isDeleted: false,
            fileName: fileName,
            isMap: false,
            latitude: 0,
            longitude: 0,
            mapName: "",
            fileUrl: pathFile,
            isFile: fileName.isEmpty ? false : true,
            isDeletedFromMe: false,
            isEdited: false,
            isPhone: false,
            phoneName: "",
            phoneNumber: "",
            isFullyDeleted: false,
            reactionFromMe: "",
            sender: sender,
            firebaseId: firebaseId,
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: ""));
      } else {
        await SQLiteManager.instance.addMessage(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            message: message,
            receiverRef: receiverRef,
            senderRef: senderRef,
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            isPerson: phoneName.isEmpty ? 0 : 1,
            personName: phoneName,
            personNumber: phoneNumber,
            answeredMessage: answeredMessage ?? "",
            firebaseId: firebaseId,
            isMap:
                (latitude ?? 0.0) == 0.0 && (longitude ?? 0.0) == 0.0 ? 0 : 1,
            mapName: "",
            latitude: latitude,
            longitude: longitude,
            answeredMessageUserName: "");

        addSortedMessage(_MessageList(
            date: parsedDate,
            imagePath: '',
            isRead: true,
            message: message,
            pdfUrl: '',
            reactionFromOther: "",
            isStared: false,
            editedMessage: "",
            isDeleted: false,
            fileName: fileName,
            fileUrl: fileUrl,
            isFile: fileName.isEmpty ? false : true,
            isDeletedFromMe: false,
            isEdited: false,
            isFullyDeleted: false,
            isMap: (latitude ?? 0.0) == 0.0 && (longitude ?? 0.0) == 0.0
                ? false
                : true,
            latitude: latitude,
            longitude: longitude,
            mapName: "",
            isPhone: phoneName.isEmpty ? false : true,
            phoneName: phoneName,
            phoneNumber: phoneNumber,
            reactionFromMe: "",
            sender: sender,
            firebaseId: firebaseId,
            answeredMessage: answeredMessage ?? "",
            answeredMessageUserName: ""));
      }

      return true;
    } catch (e) {
      print("Hata oluştu: $e");
      return false;
    }
  }

  void addSortedMessage(_MessageList newMessage) {
    final index =
        messages.indexWhere((msg) => newMessage.date.isAfter(msg.date));
    setState(() {
      if (index == -1) {
        messages.add(newMessage);
      } else {
        messages.insert(index, newMessage);
      }
    });
  }

  Future<bool> saveToLocalSQLIAmSender(
      {required String message,
      required String sender,
      required String date,
      required String pdfUrl,
      required String firebaseId,
      _MessageList? replyMessage,
      required String fileName,
      required String fileUrl,
      required String mapName,
      required double latitude,
      required double longitude,
      required String personName,
      required String personNumber,
      required String imagePath}) async {
    if (pdfUrl.isNotEmpty) {
      try {
        await SQLiteManager.instance.addMessageWithPdf(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            pdfUrl: pdfUrl,
            message: message.isEmpty ? "" : message,
            receiverRef: widget.authUser.toString(),
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            answeredMessage: replyMessage?.firebaseId ?? "",
            senderRef: sender);
      } catch (e) {
        return false;
      }
    } else if (imagePath.isNotEmpty) {
      try {
        await SQLiteManager.instance.addMessageWithImage(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            imagePath: imagePath,
            message: message.isEmpty ? "" : message,
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            receiverRef: widget.authUser.toString(),
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            answeredMessage: replyMessage?.firebaseId ?? "",
            senderRef: sender);
      } catch (e) {
        return false;
      }
    } else {
      try {
        await SQLiteManager.instance.addMessage(
            conversationId: widget.conversationId,
            date: date,
            isRead: 1,
            message: message.toString(),
            receiverRef: widget.authUser.toString(),
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            editedMessage: "",
            fileName: fileName ?? "",
            fileUrl: fileUrl ?? "",
            isFile: fileUrl.isEmpty ? 0 : 1,
            isPerson: personName.isEmpty ? 0 : 1,
            personName: personName,
            personNumber: personNumber,
            answeredMessage: replyMessage?.firebaseId ?? "",
            isMap: (((latitude ?? 0.0) == 0.0 && (longitude ?? 0.0) == 0.0))
                ? 0
                : 1,
            latitude: latitude,
            longitude: longitude,
            mapName: mapName,
            senderRef: sender);
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  Future<String?> downloadPdf(String pdfUrl) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = generateSafeFileName(pdfUrl);
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

  Future<String?> downloadAndSaveImage(String imageUrl) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = generateSafeFileName(imageUrl);
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return filePath;
      }

      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode != 200) {
        print('Görsel indirme hatası: ${response.statusCode}');
        return null;
      }

      await file.writeAsBytes(response.bodyBytes, flush: true);

      if (!widget.addImageToGalery) {
        return filePath;
      }
      final permission = await requestGalleryPermission();
      if (!permission) {
        print("Galeriye kaydetme izni verilmedi.");
        return filePath;
      }

      final assetEntity = await PhotoManager.editor
          .saveImage(response.bodyBytes, filename: fileName);

      if (assetEntity != null) {
        print("Görsel galeriye kaydedildi: ${assetEntity.id}");
      } else {
        print("Görsel galeriye kaydedilemedi.");
      }

      return filePath;
    } catch (e) {
      print('Görsel indirme istisnası: $e');
      return null;
    }
  }

  String generateSafeFileName(String url) {
    final encoded = base64Url.encode(utf8.encode(url));
    final extension = Uri.parse(url).path.split('.').last.split('?').first;
    return '$encoded.$extension';
  }

  Future<void> getAllMessages() async {
    final result = await SQLiteManager.instance
        .getMessages(conversationId: widget.conversationId);

    final docsNotReaded = await widget.receiverUser
        .collection('newMessages')
        .where("messageRef", isEqualTo: widget.messageRef)
        .where("type", isEqualTo: widget.conversationType)
        .get();
    final unreadCount = docsNotReaded.docs.length;

    print(result.length);

    var loadedMessages = result
        .map((i) => _MessageList(
            date: DateTime.tryParse(i.date ?? "") ?? DateTime.now(),
            imagePath: i.imagePath ?? "",
            isRead: i.isRead == 1,
            message: i.message ?? "",
            editedMessage: i.editedMessage ?? "",
            isDeleted: (i.isDeleted ?? 0) == 0 ? false : true,
            isDeletedFromMe: (i.isDeletedFromMe ?? 0) == 0 ? false : true,
            isEdited: (i.isEdited ?? 0) == 0 ? false : true,
            isFullyDeleted: (i.isFullyDeleted ?? 0) == 0 ? false : true,
            pdfUrl: i.pdfUrl ?? "",
            reactionFromOther: i.reactionFromOther ?? "",
            isStared: i.isStared == null
                ? false
                : i.isStared == 0
                    ? false
                    : true,
            sender: i.senderRef,
            isPhone: (i.isPerson ?? 0) == 0 ? false : true,
            phoneName: i.personName ?? "",
            phoneNumber: i.personNumber ?? "",
            isMap: (i.isMap ?? 0) == 0 ? false : true,
            latitude: i.latitude ?? 0.0,
            longitude: i.longitude ?? 0.0,
            mapName: i.mapName ?? "",
            fileName: i.fileName ?? "",
            fileUrl: i.fileUrl ?? "",
            isFile: (i.isFile ?? 0) == 0 ? false : true,
            firebaseId: i.firebaseId ?? "",
            answeredMessage: i.answeredMessage ?? "",
            reactionFromMe: i.reactionFromMe ?? "",
            answeredMessageUserName: i.answeredMessageUserName ?? ""))
        .toList();

    loadedMessages.sort((a, b) => b.date.compareTo(a.date));

    if (unreadCount > 0) {
      int markedUnread = 0;

      for (int i = 0; i < loadedMessages.length - 1; i++) {
        if (loadedMessages[i].sender == widget.authUser.toString()) {
          loadedMessages[i].isRead = true;
        }
      }

      for (int i = loadedMessages.length - 1; i >= 0; i--) {
        final message = loadedMessages[i];

        if (message.sender == widget.authUser.toString()) {
          if (markedUnread < unreadCount) {
            message.isRead = false;
            markedUnread++;
          } else {
            break;
          }
        }
      }
    }

    setState(() {
      messages.clear();
      messages.addAll(loadedMessages);
    });
  }

  Future<void> sendLocation(
      double latitude, double longitude, String mapName) async {
    String subCollectionName = '';
    switch (widget.conversationType) {
      case 'workplace':
        subCollectionName = 'workPlaceMessages';
        break;
      case 'company':
        subCollectionName = 'companyMessages';
        break;
      case 'social':
        subCollectionName = 'socialMessages';
        break;
      case 'phone':
        subCollectionName = 'phoneMessages';
        break;
      default:
        subCollectionName = 'messages';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Konum Gönderiliyor'),
        duration: Duration(seconds: 1),
      ),
    );

    final mapData = {
      'message': textController.text,
      'senderRef': widget.authUser,
      'receiverRef': widget.receiverUser,
      'answeredMessage': replyMessage?.firebaseId ?? "",
      'isRead': true,
      'date': Timestamp.now(),
      'isMap': true,
      'latitude': latitude,
      'longitude': longitude,
      // Kullanıcıya özel alanı, burada belirliyoruz
      widget.amIUser1 ? 'mapNameUser1' : 'mapNameUser2': mapName,
    };

    final firebaseId = await FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .add(mapData);

    await sendMessageToUser(
        replyMessage: replyMessage,
        receiverRef: widget.receiverUser,
        messageRef: widget.messageRef,
        message: textController.text,
        firebaseId: firebaseId.id,
        senderRef: widget.authUser.toString(),
        pdfUrlLocal: '',
        pdfUrlFirebase: '',
        imagePathLocal: '',
        imagePathFirebase: '',
        fileName: "",
        latitude: latitude,
        longitude: longitude,
        mapName: mapName,
        fileUrLocal: "",
        fileUrlFirebase: "");
  }

  void _openLocationInput(BuildContext context) async {
    final result = await _showLocationInputBottomSheet(
        context: context, backgroundColor: backgroundColor);

    if (result != null) {
      print("Konum adı: ${result['name']}");
      print("Latitude: ${result['latitude']}");
      print("Longitude: ${result['longitude']}");

      sendLocation(result['latitude'], result['longitude'],
          result['name'] == "noNameMap" ? "" : result["name"]);
    }
  }

  Future<void> sendMessageToUser(
      {required DocumentReference receiverRef,
      required DocumentReference messageRef,
      required String message,
      required String senderRef,
      required String firebaseId,
      _MessageList? replyMessage,
      String personName = '',
      String personNumber = '',
      String pdfUrlFirebase = '',
      String pdfUrlLocal = '',
      String imagePathFirebase = '',
      String imagePathLocal = '',
      double? latitude,
      double? longitude,
      String mapName = '',
      String fileName = '',
      String fileUrLocal = '',
      String fileUrlFirebase = ''}) async {
    final now = DateTime.now();
    final nowTimestamp = Timestamp.fromDate(now);
    final newMessageDoc = receiverRef.collection('newMessages').doc();
    final notificationDoc = receiverRef.collection('notifications').doc();
    final dateStr = formatDateForSQLite(now.toIso8601String());

    await player.play(AssetSource('audios/sendMessageAudio.mp3'));

    WriteBatch buildBatch() {
      final batch = FirebaseFirestore.instance.batch();

      batch.set(newMessageDoc, {
        'messageRef': messageRef,
        'message': message,
        'senderRef': senderRef,
        'date': nowTimestamp,
        'pdfUrl': pdfUrlFirebase,
        'imagePath': imagePathFirebase,
        'type': widget.conversationType,
        'answeredMessage': replyMessage?.firebaseId ?? "",
        'firebaseId': firebaseId,
        'filePath': fileUrlFirebase,
        'fileName': fileName,
        'personName': personName,
        'personNumber': personNumber,
        'latitude': latitude,
        'longitude': longitude,
      });

      batch.update(receiverRef, {
        'messageCount': FieldValue.increment(1),
        'notificationCount': FieldValue.increment(1),
      });

      final updates = <String, dynamic>{};

      if (widget.conversationType == "workplace") {
        updates['lastMessageTimeWorkplace'] = now;
        updates['lastMessageWorkplace'] = message;
      } else if (widget.conversationType == "company") {
        updates['lastMessageTimeCompany'] = now;
        updates['lastMessageCompany'] = message;
      } else if (widget.conversationType == "phone") {
        updates['lastMessageTimePhone'] = now;
        updates['lastMessagePhone'] = message;
      } else if (widget.conversationType == "social") {
        updates['lastMessageTimeSocial'] = now;
        updates['lastMessageSocial'] = message;
      }

      batch.update(widget.messageRef, updates);

      batch.set(notificationDoc, {
        'type': "message",
        'content': "Bir Yeni Mesajınız Var",
        'relatedDoc': messageRef.id,
        'creationTime': now,
        'isRead': false,
        'isDelete': false,
        'fullDescription':
            "${widget.currentUserDisplayName} İsimli Kişiden Yeni Mesajınız Var",
        'messageType': widget.conversationType,
        "image": ""
      });

      return batch;
    }

    bool success = false;

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final batch = buildBatch();
        await batch.commit();
        success = true;
        break;
      } catch (e) {
        print('Batch commit hatası (deneme ${attempt + 1}): $e');
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    if (!success) {
      return;
    }

    await saveToLocalSQLIAmSender(
        date: dateStr,
        imagePath: imagePathLocal,
        message: message,
        pdfUrl: pdfUrlLocal,
        sender: senderRef,
        firebaseId: firebaseId,
        fileName: fileName,
        personName: personName,
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
        mapName: mapName,
        personNumber: personNumber,
        fileUrl: fileUrLocal,
        replyMessage: replyMessage);

    setState(() {
      messages.insert(
          0,
          _MessageList(
              date: now,
              imagePath: imagePathLocal,
              isRead: false,
              message: message,
              pdfUrl: pdfUrlLocal,
              sender: senderRef,
              firebaseId: firebaseId,
              reactionFromMe: "",
              isStared: false,
              isDeleted: false,
              isMap: ((latitude ?? 0) != 0 && (longitude ?? 0) != 0)
                  ? true
                  : false,
              latitude: latitude ?? 0,
              longitude: longitude ?? 0,
              mapName: mapName,
              fileName: fileName,
              fileUrl: fileUrLocal,
              isFile: fileName.isEmpty ? false : true,
              editedMessage: "",
              isDeletedFromMe: false,
              isEdited: false,
              isFullyDeleted: false,
              isPhone: personName.isNotEmpty ? true : false,
              phoneName: personName,
              phoneNumber: personNumber,
              reactionFromOther: "",
              answeredMessage: replyMessage?.firebaseId ?? "",
              answeredMessageUserName: replyMessage != null ? "Siz" : ""));
    });

    setFalseWritingStatus();

    triggerPushNotification(
      notificationTitle: '${widget.currentUserDisplayName}',
      notificationText: 'Message',
      userRefs: [widget!.receiverUser],
      initialPageName: 'chatNewCopy',
      parameterData: {},
    );

    FFAppState().isSelectedImage = false;
    selectedImage = false;
    selectedPdf = false;
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

  Future<void> updateStarMessage(_MessageList message) async {
    final newIsStaredValue = message.isStared ? 0 : 1;
    await SQLiteManager.instance.updateMessageStarStatus(
      firebaseId: message.firebaseId,
      isStared: newIsStaredValue,
    );

    setState(() {
      message.isStared = !message.isStared;
    });

    final String subCollectionName;
    switch (widget.conversationType) {
      case "workplace":
        subCollectionName = 'workPlaceMessages';
        break;
      case "company":
        subCollectionName = 'companyMessages';
        break;
      case "phone":
        subCollectionName = 'phoneMessages';
        break;
      case "social":
        subCollectionName = 'socialMessages';
        break;
      default:
        throw Exception(
          "Geçersiz conversationType: ${widget.conversationType}",
        );
    }

    final messageDocRef = FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .doc(message.firebaseId);

    final reactionField =
        widget.amIUser1 ? 'isStaredFromUser1' : 'isStaredFromUser2';

    try {
      await messageDocRef.update({
        reactionField: message.isStared,
      });
    } catch (e) {
      print('[Firestore] Güncelleme HATASI: $e');
    }
  }

  Future<void> deleteMessageEveryone(_MessageList message) async {
    final messageUpdateRef =
        widget.receiverUser.collection('messageUpdate').doc();

    final String subCollectionName = switch (widget.conversationType) {
      "workplace" => 'workPlaceMessages',
      "company" => 'companyMessages',
      "phone" => 'phoneMessages',
      "social" => 'socialMessages',
      _ => throw Exception(
          "Geçersiz conversationType: ${widget.conversationType}"),
    };

    final messageDocRef = FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .doc(message.firebaseId);

    bool success = false;

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final batch = FirebaseFirestore.instance.batch();

        batch.set(messageUpdateRef, {
          'messageRef': widget.messageRef,
          'senderRef': widget.receiverUser,
          'messageType': widget.conversationType,
          'messageId': message.firebaseId,
          'updateType': "delete",
        });

        batch.update(messageDocRef, {
          'isUser1Delete': true,
          'isUser2Delete': true,
        });

        await batch.commit();
        success = true;
        break;
      } catch (e, stack) {
        print('🔥 Batch commit hatası (deneme ${attempt + 1}): $e');
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    if (!success) return;

    setState(() {
      message.isDeleted = true;
      message.isDeletedFromMe = true;
    });

    try {
      await SQLiteManager.instance
          .updateMessageStarStatus(firebaseId: message.firebaseId, isStared: 0);
      await SQLiteManager.instance.softDeleteMessage(
        firebaseId: message.firebaseId,
        isDeletedFromMe: 1,
      );
    } catch (e) {
      print('🛑 SQLite güncelleme hatası: $e');
    }
  }

  Future<void> deleteFullyMessage(_MessageList message) async {
    setState(() {
      message.isFullyDeleted = true;
    });
    await SQLiteManager.instance
        .fullyDeleteMessage(firebaseId: message.firebaseId);
  }

  Future<void> deleteMessageJustMe(_MessageList message) async {
    this.setState(() {
      message.isDeleted = true;
      message.isDeletedFromMe = true;
    });

    final String subCollectionName;
    switch (widget.conversationType) {
      case "workplace":
        subCollectionName = 'workPlaceMessages';
        break;
      case "company":
        subCollectionName = 'companyMessages';
        break;
      case "phone":
        subCollectionName = 'phoneMessages';
        break;
      case "social":
        subCollectionName = 'socialMessages';
        break;
      default:
        throw Exception(
          "Geçersiz conversationType: ${widget.conversationType}",
        );
    }

    final messageDocRef = FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .doc(message.firebaseId);

    final deleteField = widget.amIUser1 ? 'isUser1Delete' : 'isUser2Delete';

    try {
      await SQLiteManager.instance
          .updateMessageStarStatus(firebaseId: message.firebaseId, isStared: 0);
      await SQLiteManager.instance.softDeleteMessage(
          firebaseId: message.firebaseId, isDeletedFromMe: 1);
      await messageDocRef.update({deleteField: true});
    } catch (e) {
      print('[Firestore] Güncelleme HATASI: $e');
    }
  }

  Future<void> editMessage(_MessageList message, String editMessage) async {
    final messageUpdateRef =
        widget.receiverUser.collection('messageUpdate').doc();

    final String subCollectionName = switch (widget.conversationType) {
      "workplace" => 'workPlaceMessages',
      "company" => 'companyMessages',
      "phone" => 'phoneMessages',
      "social" => 'socialMessages',
      _ => throw Exception(
          "Geçersiz conversationType: ${widget.conversationType}"),
    };

    final messageDocRef = FirebaseFirestore.instance
        .collection('Message')
        .doc(widget.messageRef.id)
        .collection(subCollectionName)
        .doc(message.firebaseId);

    bool success = false;

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final batch = FirebaseFirestore.instance.batch();

        batch.set(messageUpdateRef, {
          'messageRef': widget.messageRef,
          'senderRef': widget.receiverUser,
          'messageType': widget.conversationType,
          'messageId': message.firebaseId,
          'updateType': "edit",
          'editMessage': editMessage
        });

        batch.update(messageDocRef, {
          'editMessage': editMessage,
        });

        await batch.commit();
        success = true;
        break;
      } catch (e, stack) {
        print('🔥 Batch commit hatası (deneme ${attempt + 1}): $e');
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    if (!success) return;

    setState(() {
      message.editedMessage = editMessage;
      message.isEdited = true;
    });

    try {
      await SQLiteManager.instance.editMessage(
          editedMessage: editMessage, firebaseId: message.firebaseId);
    } catch (e) {
      print('🛑 SQLite güncelleme hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isMe = message.sender == widget.authUser.toString();
              double dragOffset = 0;

              if (message.isFullyDeleted) return SizedBox();

              // Calculate dynamic top padding
              double topPadding = 20;
              // Check if the next message (older, above in UI) is from the same sender
              if (index < messages.length - 1 &&
                  messages[index].sender == messages[index + 1].sender) {
                topPadding = 0; // Smaller padding for same sender
              }

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: topPadding,
                    bottom: 4,
                  ),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            dragOffset = (dragOffset + details.delta.dx)
                                .clamp(-150.0, 150.0);
                          });
                        },
                        onHorizontalDragEnd: (details) {
                          if (dragOffset.abs() > 100) {
                            this.setState(() {
                              replyMessage = message;
                            });
                          }
                          setState(() {
                            dragOffset = 0;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (message.answeredMessage.isNotEmpty)
                              Builder(
                                builder: (context) {
                                  final _MessageList? messageReply = messages
                                      .where((msg) =>
                                          msg.firebaseId ==
                                          message.answeredMessage)
                                      .toList()
                                      .cast<_MessageList?>()
                                      .firstWhere(
                                        (element) => true,
                                        orElse: () => null,
                                      );

                                  if (messageReply == null) {
                                    return SizedBox();
                                  }
                                  if (!message.isDeleted) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 6),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      constraints:
                                          const BoxConstraints(maxWidth: 300),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[850],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (messageReply.imagePath.isNotEmpty)
                                            Image.file(
                                              File(messageReply!.imagePath),
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          if (messageReply.pdfUrl.isNotEmpty)
                                            FutureBuilder<Uint8List?>(
                                              future: loadPdfBytes(
                                                  messageReply!.pdfUrl),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const SizedBox(
                                                    height: 50,
                                                    child: Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                  );
                                                }

                                                return FlutterFlowPdfViewer(
                                                  fileBytes: snapshot.data!,
                                                  width: 100,
                                                  height: 100,
                                                  horizontalScroll: false,
                                                );
                                              },
                                            ),
                                          if (messageReply.message.isNotEmpty)
                                            Text(
                                              messageReply.isEdited
                                                  ? messageReply.editedMessage
                                                  : messageReply.message,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white70,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            if (message.isDeleted)
                              InkWell(
                                onLongPress: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment: AlignmentDirectional(0, 0)
                                            .resolve(
                                                Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: DeleteMessageComponentWidget(
                                              amISender: false),
                                        ),
                                      );
                                    },
                                  ).then((value) async {
                                    if (value == null) return;
                                    if (value == "justMe") {
                                      deleteFullyMessage(message);
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: isMe
                                          ? Color.fromARGB(255, 255, 255, 255)
                                          : Color.fromARGB(255, 0, 73, 156),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14),
                                        topRight: Radius.circular(14),
                                        bottomLeft: isMe
                                            ? Radius.circular(14)
                                            : Radius.zero,
                                        bottomRight: isMe
                                            ? Radius.zero
                                            : Radius.circular(14),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFF7DA1D0),
                                        width: 1,
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: 250,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.block, size: 16),
                                        SizedBox(width: 6),
                                        Flexible(
                                          child: Text(
                                            message.isDeletedFromMe
                                                ? "Bu mesajı Sildiniz"
                                                : "Bu mesaj silindi",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (!message.isDeleted)
                              InkWell(
                                onLongPress: () async {
                                  await showGeneralDialog<String>(
                                    context: context,
                                    barrierDismissible: true,
                                    barrierLabel: "kapat",
                                    barrierColor: Colors.black87,
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Scaffold(
                                          backgroundColor: Colors.transparent,
                                          body: Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              16)),
                                                ),
                                                child:
                                                    ConfirmationReactionComponentWidget(
                                                  isMap: message.isMap,
                                                  isStarred: message.isStared,
                                                  isMe: isMe &&
                                                      message.date.isAfter(
                                                          DateTime.now()
                                                              .subtract(
                                                                  Duration(
                                                                      hours:
                                                                          1))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) async {
                                    if (value == null)
                                      return;
                                    else if (value == "answer") {
                                      this.setState(() {
                                        replyMessage = message;
                                      });
                                    } else if (value == "renameMap") {
                                      final rename =
                                          await _showLocationNameInputBottomSheet(
                                              context: context,
                                              backgroundColor: backgroundColor);
                                      if (rename != null && rename.isNotEmpty) {
                                        await SQLiteManager.instance.setMapName(
                                            firebaseId: message.firebaseId,
                                            mapName: rename);
                                        final updates = <String, dynamic>{};

                                        // subCollectionName belirleniyor
                                        late final String subCollectionName;
                                        switch (widget.conversationType) {
                                          case "workplace":
                                            subCollectionName =
                                                'workPlaceMessages';
                                            break;
                                          case "company":
                                            subCollectionName =
                                                'companyMessages';
                                            break;
                                          case "phone":
                                            subCollectionName = 'phoneMessages';
                                            break;
                                          case "social":
                                            subCollectionName =
                                                'socialMessages';
                                            break;
                                          default:
                                            throw Exception(
                                                "Geçersiz conversationType: ${widget.conversationType}");
                                        }

                                        final messageDocRef = FirebaseFirestore
                                            .instance
                                            .collection('Message')
                                            .doc(widget.messageRef.id)
                                            .collection(subCollectionName)
                                            .doc(message.firebaseId);

                                        final updateField = widget.amIUser1
                                            ? 'mapNameUser1'
                                            : 'mapNameUser2';

                                        await messageDocRef.update({
                                          updateField: rename,
                                        });

                                        safeSetState(
                                          () {
                                            message.mapName = rename;
                                          },
                                        );
                                      }
                                    } else if (value == "forward") {
                                      await showGeneralDialog<String>(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierLabel: "kapat",
                                        barrierColor: Colors.black87,
                                        transitionDuration:
                                            Duration(milliseconds: 200),
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Scaffold(
                                              backgroundColor:
                                                  Color.fromARGB(135, 9, 6, 32),
                                              body: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 48),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        16)),
                                                      ),
                                                      child:
                                                          _ForwardMessageComponent(
                                                        authUser:
                                                            widget.authUser,
                                                        height: 100,
                                                        width: 100,
                                                        currentUserDisplayName:
                                                            widget
                                                                .currentUserDisplayName,
                                                        image:
                                                            message.imagePath,
                                                        message: message
                                                                .isEdited
                                                            ? message
                                                                .editedMessage
                                                            : message.message,
                                                        pdf: message.pdfUrl,
                                                        fileName:
                                                            message.fileName,
                                                        fileUrl:
                                                            message.fileUrl,
                                                        isFile: message.isFile,
                                                        isMap: message.isMap,
                                                        isPerson:
                                                            message.isPhone,
                                                        latitude:
                                                            message.latitude,
                                                        longitude:
                                                            message.longitude,
                                                        mapName:
                                                            message.mapName,
                                                        personName:
                                                            message.phoneName,
                                                        personNumber:
                                                            message.phoneNumber,
                                                        selectedMessageDocument:
                                                            widget.messageRef,
                                                        selectedMessageFirebaseId:
                                                            message.firebaseId,
                                                        subCollectionName:
                                                            getSubCollectionName(
                                                                widget
                                                                    .conversationType),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else if (value == "copy") {
                                      await Clipboard.setData(
                                          ClipboardData(text: message.message));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Mesaj Kopyalandı',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 500),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else if (value == "star") {
                                      updateStarMessage(message);
                                    } else if (value == "edit") {
                                      if (message.message.isEmpty) {
                                        return;
                                      }
                                      final newText =
                                          await _showEditMessageDialog(
                                        context: context,
                                        backgroundColor: backgroundColor,
                                        initialText: message.isEdited
                                            ? message.editedMessage
                                            : message.message,
                                      );
                                      if (newText != null &&
                                          newText.trim().isNotEmpty) {
                                        if (newText != message.message) {
                                          editMessage(message, newText);
                                        }
                                      }
                                    } else if (value == "delete") {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0, 0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child:
                                                  DeleteMessageComponentWidget(
                                                      amISender: isMe),
                                            ),
                                          );
                                        },
                                      ).then((value) async {
                                        if (value == null) return;
                                        if (value == "everyone") {
                                          deleteMessageEveryone(message);
                                        } else if (value == "justMe") {
                                          deleteMessageJustMe(message);
                                        }
                                      });
                                    } else {
                                      addReaction(message.firebaseId, value);
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform: Matrix4.translationValues(
                                      dragOffset, 0, 0),
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 300),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: isMe ? ballon1Color : ballon2Color,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(14),
                                        topRight: const Radius.circular(14),
                                        bottomLeft: isMe
                                            ? const Radius.circular(14)
                                            : Radius.zero,
                                        bottomRight: isMe
                                            ? Radius.zero
                                            : const Radius.circular(14),
                                      ),
                                      border: Border.all(
                                          color: Color(0xFF7DA1D0), width: 1),
                                    ),
                                    child: _MessageBubble(
                                      message: message,
                                      isMe: isMe,
                                      balloon1Text: balloon1TextColor,
                                      balloon2Text: balloon2TextColor,
                                    ),
                                  ),
                                ),
                              ),
                            if (!message.isDeleted)
                              if (message.reactionFromMe.isNotEmpty ||
                                  message.reactionFromOther.isNotEmpty)
                                Container(
                                  child: Row(
                                    mainAxisAlignment: isMe
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    crossAxisAlignment: isMe
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      if (message.reactionFromMe != null &&
                                          message.reactionFromMe.isNotEmpty &&
                                          message.reactionFromMe != "null")
                                        Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: Text(
                                            message.reactionFromMe,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      if (message.reactionFromOther != null &&
                                          message
                                              .reactionFromOther.isNotEmpty &&
                                          message.reactionFromOther != "null")
                                        Text(
                                          message.reactionFromOther,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                    ],
                                  ),
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        if (replyMessage != null)
          Padding(
            padding: const EdgeInsets.only(left: 66, right: 66),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: replyMessage!.message.isNotEmpty
                          ? Text(
                              replyMessage!.isEdited
                                  ? replyMessage!.editedMessage
                                  : replyMessage!.message,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            )
                          : replyMessage!.imagePath.isNotEmpty
                              ? Image.file(
                                  File(replyMessage!.imagePath),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : FutureBuilder<Uint8List?>(
                                  future: loadPdfBytes(replyMessage!.pdfUrl),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const SizedBox(
                                        height: 50,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                    return FlutterFlowPdfViewer(
                                      fileBytes: snapshot.data!,
                                      width: 100,
                                      height: 100,
                                      horizontalScroll: false,
                                    );
                                  },
                                ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          replyMessage = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 12, left: 12, right: 12),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    (selectedImage || selectedPdf)
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (selectedImage)
                                Stack(
                                  alignment: AlignmentDirectional(1, -1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.memory(
                                        returnValue?.bytes ??
                                            Uint8List.fromList([]),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        selectedImage = false;
                                        safeSetState(() {});
                                      },
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        color: Color(0xFFFF0101),
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              if (selectedPdf)
                                Stack(
                                  alignment: AlignmentDirectional(1, -1),
                                  children: [
                                    FlutterFlowPdfViewer(
                                      fileBytes: returnValue?.bytes,
                                      width: 100,
                                      height: 100,
                                      horizontalScroll: false,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        selectedPdf = false;
                                        safeSetState(() {});
                                      },
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        color: Color(0xFFFF0101),
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          )
                        : const SizedBox.shrink(), // hiç gösterme

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(-1, 0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor: AlignmentDirectional(-1, 1)
                                      .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Container(
                                                  color: Colors.transparent),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: GestureDetector(
                                                onTap: () {},
                                                child:
                                                    const AttachmentsMessageComponentWidget(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).then(
                                  (value) async {
                                    selectedPdf = false;
                                    selectedImage = false;
                                    if (value == "person") {
                                      _showContactDialog(context);
                                    } else if (value == "file") {
                                      uploadSelectedFileToFirebase();
                                    } else if (value == "map") {
                                      _openLocationInput(context);
                                    } else if (value == "pdf") {
                                      selectedImage = false;
                                      final selectedFiles = await selectFiles(
                                        allowedExtensions: ['pdf'],
                                        multiFile: false,
                                      );
                                      if (selectedFiles != null) {
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];
                                        selectedUploadedFiles = selectedFiles
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                ))
                                            .toList();

                                        if (selectedUploadedFiles.length ==
                                            selectedFiles.length) {
                                          safeSetState(() {
                                            returnValue =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }
                                    } else if (value == "image") {
                                      selectedPdf = false;
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 800.00,
                                        maxHeight: 800.00,
                                        imageQuality: 88,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            returnValue =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }
                                    } else if (value == "camera") {
                                      final selectedMedia = await selectMedia(
                                        multiImage: false,
                                        mediaSource: MediaSource
                                            .camera, // sadece kamerayı aç
                                      );

                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            returnValue =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }
                                    }
                                  },
                                );

                                if (returnValue != null) {
                                  if (returnValue!.bytes!.isNotEmpty) {
                                    if (FFAppState().isSelectedImage) {
                                      selectedImage = true;
                                      selectedPdf = false;
                                    } else {
                                      selectedPdf = true;
                                      selectedImage = false;
                                    }
                                  } else {
                                    selectedPdf = false;
                                    selectedImage = false;
                                  }
                                } else {
                                  selectedPdf = false;
                                  selectedImage = false;
                                }

                                safeSetState(() {});
                              },
                              child: const Icon(
                                Icons.attach_file,
                                color: Color(0xFFFFFF00),
                                size: 36,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 8,
                            child: Opacity(
                              opacity: 0.8,
                              child: TextFormField(
                                controller: textController,
                                focusNode: textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                onChanged: (value) {
                                  onChangedText(value);
                                },
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Mesaj Girin',
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF080000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                style: FlutterFlowTheme.of(context)
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
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                maxLines: 5,
                                minLines: 1,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: textControllerValidator
                                    ?.asValidator(context),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                  borderRadius: 8,
                                  buttonSize: 40,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    if (returnValue?.bytes != null &&
                                        returnValue!.bytes!.isNotEmpty) {
                                      String ext =
                                          selectedImage ? 'png' : 'pdf';
                                      String fileName =
                                          'selected_file_${DateTime.now().millisecondsSinceEpoch}.$ext';

                                      String? savedFilePath =
                                          await saveFileToAppDirectory(
                                              returnValue!.bytes!, fileName);

                                      if (savedFilePath != null) {
                                        String? uploadedUrl =
                                            await uploadFileToFirebaseStorage(
                                                returnValue!.bytes!, fileName);

                                        if (uploadedUrl != null) {
                                          String subCollectionName = '';
                                          switch (widget.conversationType) {
                                            case 'workplace':
                                              subCollectionName =
                                                  'workPlaceMessages';
                                              break;
                                            case 'company':
                                              subCollectionName =
                                                  'companyMessages';
                                              break;
                                            case 'social':
                                              subCollectionName =
                                                  'socialMessages';
                                              break;
                                            case 'phone':
                                              subCollectionName =
                                                  'phoneMessages';
                                              break;
                                            default:
                                              subCollectionName = 'messages';
                                          }

                                          final firebaseId =
                                              await FirebaseFirestore.instance
                                                  .collection('Message')
                                                  .doc(widget.messageRef.id)
                                                  .collection(subCollectionName)
                                                  .add({
                                            'message': textController.text,
                                            'senderRef': widget.authUser,
                                            'receiverRef': widget.receiverUser,
                                            'answeredMessage':
                                                replyMessage?.firebaseId ?? "",
                                            'isRead': true,
                                            'date': Timestamp.now(),
                                            'pdfUrl':
                                                selectedPdf ? uploadedUrl : '',
                                            'imageUrl': selectedImage
                                                ? uploadedUrl
                                                : '',
                                          });
                                          await sendMessageToUser(
                                            replyMessage: replyMessage,
                                            receiverRef: widget.receiverUser,
                                            messageRef: widget.messageRef,
                                            message: textController.text,
                                            firebaseId: firebaseId.id,
                                            senderRef:
                                                widget.authUser.toString(),
                                            pdfUrlLocal: selectedPdf
                                                ? savedFilePath
                                                : '',
                                            pdfUrlFirebase:
                                                selectedPdf ? uploadedUrl : '',
                                            imagePathLocal: selectedImage
                                                ? savedFilePath
                                                : '',
                                            imagePathFirebase: selectedImage
                                                ? uploadedUrl
                                                : '',
                                          );

                                          textController?.clear();

                                          safeSetState(() {
                                            selectedImage = false;
                                            selectedPdf = false;
                                          });
                                        } else {
                                          print(
                                              'Firebase Storage yüklemesi başarısız!');
                                        }
                                      } else {
                                        print('Dosya cihazda kaydedilemedi!');
                                      }
                                    } else {
                                      if (!(formKey.currentState?.validate() ??
                                          false)) {
                                        return;
                                      }
                                      String subCollectionName = '';
                                      switch (widget.conversationType) {
                                        case 'workplace':
                                          subCollectionName =
                                              'workPlaceMessages';
                                          break;
                                        case 'company':
                                          subCollectionName = 'companyMessages';
                                          break;
                                        case 'social':
                                          subCollectionName = 'socialMessages';
                                          break;
                                        case 'phone':
                                          subCollectionName = 'phoneMessages';
                                          break;
                                        default:
                                          subCollectionName = 'messages';
                                      }

                                      final firebaseId = await FirebaseFirestore
                                          .instance
                                          .collection('Message')
                                          .doc(widget.messageRef.id)
                                          .collection(subCollectionName)
                                          .add({
                                        'message': textController.text,
                                        'senderRef': widget.authUser,
                                        'receiverRef': widget.receiverUser,
                                        'answeredMessage':
                                            replyMessage?.firebaseId ?? "",
                                        'isRead': true,
                                        'date': Timestamp.now(),
                                      });

                                      await sendMessageToUser(
                                        replyMessage: replyMessage,
                                        receiverRef: widget.receiverUser,
                                        messageRef: widget.messageRef,
                                        message: textController.text,
                                        firebaseId: firebaseId.id,
                                        senderRef: widget.authUser.toString(),
                                        pdfUrlLocal: '',
                                        pdfUrlFirebase: '',
                                        imagePathFirebase: '',
                                        imagePathLocal: '',
                                      );

                                      textController?.clear();
                                    }

                                    safeSetState(() {
                                      replyMessage = null;
                                    });
                                  }),
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
        )
      ],
    );
  }

  String getSubCollectionName(String conversationType) {
    switch (conversationType) {
      case 'workplace':
        return 'workPlaceMessages';
      case 'company':
        return 'companyMessages';
      case 'social':
        return 'socialMessages';
      case 'phone':
        return 'phoneMessages';
      default:
        return 'messages';
    }
  }
}

class _MessageBubble extends StatelessWidget {
  final _MessageList message;
  final bool isMe;
  final Color balloon1Text;
  final Color balloon2Text;

  const _MessageBubble(
      {super.key,
      required this.message,
      required this.isMe,
      required this.balloon1Text,
      required this.balloon2Text});

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat.Hm().format(message.date);

    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (message.isMap)
          InkWell(
            onTap: _openMaps,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.place,
                          size: 16, color: Colors.redAccent),
                      const SizedBox(width: 4),
                      Text(
                        message.mapName.isEmpty ? "" : message.mapName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isMe ? balloon1Text : balloon2Text,
                        ),
                      ),
                    ],
                  ),
                ),
                // Harita görüntüsünü minimum alanda gösteriyoruz
                Image.network(
                  getStaticMapUrl(),
                  width: double.infinity,
                  height: 90,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const SizedBox(
                      height: 90,
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 90,
                    child: Center(
                        child: Icon(Icons.map, size: 24, color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        if (message.isPhone)
          InkWell(
            onTap: () async {
              final phone = message.phoneNumber.trim();
              final uri = Uri.parse('tel:$phone');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Telefon araması başlatılamadı')),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[200] : Colors.white10,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone, color: isMe ? Colors.black : Colors.white),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.phoneName,
                          style: TextStyle(
                            fontSize: 14,
                            color: isMe ? balloon1Text : balloon2Text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          message.phoneNumber,
                          style: TextStyle(
                            fontSize: 14,
                            color: isMe ? balloon1Text : balloon2Text,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (message.pdfUrl.isNotEmpty)
          FutureBuilder<Uint8List?>(
            future: loadPdfBytes(message.pdfUrl),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return InkWell(
                onTap: () {
                  openPdfExternally(message.pdfUrl);
                },
                child: FlutterFlowPdfViewer(
                  fileBytes: snapshot.data!,
                  width: 200,
                  height: 300,
                  horizontalScroll: false,
                ),
              );
            },
          ),
        const SizedBox(height: 8),
        if (message.imagePath.isNotEmpty)
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: FlutterFlowExpandedImageView(
                    image: Image.file(
                      File(message.imagePath),
                      fit: BoxFit.contain,
                    ),
                    allowRotation: false,
                    tag: 'imageTag',
                    useHeroAnimation: true,
                  ),
                ),
              );
            },
            child: Image.file(
              File(message.imagePath),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(height: 8),
        if (message.message.trim().isNotEmpty)
          Text(
            message.isEdited ? message.editedMessage : message.message,
            style: TextStyle(
              fontSize: 14,
              color: isMe ? balloon1Text : balloon2Text,
            ),
          ),
        const SizedBox(height: 4),
        if (message.isFile)
          InkWell(
            onTap: () {
              openPdfExternally(message.fileUrl);
            },
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[200] : Colors.white10,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(
                    _getFileIcon(message.fileName),
                    size: 32,
                    color: isMe ? Colors.black : Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.fileName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: isMe ? balloon1Text : balloon2Text,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _getFileTypeLabel(message.fileName),
                          style: TextStyle(
                            fontSize: 12,
                            color: isMe ? balloon1Text : balloon2Text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message.isEdited)
                Text(
                  "Düzenlendi",
                  style: TextStyle(
                    fontSize: 10,
                    color: isMe ? Colors.black87 : Colors.white70,
                  ),
                ),
              if (message.isEdited)
                const SizedBox(
                  width: 6,
                ),
              if (message.isStared)
                const Icon(
                  Icons.star_border_sharp,
                  size: 12,
                ),
              if (message.isStared)
                const SizedBox(
                  width: 6,
                ),
              Text(
                dateFormatted,
                style: TextStyle(
                  fontSize: 10,
                  color: isMe ? Colors.black87 : Colors.white70,
                ),
              ),
              if (isMe) ...[
                const SizedBox(width: 4),
                Icon(
                  message.isRead ? Icons.done_all : Icons.check,
                  size: 20,
                  color: message.isRead ? Color(0xFF00FF23) : Colors.grey,
                ),
              ],
            ],
          ),
        ),
      ],
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

  String getStaticMapUrl() {
    return 'https://maps.googleapis.com/maps/api/staticmap'
        '?center=${message.latitude},${message.longitude}'
        '&zoom=15'
        '&size=300x90'
        '&maptype=roadmap'
        '&markers=color:red%7Clabel:${(message.mapName.isEmpty ? "X" : message.mapName[0]).toUpperCase()}%7C${message.latitude},${message.longitude}'
        '&key=AIzaSyDtwTJXkGaFwfXXtnkcfU07XZE7Mm--pUc';
  }

  Future<void> _openMaps() async {
    final geoUrl = Uri.parse(
        'geo:${message.latitude},${message.longitude}?q=${message.latitude},${message.longitude}(${message.mapName})');
    final httpsUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${message.latitude},${message.longitude}');

    try {
      bool launched = false;
      if (Platform.isAndroid && await canLaunchUrl(geoUrl)) {
        launched =
            await launchUrl(geoUrl, mode: LaunchMode.externalApplication);
      }
      if (!launched && await canLaunchUrl(httpsUrl)) {
        await launchUrl(httpsUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("Harita açılamadı: $e");
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

Future<String?> _showLocationNameInputBottomSheet({
  required BuildContext context,
  required Color backgroundColor,
}) {
  final TextEditingController _controller = TextEditingController();

  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: StatefulBuilder(
            builder: (context, setState) {
              final isValid = _controller.text.trim().isNotEmpty;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.white70),
                      SizedBox(width: 8),
                      Text(
                        "Konum Adı Gir",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _controller,
                    autofocus: true,
                    onChanged: (text) => setState(() {}),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.greenAccent,
                    decoration: InputDecoration(
                      hintText: "Örn: Ev, Ofis, Park",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: isValid
                            ? () =>
                                Navigator.pop(context, _controller.text.trim())
                            : null,
                        icon: const Icon(Icons.send, size: 18),
                        label: const Text("Kaydet"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

Future<Map<String, dynamic>?> _showLocationInputBottomSheet({
  required BuildContext context,
  required Color backgroundColor,
}) {
  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return _LocationInputSheet(
        backgroundColor: backgroundColor,
      );
    },
  );
}

class _LocationInputSheet extends StatefulWidget {
  Color backgroundColor;

  _LocationInputSheet({required this.backgroundColor});

  @override
  State<_LocationInputSheet> createState() => _LocationInputSheetState();
}

class _LocationInputSheetState extends State<_LocationInputSheet> {
  final TextEditingController _controller = TextEditingController();
  double? latitude;
  double? longitude;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        return null;
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _startLocationUpdates() {
    _fetchLocation(); // ilk konumu hemen al
    _timer = Timer.periodic(Duration(seconds: 3), (_) => _fetchLocation());
  }

  Future<void> _fetchLocation() async {
    Position? position = await getCurrentLocation();
    if (position != null) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }
  }

  String getStaticMapUrl() {
    if (latitude == null || longitude == null) return '';
    return 'https://maps.googleapis.com/maps/api/staticmap'
        '?center=$latitude,$longitude'
        '&zoom=15'
        '&size=300x200'
        '&maptype=roadmap'
        '&markers=color:red%7Clabel:X%7C$latitude,$longitude'
        '&key=AIzaSyDtwTJXkGaFwfXXtnkcfU07XZE7Mm--pUc';
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _controller.text.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (latitude != null && longitude != null)
              Image.network(
                getStaticMapUrl(),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 90,
                    child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 90,
                  child: Center(
                      child: Icon(Icons.map, size: 24, color: Colors.grey)),
                ),
              )
            else
              const SizedBox(
                height: 90,
                child: Center(child: CircularProgressIndicator()),
              ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Icon(Icons.location_on, size: 20, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  "Konum Adı Gir",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              autofocus: true,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                hintText: "Örn: Ev, Ofis, Park",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: latitude != null && longitude != null
                      ? () {
                          final input = _controller.text.trim();
                          Navigator.pop(context, {
                            "name": input.isNotEmpty ? input : "noNameMap",
                            "latitude": latitude,
                            "longitude": longitude,
                          });
                        }
                      : null,
                  icon: const Icon(Icons.send, size: 18),
                  label: const Text("Gönder"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<String?> _showEditMessageDialog({
  required BuildContext context,
  required String initialText,
  required Color backgroundColor,
}) {
  final TextEditingController _controller =
      TextEditingController(text: initialText);

  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.edit, size: 20, color: Colors.white70),
                  SizedBox(width: 8),
                  Text(
                    "Mesajı Düzenle",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _controller,
                autofocus: true,
                maxLines: null,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                  hintText: "Yeni mesajı yaz...",
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white54),
                    tooltip: "İptal",
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: _controller.text.trim().isEmpty
                        ? null
                        : () => Navigator.pop(context, _controller.text.trim()),
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text("Kaydet"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

class _ForwardMessageComponent extends StatefulWidget {
  final DocumentReference authUser;

  final String selectedMessageFirebaseId;
  final String subCollectionName;
  final DocumentReference selectedMessageDocument;

  final String currentUserDisplayName;
  final String message;
  final String pdf;
  final String image;

  final bool isMap;
  final double? latitude;
  final double? longitude;
  final String mapName;

  final bool isFile;
  final String fileName;
  final String fileUrl;

  final bool isPerson;
  final String personName;
  final String personNumber;

  final double width;
  final double height;

  const _ForwardMessageComponent({
    Key? key,
    required this.authUser,
    required this.selectedMessageFirebaseId,
    required this.subCollectionName,
    required this.selectedMessageDocument,
    required this.currentUserDisplayName,
    required this.message,
    required this.pdf,
    required this.image,
    required this.isMap,
    required this.latitude,
    required this.longitude,
    required this.mapName,
    required this.isFile,
    required this.fileName,
    required this.fileUrl,
    required this.isPerson,
    required this.personName,
    required this.personNumber,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _ForwardMessageComponentState createState() =>
      _ForwardMessageComponentState();
}

class _ForwardMessageComponentState extends State<_ForwardMessageComponent> {
  late final List<Map<String, dynamic>> _chatStream;

  final ScrollController listViewController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();

  List<Map<String, dynamic>> chats = [];

  @override
  void initState() {
    super.initState();

    print('🔍 _ForwardMessageComponent - initState');

    print('authUser: ${widget.authUser.path}');
    print('selectedMessageFirebaseId: ${widget.selectedMessageFirebaseId}');
    print('subCollectionName: ${widget.subCollectionName}');
    print('selectedMessageDocument: ${widget.selectedMessageDocument.path}');
    print('currentUserDisplayName: ${widget.currentUserDisplayName}');
    print('message: ${widget.message}');
    print('pdf: ${widget.pdf}');
    print('image: ${widget.image}');
    print('isMap: ${widget.isMap}');
    print('latitude: ${widget.latitude}');
    print('longitude: ${widget.longitude}');
    print('mapName: ${widget.mapName}');
    print('isFile: ${widget.isFile}');
    print('fileName: ${widget.fileName}');
    print('fileUrl: ${widget.fileUrl}');
    print('isPerson: ${widget.isPerson}');
    print('personName: ${widget.personName}');
    print('personNumber: ${widget.personNumber}');
    print('width: ${widget.width}');
    print('height: ${widget.height}');

    print('🔍 _ForwardMessageComponent - initState');

    _loadChats();
  }

  Future<void> _loadChats() async {
    _chatStream = await getUserChatsOnce(widget.authUser);
    chats = _chatStream;
    setState(() {});
  }

  @override
  void dispose() {
    listViewController.dispose();
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> getUserChatsOnce(
      DocumentReference currentUserRef) async {
    final messages1 = await FirebaseFirestore.instance
        .collection('Message')
        .where('user1', isEqualTo: currentUserRef)
        .get();

    final messages2 = await FirebaseFirestore.instance
        .collection('Message')
        .where('user2', isEqualTo: currentUserRef)
        .get();

    final docs = [...messages1.docs, ...messages2.docs];

    final List<Map<String, dynamic>> userChats = [];

    for (var doc in docs) {
      final data = doc.data() as Map<String, dynamic>;
      final docRef = doc.reference;

      final user1 = data['user1'];
      final user2 = data['user2'];
      final user1AllowMediaSave = data['user1AllowMediaSave'];
      final user2AllowMediaSave = data['user2AllowMediaSave'];
      final otherUserRef = (user1 == currentUserRef) ? user2 : user1;
      final otherUserName =
          (user1 == currentUserRef) ? data['user2Name'] : data['user1Name'];
      final isUser1Blocked = data['isUser1Blocked'] as bool;
      final isUser2Blocked = data['isUser2Blocked'] as bool;
      final isBlocked = isUser1Blocked || isUser2Blocked;

      if (isBlocked) continue;

      if (data['lastMessageTimePhone'] != null) {
        userChats.add({
          'type': 'phone',
          'messageRef': docRef.id,
          'otherUserRef': otherUserRef,
          'otherUserName': otherUserName,
          'user1': user1,
          'user2': user2,
          'user2AllowMediaSave': user2AllowMediaSave,
          'user1AllowMediaSave': user1AllowMediaSave,
          'isUser2Blocked': isUser2Blocked,
          'isUser1Blocked': isUser1Blocked,
          'lastMessage': data['lastMessagePhone'],
          'lastMessageTime': data['lastMessageTimePhone'],
        });
      }

      if (data['lastMessageTimeSocial'] != null) {
        userChats.add({
          'type': 'social',
          'messageRef': docRef.id,
          'otherUserRef': otherUserRef,
          'otherUserName': otherUserName,
          'user1': user1,
          'user2': user2,
          'user2AllowMediaSave': user2AllowMediaSave,
          'user1AllowMediaSave': user1AllowMediaSave,
          'isUser2Blocked': isUser2Blocked,
          'isUser1Blocked': isUser1Blocked,
          'lastMessage': data['lastMessageSocial'],
          'lastMessageTime': data['lastMessageTimeSocial'],
        });
      }

      if (data['lastMessageTimeWorkplace'] != null) {
        userChats.add({
          'type': 'workplace',
          'messageRef': docRef.id,
          'otherUserRef': otherUserRef,
          'otherUserName': otherUserName,
          'user1': user1,
          'user2': user2,
          'user2AllowMediaSave': user2AllowMediaSave,
          'user1AllowMediaSave': user1AllowMediaSave,
          'isUser2Blocked': isUser2Blocked,
          'isUser1Blocked': isUser1Blocked,
          'lastMessage': data['lastMessageWorkplace'],
          'lastMessageTime': data['lastMessageTimeWorkplace'],
        });
      }

      if (data['lastMessageTimeCompany'] != null) {
        userChats.add({
          'type': 'company',
          'messageRef': docRef.id,
          'otherUserRef': otherUserRef,
          'otherUserName': otherUserName,
          'user1': user1,
          'user2': user2,
          'user2AllowMediaSave': user2AllowMediaSave,
          'user1AllowMediaSave': user1AllowMediaSave,
          'isUser2Blocked': isUser2Blocked,
          'isUser1Blocked': isUser1Blocked,
          'lastMessage': data['lastMessageCompany'],
          'lastMessageTime': data['lastMessageTimeCompany'],
        });
      }
    }

    // Son mesaj zamanına göre sırala
    userChats.sort((a, b) {
      final timeA = a['lastMessageTime'] as Timestamp?;
      final timeB = b['lastMessageTime'] as Timestamp?;
      if (timeA == null && timeB == null) return 0;
      if (timeA == null) return 1;
      if (timeB == null) return -1;
      return timeB.compareTo(timeA);
    });

    return userChats;
  }

  String trimMessage(dynamic message, {int maxLength = 50}) {
    final msg = message?.toString() ?? '';
    return msg.length > maxLength ? '${msg.substring(0, maxLength)}…' : msg;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: chats.isEmpty
          ? Center(
              child: Text(
                'Henüz mesaj yok',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
            )
          : Column(
              children: [
                Icon(Icons.close, color: Colors.red, size: 36),
                Expanded(
                  child: ListView.builder(
                    controller: listViewController,
                    padding: const EdgeInsets.all(8),
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final messageRef = FirebaseFirestore.instance
                                .collection('Message')
                                .doc(chat['messageRef'] as String);

                            final selectedMessage = await widget
                                .selectedMessageDocument
                                .collection(widget.subCollectionName)
                                .doc(widget.selectedMessageFirebaseId)
                                .get();

                            final recevicerRef =
                                chat['otherUserRef'] as DocumentReference;

                            String subCollectionName = '';
                            switch (chat['type']) {
                              case 'workplace':
                                subCollectionName = 'workPlaceMessages';
                                break;
                              case 'company':
                                subCollectionName = 'companyMessages';
                                break;
                              case 'social':
                                subCollectionName = 'socialMessages';
                                break;
                              case 'phone':
                                subCollectionName = 'phoneMessages';
                                break;
                              default:
                                subCollectionName = 'messages';
                            }

                            final firebaseId = await FirebaseFirestore.instance
                                .collection('Message')
                                .doc(messageRef.id)
                                .collection(subCollectionName)
                                .add({
                              'message':
                                  selectedMessage.data()?["message"] ?? "",
                              'senderRef': widget.authUser,
                              'receiverRef': recevicerRef,
                              'answeredMessage': "",
                              'isRead': true,
                              'date': Timestamp.now(),
                              'isMap': widget.isMap,
                              'latitude': widget.latitude ?? 0,
                              'longitude': widget.longitude ?? 0,
                              'isPerson': widget.isPerson,
                              'personName': widget.personName,
                              'personNumber': widget.personNumber,
                              'isFile': widget.isFile,
                              'fileUrl':
                                  selectedMessage.data()?["fileUrl"] ?? '',
                              'fileName': widget.fileName,
                              'pdfUrl': selectedMessage.data()?["pdfUrl"] ?? '',
                              'imageUrl':
                                  selectedMessage.data()?["imageUrl"] ?? '',
                            });

                            final conversationId = await SQLiteManager.instance
                                .getConversationWithLastMessage(
                              conversationName: chat['messageRef'].toString(),
                              type: chat['type'],
                            );

                            sendMessageToUser(
                              conversationId:
                                  conversationId.lastOrNull?.id ?? 0,
                              conversationType: chat['type'],
                              firebaseId: firebaseId.id,
                              messageRef: messageRef,
                              receiverRef: recevicerRef,
                              fileName: widget.fileName,
                              fileUrlFirebase:
                                  selectedMessage.data()?["fileUrl"] ?? '',
                              latitude: widget.latitude ?? 0,
                              longitude: widget.longitude ?? 0,
                              personName: widget.personName,
                              personNumber: widget.personNumber,
                              senderRef: widget.authUser.toString(),
                              imagePathFirebase:
                                  selectedMessage.data()?["imageUrl"] ?? '',
                              pdfUrlFirebase:
                                  selectedMessage.data()?["pdfUrl"] ?? '',
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Mesaj İletildi',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 500),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder<DocumentSnapshot>(
                                    future: chat['otherUserRef'].get(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox(
                                          width: 44,
                                          height: 44,
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      final userDoc = snapshot.data!;
                                      final data = userDoc.data()
                                              as Map<String, dynamic>? ??
                                          {};
                                      final photoUrl = data['photo_url'] ?? '';

                                      return Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: const Color(0x4D9489F5),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFF6F61EF),
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: photoUrl.isNotEmpty
                                              ? Image.network(
                                                  photoUrl,
                                                  width: 44,
                                                  height: 44,
                                                  fit: BoxFit.cover,
                                                )
                                              : Icon(
                                                  Icons.person,
                                                  size: 32,
                                                  color: Colors.grey[400],
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                chat['otherUserName'] ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Color(0xFF15161E),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              chat['lastMessageTime'] != null
                                                  ? _formatRelativeTime(
                                                      chat['lastMessageTime'])
                                                  : '',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF606A85),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                trimMessage(
                                                    chat['lastMessage']),
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            FutureBuilder<int>(
                                              future:
                                                  queryNewMessagesRecordCount(
                                                parent: currentUserReference,
                                                queryBuilder:
                                                    (newMessagesRecord) =>
                                                        newMessagesRecord
                                                            .where(
                                                              'messageRef',
                                                              isEqualTo:
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .doc(
                                                                          '/Message/${chat["messageRef"]}'),
                                                            )
                                                            .where(
                                                              'type',
                                                              isEqualTo:
                                                                  chat["type"],
                                                            ),
                                              ),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 5.0,
                                                      height: 5.0,
                                                    ),
                                                  );
                                                }
                                                int containerCount =
                                                    snapshot.data!;

                                                return Container(
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (containerCount > 0)
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerCount
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFFC0505),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF606A85),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  String _formatRelativeTime(Timestamp timestamp) {
    final date = timestamp.toDate();
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Az önce';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} dakika önce';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} saat önce';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} gün önce';
    } else {
      return '${date.day}.${date.month}.${date.year}';
    }
  }

  Future<void> sendMessageToUser({
    required DocumentReference receiverRef,
    required DocumentReference messageRef,
    required String conversationType,
    required String senderRef,
    required String firebaseId,
    required int conversationId,
    String pdfUrlFirebase = '',
    String imagePathFirebase = '',
    String fileUrlFirebase = '',
    String fileName = '',
    String personName = '',
    String personNumber = '',
    double latitude = 0.0,
    double longitude = 0.0,
  }) async {
    final now = DateTime.now();
    final nowTimestamp = Timestamp.fromDate(now);
    final newMessageDoc = receiverRef.collection('newMessages').doc();
    final notificationDoc = receiverRef.collection('notifications').doc();
    final dateStr = formatDateForSQLite(now.toIso8601String());

    print('---- sendMessageToUser Params ----');
    print('receiverRef: ${receiverRef.path}');
    print('messageRef: ${messageRef.path}');
    print('conversationType: $conversationType');
    print('senderRef: $senderRef');
    print('firebaseId: $firebaseId');
    print('conversationId: $conversationId');
    print('pdfUrlFirebase: $pdfUrlFirebase');
    print('imagePathFirebase: $imagePathFirebase');
    print('fileUrlFirebase: $fileUrlFirebase');
    print('fileName: $fileName');
    print('personName: $personName');
    print('personNumber: $personNumber');
    print('latitude: $latitude');
    print('longitude: $longitude');
    print('----------------------------------');

    WriteBatch buildBatch() {
      final batch = FirebaseFirestore.instance.batch();

      batch.set(newMessageDoc, {
        'messageRef': messageRef,
        'message': widget.message,
        'senderRef': senderRef,
        'date': nowTimestamp,
        'pdfUrl': pdfUrlFirebase,
        'imagePath': imagePathFirebase,
        'type': conversationType,
        'answeredMessage': "",
        'firebaseId': firebaseId,
        'filePath': fileUrlFirebase,
        'fileName': fileName,
        'personName': personName,
        'personNumber': personNumber,
        'latitude': latitude,
        'longitude': longitude,
      });

      batch.update(receiverRef, {
        'messageCount': FieldValue.increment(1),
        'notificationCount': FieldValue.increment(1),
      });

      final updates = <String, dynamic>{};

      if (conversationType == "workplace") {
        updates['lastMessageTimeWorkplace'] = now;
        updates['lastMessageWorkplace'] = widget.message;
      } else if (conversationType == "company") {
        updates['lastMessageTimeCompany'] = now;
        updates['lastMessageCompany'] = widget.message;
      } else if (conversationType == "phone") {
        updates['lastMessageTimePhone'] = now;
        updates['lastMessagePhone'] = widget.message;
      } else if (conversationType == "social") {
        updates['lastMessageTimeSocial'] = now;
        updates['lastMessageSocial'] = widget.message;
      }

      batch.update(messageRef, updates);

      batch.set(notificationDoc, {
        'type': "message",
        'content': "Bir Yeni Mesajınız Var",
        'relatedDoc': messageRef.id,
        'creationTime': now,
        'isRead': false,
        'isDelete': false,
        'fullDescription':
            "${widget.currentUserDisplayName} İsimli Kişiden Yeni Mesajınız Var",
        'messageType': conversationType,
        "image": ""
      });

      return batch;
    }

    bool success = false;

    for (int attempt = 0; attempt < 2; attempt++) {
      try {
        final batch = buildBatch();
        await batch.commit();
        success = true;
        break;
      } catch (e) {
        print('Batch commit hatası (deneme ${attempt + 1}): $e');
        await Future.delayed(Duration(milliseconds: 200));
      }
    }

    if (!success) {
      return;
    }

    await saveToLocalSQLIAmSender(
      date: dateStr,
      imagePath: widget.image,
      message: widget.message,
      pdfUrl: widget.pdf,
      sender: senderRef,
      conversationId: conversationId,
      firebaseId: firebaseId,
      fileName: fileName,
      fileUrl: widget.fileUrl,
      latitude: latitude,
      longitude: longitude,
      mapName: widget.mapName,
      personName: personName,
      personNumber: personNumber,
    );

    triggerPushNotification(
      notificationTitle: '${widget.currentUserDisplayName}',
      notificationText: 'Message',
      userRefs: [receiverRef],
      initialPageName: 'chatNewCopy',
      parameterData: {},
    );
  }

  Future<bool> saveToLocalSQLIAmSender(
      {required String message,
      required String sender,
      required String date,
      required String pdfUrl,
      required String firebaseId,
      _MessageList? replyMessage,
      required String fileName,
      required String fileUrl,
      required int conversationId,
      required String mapName,
      required double latitude,
      required double longitude,
      required String personName,
      required String personNumber,
      required String imagePath}) async {
    if (pdfUrl.isNotEmpty) {
      try {
        await SQLiteManager.instance.addMessageWithPdf(
            conversationId: conversationId,
            date: date,
            isRead: 1,
            pdfUrl: pdfUrl,
            message: message.isEmpty ? "" : message,
            receiverRef: widget.authUser.toString(),
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            answeredMessage: replyMessage?.firebaseId ?? "",
            senderRef: sender);
      } catch (e) {
        return false;
      }
    } else if (imagePath.isNotEmpty) {
      try {
        await SQLiteManager.instance.addMessageWithImage(
            conversationId: conversationId,
            date: date,
            isRead: 1,
            imagePath: imagePath,
            message: message.isEmpty ? "" : message,
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            receiverRef: widget.authUser.toString(),
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            answeredMessage: replyMessage?.firebaseId ?? "",
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
            receiverRef: widget.authUser.toString(),
            isStared: 0,
            isDeleted: 0,
            isEdited: 0,
            isDeletedFromMe: 0,
            isFullyDeleted: 0,
            reactionFromMe: "",
            reactionFromOther: "",
            firebaseId: firebaseId,
            editedMessage: "",
            fileName: fileName ?? "",
            fileUrl: fileUrl ?? "",
            isFile: fileUrl.isEmpty ? 0 : 1,
            isPerson: personName.isEmpty ? 0 : 1,
            personName: personName,
            personNumber: personNumber,
            answeredMessage: replyMessage?.firebaseId ?? "",
            isMap: (((latitude ?? 0.0) == 0.0 && (longitude ?? 0.0) == 0.0))
                ? 0
                : 1,
            latitude: latitude,
            longitude: longitude,
            mapName: mapName,
            senderRef: sender);
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  String formatDateForSQLite(dynamic date) {
    DateTime parsed;
    if (date is Timestamp) {
      parsed = date.toDate();
    } else if (date is DateTime) {
      parsed = date;
    } else {
      parsed = DateTime.tryParse(date.toString()) ?? DateTime.now();
    }

    return parsed.toIso8601String().split('.').first.replaceFirst('T', ' ');
  }
}

class _Contact {
  final String name;
  final String phone;

  _Contact({required this.name, required this.phone});
}

class _ContactSelectorDialog extends StatelessWidget {
  final List<_Contact> contacts;
  final Color backGroundColor;

  const _ContactSelectorDialog(
      {Key? key, required this.contacts, required this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Colors.transparent, // dialog şeffaf, içerik kendi rengini alacak
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backGroundColor, // 🎯 Yeni arka plan rengi
          border: Border.all(
            color: const Color(0xFF6F61EF), // mor kenarlık
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kişi Seç",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel_outlined,
                        color: Colors.red, size: 32))
              ],
            ),
            const Divider(height: 24, color: Colors.white24),
            Expanded(
              child: ListView.separated(
                itemCount: contacts.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.white10),
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return InkWell(
                    onTap: () => Navigator.pop(context, contact),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.person, color: Colors.white70),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  contact.phone,
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: Colors.white38),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
