import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalculationsRecord extends FirestoreRecord {
  CalculationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "parameters" field.
  List<ProductCostDataTypeStruct>? _parameters;
  List<ProductCostDataTypeStruct> get parameters => _parameters ?? const [];
  bool hasParameters() => _parameters != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "productQuantity" field.
  double? _productQuantity;
  double get productQuantity => _productQuantity ?? 0.0;
  bool hasProductQuantity() => _productQuantity != null;

  // "companyPaymentRef" field.
  DocumentReference? _companyPaymentRef;
  DocumentReference? get companyPaymentRef => _companyPaymentRef;
  bool hasCompanyPaymentRef() => _companyPaymentRef != null;

  // "workPlacePaymentRef" field.
  DocumentReference? _workPlacePaymentRef;
  DocumentReference? get workPlacePaymentRef => _workPlacePaymentRef;
  bool hasWorkPlacePaymentRef() => _workPlacePaymentRef != null;

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

  // "bills" field.
  List<DocumentReference>? _bills;
  List<DocumentReference> get bills => _bills ?? const [];
  bool hasBills() => _bills != null;

  // "workPlaceIncomes" field.
  List<DocumentReference>? _workPlaceIncomes;
  List<DocumentReference> get workPlaceIncomes => _workPlaceIncomes ?? const [];
  bool hasWorkPlaceIncomes() => _workPlaceIncomes != null;

  // "parentProduct" field.
  DocumentReference? _parentProduct;
  DocumentReference? get parentProduct => _parentProduct;
  bool hasParentProduct() => _parentProduct != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _parameters = getStructList(
      snapshotData['parameters'],
      ProductCostDataTypeStruct.fromMap,
    );
    _cost = castToType<double>(snapshotData['cost']);
    _productQuantity = castToType<double>(snapshotData['productQuantity']);
    _companyPaymentRef =
        snapshotData['companyPaymentRef'] as DocumentReference?;
    _workPlacePaymentRef =
        snapshotData['workPlacePaymentRef'] as DocumentReference?;
    _soldQuantity = castToType<double>(snapshotData['soldQuantity']);
    _totalSoldCost = castToType<double>(snapshotData['totalSoldCost']);
    _companyIncomes = getDataList(snapshotData['companyIncomes']);
    _bills = getDataList(snapshotData['bills']);
    _workPlaceIncomes = getDataList(snapshotData['workPlaceIncomes']);
    _parentProduct = snapshotData['parentProduct'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('calculations')
          : FirebaseFirestore.instance.collectionGroup('calculations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('calculations').doc(id);

  static Stream<CalculationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalculationsRecord.fromSnapshot(s));

  static Future<CalculationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalculationsRecord.fromSnapshot(s));

  static CalculationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalculationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalculationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalculationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalculationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalculationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalculationsRecordData({
  DateTime? date,
  bool? isDelete,
  double? cost,
  double? productQuantity,
  DocumentReference? companyPaymentRef,
  DocumentReference? workPlacePaymentRef,
  double? soldQuantity,
  double? totalSoldCost,
  DocumentReference? parentProduct,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'isDelete': isDelete,
      'cost': cost,
      'productQuantity': productQuantity,
      'companyPaymentRef': companyPaymentRef,
      'workPlacePaymentRef': workPlacePaymentRef,
      'soldQuantity': soldQuantity,
      'totalSoldCost': totalSoldCost,
      'parentProduct': parentProduct,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalculationsRecordDocumentEquality
    implements Equality<CalculationsRecord> {
  const CalculationsRecordDocumentEquality();

  @override
  bool equals(CalculationsRecord? e1, CalculationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.isDelete == e2?.isDelete &&
        listEquality.equals(e1?.parameters, e2?.parameters) &&
        e1?.cost == e2?.cost &&
        e1?.productQuantity == e2?.productQuantity &&
        e1?.companyPaymentRef == e2?.companyPaymentRef &&
        e1?.workPlacePaymentRef == e2?.workPlacePaymentRef &&
        e1?.soldQuantity == e2?.soldQuantity &&
        e1?.totalSoldCost == e2?.totalSoldCost &&
        listEquality.equals(e1?.companyIncomes, e2?.companyIncomes) &&
        listEquality.equals(e1?.bills, e2?.bills) &&
        listEquality.equals(e1?.workPlaceIncomes, e2?.workPlaceIncomes) &&
        e1?.parentProduct == e2?.parentProduct;
  }

  @override
  int hash(CalculationsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.isDelete,
        e?.parameters,
        e?.cost,
        e?.productQuantity,
        e?.companyPaymentRef,
        e?.workPlacePaymentRef,
        e?.soldQuantity,
        e?.totalSoldCost,
        e?.companyIncomes,
        e?.bills,
        e?.workPlaceIncomes,
        e?.parentProduct
      ]);

  @override
  bool isValidKey(Object? o) => o is CalculationsRecord;
}
