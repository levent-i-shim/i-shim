import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceStockMovementRecord extends FirestoreRecord {
  WorkPlaceStockMovementRecord._(
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

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _stockRef = snapshotData['stockRef'] as DocumentReference?;
    _movementType = snapshotData['movementType'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _date = snapshotData['date'] as DateTime?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceStockMovement')
          : FirebaseFirestore.instance
              .collectionGroup('workPlaceStockMovement');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceStockMovement').doc(id);

  static Stream<WorkPlaceStockMovementRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceStockMovementRecord.fromSnapshot(s));

  static Future<WorkPlaceStockMovementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceStockMovementRecord.fromSnapshot(s));

  static WorkPlaceStockMovementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceStockMovementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceStockMovementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceStockMovementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceStockMovementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceStockMovementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceStockMovementRecordData({
  DocumentReference? stockRef,
  String? movementType,
  double? quantity,
  DateTime? date,
  DocumentReference? createdUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stockRef': stockRef,
      'movementType': movementType,
      'quantity': quantity,
      'date': date,
      'createdUserRef': createdUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceStockMovementRecordDocumentEquality
    implements Equality<WorkPlaceStockMovementRecord> {
  const WorkPlaceStockMovementRecordDocumentEquality();

  @override
  bool equals(
      WorkPlaceStockMovementRecord? e1, WorkPlaceStockMovementRecord? e2) {
    return e1?.stockRef == e2?.stockRef &&
        e1?.movementType == e2?.movementType &&
        e1?.quantity == e2?.quantity &&
        e1?.date == e2?.date &&
        e1?.createdUserRef == e2?.createdUserRef;
  }

  @override
  int hash(WorkPlaceStockMovementRecord? e) => const ListEquality().hash(
      [e?.stockRef, e?.movementType, e?.quantity, e?.date, e?.createdUserRef]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceStockMovementRecord;
}
