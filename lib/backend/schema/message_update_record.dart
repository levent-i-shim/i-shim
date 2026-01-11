import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageUpdateRecord extends FirestoreRecord {
  MessageUpdateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "messageRef" field.
  DocumentReference? _messageRef;
  DocumentReference? get messageRef => _messageRef;
  bool hasMessageRef() => _messageRef != null;

  // "messageType" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "messageId" field.
  String? _messageId;
  String get messageId => _messageId ?? '';
  bool hasMessageId() => _messageId != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "reaction" field.
  String? _reaction;
  String get reaction => _reaction ?? '';
  bool hasReaction() => _reaction != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "updateType" field.
  String? _updateType;
  String get updateType => _updateType ?? '';
  bool hasUpdateType() => _updateType != null;

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "editMessage" field.
  String? _editMessage;
  String get editMessage => _editMessage ?? '';
  bool hasEditMessage() => _editMessage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageRef = snapshotData['messageRef'] as DocumentReference?;
    _messageType = snapshotData['messageType'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _messageId = snapshotData['messageId'] as String?;
    _isPinned = snapshotData['isPinned'] as bool?;
    _reaction = snapshotData['reaction'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _updateType = snapshotData['updateType'] as String?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _editMessage = snapshotData['editMessage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messageUpdate')
          : FirebaseFirestore.instance.collectionGroup('messageUpdate');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messageUpdate').doc(id);

  static Stream<MessageUpdateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageUpdateRecord.fromSnapshot(s));

  static Future<MessageUpdateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageUpdateRecord.fromSnapshot(s));

  static MessageUpdateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageUpdateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageUpdateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageUpdateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageUpdateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageUpdateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageUpdateRecordData({
  DocumentReference? messageRef,
  String? messageType,
  DateTime? date,
  String? messageId,
  bool? isPinned,
  String? reaction,
  bool? isDelete,
  String? updateType,
  DocumentReference? senderRef,
  String? editMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'messageRef': messageRef,
      'messageType': messageType,
      'date': date,
      'messageId': messageId,
      'isPinned': isPinned,
      'reaction': reaction,
      'isDelete': isDelete,
      'updateType': updateType,
      'senderRef': senderRef,
      'editMessage': editMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageUpdateRecordDocumentEquality
    implements Equality<MessageUpdateRecord> {
  const MessageUpdateRecordDocumentEquality();

  @override
  bool equals(MessageUpdateRecord? e1, MessageUpdateRecord? e2) {
    return e1?.messageRef == e2?.messageRef &&
        e1?.messageType == e2?.messageType &&
        e1?.date == e2?.date &&
        e1?.messageId == e2?.messageId &&
        e1?.isPinned == e2?.isPinned &&
        e1?.reaction == e2?.reaction &&
        e1?.isDelete == e2?.isDelete &&
        e1?.updateType == e2?.updateType &&
        e1?.senderRef == e2?.senderRef &&
        e1?.editMessage == e2?.editMessage;
  }

  @override
  int hash(MessageUpdateRecord? e) => const ListEquality().hash([
        e?.messageRef,
        e?.messageType,
        e?.date,
        e?.messageId,
        e?.isPinned,
        e?.reaction,
        e?.isDelete,
        e?.updateType,
        e?.senderRef,
        e?.editMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageUpdateRecord;
}
