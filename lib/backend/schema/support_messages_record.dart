import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportMessagesRecord extends FirestoreRecord {
  SupportMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportMessages');

  static Stream<SupportMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportMessagesRecord.fromSnapshot(s));

  static Future<SupportMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportMessagesRecord.fromSnapshot(s));

  static SupportMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportMessagesRecordData({
  DocumentReference? userRef,
  DateTime? date,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'date': date,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportMessagesRecordDocumentEquality
    implements Equality<SupportMessagesRecord> {
  const SupportMessagesRecordDocumentEquality();

  @override
  bool equals(SupportMessagesRecord? e1, SupportMessagesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.date == e2?.date &&
        e1?.message == e2?.message;
  }

  @override
  int hash(SupportMessagesRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.date, e?.message]);

  @override
  bool isValidKey(Object? o) => o is SupportMessagesRecord;
}
