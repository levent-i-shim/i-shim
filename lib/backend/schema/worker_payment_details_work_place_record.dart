import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerPaymentDetailsWorkPlaceRecord extends FirestoreRecord {
  WorkerPaymentDetailsWorkPlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "dailySalary" field.
  double? _dailySalary;
  double get dailySalary => _dailySalary ?? 0.0;
  bool hasDailySalary() => _dailySalary != null;

  // "extraShiftTotal" field.
  double? _extraShiftTotal;
  double get extraShiftTotal => _extraShiftTotal ?? 0.0;
  bool hasExtraShiftTotal() => _extraShiftTotal != null;

  // "totalPaid" field.
  double? _totalPaid;
  double get totalPaid => _totalPaid ?? 0.0;
  bool hasTotalPaid() => _totalPaid != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "paymentRef" field.
  DocumentReference? _paymentRef;
  DocumentReference? get paymentRef => _paymentRef;
  bool hasPaymentRef() => _paymentRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _dailySalary = castToType<double>(snapshotData['dailySalary']);
    _extraShiftTotal = castToType<double>(snapshotData['extraShiftTotal']);
    _totalPaid = castToType<double>(snapshotData['totalPaid']);
    _date = snapshotData['date'] as DateTime?;
    _company = snapshotData['company'] as DocumentReference?;
    _paymentRef = snapshotData['paymentRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workerPaymentDetailsWorkPlace')
          : FirebaseFirestore.instance
              .collectionGroup('workerPaymentDetailsWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workerPaymentDetailsWorkPlace').doc(id);

  static Stream<WorkerPaymentDetailsWorkPlaceRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => WorkerPaymentDetailsWorkPlaceRecord.fromSnapshot(s));

  static Future<WorkerPaymentDetailsWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref
          .get()
          .then((s) => WorkerPaymentDetailsWorkPlaceRecord.fromSnapshot(s));

  static WorkerPaymentDetailsWorkPlaceRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      WorkerPaymentDetailsWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerPaymentDetailsWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerPaymentDetailsWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerPaymentDetailsWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerPaymentDetailsWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerPaymentDetailsWorkPlaceRecordData({
  DocumentReference? userRef,
  double? dailySalary,
  double? extraShiftTotal,
  double? totalPaid,
  DateTime? date,
  DocumentReference? company,
  DocumentReference? paymentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'dailySalary': dailySalary,
      'extraShiftTotal': extraShiftTotal,
      'totalPaid': totalPaid,
      'date': date,
      'company': company,
      'paymentRef': paymentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerPaymentDetailsWorkPlaceRecordDocumentEquality
    implements Equality<WorkerPaymentDetailsWorkPlaceRecord> {
  const WorkerPaymentDetailsWorkPlaceRecordDocumentEquality();

  @override
  bool equals(WorkerPaymentDetailsWorkPlaceRecord? e1,
      WorkerPaymentDetailsWorkPlaceRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.dailySalary == e2?.dailySalary &&
        e1?.extraShiftTotal == e2?.extraShiftTotal &&
        e1?.totalPaid == e2?.totalPaid &&
        e1?.date == e2?.date &&
        e1?.company == e2?.company &&
        e1?.paymentRef == e2?.paymentRef;
  }

  @override
  int hash(WorkerPaymentDetailsWorkPlaceRecord? e) =>
      const ListEquality().hash([
        e?.userRef,
        e?.dailySalary,
        e?.extraShiftTotal,
        e?.totalPaid,
        e?.date,
        e?.company,
        e?.paymentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerPaymentDetailsWorkPlaceRecord;
}
