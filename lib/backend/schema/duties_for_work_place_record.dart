import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DutiesForWorkPlaceRecord extends FirestoreRecord {
  DutiesForWorkPlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlaceTaskDuties" field.
  DocumentReference? _workPlaceTaskDuties;
  DocumentReference? get workPlaceTaskDuties => _workPlaceTaskDuties;
  bool hasWorkPlaceTaskDuties() => _workPlaceTaskDuties != null;

  // "visibleTo" field.
  List<DocumentReference>? _visibleTo;
  List<DocumentReference> get visibleTo => _visibleTo ?? const [];
  bool hasVisibleTo() => _visibleTo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _taskName = snapshotData['taskName'] as String?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlaceTaskDuties =
        snapshotData['workPlaceTaskDuties'] as DocumentReference?;
    _visibleTo = getDataList(snapshotData['visibleTo']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dutiesForWorkPlace')
          : FirebaseFirestore.instance.collectionGroup('dutiesForWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dutiesForWorkPlace').doc(id);

  static Stream<DutiesForWorkPlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DutiesForWorkPlaceRecord.fromSnapshot(s));

  static Future<DutiesForWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DutiesForWorkPlaceRecord.fromSnapshot(s));

  static DutiesForWorkPlaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DutiesForWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DutiesForWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DutiesForWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DutiesForWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DutiesForWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDutiesForWorkPlaceRecordData({
  String? type,
  DocumentReference? userRef,
  DocumentReference? createdUserRef,
  String? taskName,
  bool? isComplete,
  bool? isDelete,
  DocumentReference? workPlaceTaskDuties,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'userRef': userRef,
      'createdUserRef': createdUserRef,
      'taskName': taskName,
      'isComplete': isComplete,
      'isDelete': isDelete,
      'workPlaceTaskDuties': workPlaceTaskDuties,
    }.withoutNulls,
  );

  return firestoreData;
}

class DutiesForWorkPlaceRecordDocumentEquality
    implements Equality<DutiesForWorkPlaceRecord> {
  const DutiesForWorkPlaceRecordDocumentEquality();

  @override
  bool equals(DutiesForWorkPlaceRecord? e1, DutiesForWorkPlaceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.userRef == e2?.userRef &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.taskName == e2?.taskName &&
        e1?.isComplete == e2?.isComplete &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlaceTaskDuties == e2?.workPlaceTaskDuties &&
        listEquality.equals(e1?.visibleTo, e2?.visibleTo);
  }

  @override
  int hash(DutiesForWorkPlaceRecord? e) => const ListEquality().hash([
        e?.type,
        e?.userRef,
        e?.createdUserRef,
        e?.taskName,
        e?.isComplete,
        e?.isDelete,
        e?.workPlaceTaskDuties,
        e?.visibleTo
      ]);

  @override
  bool isValidKey(Object? o) => o is DutiesForWorkPlaceRecord;
}
