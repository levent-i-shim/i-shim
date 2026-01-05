import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerPaymentDetailsRecord extends FirestoreRecord {
  WorkerPaymentDetailsRecord._(
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

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

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
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _paymentRef = snapshotData['paymentRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workerPaymentDetails')
          : FirebaseFirestore.instance.collectionGroup('workerPaymentDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workerPaymentDetails').doc(id);

  static Stream<WorkerPaymentDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerPaymentDetailsRecord.fromSnapshot(s));

  static Future<WorkerPaymentDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkerPaymentDetailsRecord.fromSnapshot(s));

  static WorkerPaymentDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerPaymentDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerPaymentDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerPaymentDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerPaymentDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerPaymentDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerPaymentDetailsRecordData({
  DocumentReference? userRef,
  double? dailySalary,
  double? extraShiftTotal,
  double? totalPaid,
  DateTime? date,
  DocumentReference? workPlace,
  DocumentReference? paymentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'dailySalary': dailySalary,
      'extraShiftTotal': extraShiftTotal,
      'totalPaid': totalPaid,
      'date': date,
      'workPlace': workPlace,
      'paymentRef': paymentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerPaymentDetailsRecordDocumentEquality
    implements Equality<WorkerPaymentDetailsRecord> {
  const WorkerPaymentDetailsRecordDocumentEquality();

  @override
  bool equals(WorkerPaymentDetailsRecord? e1, WorkerPaymentDetailsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.dailySalary == e2?.dailySalary &&
        e1?.extraShiftTotal == e2?.extraShiftTotal &&
        e1?.totalPaid == e2?.totalPaid &&
        e1?.date == e2?.date &&
        e1?.workPlace == e2?.workPlace &&
        e1?.paymentRef == e2?.paymentRef;
  }

  @override
  int hash(WorkerPaymentDetailsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.dailySalary,
        e?.extraShiftTotal,
        e?.totalPaid,
        e?.date,
        e?.workPlace,
        e?.paymentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerPaymentDetailsRecord;
}
