import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerShiftsRecord extends FirestoreRecord {
  WorkerShiftsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "hour" field.
  double? _hour;
  double get hour => _hour ?? 0.0;
  bool hasHour() => _hour != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "totalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isProcessed" field.
  bool? _isProcessed;
  bool get isProcessed => _isProcessed ?? false;
  bool hasIsProcessed() => _isProcessed != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _hour = castToType<double>(snapshotData['hour']);
    _isAccept = snapshotData['isAccept'] as bool?;
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _isProcessed = snapshotData['isProcessed'] as bool?;
    _note = snapshotData['note'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workerShifts')
          : FirebaseFirestore.instance.collectionGroup('workerShifts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workerShifts').doc(id);

  static Stream<WorkerShiftsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerShiftsRecord.fromSnapshot(s));

  static Future<WorkerShiftsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerShiftsRecord.fromSnapshot(s));

  static WorkerShiftsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkerShiftsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerShiftsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerShiftsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerShiftsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerShiftsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerShiftsRecordData({
  DocumentReference? userRef,
  double? hour,
  bool? isAccept,
  double? totalValue,
  DocumentReference? workPlace,
  DateTime? date,
  bool? isProcessed,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'hour': hour,
      'isAccept': isAccept,
      'totalValue': totalValue,
      'workPlace': workPlace,
      'date': date,
      'isProcessed': isProcessed,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerShiftsRecordDocumentEquality
    implements Equality<WorkerShiftsRecord> {
  const WorkerShiftsRecordDocumentEquality();

  @override
  bool equals(WorkerShiftsRecord? e1, WorkerShiftsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.hour == e2?.hour &&
        e1?.isAccept == e2?.isAccept &&
        e1?.totalValue == e2?.totalValue &&
        e1?.workPlace == e2?.workPlace &&
        e1?.date == e2?.date &&
        e1?.isProcessed == e2?.isProcessed &&
        e1?.note == e2?.note;
  }

  @override
  int hash(WorkerShiftsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.hour,
        e?.isAccept,
        e?.totalValue,
        e?.workPlace,
        e?.date,
        e?.isProcessed,
        e?.note
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerShiftsRecord;
}
