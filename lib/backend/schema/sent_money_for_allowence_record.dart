import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SentMoneyForAllowenceRecord extends FirestoreRecord {
  SentMoneyForAllowenceRecord._(
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

  // "sentMoney" field.
  double? _sentMoney;
  double get sentMoney => _sentMoney ?? 0.0;
  bool hasSentMoney() => _sentMoney != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "sentMoneyWorkPlace" field.
  DocumentReference? _sentMoneyWorkPlace;
  DocumentReference? get sentMoneyWorkPlace => _sentMoneyWorkPlace;
  bool hasSentMoneyWorkPlace() => _sentMoneyWorkPlace != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _sentMoney = castToType<double>(snapshotData['sentMoney']);
    _note = snapshotData['note'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _senderName = snapshotData['senderName'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _sentMoneyWorkPlace =
        snapshotData['sentMoneyWorkPlace'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sentMoneyForAllowence')
          : FirebaseFirestore.instance.collectionGroup('sentMoneyForAllowence');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sentMoneyForAllowence').doc(id);

  static Stream<SentMoneyForAllowenceRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SentMoneyForAllowenceRecord.fromSnapshot(s));

  static Future<SentMoneyForAllowenceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SentMoneyForAllowenceRecord.fromSnapshot(s));

  static SentMoneyForAllowenceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SentMoneyForAllowenceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SentMoneyForAllowenceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SentMoneyForAllowenceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SentMoneyForAllowenceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SentMoneyForAllowenceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSentMoneyForAllowenceRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  double? sentMoney,
  String? note,
  DateTime? date,
  String? senderName,
  String? pdfUrl,
  DocumentReference? sentMoneyWorkPlace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'sentMoney': sentMoney,
      'note': note,
      'date': date,
      'senderName': senderName,
      'pdfUrl': pdfUrl,
      'sentMoneyWorkPlace': sentMoneyWorkPlace,
    }.withoutNulls,
  );

  return firestoreData;
}

class SentMoneyForAllowenceRecordDocumentEquality
    implements Equality<SentMoneyForAllowenceRecord> {
  const SentMoneyForAllowenceRecordDocumentEquality();

  @override
  bool equals(
      SentMoneyForAllowenceRecord? e1, SentMoneyForAllowenceRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.sentMoney == e2?.sentMoney &&
        e1?.note == e2?.note &&
        e1?.date == e2?.date &&
        e1?.senderName == e2?.senderName &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.sentMoneyWorkPlace == e2?.sentMoneyWorkPlace;
  }

  @override
  int hash(SentMoneyForAllowenceRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.sentMoney,
        e?.note,
        e?.date,
        e?.senderName,
        e?.pdfUrl,
        e?.sentMoneyWorkPlace
      ]);

  @override
  bool isValidKey(Object? o) => o is SentMoneyForAllowenceRecord;
}
