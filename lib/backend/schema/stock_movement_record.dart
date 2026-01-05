import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockMovementRecord extends FirestoreRecord {
  StockMovementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stockRef" field.
  DocumentReference? _stockRef;
  DocumentReference? get stockRef => _stockRef;
  bool hasStockRef() => _stockRef != null;

  // "movementType" field.
  String? _movementType;
  String get movementType => _movementType ?? '';
  bool hasMovementType() => _movementType != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _stockRef = snapshotData['stockRef'] as DocumentReference?;
    _movementType = snapshotData['movementType'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _date = snapshotData['date'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('stockMovement')
          : FirebaseFirestore.instance.collectionGroup('stockMovement');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('stockMovement').doc(id);

  static Stream<StockMovementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockMovementRecord.fromSnapshot(s));

  static Future<StockMovementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockMovementRecord.fromSnapshot(s));

  static StockMovementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockMovementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockMovementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockMovementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockMovementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockMovementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockMovementRecordData({
  DocumentReference? stockRef,
  String? movementType,
  double? quantity,
  DateTime? date,
  DocumentReference? creatorUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stockRef': stockRef,
      'movementType': movementType,
      'quantity': quantity,
      'date': date,
      'creatorUserRef': creatorUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockMovementRecordDocumentEquality
    implements Equality<StockMovementRecord> {
  const StockMovementRecordDocumentEquality();

  @override
  bool equals(StockMovementRecord? e1, StockMovementRecord? e2) {
    return e1?.stockRef == e2?.stockRef &&
        e1?.movementType == e2?.movementType &&
        e1?.quantity == e2?.quantity &&
        e1?.date == e2?.date &&
        e1?.creatorUserRef == e2?.creatorUserRef;
  }

  @override
  int hash(StockMovementRecord? e) => const ListEquality().hash(
      [e?.stockRef, e?.movementType, e?.quantity, e?.date, e?.creatorUserRef]);

  @override
  bool isValidKey(Object? o) => o is StockMovementRecord;
}
