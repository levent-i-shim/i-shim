import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isAcceptWorkPlace" field.
  bool? _isAcceptWorkPlace;
  bool get isAcceptWorkPlace => _isAcceptWorkPlace ?? false;
  bool hasIsAcceptWorkPlace() => _isAcceptWorkPlace != null;

  // "isAcceptCompany" field.
  bool? _isAcceptCompany;
  bool get isAcceptCompany => _isAcceptCompany ?? false;
  bool hasIsAcceptCompany() => _isAcceptCompany != null;

  // "lastMessageTimeWorkplace" field.
  DateTime? _lastMessageTimeWorkplace;
  DateTime? get lastMessageTimeWorkplace => _lastMessageTimeWorkplace;
  bool hasLastMessageTimeWorkplace() => _lastMessageTimeWorkplace != null;

  // "lastMessageTimeCompany" field.
  DateTime? _lastMessageTimeCompany;
  DateTime? get lastMessageTimeCompany => _lastMessageTimeCompany;
  bool hasLastMessageTimeCompany() => _lastMessageTimeCompany != null;

  // "lastMessageWorkplace" field.
  String? _lastMessageWorkplace;
  String get lastMessageWorkplace => _lastMessageWorkplace ?? '';
  bool hasLastMessageWorkplace() => _lastMessageWorkplace != null;

  // "lastMessageCompany" field.
  String? _lastMessageCompany;
  String get lastMessageCompany => _lastMessageCompany ?? '';
  bool hasLastMessageCompany() => _lastMessageCompany != null;

  // "lastMessagePhone" field.
  String? _lastMessagePhone;
  String get lastMessagePhone => _lastMessagePhone ?? '';
  bool hasLastMessagePhone() => _lastMessagePhone != null;

  // "lastMessageSocial" field.
  String? _lastMessageSocial;
  String get lastMessageSocial => _lastMessageSocial ?? '';
  bool hasLastMessageSocial() => _lastMessageSocial != null;

  // "user1" field.
  DocumentReference? _user1;
  DocumentReference? get user1 => _user1;
  bool hasUser1() => _user1 != null;

  // "user2" field.
  DocumentReference? _user2;
  DocumentReference? get user2 => _user2;
  bool hasUser2() => _user2 != null;

  // "user1Name" field.
  String? _user1Name;
  String get user1Name => _user1Name ?? '';
  bool hasUser1Name() => _user1Name != null;

  // "user2Name" field.
  String? _user2Name;
  String get user2Name => _user2Name ?? '';
  bool hasUser2Name() => _user2Name != null;

  // "lastMessageTimePhone" field.
  DateTime? _lastMessageTimePhone;
  DateTime? get lastMessageTimePhone => _lastMessageTimePhone;
  bool hasLastMessageTimePhone() => _lastMessageTimePhone != null;

  // "lastMessageTimeSocial" field.
  DateTime? _lastMessageTimeSocial;
  DateTime? get lastMessageTimeSocial => _lastMessageTimeSocial;
  bool hasLastMessageTimeSocial() => _lastMessageTimeSocial != null;

  // "user1AllowMediaSave" field.
  bool? _user1AllowMediaSave;
  bool get user1AllowMediaSave => _user1AllowMediaSave ?? false;
  bool hasUser1AllowMediaSave() => _user1AllowMediaSave != null;

  // "user2AllowMediaSave" field.
  bool? _user2AllowMediaSave;
  bool get user2AllowMediaSave => _user2AllowMediaSave ?? false;
  bool hasUser2AllowMediaSave() => _user2AllowMediaSave != null;

  // "isUser1Blocked" field.
  bool? _isUser1Blocked;
  bool get isUser1Blocked => _isUser1Blocked ?? false;
  bool hasIsUser1Blocked() => _isUser1Blocked != null;

  // "isUser2Blocked" field.
  bool? _isUser2Blocked;
  bool get isUser2Blocked => _isUser2Blocked ?? false;
  bool hasIsUser2Blocked() => _isUser2Blocked != null;

  // "isWritingUser1" field.
  bool? _isWritingUser1;
  bool get isWritingUser1 => _isWritingUser1 ?? false;
  bool hasIsWritingUser1() => _isWritingUser1 != null;

  // "isWritingUser2" field.
  bool? _isWritingUser2;
  bool get isWritingUser2 => _isWritingUser2 ?? false;
  bool hasIsWritingUser2() => _isWritingUser2 != null;

  // "isOnlineUser1" field.
  bool? _isOnlineUser1;
  bool get isOnlineUser1 => _isOnlineUser1 ?? false;
  bool hasIsOnlineUser1() => _isOnlineUser1 != null;

  // "isOnlineUser2" field.
  bool? _isOnlineUser2;
  bool get isOnlineUser2 => _isOnlineUser2 ?? false;
  bool hasIsOnlineUser2() => _isOnlineUser2 != null;

  // "backgroundUser1" field.
  String? _backgroundUser1;
  String get backgroundUser1 => _backgroundUser1 ?? '';
  bool hasBackgroundUser1() => _backgroundUser1 != null;

  // "backgroundUser2" field.
  String? _backgroundUser2;
  String get backgroundUser2 => _backgroundUser2 ?? '';
  bool hasBackgroundUser2() => _backgroundUser2 != null;

  // "balloon1User1" field.
  String? _balloon1User1;
  String get balloon1User1 => _balloon1User1 ?? '';
  bool hasBalloon1User1() => _balloon1User1 != null;

  // "balloon1User2" field.
  String? _balloon1User2;
  String get balloon1User2 => _balloon1User2 ?? '';
  bool hasBalloon1User2() => _balloon1User2 != null;

  // "balloon2User1" field.
  String? _balloon2User1;
  String get balloon2User1 => _balloon2User1 ?? '';
  bool hasBalloon2User1() => _balloon2User1 != null;

  // "balloon2User2" field.
  String? _balloon2User2;
  String get balloon2User2 => _balloon2User2 ?? '';
  bool hasBalloon2User2() => _balloon2User2 != null;

  // "balloon1TextColorUser1" field.
  String? _balloon1TextColorUser1;
  String get balloon1TextColorUser1 => _balloon1TextColorUser1 ?? '';
  bool hasBalloon1TextColorUser1() => _balloon1TextColorUser1 != null;

  // "balloon1TextColorUser2" field.
  String? _balloon1TextColorUser2;
  String get balloon1TextColorUser2 => _balloon1TextColorUser2 ?? '';
  bool hasBalloon1TextColorUser2() => _balloon1TextColorUser2 != null;

  // "balloon2TextColorUser1" field.
  String? _balloon2TextColorUser1;
  String get balloon2TextColorUser1 => _balloon2TextColorUser1 ?? '';
  bool hasBalloon2TextColorUser1() => _balloon2TextColorUser1 != null;

  // "balloon2TextColorUser2" field.
  String? _balloon2TextColorUser2;
  String get balloon2TextColorUser2 => _balloon2TextColorUser2 ?? '';
  bool hasBalloon2TextColorUser2() => _balloon2TextColorUser2 != null;

  void _initializeFields() {
    _isAcceptWorkPlace = snapshotData['isAcceptWorkPlace'] as bool?;
    _isAcceptCompany = snapshotData['isAcceptCompany'] as bool?;
    _lastMessageTimeWorkplace =
        snapshotData['lastMessageTimeWorkplace'] as DateTime?;
    _lastMessageTimeCompany =
        snapshotData['lastMessageTimeCompany'] as DateTime?;
    _lastMessageWorkplace = snapshotData['lastMessageWorkplace'] as String?;
    _lastMessageCompany = snapshotData['lastMessageCompany'] as String?;
    _lastMessagePhone = snapshotData['lastMessagePhone'] as String?;
    _lastMessageSocial = snapshotData['lastMessageSocial'] as String?;
    _user1 = snapshotData['user1'] as DocumentReference?;
    _user2 = snapshotData['user2'] as DocumentReference?;
    _user1Name = snapshotData['user1Name'] as String?;
    _user2Name = snapshotData['user2Name'] as String?;
    _lastMessageTimePhone = snapshotData['lastMessageTimePhone'] as DateTime?;
    _lastMessageTimeSocial = snapshotData['lastMessageTimeSocial'] as DateTime?;
    _user1AllowMediaSave = snapshotData['user1AllowMediaSave'] as bool?;
    _user2AllowMediaSave = snapshotData['user2AllowMediaSave'] as bool?;
    _isUser1Blocked = snapshotData['isUser1Blocked'] as bool?;
    _isUser2Blocked = snapshotData['isUser2Blocked'] as bool?;
    _isWritingUser1 = snapshotData['isWritingUser1'] as bool?;
    _isWritingUser2 = snapshotData['isWritingUser2'] as bool?;
    _isOnlineUser1 = snapshotData['isOnlineUser1'] as bool?;
    _isOnlineUser2 = snapshotData['isOnlineUser2'] as bool?;
    _backgroundUser1 = snapshotData['backgroundUser1'] as String?;
    _backgroundUser2 = snapshotData['backgroundUser2'] as String?;
    _balloon1User1 = snapshotData['balloon1User1'] as String?;
    _balloon1User2 = snapshotData['balloon1User2'] as String?;
    _balloon2User1 = snapshotData['balloon2User1'] as String?;
    _balloon2User2 = snapshotData['balloon2User2'] as String?;
    _balloon1TextColorUser1 = snapshotData['balloon1TextColorUser1'] as String?;
    _balloon1TextColorUser2 = snapshotData['balloon1TextColorUser2'] as String?;
    _balloon2TextColorUser1 = snapshotData['balloon2TextColorUser1'] as String?;
    _balloon2TextColorUser2 = snapshotData['balloon2TextColorUser2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  bool? isAcceptWorkPlace,
  bool? isAcceptCompany,
  DateTime? lastMessageTimeWorkplace,
  DateTime? lastMessageTimeCompany,
  String? lastMessageWorkplace,
  String? lastMessageCompany,
  String? lastMessagePhone,
  String? lastMessageSocial,
  DocumentReference? user1,
  DocumentReference? user2,
  String? user1Name,
  String? user2Name,
  DateTime? lastMessageTimePhone,
  DateTime? lastMessageTimeSocial,
  bool? user1AllowMediaSave,
  bool? user2AllowMediaSave,
  bool? isUser1Blocked,
  bool? isUser2Blocked,
  bool? isWritingUser1,
  bool? isWritingUser2,
  bool? isOnlineUser1,
  bool? isOnlineUser2,
  String? backgroundUser1,
  String? backgroundUser2,
  String? balloon1User1,
  String? balloon1User2,
  String? balloon2User1,
  String? balloon2User2,
  String? balloon1TextColorUser1,
  String? balloon1TextColorUser2,
  String? balloon2TextColorUser1,
  String? balloon2TextColorUser2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isAcceptWorkPlace': isAcceptWorkPlace,
      'isAcceptCompany': isAcceptCompany,
      'lastMessageTimeWorkplace': lastMessageTimeWorkplace,
      'lastMessageTimeCompany': lastMessageTimeCompany,
      'lastMessageWorkplace': lastMessageWorkplace,
      'lastMessageCompany': lastMessageCompany,
      'lastMessagePhone': lastMessagePhone,
      'lastMessageSocial': lastMessageSocial,
      'user1': user1,
      'user2': user2,
      'user1Name': user1Name,
      'user2Name': user2Name,
      'lastMessageTimePhone': lastMessageTimePhone,
      'lastMessageTimeSocial': lastMessageTimeSocial,
      'user1AllowMediaSave': user1AllowMediaSave,
      'user2AllowMediaSave': user2AllowMediaSave,
      'isUser1Blocked': isUser1Blocked,
      'isUser2Blocked': isUser2Blocked,
      'isWritingUser1': isWritingUser1,
      'isWritingUser2': isWritingUser2,
      'isOnlineUser1': isOnlineUser1,
      'isOnlineUser2': isOnlineUser2,
      'backgroundUser1': backgroundUser1,
      'backgroundUser2': backgroundUser2,
      'balloon1User1': balloon1User1,
      'balloon1User2': balloon1User2,
      'balloon2User1': balloon2User1,
      'balloon2User2': balloon2User2,
      'balloon1TextColorUser1': balloon1TextColorUser1,
      'balloon1TextColorUser2': balloon1TextColorUser2,
      'balloon2TextColorUser1': balloon2TextColorUser1,
      'balloon2TextColorUser2': balloon2TextColorUser2,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.isAcceptWorkPlace == e2?.isAcceptWorkPlace &&
        e1?.isAcceptCompany == e2?.isAcceptCompany &&
        e1?.lastMessageTimeWorkplace == e2?.lastMessageTimeWorkplace &&
        e1?.lastMessageTimeCompany == e2?.lastMessageTimeCompany &&
        e1?.lastMessageWorkplace == e2?.lastMessageWorkplace &&
        e1?.lastMessageCompany == e2?.lastMessageCompany &&
        e1?.lastMessagePhone == e2?.lastMessagePhone &&
        e1?.lastMessageSocial == e2?.lastMessageSocial &&
        e1?.user1 == e2?.user1 &&
        e1?.user2 == e2?.user2 &&
        e1?.user1Name == e2?.user1Name &&
        e1?.user2Name == e2?.user2Name &&
        e1?.lastMessageTimePhone == e2?.lastMessageTimePhone &&
        e1?.lastMessageTimeSocial == e2?.lastMessageTimeSocial &&
        e1?.user1AllowMediaSave == e2?.user1AllowMediaSave &&
        e1?.user2AllowMediaSave == e2?.user2AllowMediaSave &&
        e1?.isUser1Blocked == e2?.isUser1Blocked &&
        e1?.isUser2Blocked == e2?.isUser2Blocked &&
        e1?.isWritingUser1 == e2?.isWritingUser1 &&
        e1?.isWritingUser2 == e2?.isWritingUser2 &&
        e1?.isOnlineUser1 == e2?.isOnlineUser1 &&
        e1?.isOnlineUser2 == e2?.isOnlineUser2 &&
        e1?.backgroundUser1 == e2?.backgroundUser1 &&
        e1?.backgroundUser2 == e2?.backgroundUser2 &&
        e1?.balloon1User1 == e2?.balloon1User1 &&
        e1?.balloon1User2 == e2?.balloon1User2 &&
        e1?.balloon2User1 == e2?.balloon2User1 &&
        e1?.balloon2User2 == e2?.balloon2User2 &&
        e1?.balloon1TextColorUser1 == e2?.balloon1TextColorUser1 &&
        e1?.balloon1TextColorUser2 == e2?.balloon1TextColorUser2 &&
        e1?.balloon2TextColorUser1 == e2?.balloon2TextColorUser1 &&
        e1?.balloon2TextColorUser2 == e2?.balloon2TextColorUser2;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.isAcceptWorkPlace,
        e?.isAcceptCompany,
        e?.lastMessageTimeWorkplace,
        e?.lastMessageTimeCompany,
        e?.lastMessageWorkplace,
        e?.lastMessageCompany,
        e?.lastMessagePhone,
        e?.lastMessageSocial,
        e?.user1,
        e?.user2,
        e?.user1Name,
        e?.user2Name,
        e?.lastMessageTimePhone,
        e?.lastMessageTimeSocial,
        e?.user1AllowMediaSave,
        e?.user2AllowMediaSave,
        e?.isUser1Blocked,
        e?.isUser2Blocked,
        e?.isWritingUser1,
        e?.isWritingUser2,
        e?.isOnlineUser1,
        e?.isOnlineUser2,
        e?.backgroundUser1,
        e?.backgroundUser2,
        e?.balloon1User1,
        e?.balloon1User2,
        e?.balloon2User1,
        e?.balloon2User2,
        e?.balloon1TextColorUser1,
        e?.balloon1TextColorUser2,
        e?.balloon2TextColorUser1,
        e?.balloon2TextColorUser2
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
