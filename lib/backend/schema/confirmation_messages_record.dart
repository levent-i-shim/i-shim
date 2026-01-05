import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfirmationMessagesRecord extends FirestoreRecord {
  ConfirmationMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _message = snapshotData['message'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('confirmationMessages')
          : FirebaseFirestore.instance.collectionGroup('confirmationMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('confirmationMessages').doc(id);

  static Stream<ConfirmationMessagesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ConfirmationMessagesRecord.fromSnapshot(s));

  static Future<ConfirmationMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfirmationMessagesRecord.fromSnapshot(s));

  static ConfirmationMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfirmationMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfirmationMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfirmationMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfirmationMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfirmationMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfirmationMessagesRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  DateTime? date,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'date': date,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfirmationMessagesRecordDocumentEquality
    implements Equality<ConfirmationMessagesRecord> {
  const ConfirmationMessagesRecordDocumentEquality();

  @override
  bool equals(ConfirmationMessagesRecord? e1, ConfirmationMessagesRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.date == e2?.date &&
        e1?.message == e2?.message;
  }

  @override
  int hash(ConfirmationMessagesRecord? e) =>
      const ListEquality().hash([e?.sender, e?.receiver, e?.date, e?.message]);

  @override
  bool isValidKey(Object? o) => o is ConfirmationMessagesRecord;
}
