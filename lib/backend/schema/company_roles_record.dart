import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyRolesRecord extends FirestoreRecord {
  CompanyRolesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "assignedUsers" field.
  List<DocumentReference>? _assignedUsers;
  List<DocumentReference> get assignedUsers => _assignedUsers ?? const [];
  bool hasAssignedUsers() => _assignedUsers != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "WorkPlaceRoleRef" field.
  DocumentReference? _workPlaceRoleRef;
  DocumentReference? get workPlaceRoleRef => _workPlaceRoleRef;
  bool hasWorkPlaceRoleRef() => _workPlaceRoleRef != null;

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
    _assignedUsers = getDataList(snapshotData['assignedUsers']);
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceRoleRef = snapshotData['WorkPlaceRoleRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyRoles')
          : FirebaseFirestore.instance.collectionGroup('companyRoles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyRoles').doc(id);

  static Stream<CompanyRolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyRolesRecord.fromSnapshot(s));

  static Future<CompanyRolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyRolesRecord.fromSnapshot(s));

  static CompanyRolesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyRolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyRolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyRolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyRolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyRolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyRolesRecordData({
  String? name,
  bool? isDelete,
  DocumentReference? workPlaceRef,
  DocumentReference? workPlaceRoleRef,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isDelete': isDelete,
      'workPlaceRef': workPlaceRef,
      'WorkPlaceRoleRef': workPlaceRoleRef,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyRolesRecordDocumentEquality
    implements Equality<CompanyRolesRecord> {
  const CompanyRolesRecordDocumentEquality();

  @override
  bool equals(CompanyRolesRecord? e1, CompanyRolesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.assignedUsers, e2?.assignedUsers) &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceRoleRef == e2?.workPlaceRoleRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(CompanyRolesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.assignedUsers,
        e?.isDelete,
        e?.workPlaceRef,
        e?.workPlaceRoleRef,
        e?.createdBy,
        e?.deletedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyRolesRecord;
}
