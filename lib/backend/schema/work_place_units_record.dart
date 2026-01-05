import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceUnitsRecord extends FirestoreRecord {
  WorkPlaceUnitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "departmentRef" field.
  DocumentReference? _departmentRef;
  DocumentReference? get departmentRef => _departmentRef;
  bool hasDepartmentRef() => _departmentRef != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "deletedBy" field.
  DocumentReference? _deletedBy;
  DocumentReference? get deletedBy => _deletedBy;
  bool hasDeletedBy() => _deletedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _departmentRef = snapshotData['departmentRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceUnits')
          : FirebaseFirestore.instance.collectionGroup('workPlaceUnits');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceUnits').doc(id);

  static Stream<WorkPlaceUnitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceUnitsRecord.fromSnapshot(s));

  static Future<WorkPlaceUnitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceUnitsRecord.fromSnapshot(s));

  static WorkPlaceUnitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceUnitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceUnitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceUnitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceUnitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceUnitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceUnitsRecordData({
  String? name,
  bool? isDelete,
  DocumentReference? departmentRef,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isDelete': isDelete,
      'departmentRef': departmentRef,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceUnitsRecordDocumentEquality
    implements Equality<WorkPlaceUnitsRecord> {
  const WorkPlaceUnitsRecordDocumentEquality();

  @override
  bool equals(WorkPlaceUnitsRecord? e1, WorkPlaceUnitsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isDelete == e2?.isDelete &&
        e1?.departmentRef == e2?.departmentRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(WorkPlaceUnitsRecord? e) => const ListEquality().hash(
      [e?.name, e?.isDelete, e?.departmentRef, e?.createdBy, e?.deletedBy]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceUnitsRecord;
}
