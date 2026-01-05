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

import 'package:i_shim/confrimations/message_new_page_copy/message_new_page_copy_widget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:i_shim/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatsWidget extends StatefulWidget {
  final DocumentReference authUser;
  final double width;
  final double height;

  const UserChatsWidget({
    Key? key,
    required this.authUser,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _UserChatsWidgetState createState() => _UserChatsWidgetState();
}

class _UserChatsWidgetState extends State<UserChatsWidget> {
  StreamSubscription<List<Map<String, dynamic>>>? _subscription;
  late final Stream<List<Map<String, dynamic>>> _chatStream;

  final ScrollController listViewController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();

  final List<Map<String, dynamic>> chats = [];

  @override
  void initState() {
    super.initState();

    _chatStream = getUserChatsStream(widget.authUser);

    _subscription = _chatStream.listen((chatList) {
      setState(() {
        chats
          ..clear()
          ..addAll(chatList);
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    listViewController.dispose();
    textController.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  Stream<List<Map<String, dynamic>>> getUserChatsStream(
      DocumentReference currentUserRef) {
    final messages1 = FirebaseFirestore.instance
        .collection('Message')
        .where('user1', isEqualTo: currentUserRef)
        .snapshots();

    final messages2 = FirebaseFirestore.instance
        .collection('Message')
        .where('user2', isEqualTo: currentUserRef)
        .snapshots();

    final controller = StreamController<List<Map<String, dynamic>>>();

    QuerySnapshot? lastSnapshot1;
    QuerySnapshot? lastSnapshot2;

    void update() {
      if (lastSnapshot1 == null || lastSnapshot2 == null) return;

      final docs = [...lastSnapshot1!.docs, ...lastSnapshot2!.docs];

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
        final defaultBackgroundColor = Color(0xFF090620);
        final defaultBalloon1Color = Color(0xFFFFFFFF);
        final defaultBalloon2Color = Color(0xFF00499C);
        final defaultBalloon1TextColor = Color(0x00000000);
        final defaultBalloon2TextColor = Color(0xFFFFFFFF);

        // Get values from data or use defaults if not found
        final backgroundUser1 = data['backgroundUser1'] != null
            ? Color(int.parse(data['backgroundUser1']))
            : defaultBackgroundColor;
        final balloon1User1 = data['balloon1User1'] != null
            ? Color(int.parse(data['balloon1User1']))
            : defaultBalloon1Color;
        final balloon2User1 = data['balloon2User1'] != null
            ? Color(int.parse(data['balloon2User1']))
            : defaultBalloon2Color;
        final balloon1TextColorUser1 = data['balloon1TextColorUser1'] != null
            ? Color(int.parse(data['balloon1TextColorUser1']))
            : defaultBalloon1TextColor;
        final balloon2TextColorUser1 = data['balloon2TextColorUser1'] != null
            ? Color(int.parse(data['balloon2TextColorUser1']))
            : defaultBalloon2TextColor;

        final backgroundUser2 = data['backgroundUser2'] != null
            ? Color(int.parse(data['backgroundUser2']))
            : defaultBackgroundColor;
        final balloon1User2 = data['balloon1User2'] != null
            ? Color(int.parse(data['balloon1User2']))
            : defaultBalloon1Color;
        final balloon2User2 = data['balloon2User2'] != null
            ? Color(int.parse(data['balloon2User2']))
            : defaultBalloon2Color;
        final balloon1TextColorUser2 = data['balloon1TextColorUser2'] != null
            ? Color(int.parse(data['balloon1TextColorUser2']))
            : defaultBalloon1TextColor;
        final balloon2TextColorUser2 = data['balloon2TextColorUser2'] != null
            ? Color(int.parse(data['balloon2TextColorUser2']))
            : defaultBalloon2TextColor;

        if (isUser2Blocked == true || isUser1Blocked == true) continue;

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
            'backgroundUser1': backgroundUser1.value.toString(),
            'balloon1User1': balloon1User1.value.toString(),
            'balloon2User1': balloon2User1.value.toString(),
            'balloon1TextColorUser1': balloon1TextColorUser1.value.toString(),
            'balloon2TextColorUser1': balloon2TextColorUser1.value.toString(),
            'backgroundUser2': backgroundUser2.value.toString(),
            'balloon1User2': balloon1User2.value.toString(),
            'balloon2User2': balloon2User2.value.toString(),
            'balloon1TextColorUser2': balloon1TextColorUser2.value.toString(),
            'balloon2TextColorUser2': balloon2TextColorUser2.value.toString(),
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
            'isUser2Blocked': isUser2Blocked,
            'user2AllowMediaSave': user2AllowMediaSave,
            'user1AllowMediaSave': user1AllowMediaSave,
            'isUser1Blocked': isUser1Blocked,
            'lastMessage': data['lastMessageSocial'],
            'lastMessageTime': data['lastMessageTimeSocial'],
            'backgroundUser1': backgroundUser1.value.toString(),
            'balloon1User1': balloon1User1.value.toString(),
            'balloon2User1': balloon2User1.value.toString(),
            'balloon1TextColorUser1': balloon1TextColorUser1.value.toString(),
            'balloon2TextColorUser1': balloon2TextColorUser1.value.toString(),
            'backgroundUser2': backgroundUser2.value.toString(),
            'balloon1User2': balloon1User2.value.toString(),
            'balloon2User2': balloon2User2.value.toString(),
            'balloon1TextColorUser2': balloon1TextColorUser2.value.toString(),
            'balloon2TextColorUser2': balloon2TextColorUser2.value.toString(),
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
            'isUser2Blocked': isUser2Blocked,
            'user2AllowMediaSave': user2AllowMediaSave,
            'user1AllowMediaSave': user1AllowMediaSave,
            'isUser1Blocked': isUser1Blocked,
            'lastMessage': data['lastMessageWorkplace'],
            'lastMessageTime': data['lastMessageTimeWorkplace'],
            'backgroundUser1': backgroundUser1.value.toString(),
            'balloon1User1': balloon1User1.value.toString(),
            'balloon2User1': balloon2User1.value.toString(),
            'balloon1TextColorUser1': balloon1TextColorUser1.value.toString(),
            'balloon2TextColorUser1': balloon2TextColorUser1.value.toString(),
            'backgroundUser2': backgroundUser2.value.toString(),
            'balloon1User2': balloon1User2.value.toString(),
            'balloon2User2': balloon2User2.value.toString(),
            'balloon1TextColorUser2': balloon1TextColorUser2.value.toString(),
            'balloon2TextColorUser2': balloon2TextColorUser2.value.toString(),
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
            'backgroundUser1': backgroundUser1.value.toString(),
            'balloon1User1': balloon1User1.value.toString(),
            'balloon2User1': balloon2User1.value.toString(),
            'balloon1TextColorUser1': balloon1TextColorUser1.value.toString(),
            'balloon2TextColorUser1': balloon2TextColorUser1.value.toString(),
            'backgroundUser2': backgroundUser2.value.toString(),
            'balloon1User2': balloon1User2.value.toString(),
            'balloon2User2': balloon2User2.value.toString(),
            'balloon1TextColorUser2': balloon1TextColorUser2.value.toString(),
            'balloon2TextColorUser2': balloon2TextColorUser2.value.toString(),
          });
        }
      }

      userChats.sort((a, b) {
        final timeA = a['lastMessageTime'] as Timestamp?;
        final timeB = b['lastMessageTime'] as Timestamp?;
        if (timeA == null && timeB == null) return 0;
        if (timeA == null) return 1;
        if (timeB == null) return -1;
        return timeB.compareTo(timeA);
      });

      controller.add(userChats);
    }

    final sub1 = messages1.listen((snapshot) {
      lastSnapshot1 = snapshot;
      update();
    });

    final sub2 = messages2.listen((snapshot) {
      lastSnapshot2 = snapshot;
      update();
    });

    controller.onCancel = () {
      sub1.cancel();
      sub2.cancel();
      controller.close();
    };

    return controller.stream;
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
          : ListView.builder(
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
                      final messageRecord = MessageRecord.getDocumentFromData(
                        chat,
                        messageRef,
                      );

                      final user2Phone = await UsersRecord.getDocumentOnce(
                        chat['otherUserRef'],
                      );

                      if (chat['type'] == "phone") {
                        final conversationIdPhone = await SQLiteManager.instance
                            .getConversationWithLastMessage(
                          conversationName: chat['messageRef'].toString(),
                          type: 'phone',
                        );
                        final user2Phone = await UsersRecord.getDocumentOnce(
                            chat['otherUserRef']);
                        context.pushNamed(
                          MessageNewPageCopyWidget.routeName,
                          queryParameters: {
                            'type': serializeParam(
                              'phone',
                              ParamType.String,
                            ),
                            'conversationId': serializeParam(
                              conversationIdPhone.lastOrNull?.id.toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: {
                            'message': messageRecord,
                            'receiverUser': user2Phone,
                          },
                        );
                        safeSetState(() {});
                      } else if (chat['type'] == "workplace") {
                        final conversationId = await SQLiteManager.instance
                            .getConversationWithLastMessage(
                          conversationName: chat['messageRef'].toString(),
                          type: 'workplace',
                        );
                        final user2Workplace =
                            await UsersRecord.getDocumentOnce(
                                chat['otherUserRef']);
                        context.pushNamed(
                          MessageNewPageCopyWidget.routeName,
                          queryParameters: {
                            'type': serializeParam(
                              'workplace',
                              ParamType.String,
                            ),
                            'conversationId': serializeParam(
                              conversationId.lastOrNull?.id.toString(),
                              ParamType
                                  .String, // 🔁 int yerine string kullanıldı
                            ),
                          }.withoutNulls,
                          extra: {
                            'message':
                                messageRecord, // ✅ Artık MessageRecord tipinde
                            'receiverUser': user2Workplace, // ✅ UsersRecord
                          },
                        );
                      } else if (chat['type'] == "company") {
                        final conversationIdCompany = await SQLiteManager
                            .instance
                            .getConversationWithLastMessage(
                          conversationName: chat['messageRef'].toString(),
                          type: 'company',
                        );

                        final user2Company = await UsersRecord.getDocumentOnce(
                            chat['otherUserRef']);
                        context.pushNamed(
                          MessageNewPageCopyWidget.routeName,
                          queryParameters: {
                            'type': serializeParam(
                              'company',
                              ParamType.String,
                            ),
                            'conversationId': serializeParam(
                              conversationIdCompany.lastOrNull?.id.toString(),
                              ParamType
                                  .String, // 🔁 int yerine string kullanıldı
                            ),
                          }.withoutNulls,
                          extra: {
                            'message':
                                messageRecord, // ✅ Artık MessageRecord tipinde
                            'receiverUser': user2Company, // ✅ UsersRecord
                          },
                        );
                      } else if (chat['type'] == "social") {
                        final conversationIdSocial = await SQLiteManager
                            .instance
                            .getConversationWithLastMessage(
                          conversationName: chat['messageRef'].toString(),
                          type: 'social',
                        );

                        final user2Social = await UsersRecord.getDocumentOnce(
                            chat['otherUserRef']);
                        context.pushNamed(
                          MessageNewPageCopyWidget.routeName,
                          queryParameters: {
                            'type': serializeParam(
                              'social',
                              ParamType.String,
                            ),
                            'conversationId': serializeParam(
                              conversationIdSocial.lastOrNull?.id.toString(),
                              ParamType
                                  .String, // 🔁 int yerine string kullanıldı
                            ),
                          }.withoutNulls,
                          extra: {
                            'message':
                                messageRecord, // ✅ Artık MessageRecord tipinde
                            'receiverUser': user2Social, // ✅ UsersRecord
                          },
                        );
                      }
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
                                final data =
                                    userDoc.data() as Map<String, dynamic>? ??
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
                                    borderRadius: BorderRadius.circular(40),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          trimMessage(chat['lastMessage']),
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
                                        future: queryNewMessagesRecordCount(
                                          parent: currentUserReference,
                                          queryBuilder: (newMessagesRecord) =>
                                              newMessagesRecord
                                                  .where(
                                                    'messageRef',
                                                    isEqualTo: FirebaseFirestore
                                                        .instance
                                                        .doc(
                                                            '/Message/${chat["messageRef"]}'),
                                                  )
                                                  .where(
                                                    'type',
                                                    isEqualTo: chat["type"],
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
                                          int containerCount = snapshot.data!;

                                          return Container(
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (containerCount > 0)
                                                  Text(
                                                    valueOrDefault<String>(
                                                      containerCount.toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          color:
                                                              Color(0xFFFC0505),
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
}
