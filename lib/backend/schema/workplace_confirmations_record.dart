import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkplaceConfirmationsRecord extends FirestoreRecord {
  WorkplaceConfirmationsRecord._(
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

  // "workplace" field.
  DocumentReference? _workplace;
  DocumentReference? get workplace => _workplace;
  bool hasWorkplace() => _workplace != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "receiverRef" field.
  DocumentReference? _receiverRef;
  DocumentReference? get receiverRef => _receiverRef;
  bool hasReceiverRef() => _receiverRef != null;

  void _initializeFields() {
    _senderName = snapshotData['senderName'] as String?;
    _receiverName = snapshotData['receiverName'] as String?;
    _workplace = snapshotData['workplace'] as DocumentReference?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workplaceConfirmations');

  static Stream<WorkplaceConfirmationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkplaceConfirmationsRecord.fromSnapshot(s));

  static Future<WorkplaceConfirmationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkplaceConfirmationsRecord.fromSnapshot(s));

  static WorkplaceConfirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkplaceConfirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkplaceConfirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkplaceConfirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkplaceConfirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkplaceConfirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkplaceConfirmationsRecordData({
  String? senderName,
  String? receiverName,
  DocumentReference? workplace,
  String? lastMessage,
  DateTime? lastMessageTime,
  bool? isAccept,
  bool? isDelete,
  DocumentReference? senderRef,
  DocumentReference? receiverRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderName': senderName,
      'receiverName': receiverName,
      'workplace': workplace,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'isAccept': isAccept,
      'isDelete': isDelete,
      'senderRef': senderRef,
      'receiverRef': receiverRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkplaceConfirmationsRecordDocumentEquality
    implements Equality<WorkplaceConfirmationsRecord> {
  const WorkplaceConfirmationsRecordDocumentEquality();

  @override
  bool equals(
      WorkplaceConfirmationsRecord? e1, WorkplaceConfirmationsRecord? e2) {
    return e1?.senderName == e2?.senderName &&
        e1?.receiverName == e2?.receiverName &&
        e1?.workplace == e2?.workplace &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isDelete == e2?.isDelete &&
        e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef;
  }

  @override
  int hash(WorkplaceConfirmationsRecord? e) => const ListEquality().hash([
        e?.senderName,
        e?.receiverName,
        e?.workplace,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.isAccept,
        e?.isDelete,
        e?.senderRef,
        e?.receiverRef
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkplaceConfirmationsRecord;
}
