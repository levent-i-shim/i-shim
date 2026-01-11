import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkHistoryRecord extends FirestoreRecord {
  WorkHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "reportCount" field.
  int? _reportCount;
  int get reportCount => _reportCount ?? 0;
  bool hasReportCount() => _reportCount != null;

  // "instructionCount" field.
  int? _instructionCount;
  int get instructionCount => _instructionCount ?? 0;
  bool hasInstructionCount() => _instructionCount != null;

  // "receivedTaskCount" field.
  int? _receivedTaskCount;
  int get receivedTaskCount => _receivedTaskCount ?? 0;
  bool hasReceivedTaskCount() => _receivedTaskCount != null;

  // "assignedTaskCount" field.
  int? _assignedTaskCount;
  int get assignedTaskCount => _assignedTaskCount ?? 0;
  bool hasAssignedTaskCount() => _assignedTaskCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _role = snapshotData['role'] as String?;
    _city = snapshotData['city'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _company = snapshotData['company'] as DocumentReference?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _unit = snapshotData['unit'] as String?;
    _department = snapshotData['department'] as String?;
    _reportCount = castToType<int>(snapshotData['reportCount']);
    _instructionCount = castToType<int>(snapshotData['instructionCount']);
    _receivedTaskCount = castToType<int>(snapshotData['receivedTaskCount']);
    _assignedTaskCount = castToType<int>(snapshotData['assignedTaskCount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workHistory')
          : FirebaseFirestore.instance.collectionGroup('workHistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workHistory').doc(id);

  static Stream<WorkHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkHistoryRecord.fromSnapshot(s));

  static Future<WorkHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkHistoryRecord.fromSnapshot(s));

  static WorkHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkHistoryRecordData({
  String? role,
  String? city,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? company,
  DocumentReference? workPlace,
  String? unit,
  String? department,
  int? reportCount,
  int? instructionCount,
  int? receivedTaskCount,
  int? assignedTaskCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'city': city,
      'startDate': startDate,
      'endDate': endDate,
      'company': company,
      'workPlace': workPlace,
      'unit': unit,
      'department': department,
      'reportCount': reportCount,
      'instructionCount': instructionCount,
      'receivedTaskCount': receivedTaskCount,
      'assignedTaskCount': assignedTaskCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkHistoryRecordDocumentEquality implements Equality<WorkHistoryRecord> {
  const WorkHistoryRecordDocumentEquality();

  @override
  bool equals(WorkHistoryRecord? e1, WorkHistoryRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.city == e2?.city &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.company == e2?.company &&
        e1?.workPlace == e2?.workPlace &&
        e1?.unit == e2?.unit &&
        e1?.department == e2?.department &&
        e1?.reportCount == e2?.reportCount &&
        e1?.instructionCount == e2?.instructionCount &&
        e1?.receivedTaskCount == e2?.receivedTaskCount &&
        e1?.assignedTaskCount == e2?.assignedTaskCount;
  }

  @override
  int hash(WorkHistoryRecord? e) => const ListEquality().hash([
        e?.role,
        e?.city,
        e?.startDate,
        e?.endDate,
        e?.company,
        e?.workPlace,
        e?.unit,
        e?.department,
        e?.reportCount,
        e?.instructionCount,
        e?.receivedTaskCount,
        e?.assignedTaskCount
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkHistoryRecord;
}
