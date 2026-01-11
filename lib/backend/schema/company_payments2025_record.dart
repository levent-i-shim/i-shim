import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyPayments2025Record extends FirestoreRecord {
  CompanyPayments2025Record._(
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

  // "toWhom" field.
  String? _toWhom;
  String get toWhom => _toWhom ?? '';
  bool hasToWhom() => _toWhom != null;

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

  // "vehicle" field.
  DocumentReference? _vehicle;
  DocumentReference? get vehicle => _vehicle;
  bool hasVehicle() => _vehicle != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlacePayment" field.
  DocumentReference? _workPlacePayment;
  DocumentReference? get workPlacePayment => _workPlacePayment;
  bool hasWorkPlacePayment() => _workPlacePayment != null;

  // "paymentPeriodTime" field.
  String? _paymentPeriodTime;
  String get paymentPeriodTime => _paymentPeriodTime ?? '';
  bool hasPaymentPeriodTime() => _paymentPeriodTime != null;

  // "calculation" field.
  DocumentReference? _calculation;
  DocumentReference? get calculation => _calculation;
  bool hasCalculation() => _calculation != null;

  // "parentProduct" field.
  DocumentReference? _parentProduct;
  DocumentReference? get parentProduct => _parentProduct;
  bool hasParentProduct() => _parentProduct != null;

  // "childProduct" field.
  DocumentReference? _childProduct;
  DocumentReference? get childProduct => _childProduct;
  bool hasChildProduct() => _childProduct != null;

  // "isProductPayment" field.
  bool? _isProductPayment;
  bool get isProductPayment => _isProductPayment ?? false;
  bool hasIsProductPayment() => _isProductPayment != null;

  // "isSalary" field.
  bool? _isSalary;
  bool get isSalary => _isSalary ?? false;
  bool hasIsSalary() => _isSalary != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _toWhom = snapshotData['toWhom'] as String?;
    _vkntcknor = snapshotData['vkntcknor'] as String?;
    _description = snapshotData['description'] as String?;
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _isExpected = snapshotData['isExpected'] as bool?;
    _expectedDate = snapshotData['expectedDate'] as DateTime?;
    _vehicle = snapshotData['vehicle'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlacePayment = snapshotData['workPlacePayment'] as DocumentReference?;
    _paymentPeriodTime = snapshotData['paymentPeriodTime'] as String?;
    _calculation = snapshotData['calculation'] as DocumentReference?;
    _parentProduct = snapshotData['parentProduct'] as DocumentReference?;
    _childProduct = snapshotData['childProduct'] as DocumentReference?;
    _isProductPayment = snapshotData['isProductPayment'] as bool?;
    _isSalary = snapshotData['isSalary'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyPayments2025')
          : FirebaseFirestore.instance.collectionGroup('companyPayments2025');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyPayments2025').doc(id);

  static Stream<CompanyPayments2025Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyPayments2025Record.fromSnapshot(s));

  static Future<CompanyPayments2025Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyPayments2025Record.fromSnapshot(s));

  static CompanyPayments2025Record fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyPayments2025Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyPayments2025Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyPayments2025Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyPayments2025Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyPayments2025Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyPayments2025RecordData({
  double? value,
  DateTime? date,
  String? type,
  String? toWhom,
  String? vkntcknor,
  String? description,
  DocumentReference? billRef,
  bool? isExpected,
  DateTime? expectedDate,
  DocumentReference? vehicle,
  bool? isDelete,
  DocumentReference? workPlace,
  DocumentReference? workPlacePayment,
  String? paymentPeriodTime,
  DocumentReference? calculation,
  DocumentReference? parentProduct,
  DocumentReference? childProduct,
  bool? isProductPayment,
  bool? isSalary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'date': date,
      'type': type,
      'toWhom': toWhom,
      'vkntcknor': vkntcknor,
      'description': description,
      'billRef': billRef,
      'isExpected': isExpected,
      'expectedDate': expectedDate,
      'vehicle': vehicle,
      'isDelete': isDelete,
      'workPlace': workPlace,
      'workPlacePayment': workPlacePayment,
      'paymentPeriodTime': paymentPeriodTime,
      'calculation': calculation,
      'parentProduct': parentProduct,
      'childProduct': childProduct,
      'isProductPayment': isProductPayment,
      'isSalary': isSalary,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyPayments2025RecordDocumentEquality
    implements Equality<CompanyPayments2025Record> {
  const CompanyPayments2025RecordDocumentEquality();

  @override
  bool equals(CompanyPayments2025Record? e1, CompanyPayments2025Record? e2) {
    return e1?.value == e2?.value &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.toWhom == e2?.toWhom &&
        e1?.vkntcknor == e2?.vkntcknor &&
        e1?.description == e2?.description &&
        e1?.billRef == e2?.billRef &&
        e1?.isExpected == e2?.isExpected &&
        e1?.expectedDate == e2?.expectedDate &&
        e1?.vehicle == e2?.vehicle &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlacePayment == e2?.workPlacePayment &&
        e1?.paymentPeriodTime == e2?.paymentPeriodTime &&
        e1?.calculation == e2?.calculation &&
        e1?.parentProduct == e2?.parentProduct &&
        e1?.childProduct == e2?.childProduct &&
        e1?.isProductPayment == e2?.isProductPayment &&
        e1?.isSalary == e2?.isSalary;
  }

  @override
  int hash(CompanyPayments2025Record? e) => const ListEquality().hash([
        e?.value,
        e?.date,
        e?.type,
        e?.toWhom,
        e?.vkntcknor,
        e?.description,
        e?.billRef,
        e?.isExpected,
        e?.expectedDate,
        e?.vehicle,
        e?.isDelete,
        e?.workPlace,
        e?.workPlacePayment,
        e?.paymentPeriodTime,
        e?.calculation,
        e?.parentProduct,
        e?.childProduct,
        e?.isProductPayment,
        e?.isSalary
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyPayments2025Record;
}
