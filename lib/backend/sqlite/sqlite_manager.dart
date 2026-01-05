import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'ishim7_db',
      'ishim3.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetConversationWithLastMessageRow>>
      getConversationWithLastMessage({
    String? conversationName,
    String? type,
  }) =>
          performGetConversationWithLastMessage(
            _database,
            conversationName: conversationName,
            type: type,
          );

  Future<List<GetMessagesRow>> getMessages({
    int? conversationId,
  }) =>
      performGetMessages(
        _database,
        conversationId: conversationId,
      );

  Future<List<ConversationHasExistRow>> conversationHasExist({
    String? conversationName,
    String? type,
  }) =>
      performConversationHasExist(
        _database,
        conversationName: conversationName,
        type: type,
      );

  Future<List<CompanyWorkerExistRow>> companyWorkerExist({
    String? userId,
  }) =>
      performCompanyWorkerExist(
        _database,
        userId: userId,
      );

  Future<List<PhoneExistRow>> phoneExist({
    String? phoneNumber,
  }) =>
      performPhoneExist(
        _database,
        phoneNumber: phoneNumber,
      );

  Future<List<FriendExistRow>> friendExist({
    String? userId,
  }) =>
      performFriendExist(
        _database,
        userId: userId,
      );

  Future<List<GetWorkersWithoutSpeechRow>> getWorkersWithoutSpeech() =>
      performGetWorkersWithoutSpeech(
        _database,
      );

  Future<List<GetFriendsWithoutSpeechRow>> getFriendsWithoutSpeech() =>
      performGetFriendsWithoutSpeech(
        _database,
      );

  Future<List<GetPhonesWithoutSpeechRow>> getPhonesWithoutSpeech() =>
      performGetPhonesWithoutSpeech(
        _database,
      );

  Future<List<GetNonUserPhonesRow>> getNonUserPhones() =>
      performGetNonUserPhones(
        _database,
      );

  Future<List<SearchCompanyWorkersByNameRow>> searchCompanyWorkersByName({
    String? userName,
  }) =>
      performSearchCompanyWorkersByName(
        _database,
        userName: userName,
      );

  Future<List<SearchPhoneByNameRow>> searchPhoneByName({
    String? name,
  }) =>
      performSearchPhoneByName(
        _database,
        name: name,
      );

  Future<List<SearchPhoneNonUserByNameRow>> searchPhoneNonUserByName({
    String? name,
  }) =>
      performSearchPhoneNonUserByName(
        _database,
        name: name,
      );

  Future<List<GetMessageMediaCountRow>> getMessageMediaCount({
    int? conversationId,
  }) =>
      performGetMessageMediaCount(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetLastImagesRow>> getLastImages({
    int? conversationId,
  }) =>
      performGetLastImages(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetImagesRow>> getImages({
    int? conversationId,
  }) =>
      performGetImages(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetPdfsRow>> getPdfs({
    int? conversationId,
  }) =>
      performGetPdfs(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetMessageStarredCountRow>> getMessageStarredCount({
    String? conversationId,
  }) =>
      performGetMessageStarredCount(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetStarredMessagesRow>> getStarredMessages({
    String? conversationId,
  }) =>
      performGetStarredMessages(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetFilesRow>> getFiles({
    int? conversationId,
  }) =>
      performGetFiles(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetAllPhonesRow>> getAllPhones() => performGetAllPhones(
        _database,
      );

  Future<List<GetMessagePhonesRow>> getMessagePhones({
    int? conversationId,
  }) =>
      performGetMessagePhones(
        _database,
        conversationId: conversationId,
      );

  Future<List<GetMessageMapsRow>> getMessageMaps({
    int? conversationId,
  }) =>
      performGetMessageMaps(
        _database,
        conversationId: conversationId,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addConversation({
    String? conversationName,
    String? type,
    String? user1Ref,
    String? user2Ref,
  }) =>
      performAddConversation(
        _database,
        conversationName: conversationName,
        type: type,
        user1Ref: user1Ref,
        user2Ref: user2Ref,
      );

  Future addMessage({
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
  }) =>
      performAddMessage(
        _database,
        conversationId: conversationId,
        senderRef: senderRef,
        receiverRef: receiverRef,
        message: message,
        isRead: isRead,
        date: date,
        answeredMessage: answeredMessage,
        answeredMessageUserName: answeredMessageUserName,
        firebaseId: firebaseId,
        reactionFromMe: reactionFromMe,
        reactionFromOther: reactionFromOther,
        isStared: isStared,
        isDeleted: isDeleted,
        isFullyDeleted: isFullyDeleted,
        isDeletedFromMe: isDeletedFromMe,
        isEdited: isEdited,
        editedMessage: editedMessage,
        isFile: isFile,
        isPerson: isPerson,
        fileName: fileName,
        fileUrl: fileUrl,
        personName: personName,
        personNumber: personNumber,
        isMap: isMap,
        latitude: latitude,
        longitude: longitude,
        mapName: mapName,
      );

  Future addMessageWithPdf({
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
  }) =>
      performAddMessageWithPdf(
        _database,
        conversationId: conversationId,
        senderRef: senderRef,
        receiverRef: receiverRef,
        message: message,
        isRead: isRead,
        date: date,
        pdfUrl: pdfUrl,
        answeredMessageUserName: answeredMessageUserName,
        answeredMessage: answeredMessage,
        firebaseId: firebaseId,
        reactionFromOther: reactionFromOther,
        reactionFromMe: reactionFromMe,
        isStared: isStared,
        isDeleted: isDeleted,
        isFullyDeleted: isFullyDeleted,
        isDeletedFromMe: isDeletedFromMe,
        isEdited: isEdited,
        editedMessage: editedMessage,
      );

  Future addMessageWithImage({
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
  }) =>
      performAddMessageWithImage(
        _database,
        conversationId: conversationId,
        senderRef: senderRef,
        receiverRef: receiverRef,
        message: message,
        isRead: isRead,
        date: date,
        imagePath: imagePath,
        answeredMessageUserName: answeredMessageUserName,
        answeredMessage: answeredMessage,
        firebaseId: firebaseId,
        reactionFromMe: reactionFromMe,
        reactionFromOther: reactionFromOther,
        isStared: isStared,
        isDeleted: isDeleted,
        isFullyDeleted: isFullyDeleted,
        isDeletedFromMe: isDeletedFromMe,
        isEdited: isEdited,
        editedMessage: editedMessage,
      );

  Future updateConversationLastMessageId({
    int? lastMessageId,
    String? coversationName,
    String? type,
  }) =>
      performUpdateConversationLastMessageId(
        _database,
        lastMessageId: lastMessageId,
        coversationName: coversationName,
        type: type,
      );

  Future deleteConversations() => performDeleteConversations(
        _database,
      );

  Future deleteMessages() => performDeleteMessages(
        _database,
      );

  Future addCompanyWorker({
    String? userId,
    String? companyWorkerId,
    String? workplaceId,
    String? companyId,
    String? roleName,
    String? departmentName,
    int? speechExist,
    String? unitName,
    String? userName,
  }) =>
      performAddCompanyWorker(
        _database,
        userId: userId,
        companyWorkerId: companyWorkerId,
        workplaceId: workplaceId,
        companyId: companyId,
        roleName: roleName,
        departmentName: departmentName,
        speechExist: speechExist,
        unitName: unitName,
        userName: userName,
      );

  Future addPhone({
    String? phoneNumber,
    String? name,
    int? isUser,
    int? speechExist,
    String? userId,
  }) =>
      performAddPhone(
        _database,
        phoneNumber: phoneNumber,
        name: name,
        isUser: isUser,
        speechExist: speechExist,
        userId: userId,
      );

  Future addFriend({
    String? userId,
    String? userName,
    int? speechExist,
  }) =>
      performAddFriend(
        _database,
        userId: userId,
        userName: userName,
        speechExist: speechExist,
      );

  Future updateCompanyWorker({
    String? workplaceId,
    String? roleName,
    String? unitName,
    String? departmentName,
    int? speechExist,
    String? userId,
    String? userName,
  }) =>
      performUpdateCompanyWorker(
        _database,
        workplaceId: workplaceId,
        roleName: roleName,
        unitName: unitName,
        departmentName: departmentName,
        speechExist: speechExist,
        userId: userId,
        userName: userName,
      );

  Future updatePhone({
    int? speechExist,
    String? phoneNumber,
  }) =>
      performUpdatePhone(
        _database,
        speechExist: speechExist,
        phoneNumber: phoneNumber,
      );

  Future updateFriend({
    int? speechExist,
    String? userId,
  }) =>
      performUpdateFriend(
        _database,
        speechExist: speechExist,
        userId: userId,
      );

  Future deletePhones() => performDeletePhones(
        _database,
      );

  Future deleteCompanyWorkers() => performDeleteCompanyWorkers(
        _database,
      );

  Future updateReactionFromMe({
    String? reactionFromMe,
    String? firebaseId,
  }) =>
      performUpdateReactionFromMe(
        _database,
        reactionFromMe: reactionFromMe,
        firebaseId: firebaseId,
      );

  Future updateReactionFromOther({
    String? reactionFromOther,
    String? firebaseId,
  }) =>
      performUpdateReactionFromOther(
        _database,
        reactionFromOther: reactionFromOther,
        firebaseId: firebaseId,
      );

  Future updateMessageStarStatus({
    int? isStared,
    String? firebaseId,
  }) =>
      performUpdateMessageStarStatus(
        _database,
        isStared: isStared,
        firebaseId: firebaseId,
      );

  Future softDeleteMessage({
    String? firebaseId,
    int? isDeletedFromMe,
  }) =>
      performSoftDeleteMessage(
        _database,
        firebaseId: firebaseId,
        isDeletedFromMe: isDeletedFromMe,
      );

  Future fullyDeleteMessage({
    String? firebaseId,
  }) =>
      performFullyDeleteMessage(
        _database,
        firebaseId: firebaseId,
      );

  Future editMessage({
    String? firebaseId,
    String? editedMessage,
  }) =>
      performEditMessage(
        _database,
        firebaseId: firebaseId,
        editedMessage: editedMessage,
      );

  Future setMapName({
    String? mapName,
    String? firebaseId,
  }) =>
      performSetMapName(
        _database,
        mapName: mapName,
        firebaseId: firebaseId,
      );

  /// END UPDATE QUERY CALLS
}
