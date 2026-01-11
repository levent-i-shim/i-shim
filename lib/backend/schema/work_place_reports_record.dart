import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceReportsRecord extends FirestoreRecord {
  WorkPlaceReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "task" field.
  DocumentReference? _task;
  DocumentReference? get task => _task;
  bool hasTask() => _task != null;

  // "reportsTo" field.
  DocumentReference? _reportsTo;
  DocumentReference? get reportsTo => _reportsTo;
  bool hasReportsTo() => _reportsTo != null;

  // "responses" field.
  DocumentReference? _responses;
  DocumentReference? get responses => _responses;
  bool hasResponses() => _responses != null;

  // "duty" field.
  DocumentReference? _duty;
  DocumentReference? get duty => _duty;
  bool hasDuty() => _duty != null;

  // "isSendTransaction" field.
  bool? _isSendTransaction;
  bool get isSendTransaction => _isSendTransaction ?? false;
  bool hasIsSendTransaction() => _isSendTransaction != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "hasResponse" field.
  bool? _hasResponse;
  bool get hasResponse => _hasResponse ?? false;
  bool hasHasResponse() => _hasResponse != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "sentBy" field.
  DocumentReference? _sentBy;
  DocumentReference? get sentBy => _sentBy;
  bool hasSentBy() => _sentBy != null;

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _task = snapshotData['task'] as DocumentReference?;
    _reportsTo = snapshotData['reportsTo'] as DocumentReference?;
    _responses = snapshotData['responses'] as DocumentReference?;
    _duty = snapshotData['duty'] as DocumentReference?;
    _isSendTransaction = snapshotData['isSendTransaction'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _hasResponse = snapshotData['hasResponse'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _sentBy = snapshotData['sentBy'] as DocumentReference?;
    _taskName = snapshotData['taskName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceReports')
          : FirebaseFirestore.instance.collectionGroup('workPlaceReports');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceReports').doc(id);

  static Stream<WorkPlaceReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceReportsRecord.fromSnapshot(s));

  static Future<WorkPlaceReportsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceReportsRecord.fromSnapshot(s));

  static WorkPlaceReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceReportsRecordData({
  DocumentReference? task,
  DocumentReference? reportsTo,
  DocumentReference? responses,
  DocumentReference? duty,
  bool? isSendTransaction,
  DateTime? date,
  bool? hasResponse,
  bool? isDelete,
  DocumentReference? sentBy,
  String? taskName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'task': task,
      'reportsTo': reportsTo,
      'responses': responses,
      'duty': duty,
      'isSendTransaction': isSendTransaction,
      'date': date,
      'hasResponse': hasResponse,
      'isDelete': isDelete,
      'sentBy': sentBy,
      'taskName': taskName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceReportsRecordDocumentEquality
    implements Equality<WorkPlaceReportsRecord> {
  const WorkPlaceReportsRecordDocumentEquality();

  @override
  bool equals(WorkPlaceReportsRecord? e1, WorkPlaceReportsRecord? e2) {
    return e1?.task == e2?.task &&
        e1?.reportsTo == e2?.reportsTo &&
        e1?.responses == e2?.responses &&
        e1?.duty == e2?.duty &&
        e1?.isSendTransaction == e2?.isSendTransaction &&
        e1?.date == e2?.date &&
        e1?.hasResponse == e2?.hasResponse &&
        e1?.isDelete == e2?.isDelete &&
        e1?.sentBy == e2?.sentBy &&
        e1?.taskName == e2?.taskName;
  }

  @override
  int hash(WorkPlaceReportsRecord? e) => const ListEquality().hash([
        e?.task,
        e?.reportsTo,
        e?.responses,
        e?.duty,
        e?.isSendTransaction,
        e?.date,
        e?.hasResponse,
        e?.isDelete,
        e?.sentBy,
        e?.taskName
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceReportsRecord;
}
