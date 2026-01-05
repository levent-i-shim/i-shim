import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETCONVERSATIONWITHLASTMESSAGE
Future<List<GetConversationWithLastMessageRow>>
    performGetConversationWithLastMessage(
  Database database, {
  String? conversationName,
  String? type,
}) {
  final query = '''
SELECT id,conversationName,type,user1Ref,user2Ref
FROM conversation
WHERE conversationName = '${conversationName}' AND type = '${type}';
''';
  return _readQuery(
      database, query, (d) => GetConversationWithLastMessageRow(d));
}

class GetConversationWithLastMessageRow extends SqliteRow {
  GetConversationWithLastMessageRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get coversationName => data['coversationName'] as String;
  String get type => data['type'] as String;
  String get user1Ref => data['user1Ref'] as String;
  String get user2Ref => data['user2Ref'] as String;
}

/// END GETCONVERSATIONWITHLASTMESSAGE

/// BEGIN GETMESSAGES
Future<List<GetMessagesRow>> performGetMessages(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT * FROM messages WHERE conversationId = ${conversationId};
''';
  return _readQuery(database, query, (d) => GetMessagesRow(d));
}

class GetMessagesRow extends SqliteRow {
  GetMessagesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get senderRef => data['senderRef'] as String;
  String get receiverRef => data['receiverRef'] as String;
  String? get message => data['message'] as String?;
  int get isRead => data['isRead'] as int;
  String? get date => data['date'] as String?;
  String? get pdfUrl => data['pdfUrl'] as String?;
  String? get imagePath => data['imagePath'] as String?;
  String? get answeredMessage => data['answeredMessage'] as String?;
  String? get answeredMessageUserName =>
      data['answeredMessageUserName'] as String?;
  String? get firebaseId => data['firebaseId'] as String?;
  String? get reactionFromMe => data['reactionFromMe'] as String?;
  String? get reactionFromOther => data['reactionFromOther'] as String?;
  int? get isStared => data['isStared'] as int?;
  int? get isDeleted => data['isDeleted'] as int?;
  int? get isFullyDeleted => data['isFullyDeleted'] as int?;
  int? get isDeletedFromMe => data['isDeletedFromMe'] as int?;
  int? get isEdited => data['isEdited'] as int?;
  String? get editedMessage => data['editedMessage'] as String?;
  int? get isFile => data['isFile'] as int?;
  String? get fileName => data['fileName'] as String?;
  String? get fileUrl => data['fileUrl'] as String?;
  int? get isPerson => data['isPerson'] as int?;
  String? get personName => data['personName'] as String?;
  String? get personNumber => data['personNumber'] as String?;
  int? get isMap => data['isMap'] as int?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['longitude'] as double?;
  String? get mapName => data['mapName'] as String?;
}

/// END GETMESSAGES

/// BEGIN CONVERSATIONHASEXIST
Future<List<ConversationHasExistRow>> performConversationHasExist(
  Database database, {
  String? conversationName,
  String? type,
}) {
  final query = '''
SELECT id FROM conversation
WHERE conversationName = '${conversationName}' AND type = '${type}'
LIMIT 1;
''';
  return _readQuery(database, query, (d) => ConversationHasExistRow(d));
}

class ConversationHasExistRow extends SqliteRow {
  ConversationHasExistRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
}

/// END CONVERSATIONHASEXIST

/// BEGIN COMPANYWORKEREXIST
Future<List<CompanyWorkerExistRow>> performCompanyWorkerExist(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT id FROM companyWorkers
WHERE userId = '${userId}'
LIMIT 1;
''';
  return _readQuery(database, query, (d) => CompanyWorkerExistRow(d));
}

class CompanyWorkerExistRow extends SqliteRow {
  CompanyWorkerExistRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
}

/// END COMPANYWORKEREXIST

/// BEGIN PHONEEXIST
Future<List<PhoneExistRow>> performPhoneExist(
  Database database, {
  String? phoneNumber,
}) {
  final query = '''
SELECT id FROM phones
WHERE phoneNumber = '${phoneNumber}'
LIMIT 1;
''';
  return _readQuery(database, query, (d) => PhoneExistRow(d));
}

class PhoneExistRow extends SqliteRow {
  PhoneExistRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
}

/// END PHONEEXIST

/// BEGIN FRIENDEXIST
Future<List<FriendExistRow>> performFriendExist(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT id FROM friends
WHERE userId = '${userId}'
LIMIT 1;
''';
  return _readQuery(database, query, (d) => FriendExistRow(d));
}

class FriendExistRow extends SqliteRow {
  FriendExistRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
}

/// END FRIENDEXIST

/// BEGIN GETWORKERSWITHOUTSPEECH
Future<List<GetWorkersWithoutSpeechRow>> performGetWorkersWithoutSpeech(
  Database database,
) {
  final query = '''
SELECT userId,companyWorkerId,workplaceId,companyId,roleName,unitName,departmentName,userName
FROM companyWorkers
WHERE speechExist = 0;
''';
  return _readQuery(database, query, (d) => GetWorkersWithoutSpeechRow(d));
}

class GetWorkersWithoutSpeechRow extends SqliteRow {
  GetWorkersWithoutSpeechRow(Map<String, dynamic> data) : super(data);

  String get companyWorkerId => data['companyWorkerId'] as String;
  String get workplaceId => data['workplaceId'] as String;
  String get companyId => data['companyId'] as String;
  String get roleName => data['roleName'] as String;
  String get unitName => data['unitName'] as String;
  String get departmentName => data['departmentName'] as String;
  String get userId => data['userId'] as String;
  String? get userName => data['userName'] as String?;
}

/// END GETWORKERSWITHOUTSPEECH

/// BEGIN GETFRIENDSWITHOUTSPEECH
Future<List<GetFriendsWithoutSpeechRow>> performGetFriendsWithoutSpeech(
  Database database,
) {
  final query = '''
SELECT userId,userName 
FROM friends
WHERE speechExist = 0;
''';
  return _readQuery(database, query, (d) => GetFriendsWithoutSpeechRow(d));
}

class GetFriendsWithoutSpeechRow extends SqliteRow {
  GetFriendsWithoutSpeechRow(Map<String, dynamic> data) : super(data);

  String get userId => data['userId'] as String;
  String get userName => data['userName'] as String;
}

/// END GETFRIENDSWITHOUTSPEECH

/// BEGIN GETPHONESWITHOUTSPEECH
Future<List<GetPhonesWithoutSpeechRow>> performGetPhonesWithoutSpeech(
  Database database,
) {
  final query = '''
SELECT phoneNumber,name ,userId
FROM phones
WHERE speechExist = 0 AND isUser=1;
''';
  return _readQuery(database, query, (d) => GetPhonesWithoutSpeechRow(d));
}

class GetPhonesWithoutSpeechRow extends SqliteRow {
  GetPhonesWithoutSpeechRow(Map<String, dynamic> data) : super(data);

  String get phoneNumber => data['phoneNumber'] as String;
  String get name => data['name'] as String;
  String? get userId => data['userId'] as String?;
}

/// END GETPHONESWITHOUTSPEECH

/// BEGIN GETNONUSERPHONES
Future<List<GetNonUserPhonesRow>> performGetNonUserPhones(
  Database database,
) {
  final query = '''
SELECT phoneNumber,name 
FROM phones
WHERE isUser=0;
''';
  return _readQuery(database, query, (d) => GetNonUserPhonesRow(d));
}

class GetNonUserPhonesRow extends SqliteRow {
  GetNonUserPhonesRow(Map<String, dynamic> data) : super(data);

  String get phoneNumber => data['phoneNumber'] as String;
  String get name => data['name'] as String;
}

/// END GETNONUSERPHONES

/// BEGIN SEARCHCOMPANYWORKERSBYNAME
Future<List<SearchCompanyWorkersByNameRow>> performSearchCompanyWorkersByName(
  Database database, {
  String? userName,
}) {
  final query = '''
SELECT userId, companyWorkerId, workplaceId, companyId, roleName, unitName, departmentName, userName
FROM companyWorkers
WHERE speechExist = 0 AND userName LIKE '%${userName}%';
''';
  return _readQuery(database, query, (d) => SearchCompanyWorkersByNameRow(d));
}

class SearchCompanyWorkersByNameRow extends SqliteRow {
  SearchCompanyWorkersByNameRow(Map<String, dynamic> data) : super(data);

  String get userId => data['userId'] as String;
  String get companyWorkerId => data['companyWorkerId'] as String;
  String get workplaceId => data['workplaceId'] as String;
  String get companyId => data['companyId'] as String;
  String get roleName => data['roleName'] as String;
  String get unitName => data['unitName'] as String;
  String get departmentName => data['departmentName'] as String;
  String get userName => data['userName'] as String;
}

/// END SEARCHCOMPANYWORKERSBYNAME

/// BEGIN SEARCHPHONEBYNAME
Future<List<SearchPhoneByNameRow>> performSearchPhoneByName(
  Database database, {
  String? name,
}) {
  final query = '''
SELECT phoneNumber,name ,userId
FROM phones
WHERE speechExist = 0 AND isUser=1 AND name LIKE '%${name}%';
''';
  return _readQuery(database, query, (d) => SearchPhoneByNameRow(d));
}

class SearchPhoneByNameRow extends SqliteRow {
  SearchPhoneByNameRow(Map<String, dynamic> data) : super(data);

  String get phoneNumber => data['phoneNumber'] as String;
  String get name => data['name'] as String;
  String get userId => data['userId'] as String;
}

/// END SEARCHPHONEBYNAME

/// BEGIN SEARCHPHONENONUSERBYNAME
Future<List<SearchPhoneNonUserByNameRow>> performSearchPhoneNonUserByName(
  Database database, {
  String? name,
}) {
  final query = '''
SELECT phoneNumber,name 
FROM phones
WHERE isUser=0 AND name LIKE '%${name}%';
''';
  return _readQuery(database, query, (d) => SearchPhoneNonUserByNameRow(d));
}

class SearchPhoneNonUserByNameRow extends SqliteRow {
  SearchPhoneNonUserByNameRow(Map<String, dynamic> data) : super(data);

  String get phoneNumber => data['phoneNumber'] as String;
  String get name => data['name'] as String;
}

/// END SEARCHPHONENONUSERBYNAME

/// BEGIN GETMESSAGEMEDIACOUNT
Future<List<GetMessageMediaCountRow>> performGetMessageMediaCount(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT COUNT(*) AS totalCount
FROM messages
WHERE (imagePath IS NOT NULL OR pdfUrl IS NOT NULL OR isFile = 1 OR isPerson = 1 OR isMap = 1) AND isDeleted = 0
  AND conversationId = ${conversationId};
''';
  return _readQuery(database, query, (d) => GetMessageMediaCountRow(d));
}

class GetMessageMediaCountRow extends SqliteRow {
  GetMessageMediaCountRow(Map<String, dynamic> data) : super(data);

  int get totalCount => data['totalCount'] as int;
}

/// END GETMESSAGEMEDIACOUNT

/// BEGIN GETLASTIMAGES
Future<List<GetLastImagesRow>> performGetLastImages(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT imagePath
FROM messages
WHERE imagePath IS NOT NULL AND isDeleted=0
  AND conversationId = ${conversationId}
ORDER BY date DESC
LIMIT 4;
''';
  return _readQuery(database, query, (d) => GetLastImagesRow(d));
}

class GetLastImagesRow extends SqliteRow {
  GetLastImagesRow(Map<String, dynamic> data) : super(data);

  String get imagePath => data['imagePath'] as String;
}

/// END GETLASTIMAGES

/// BEGIN GETIMAGES
Future<List<GetImagesRow>> performGetImages(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT imagePath
FROM messages
WHERE imagePath IS NOT NULL  AND isDeleted = 0
  AND conversationId = ${conversationId}
ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetImagesRow(d));
}

class GetImagesRow extends SqliteRow {
  GetImagesRow(Map<String, dynamic> data) : super(data);

  String get imagePath => data['imagePath'] as String;
}

/// END GETIMAGES

/// BEGIN GETPDFS
Future<List<GetPdfsRow>> performGetPdfs(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT pdfUrl
FROM messages
WHERE pdfUrl IS NOT NULL  AND isDeleted = 0
  AND conversationId = ${conversationId}
ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetPdfsRow(d));
}

class GetPdfsRow extends SqliteRow {
  GetPdfsRow(Map<String, dynamic> data) : super(data);

  String get pdfUrl => data['pdfUrl'] as String;
}

/// END GETPDFS

/// BEGIN GETMESSAGESTARREDCOUNT
Future<List<GetMessageStarredCountRow>> performGetMessageStarredCount(
  Database database, {
  String? conversationId,
}) {
  final query = '''
SELECT COUNT(*) AS totalCount
FROM messages
WHERE isStared = 1 AND isDeleted = 0
  AND conversationId = ${conversationId};
''';
  return _readQuery(database, query, (d) => GetMessageStarredCountRow(d));
}

class GetMessageStarredCountRow extends SqliteRow {
  GetMessageStarredCountRow(Map<String, dynamic> data) : super(data);

  int get totalCount => data['totalCount'] as int;
}

/// END GETMESSAGESTARREDCOUNT

/// BEGIN GETSTARREDMESSAGES
Future<List<GetStarredMessagesRow>> performGetStarredMessages(
  Database database, {
  String? conversationId,
}) {
  final query = '''
SELECT * FROM messages WHERE isStared = 1  AND isDeleted=0 AND conversationId = ${conversationId} ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetStarredMessagesRow(d));
}

class GetStarredMessagesRow extends SqliteRow {
  GetStarredMessagesRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String? get message => data['message'] as String?;
  String? get date => data['date'] as String?;
  String? get pdfUrl => data['pdfUrl'] as String?;
  String? get imagePath => data['imagePath'] as String?;
  String? get firebaseId => data['firebaseId'] as String?;
  String? get senderRef => data['senderRef'] as String?;
  int? get isEdited => data['isEdited'] as int?;
  String? get editedMessage => data['editedMessage'] as String?;
  int? get isFile => data['isFile'] as int?;
  String? get fileUrl => data['fileUrl'] as String?;
  String? get fileName => data['fileName'] as String?;
  int? get isPerson => data['isPerson'] as int?;
  String? get personName => data['personName'] as String?;
  String? get personNumber => data['personNumber'] as String?;
  int? get isMap => data['isMap'] as int?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['longitude'] as double?;
  String? get mapName => data['mapName'] as String?;
}

/// END GETSTARREDMESSAGES

/// BEGIN GETFILES
Future<List<GetFilesRow>> performGetFiles(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT fileName,fileUrl
FROM messages
WHERE isFile = 1 AND isDeleted = 0
  AND conversationId = ${conversationId}
ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetFilesRow(d));
}

class GetFilesRow extends SqliteRow {
  GetFilesRow(Map<String, dynamic> data) : super(data);

  String? get fileName => data['fileName'] as String?;
  String? get fileUrl => data['fileUrl'] as String?;
}

/// END GETFILES

/// BEGIN GETALLPHONES
Future<List<GetAllPhonesRow>> performGetAllPhones(
  Database database,
) {
  final query = '''
SELECT phoneNumber, name 
FROM phones;
''';
  return _readQuery(database, query, (d) => GetAllPhonesRow(d));
}

class GetAllPhonesRow extends SqliteRow {
  GetAllPhonesRow(Map<String, dynamic> data) : super(data);

  String? get phoneNumber => data['phoneNumber'] as String?;
  String? get name => data['name'] as String?;
}

/// END GETALLPHONES

/// BEGIN GETMESSAGEPHONES
Future<List<GetMessagePhonesRow>> performGetMessagePhones(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT personName,personNumber
FROM messages
WHERE isPerson = 1 AND isDeleted = 0
  AND conversationId = ${conversationId}
ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetMessagePhonesRow(d));
}

class GetMessagePhonesRow extends SqliteRow {
  GetMessagePhonesRow(Map<String, dynamic> data) : super(data);

  String? get personName => data['personName'] as String?;
  String? get personNumber => data['personNumber'] as String?;
}

/// END GETMESSAGEPHONES

/// BEGIN GETMESSAGEMAPS
Future<List<GetMessageMapsRow>> performGetMessageMaps(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT mapName,latitude,longitude
FROM messages
WHERE isMap = 1 AND isDeleted = 0
  AND conversationId = ${conversationId}
ORDER BY date DESC;
''';
  return _readQuery(database, query, (d) => GetMessageMapsRow(d));
}

class GetMessageMapsRow extends SqliteRow {
  GetMessageMapsRow(Map<String, dynamic> data) : super(data);

  String? get mapName => data['mapName'] as String?;
  double? get latitude => data['latitude'] as double?;
  double? get longitude => data['longitude'] as double?;
}

/// END GETMESSAGEMAPS
