import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StocksRecord extends FirestoreRecord {
  StocksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "stockAdditionTime" field.
  DateTime? _stockAdditionTime;
  DateTime? get stockAdditionTime => _stockAdditionTime;
  bool hasStockAdditionTime() => _stockAdditionTime != null;

  // "stockRemovalTime" field.
  DateTime? _stockRemovalTime;
  DateTime? get stockRemovalTime => _stockRemovalTime;
  bool hasStockRemovalTime() => _stockRemovalTime != null;

  // "isRemoved" field.
  bool? _isRemoved;
  bool get isRemoved => _isRemoved ?? false;
  bool hasIsRemoved() => _isRemoved != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "totalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "pricePerUnit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceStock" field.
  DocumentReference? _workPlaceStock;
  DocumentReference? get workPlaceStock => _workPlaceStock;
  bool hasWorkPlaceStock() => _workPlaceStock != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _stockAdditionTime = snapshotData['stockAdditionTime'] as DateTime?;
    _stockRemovalTime = snapshotData['stockRemovalTime'] as DateTime?;
    _isRemoved = snapshotData['isRemoved'] as bool?;
    _unit = snapshotData['unit'] as String?;
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _pricePerUnit = castToType<double>(snapshotData['pricePerUnit']);
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceStock = snapshotData['workPlaceStock'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('stocks')
          : FirebaseFirestore.instance.collectionGroup('stocks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('stocks').doc(id);

  static Stream<StocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StocksRecord.fromSnapshot(s));

  static Future<StocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StocksRecord.fromSnapshot(s));

  static StocksRecord fromSnapshot(DocumentSnapshot snapshot) => StocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStocksRecordData({
  String? name,
  double? quantity,
  DateTime? stockAdditionTime,
  DateTime? stockRemovalTime,
  bool? isRemoved,
  String? unit,
  double? totalValue,
  double? pricePerUnit,
  DocumentReference? workPlace,
  DocumentReference? workPlaceStock,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'stockAdditionTime': stockAdditionTime,
      'stockRemovalTime': stockRemovalTime,
      'isRemoved': isRemoved,
      'unit': unit,
      'totalValue': totalValue,
      'pricePerUnit': pricePerUnit,
      'workPlace': workPlace,
      'workPlaceStock': workPlaceStock,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class StocksRecordDocumentEquality implements Equality<StocksRecord> {
  const StocksRecordDocumentEquality();

  @override
  bool equals(StocksRecord? e1, StocksRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.quantity == e2?.quantity &&
        e1?.stockAdditionTime == e2?.stockAdditionTime &&
        e1?.stockRemovalTime == e2?.stockRemovalTime &&
        e1?.isRemoved == e2?.isRemoved &&
        e1?.unit == e2?.unit &&
        e1?.totalValue == e2?.totalValue &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceStock == e2?.workPlaceStock &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(StocksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.quantity,
        e?.stockAdditionTime,
        e?.stockRemovalTime,
        e?.isRemoved,
        e?.unit,
        e?.totalValue,
        e?.pricePerUnit,
        e?.workPlace,
        e?.workPlaceStock,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is StocksRecord;
}
