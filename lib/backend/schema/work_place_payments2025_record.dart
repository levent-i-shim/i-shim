import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlacePayments2025Record extends FirestoreRecord {
  WorkPlacePayments2025Record._(
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

  // "paymentPeriodTime" field.
  String? _paymentPeriodTime;
  String get paymentPeriodTime => _paymentPeriodTime ?? '';
  bool hasPaymentPeriodTime() => _paymentPeriodTime != null;

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
    _paymentPeriodTime = snapshotData['paymentPeriodTime'] as String?;
    _isSalary = snapshotData['isSalary'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlacePayments2025')
          : FirebaseFirestore.instance.collectionGroup('workPlacePayments2025');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlacePayments2025').doc(id);

  static Stream<WorkPlacePayments2025Record> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlacePayments2025Record.fromSnapshot(s));

  static Future<WorkPlacePayments2025Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlacePayments2025Record.fromSnapshot(s));

  static WorkPlacePayments2025Record fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlacePayments2025Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlacePayments2025Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlacePayments2025Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlacePayments2025Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlacePayments2025Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlacePayments2025RecordData({
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
  String? paymentPeriodTime,
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
      'paymentPeriodTime': paymentPeriodTime,
      'isSalary': isSalary,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlacePayments2025RecordDocumentEquality
    implements Equality<WorkPlacePayments2025Record> {
  const WorkPlacePayments2025RecordDocumentEquality();

  @override
  bool equals(
      WorkPlacePayments2025Record? e1, WorkPlacePayments2025Record? e2) {
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
        e1?.paymentPeriodTime == e2?.paymentPeriodTime &&
        e1?.isSalary == e2?.isSalary;
  }

  @override
  int hash(WorkPlacePayments2025Record? e) => const ListEquality().hash([
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
        e?.paymentPeriodTime,
        e?.isSalary
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlacePayments2025Record;
}
