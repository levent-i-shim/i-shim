import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationReportsRecord extends FirestoreRecord {
  ConversationReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "reportedUser" field.
  DocumentReference? _reportedUser;
  DocumentReference? get reportedUser => _reportedUser;
  bool hasReportedUser() => _reportedUser != null;

  // "reportedAt" field.
  DateTime? _reportedAt;
  DateTime? get reportedAt => _reportedAt;
  bool hasReportedAt() => _reportedAt != null;

  // "messageRef" field.
  DocumentReference? _messageRef;
  DocumentReference? get messageRef => _messageRef;
  bool hasMessageRef() => _messageRef != null;

  // "conversationType" field.
  String? _conversationType;
  String get conversationType => _conversationType ?? '';
  bool hasConversationType() => _conversationType != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _reportedUser = snapshotData['reportedUser'] as DocumentReference?;
    _reportedAt = snapshotData['reportedAt'] as DateTime?;
    _messageRef = snapshotData['messageRef'] as DocumentReference?;
    _conversationType = snapshotData['conversationType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversationReports');

  static Stream<ConversationReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationReportsRecord.fromSnapshot(s));

  static Future<ConversationReportsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConversationReportsRecord.fromSnapshot(s));

  static ConversationReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversationReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversationReportsRecordData({
  DocumentReference? user,
  DocumentReference? reportedUser,
  DateTime? reportedAt,
  DocumentReference? messageRef,
  String? conversationType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'reportedUser': reportedUser,
      'reportedAt': reportedAt,
      'messageRef': messageRef,
      'conversationType': conversationType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversationReportsRecordDocumentEquality
    implements Equality<ConversationReportsRecord> {
  const ConversationReportsRecordDocumentEquality();

  @override
  bool equals(ConversationReportsRecord? e1, ConversationReportsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.reportedUser == e2?.reportedUser &&
        e1?.reportedAt == e2?.reportedAt &&
        e1?.messageRef == e2?.messageRef &&
        e1?.conversationType == e2?.conversationType;
  }

  @override
  int hash(ConversationReportsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.reportedUser,
        e?.reportedAt,
        e?.messageRef,
        e?.conversationType
      ]);

  @override
  bool isValidKey(Object? o) => o is ConversationReportsRecord;
}
