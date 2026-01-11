import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpentMoneyForAllowenceRecord extends FirestoreRecord {
  SpentMoneyForAllowenceRecord._(
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

  // "spentMoneyForAllowenceWorkPlace" field.
  DocumentReference? _spentMoneyForAllowenceWorkPlace;
  DocumentReference? get spentMoneyForAllowenceWorkPlace =>
      _spentMoneyForAllowenceWorkPlace;
  bool hasSpentMoneyForAllowenceWorkPlace() =>
      _spentMoneyForAllowenceWorkPlace != null;

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
    _spentMoneyForAllowenceWorkPlace =
        snapshotData['spentMoneyForAllowenceWorkPlace'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('spentMoneyForAllowence')
          : FirebaseFirestore.instance
              .collectionGroup('spentMoneyForAllowence');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('spentMoneyForAllowence').doc(id);

  static Stream<SpentMoneyForAllowenceRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SpentMoneyForAllowenceRecord.fromSnapshot(s));

  static Future<SpentMoneyForAllowenceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SpentMoneyForAllowenceRecord.fromSnapshot(s));

  static SpentMoneyForAllowenceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpentMoneyForAllowenceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpentMoneyForAllowenceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpentMoneyForAllowenceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpentMoneyForAllowenceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpentMoneyForAllowenceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpentMoneyForAllowenceRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  double? spendMoney,
  DateTime? date,
  String? note,
  String? senderName,
  String? imageUrl,
  String? pdfUrl,
  String? type,
  DocumentReference? spentMoneyForAllowenceWorkPlace,
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
      'spentMoneyForAllowenceWorkPlace': spentMoneyForAllowenceWorkPlace,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpentMoneyForAllowenceRecordDocumentEquality
    implements Equality<SpentMoneyForAllowenceRecord> {
  const SpentMoneyForAllowenceRecordDocumentEquality();

  @override
  bool equals(
      SpentMoneyForAllowenceRecord? e1, SpentMoneyForAllowenceRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.spendMoney == e2?.spendMoney &&
        e1?.date == e2?.date &&
        e1?.note == e2?.note &&
        e1?.senderName == e2?.senderName &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.type == e2?.type &&
        e1?.spentMoneyForAllowenceWorkPlace ==
            e2?.spentMoneyForAllowenceWorkPlace;
  }

  @override
  int hash(SpentMoneyForAllowenceRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.spendMoney,
        e?.date,
        e?.note,
        e?.senderName,
        e?.imageUrl,
        e?.pdfUrl,
        e?.type,
        e?.spentMoneyForAllowenceWorkPlace
      ]);

  @override
  bool isValidKey(Object? o) => o is SpentMoneyForAllowenceRecord;
}
