import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "averageCost" field.
  double? _averageCost;
  double get averageCost => _averageCost ?? 0.0;
  bool hasAverageCost() => _averageCost != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "counter" field.
  int? _counter;
  int get counter => _counter ?? 0;
  bool hasCounter() => _counter != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "totalProduct" field.
  double? _totalProduct;
  double get totalProduct => _totalProduct ?? 0.0;
  bool hasTotalProduct() => _totalProduct != null;

  // "totalCost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

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

  // "parentProduct" field.
  DocumentReference? _parentProduct;
  DocumentReference? get parentProduct => _parentProduct;
  bool hasParentProduct() => _parentProduct != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _company = snapshotData['company'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _averageCost = castToType<double>(snapshotData['averageCost']);
    _date = snapshotData['date'] as DateTime?;
    _counter = castToType<int>(snapshotData['counter']);
    _unit = snapshotData['unit'] as String?;
    _totalProduct = castToType<double>(snapshotData['totalProduct']);
    _totalCost = castToType<double>(snapshotData['totalCost']);
    _soldQuantity = castToType<double>(snapshotData['soldQuantity']);
    _totalSoldCost = castToType<double>(snapshotData['totalSoldCost']);
    _companyIncomes = getDataList(snapshotData['companyIncomes']);
    _companyPayments = getDataList(snapshotData['companyPayments']);
    _workPlaceIncomes = getDataList(snapshotData['workPlaceIncomes']);
    _workPlacePayments = getDataList(snapshotData['workPlacePayments']);
    _bills = getDataList(snapshotData['bills']);
    _parentProduct = snapshotData['parentProduct'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  DocumentReference? company,
  bool? isDelete,
  double? averageCost,
  DateTime? date,
  int? counter,
  String? unit,
  double? totalProduct,
  double? totalCost,
  double? soldQuantity,
  double? totalSoldCost,
  DocumentReference? parentProduct,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'company': company,
      'isDelete': isDelete,
      'averageCost': averageCost,
      'date': date,
      'counter': counter,
      'unit': unit,
      'totalProduct': totalProduct,
      'totalCost': totalCost,
      'soldQuantity': soldQuantity,
      'totalSoldCost': totalSoldCost,
      'parentProduct': parentProduct,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.company == e2?.company &&
        e1?.isDelete == e2?.isDelete &&
        e1?.averageCost == e2?.averageCost &&
        e1?.date == e2?.date &&
        e1?.counter == e2?.counter &&
        e1?.unit == e2?.unit &&
        e1?.totalProduct == e2?.totalProduct &&
        e1?.totalCost == e2?.totalCost &&
        e1?.soldQuantity == e2?.soldQuantity &&
        e1?.totalSoldCost == e2?.totalSoldCost &&
        listEquality.equals(e1?.companyIncomes, e2?.companyIncomes) &&
        listEquality.equals(e1?.companyPayments, e2?.companyPayments) &&
        listEquality.equals(e1?.workPlaceIncomes, e2?.workPlaceIncomes) &&
        listEquality.equals(e1?.workPlacePayments, e2?.workPlacePayments) &&
        listEquality.equals(e1?.bills, e2?.bills) &&
        e1?.parentProduct == e2?.parentProduct;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.company,
        e?.isDelete,
        e?.averageCost,
        e?.date,
        e?.counter,
        e?.unit,
        e?.totalProduct,
        e?.totalCost,
        e?.soldQuantity,
        e?.totalSoldCost,
        e?.companyIncomes,
        e?.companyPayments,
        e?.workPlaceIncomes,
        e?.workPlacePayments,
        e?.bills,
        e?.parentProduct
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
