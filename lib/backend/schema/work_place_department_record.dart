import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceDepartmentRecord extends FirestoreRecord {
  WorkPlaceDepartmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "authorizedBy" field.
  DocumentReference? _authorizedBy;
  DocumentReference? get authorizedBy => _authorizedBy;
  bool hasAuthorizedBy() => _authorizedBy != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

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
    _authorizedBy = snapshotData['authorizedBy'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _type = snapshotData['type'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceDepartment')
          : FirebaseFirestore.instance.collectionGroup('workPlaceDepartment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceDepartment').doc(id);

  static Stream<WorkPlaceDepartmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceDepartmentRecord.fromSnapshot(s));

  static Future<WorkPlaceDepartmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceDepartmentRecord.fromSnapshot(s));

  static WorkPlaceDepartmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceDepartmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceDepartmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceDepartmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceDepartmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceDepartmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceDepartmentRecordData({
  String? name,
  DocumentReference? authorizedBy,
  bool? isDelete,
  String? type,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'authorizedBy': authorizedBy,
      'isDelete': isDelete,
      'type': type,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceDepartmentRecordDocumentEquality
    implements Equality<WorkPlaceDepartmentRecord> {
  const WorkPlaceDepartmentRecordDocumentEquality();

  @override
  bool equals(WorkPlaceDepartmentRecord? e1, WorkPlaceDepartmentRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.authorizedBy == e2?.authorizedBy &&
        e1?.isDelete == e2?.isDelete &&
        e1?.type == e2?.type &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(WorkPlaceDepartmentRecord? e) => const ListEquality().hash([
        e?.name,
        e?.authorizedBy,
        e?.isDelete,
        e?.type,
        e?.createdBy,
        e?.deletedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceDepartmentRecord;
}
