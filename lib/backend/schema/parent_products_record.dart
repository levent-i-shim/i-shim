import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParentProductsRecord extends FirestoreRecord {
  ParentProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "averageCost" field.
  double? _averageCost;
  double get averageCost => _averageCost ?? 0.0;
  bool hasAverageCost() => _averageCost != null;

  // "totalCost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

  // "totalQuantity" field.
  double? _totalQuantity;
  double get totalQuantity => _totalQuantity ?? 0.0;
  bool hasTotalQuantity() => _totalQuantity != null;

  // "soldQuantity" field.
  double? _soldQuantity;
  double get soldQuantity => _soldQuantity ?? 0.0;
  bool hasSoldQuantity() => _soldQuantity != null;

  // "totalSoldCost" field.
  double? _totalSoldCost;
  double get totalSoldCost => _totalSoldCost ?? 0.0;
  bool hasTotalSoldCost() => _totalSoldCost != null;

  // "companyIncomes" field.
  List<DocumentReference>? _companyIncomes;
  List<DocumentReference> get companyIncomes => _companyIncomes ?? const [];
  bool hasCompanyIncomes() => _companyIncomes != null;

  // "companyPayments" field.
  List<DocumentReference>? _companyPayments;
  List<DocumentReference> get companyPayments => _companyPayments ?? const [];
  bool hasCompanyPayments() => _companyPayments != null;

  // "workPlaceIncomes" field.
  List<DocumentReference>? _workPlaceIncomes;
  List<DocumentReference> get workPlaceIncomes => _workPlaceIncomes ?? const [];
  bool hasWorkPlaceIncomes() => _workPlaceIncomes != null;

  // "workPlacePayments" field.
  List<DocumentReference>? _workPlacePayments;
  List<DocumentReference> get workPlacePayments =>
      _workPlacePayments ?? const [];
  bool hasWorkPlacePayments() => _workPlacePayments != null;

  // "bills" field.
  List<DocumentReference>? _bills;
  List<DocumentReference> get bills => _bills ?? const [];
  bool hasBills() => _bills != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _products = getDataList(snapshotData['products']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _averageCost = castToType<double>(snapshotData['averageCost']);
    _totalCost = castToType<double>(snapshotData['totalCost']);
    _totalQuantity = castToType<double>(snapshotData['totalQuantity']);
    _soldQuantity = castToType<double>(snapshotData['soldQuantity']);
    _totalSoldCost = castToType<double>(snapshotData['totalSoldCost']);
    _companyIncomes = getDataList(snapshotData['companyIncomes']);
    _companyPayments = getDataList(snapshotData['companyPayments']);
    _workPlaceIncomes = getDataList(snapshotData['workPlaceIncomes']);
    _workPlacePayments = getDataList(snapshotData['workPlacePayments']);
    _bills = getDataList(snapshotData['bills']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('parentProducts')
          : FirebaseFirestore.instance.collectionGroup('parentProducts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('parentProducts').doc(id);

  static Stream<ParentProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParentProductsRecord.fromSnapshot(s));

  static Future<ParentProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParentProductsRecord.fromSnapshot(s));

  static ParentProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParentProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParentProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParentProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParentProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParentProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParentProductsRecordData({
  String? name,
  DateTime? createdAt,
  bool? isDelete,
  double? averageCost,
  double? totalCost,
  double? totalQuantity,
  double? soldQuantity,
  double? totalSoldCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'createdAt': createdAt,
      'isDelete': isDelete,
      'averageCost': averageCost,
      'totalCost': totalCost,
      'totalQuantity': totalQuantity,
      'soldQuantity': soldQuantity,
      'totalSoldCost': totalSoldCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParentProductsRecordDocumentEquality
    implements Equality<ParentProductsRecord> {
  const ParentProductsRecordDocumentEquality();

  @override
  bool equals(ParentProductsRecord? e1, ParentProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.products, e2?.products) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isDelete == e2?.isDelete &&
        e1?.averageCost == e2?.averageCost &&
        e1?.totalCost == e2?.totalCost &&
        e1?.totalQuantity == e2?.totalQuantity &&
        e1?.soldQuantity == e2?.soldQuantity &&
        e1?.totalSoldCost == e2?.totalSoldCost &&
        listEquality.equals(e1?.companyIncomes, e2?.companyIncomes) &&
        listEquality.equals(e1?.companyPayments, e2?.companyPayments) &&
        listEquality.equals(e1?.workPlaceIncomes, e2?.workPlaceIncomes) &&
        listEquality.equals(e1?.workPlacePayments, e2?.workPlacePayments) &&
        listEquality.equals(e1?.bills, e2?.bills);
  }

  @override
  int hash(ParentProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.products,
        e?.createdAt,
        e?.isDelete,
        e?.averageCost,
        e?.totalCost,
        e?.totalQuantity,
        e?.soldQuantity,
        e?.totalSoldCost,
        e?.companyIncomes,
        e?.companyPayments,
        e?.workPlaceIncomes,
        e?.workPlacePayments,
        e?.bills
      ]);

  @override
  bool isValidKey(Object? o) => o is ParentProductsRecord;
}
