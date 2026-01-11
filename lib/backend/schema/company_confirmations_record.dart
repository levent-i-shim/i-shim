import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyConfirmationsRecord extends FirestoreRecord {
  CompanyConfirmationsRecord._(
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

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

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
    _company = snapshotData['company'] as DocumentReference?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companyConfirmations');

  static Stream<CompanyConfirmationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyConfirmationsRecord.fromSnapshot(s));

  static Future<CompanyConfirmationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyConfirmationsRecord.fromSnapshot(s));

  static CompanyConfirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyConfirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyConfirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyConfirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyConfirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyConfirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyConfirmationsRecordData({
  String? senderName,
  String? receiverName,
  DocumentReference? company,
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
      'company': company,
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

class CompanyConfirmationsRecordDocumentEquality
    implements Equality<CompanyConfirmationsRecord> {
  const CompanyConfirmationsRecordDocumentEquality();

  @override
  bool equals(CompanyConfirmationsRecord? e1, CompanyConfirmationsRecord? e2) {
    return e1?.senderName == e2?.senderName &&
        e1?.receiverName == e2?.receiverName &&
        e1?.company == e2?.company &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isDelete == e2?.isDelete &&
        e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef;
  }

  @override
  int hash(CompanyConfirmationsRecord? e) => const ListEquality().hash([
        e?.senderName,
        e?.receiverName,
        e?.company,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.isAccept,
        e?.isDelete,
        e?.senderRef,
        e?.receiverRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyConfirmationsRecord;
}
