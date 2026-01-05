import 'package:sqflite/sqflite.dart';

/// BEGIN ADDCONVERSATION
Future performAddConversation(
  Database database, {
  String? conversationName,
  String? type,
  String? user1Ref,
  String? user2Ref,
}) {
  final query = '''
INSERT INTO conversation (conversationName, type,user1Ref,user2Ref) VALUES ('${conversationName}', '${type}', '${user1Ref}',' ${user2Ref}');
''';
  return database.rawQuery(query);
}

/// END ADDCONVERSATION

/// BEGIN ADDMESSAGE
Future performAddMessage(
  Database database, {
  int? conversationId,
  String? senderRef,
  String? receiverRef,
  String? message,
  int? isRead,
  String? date,
  String? answeredMessage,
  String? answeredMessageUserName,
  String? firebaseId,
  String? reactionFromMe,
  String? reactionFromOther,
  int? isStared,
  int? isDeleted,
  int? isFullyDeleted,
  int? isDeletedFromMe,
  int? isEdited,
  String? editedMessage,
  int? isFile,
  int? isPerson,
  String? fileName,
  String? fileUrl,
  String? personName,
  String? personNumber,
  int? isMap,
  double? latitude,
  double? longitude,
  String? mapName,
}) {
  final query = '''
INSERT INTO messages (conversationId, senderRef,receiverRef,message,isRead,date,answeredMessage,answeredMessageUserName,firebaseId,reactionFromMe,reactionFromOther,isStared,isDeleted,isFullyDeleted,isDeletedFromMe,isEdited,editedMessage,isPerson,isFile,fileName,fileUrl,personName,personNumber,isMap,latitude,longitude,mapName) 
VALUES (${conversationId},'${senderRef}','${receiverRef}','${message}',${isRead},'${date}','${answeredMessage}','${answeredMessageUserName}','${firebaseId}','${reactionFromMe}','${reactionFromOther}',${isStared},${isDeleted},${isFullyDeleted},${isDeletedFromMe},${isEdited},'${editedMessage}',${isPerson},${isFile},'${fileName}','${fileUrl}','${personName}','${personNumber}',${isMap},${latitude},${longitude},'${mapName}');
''';
  return database.rawQuery(query);
}

/// END ADDMESSAGE

/// BEGIN ADDMESSAGEWITHPDF
Future performAddMessageWithPdf(
  Database database, {
  int? conversationId,
  String? senderRef,
  String? receiverRef,
  String? message,
  int? isRead,
  String? date,
  String? pdfUrl,
  String? answeredMessageUserName,
  String? answeredMessage,
  String? firebaseId,
  String? reactionFromOther,
  String? reactionFromMe,
  int? isStared,
  int? isDeleted,
  int? isFullyDeleted,
  int? isDeletedFromMe,
  int? isEdited,
  String? editedMessage,
}) {
  final query = '''
INSERT INTO messages (conversationId, senderRef,receiverRef,message,isRead,date,pdfUrl,answeredMessage,answeredMessageUserName,firebaseId,reactionFromMe,reactionFromOther,isStared,isDeleted,isFullyDeleted,isDeletedFromMe,isEdited,editedMessage) 
VALUES (${conversationId},'${senderRef}','${receiverRef}','${message}',${isRead},'${date}','${pdfUrl}','${answeredMessage}','${answeredMessageUserName}','${firebaseId}','${reactionFromMe}','${reactionFromOther}',${isStared},${isDeleted},${isFullyDeleted},${isDeletedFromMe},${isEdited},'${editedMessage}')
''';
  return database.rawQuery(query);
}

/// END ADDMESSAGEWITHPDF

/// BEGIN ADDMESSAGEWITHIMAGE
Future performAddMessageWithImage(
  Database database, {
  int? conversationId,
  String? senderRef,
  String? receiverRef,
  String? message,
  int? isRead,
  String? date,
  String? imagePath,
  String? answeredMessageUserName,
  String? answeredMessage,
  String? firebaseId,
  String? reactionFromMe,
  String? reactionFromOther,
  int? isStared,
  int? isDeleted,
  int? isFullyDeleted,
  int? isDeletedFromMe,
  int? isEdited,
  String? editedMessage,
}) {
  final query = '''
INSERT INTO messages (conversationId, senderRef,receiverRef,message,isRead,date,imagePath,answeredMessage,answeredMessageUserName,firebaseId,reactionFromOther,reactionFromMe,isStared,isDeleted,isFullyDeleted,isDeletedFromMe,isEdited,editedMessage) 
VALUES (${conversationId},'${senderRef}','${receiverRef}','${message}',${isRead},'${date}','${imagePath}','${answeredMessage}','${answeredMessageUserName}','${firebaseId}','${reactionFromMe}','${reactionFromOther}',${isStared},${isDeleted},${isFullyDeleted},${isDeletedFromMe},${isEdited},'${editedMessage}')
''';
  return database.rawQuery(query);
}

/// END ADDMESSAGEWITHIMAGE

/// BEGIN UPDATECONVERSATIONLASTMESSAGEID
Future performUpdateConversationLastMessageId(
  Database database, {
  int? lastMessageId,
  String? coversationName,
  String? type,
}) {
  final query = '''
UPDATE conversation
SET lastMessageId = ${lastMessageId}
WHERE coversationName = '${coversationName}' AND type = '${type}';
''';
  return database.rawQuery(query);
}

/// END UPDATECONVERSATIONLASTMESSAGEID

/// BEGIN DELETECONVERSATIONS
Future performDeleteConversations(
  Database database,
) {
  final query = '''
DELETE FROM conversation;
''';
  return database.rawQuery(query);
}

/// END DELETECONVERSATIONS

/// BEGIN DELETEMESSAGES
Future performDeleteMessages(
  Database database,
) {
  final query = '''
DELETE FROM messages;
''';
  return database.rawQuery(query);
}

/// END DELETEMESSAGES

/// BEGIN ADDCOMPANYWORKER
Future performAddCompanyWorker(
  Database database, {
  String? userId,
  String? companyWorkerId,
  String? workplaceId,
  String? companyId,
  String? roleName,
  String? departmentName,
  int? speechExist,
  String? unitName,
  String? userName,
}) {
  final query = '''
INSERT INTO companyWorkers (userId, companyWorkerId,workplaceId,companyId,roleName,unitName,userName,departmentName,speechExist) 
VALUES ('${userId}','${companyWorkerId}','${workplaceId}','${companyId}','${roleName}','${unitName}','${userName}','${departmentName}',${speechExist})
''';
  return database.rawQuery(query);
}

/// END ADDCOMPANYWORKER

/// BEGIN ADDPHONE
Future performAddPhone(
  Database database, {
  String? phoneNumber,
  String? name,
  int? isUser,
  int? speechExist,
  String? userId,
}) {
  final query = '''
INSERT INTO phones (phoneNumber, name, isUser, speechExist, userId) 
VALUES ('${phoneNumber}', '${name}', ${isUser}, ${speechExist}, '${userId}')
''';
  return database.rawQuery(query);
}

/// END ADDPHONE

/// BEGIN ADDFRIEND
Future performAddFriend(
  Database database, {
  String? userId,
  String? userName,
  int? speechExist,
}) {
  final query = '''
INSERT INTO friends (userId,userName,speechExist) 
VALUES ('${userId}','${userName}',${speechExist})
''';
  return database.rawQuery(query);
}

/// END ADDFRIEND

/// BEGIN UPDATECOMPANYWORKER
Future performUpdateCompanyWorker(
  Database database, {
  String? workplaceId,
  String? roleName,
  String? unitName,
  String? departmentName,
  int? speechExist,
  String? userId,
  String? userName,
}) {
  final query = '''
UPDATE companyWorkers
SET 
workplaceId = '${workplaceId}',
roleName =  '${roleName}',
unitName =  '${unitName}',
departmentName =  '${departmentName}',
speechExist =  ${speechExist},
userName = '${userName}'
WHERE userId = '${userId}';
''';
  return database.rawQuery(query);
}

/// END UPDATECOMPANYWORKER

/// BEGIN UPDATEPHONE
Future performUpdatePhone(
  Database database, {
  int? speechExist,
  String? phoneNumber,
}) {
  final query = '''
UPDATE phones
SET 
speechExist =  ${speechExist},
WHERE phoneNumber = '${phoneNumber}';
''';
  return database.rawQuery(query);
}

/// END UPDATEPHONE

/// BEGIN UPDATEFRIEND
Future performUpdateFriend(
  Database database, {
  int? speechExist,
  String? userId,
}) {
  final query = '''
UPDATE friends
SET 
speechExist =  ${speechExist},
WHERE userId = '${userId}';
''';
  return database.rawQuery(query);
}

/// END UPDATEFRIEND

/// BEGIN DELETEPHONES
Future performDeletePhones(
  Database database,
) {
  final query = '''
DELETE FROM phones;
''';
  return database.rawQuery(query);
}

/// END DELETEPHONES

/// BEGIN DELETECOMPANYWORKERS
Future performDeleteCompanyWorkers(
  Database database,
) {
  final query = '''
DELETE FROM companyWorkers;
''';
  return database.rawQuery(query);
}

/// END DELETECOMPANYWORKERS

/// BEGIN UPDATEREACTIONFROMME
Future performUpdateReactionFromMe(
  Database database, {
  String? reactionFromMe,
  String? firebaseId,
}) {
  final query = '''
UPDATE messages
SET reactionFromMe = '${reactionFromMe}'
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END UPDATEREACTIONFROMME

/// BEGIN UPDATEREACTIONFROMOTHER
Future performUpdateReactionFromOther(
  Database database, {
  String? reactionFromOther,
  String? firebaseId,
}) {
  final query = '''
UPDATE messages
SET reactionFromOther = '${reactionFromOther}'
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END UPDATEREACTIONFROMOTHER

/// BEGIN UPDATEMESSAGESTARSTATUS
Future performUpdateMessageStarStatus(
  Database database, {
  int? isStared,
  String? firebaseId,
}) {
  final query = '''
UPDATE messages
SET isStared = ${isStared}
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END UPDATEMESSAGESTARSTATUS

/// BEGIN SOFTDELETEMESSAGE
Future performSoftDeleteMessage(
  Database database, {
  String? firebaseId,
  int? isDeletedFromMe,
}) {
  final query = '''
UPDATE messages
SET isDeleted = 1 , isDeletedFromMe = ${isDeletedFromMe}
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END SOFTDELETEMESSAGE

/// BEGIN FULLYDELETEMESSAGE
Future performFullyDeleteMessage(
  Database database, {
  String? firebaseId,
}) {
  final query = '''
UPDATE messages
SET isFullyDeleted = 1
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END FULLYDELETEMESSAGE

/// BEGIN EDITMESSAGE
Future performEditMessage(
  Database database, {
  String? firebaseId,
  String? editedMessage,
}) {
  final query = '''
UPDATE messages
SET isEdited = 1,editedMessage = '${editedMessage}'
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END EDITMESSAGE

/// BEGIN SETMAPNAME
Future performSetMapName(
  Database database, {
  String? mapName,
  String? firebaseId,
}) {
  final query = '''
UPDATE messages
SET mapName = '${mapName}'
WHERE firebaseId = '${firebaseId}';
''';
  return database.rawQuery(query);
}

/// END SETMAPNAME
