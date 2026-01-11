import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalConfirmationsRecord extends FirestoreRecord {
  PersonalConfirmationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "receiverName" field.
  String? _receiverName;
  String get receiverName => _receiverName ?? '';
  bool hasReceiverName() => _receiverName != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  void _initializeFields() {
    _senderName = snapshotData['senderName'] as String?;
    _receiverName = snapshotData['receiverName'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PersonalConfirmations');

  static Stream<PersonalConfirmationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalConfirmationsRecord.fromSnapshot(s));

  static Future<PersonalConfirmationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PersonalConfirmationsRecord.fromSnapshot(s));

  static PersonalConfirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalConfirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalConfirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalConfirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalConfirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalConfirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalConfirmationsRecordData({
  String? senderName,
  String? receiverName,
  DocumentReference? sender,
  DocumentReference? receiver,
  String? lastMessage,
  DateTime? lastMessageTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderName': senderName,
      'receiverName': receiverName,
      'sender': sender,
      'receiver': receiver,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalConfirmationsRecordDocumentEquality
    implements Equality<PersonalConfirmationsRecord> {
  const PersonalConfirmationsRecordDocumentEquality();

  @override
  bool equals(
      PersonalConfirmationsRecord? e1, PersonalConfirmationsRecord? e2) {
    return e1?.senderName == e2?.senderName &&
        e1?.receiverName == e2?.receiverName &&
        e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime;
  }

  @override
  int hash(PersonalConfirmationsRecord? e) => const ListEquality().hash([
        e?.senderName,
        e?.receiverName,
        e?.sender,
        e?.receiver,
        e?.lastMessage,
        e?.lastMessageTime
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalConfirmationsRecord;
}
