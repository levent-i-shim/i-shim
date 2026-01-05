import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpentMonetForAllowenceWorkPlaceRecord extends FirestoreRecord {
  SpentMonetForAllowenceWorkPlaceRecord._(
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

  // "spendMoney" field.
  double? _spendMoney;
  double get spendMoney => _spendMoney ?? 0.0;
  bool hasSpendMoney() => _spendMoney != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _spendMoney = castToType<double>(snapshotData['spendMoney']);
    _date = snapshotData['date'] as DateTime?;
    _note = snapshotData['note'] as String?;
    _senderName = snapshotData['senderName'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('spentMonetForAllowenceWorkPlace')
          : FirebaseFirestore.instance
              .collectionGroup('spentMonetForAllowenceWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('spentMonetForAllowenceWorkPlace').doc(id);

  static Stream<SpentMonetForAllowenceWorkPlaceRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot(s));

  static Future<SpentMonetForAllowenceWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref
          .get()
          .then((s) => SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot(s));

  static SpentMonetForAllowenceWorkPlaceRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SpentMonetForAllowenceWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpentMonetForAllowenceWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpentMonetForAllowenceWorkPlaceRecord._(
          reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpentMonetForAllowenceWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpentMonetForAllowenceWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpentMonetForAllowenceWorkPlaceRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  double? spendMoney,
  DateTime? date,
  String? note,
  String? senderName,
  String? imageUrl,
  String? pdfUrl,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'spendMoney': spendMoney,
      'date': date,
      'note': note,
      'senderName': senderName,
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpentMonetForAllowenceWorkPlaceRecordDocumentEquality
    implements Equality<SpentMonetForAllowenceWorkPlaceRecord> {
  const SpentMonetForAllowenceWorkPlaceRecordDocumentEquality();

  @override
  bool equals(SpentMonetForAllowenceWorkPlaceRecord? e1,
      SpentMonetForAllowenceWorkPlaceRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.spendMoney == e2?.spendMoney &&
        e1?.date == e2?.date &&
        e1?.note == e2?.note &&
        e1?.senderName == e2?.senderName &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.type == e2?.type;
  }

  @override
  int hash(SpentMonetForAllowenceWorkPlaceRecord? e) =>
      const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.spendMoney,
        e?.date,
        e?.note,
        e?.senderName,
        e?.imageUrl,
        e?.pdfUrl,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is SpentMonetForAllowenceWorkPlaceRecord;
}
