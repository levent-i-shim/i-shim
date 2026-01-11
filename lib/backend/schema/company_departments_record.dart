import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDepartmentsRecord extends FirestoreRecord {
  CompanyDepartmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "authorized" field.
  DocumentReference? _authorized;
  DocumentReference? get authorized => _authorized;
  bool hasAuthorized() => _authorized != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceDepartment" field.
  DocumentReference? _workPlaceDepartment;
  DocumentReference? get workPlaceDepartment => _workPlaceDepartment;
  bool hasWorkPlaceDepartment() => _workPlaceDepartment != null;

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
    _type = snapshotData['type'] as String?;
    _authorized = snapshotData['authorized'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceDepartment =
        snapshotData['workPlaceDepartment'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyDepartments')
          : FirebaseFirestore.instance.collectionGroup('companyDepartments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyDepartments').doc(id);

  static Stream<CompanyDepartmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyDepartmentsRecord.fromSnapshot(s));

  static Future<CompanyDepartmentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyDepartmentsRecord.fromSnapshot(s));

  static CompanyDepartmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyDepartmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyDepartmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyDepartmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyDepartmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyDepartmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyDepartmentsRecordData({
  String? name,
  String? type,
  DocumentReference? authorized,
  bool? isDelete,
  DocumentReference? workPlace,
  DocumentReference? workPlaceDepartment,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'authorized': authorized,
      'isDelete': isDelete,
      'workPlace': workPlace,
      'workPlaceDepartment': workPlaceDepartment,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyDepartmentsRecordDocumentEquality
    implements Equality<CompanyDepartmentsRecord> {
  const CompanyDepartmentsRecordDocumentEquality();

  @override
  bool equals(CompanyDepartmentsRecord? e1, CompanyDepartmentsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.authorized == e2?.authorized &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceDepartment == e2?.workPlaceDepartment &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(CompanyDepartmentsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.authorized,
        e?.isDelete,
        e?.workPlace,
        e?.workPlaceDepartment,
        e?.createdBy,
        e?.deletedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyDepartmentsRecord;
}
