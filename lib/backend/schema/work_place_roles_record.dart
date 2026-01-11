import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceRolesRecord extends FirestoreRecord {
  WorkPlaceRolesRecord._(
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
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceRoles')
          : FirebaseFirestore.instance.collectionGroup('workPlaceRoles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceRoles').doc(id);

  static Stream<WorkPlaceRolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceRolesRecord.fromSnapshot(s));

  static Future<WorkPlaceRolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceRolesRecord.fromSnapshot(s));

  static WorkPlaceRolesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceRolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceRolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceRolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceRolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceRolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceRolesRecordData({
  String? name,
  bool? isDelete,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isDelete': isDelete,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceRolesRecordDocumentEquality
    implements Equality<WorkPlaceRolesRecord> {
  const WorkPlaceRolesRecordDocumentEquality();

  @override
  bool equals(WorkPlaceRolesRecord? e1, WorkPlaceRolesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isDelete == e2?.isDelete &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(WorkPlaceRolesRecord? e) => const ListEquality()
      .hash([e?.name, e?.isDelete, e?.createdBy, e?.deletedBy]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceRolesRecord;
}
