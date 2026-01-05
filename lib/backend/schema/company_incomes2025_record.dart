import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyIncomes2025Record extends FirestoreRecord {
  CompanyIncomes2025Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "fromWhom" field.
  String? _fromWhom;
  String get fromWhom => _fromWhom ?? '';
  bool hasFromWhom() => _fromWhom != null;

  // "vkntcknor" field.
  String? _vkntcknor;
  String get vkntcknor => _vkntcknor ?? '';
  bool hasVkntcknor() => _vkntcknor != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "billRef" field.
  DocumentReference? _billRef;
  DocumentReference? get billRef => _billRef;
  bool hasBillRef() => _billRef != null;

  // "isExpected" field.
  bool? _isExpected;
  bool get isExpected => _isExpected ?? false;
  bool hasIsExpected() => _isExpected != null;

  // "expectedDate" field.
  DateTime? _expectedDate;
  DateTime? get expectedDate => _expectedDate;
  bool hasExpectedDate() => _expectedDate != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceIncome" field.
  DocumentReference? _workPlaceIncome;
  DocumentReference? get workPlaceIncome => _workPlaceIncome;
  bool hasWorkPlaceIncome() => _workPlaceIncome != null;

  // "incomePeriodTime" field.
  String? _incomePeriodTime;
  String get incomePeriodTime => _incomePeriodTime ?? '';
  bool hasIncomePeriodTime() => _incomePeriodTime != null;

  // "childProduct" field.
  DocumentReference? _childProduct;
  DocumentReference? get childProduct => _childProduct;
  bool hasChildProduct() => _childProduct != null;

  // "parentProduct" field.
  DocumentReference? _parentProduct;
  DocumentReference? get parentProduct => _parentProduct;
  bool hasParentProduct() => _parentProduct != null;

  // "calculation" field.
  DocumentReference? _calculation;
  DocumentReference? get calculation => _calculation;
  bool hasCalculation() => _calculation != null;

  // "isProductIncome" field.
  bool? _isProductIncome;
  bool get isProductIncome => _isProductIncome ?? false;
  bool hasIsProductIncome() => _isProductIncome != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _fromWhom = snapshotData['fromWhom'] as String?;
    _vkntcknor = snapshotData['vkntcknor'] as String?;
    _description = snapshotData['description'] as String?;
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _isExpected = snapshotData['isExpected'] as bool?;
    _expectedDate = snapshotData['expectedDate'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceIncome = snapshotData['workPlaceIncome'] as DocumentReference?;
    _incomePeriodTime = snapshotData['incomePeriodTime'] as String?;
    _childProduct = snapshotData['childProduct'] as DocumentReference?;
    _parentProduct = snapshotData['parentProduct'] as DocumentReference?;
    _calculation = snapshotData['calculation'] as DocumentReference?;
    _isProductIncome = snapshotData['isProductIncome'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyIncomes2025')
          : FirebaseFirestore.instance.collectionGroup('companyIncomes2025');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyIncomes2025').doc(id);

  static Stream<CompanyIncomes2025Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyIncomes2025Record.fromSnapshot(s));

  static Future<CompanyIncomes2025Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyIncomes2025Record.fromSnapshot(s));

  static CompanyIncomes2025Record fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyIncomes2025Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyIncomes2025Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyIncomes2025Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyIncomes2025Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyIncomes2025Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyIncomes2025RecordData({
  double? value,
  DateTime? date,
  String? type,
  String? fromWhom,
  String? vkntcknor,
  String? description,
  DocumentReference? billRef,
  bool? isExpected,
  DateTime? expectedDate,
  bool? isDelete,
  DocumentReference? workPlace,
  DocumentReference? workPlaceIncome,
  String? incomePeriodTime,
  DocumentReference? childProduct,
  DocumentReference? parentProduct,
  DocumentReference? calculation,
  bool? isProductIncome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'date': date,
      'type': type,
      'fromWhom': fromWhom,
      'vkntcknor': vkntcknor,
      'description': description,
      'billRef': billRef,
      'isExpected': isExpected,
      'expectedDate': expectedDate,
      'isDelete': isDelete,
      'workPlace': workPlace,
      'workPlaceIncome': workPlaceIncome,
      'incomePeriodTime': incomePeriodTime,
      'childProduct': childProduct,
      'parentProduct': parentProduct,
      'calculation': calculation,
      'isProductIncome': isProductIncome,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyIncomes2025RecordDocumentEquality
    implements Equality<CompanyIncomes2025Record> {
  const CompanyIncomes2025RecordDocumentEquality();

  @override
  bool equals(CompanyIncomes2025Record? e1, CompanyIncomes2025Record? e2) {
    return e1?.value == e2?.value &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.fromWhom == e2?.fromWhom &&
        e1?.vkntcknor == e2?.vkntcknor &&
        e1?.description == e2?.description &&
        e1?.billRef == e2?.billRef &&
        e1?.isExpected == e2?.isExpected &&
        e1?.expectedDate == e2?.expectedDate &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceIncome == e2?.workPlaceIncome &&
        e1?.incomePeriodTime == e2?.incomePeriodTime &&
        e1?.childProduct == e2?.childProduct &&
        e1?.parentProduct == e2?.parentProduct &&
        e1?.calculation == e2?.calculation &&
        e1?.isProductIncome == e2?.isProductIncome;
  }

  @override
  int hash(CompanyIncomes2025Record? e) => const ListEquality().hash([
        e?.value,
        e?.date,
        e?.type,
        e?.fromWhom,
        e?.vkntcknor,
        e?.description,
        e?.billRef,
        e?.isExpected,
        e?.expectedDate,
        e?.isDelete,
        e?.workPlace,
        e?.workPlaceIncome,
        e?.incomePeriodTime,
        e?.childProduct,
        e?.parentProduct,
        e?.calculation,
        e?.isProductIncome
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyIncomes2025Record;
}
