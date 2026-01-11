import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyUnitsRecord extends FirestoreRecord {
  CompanyUnitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "departmenRef" field.
  DocumentReference? _departmenRef;
  DocumentReference? get departmenRef => _departmenRef;
  bool hasDepartmenRef() => _departmenRef != null;

  // "workplaceRef" field.
  DocumentReference? _workplaceRef;
  DocumentReference? get workplaceRef => _workplaceRef;
  bool hasWorkplaceRef() => _workplaceRef != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlaceUnitRef" field.
  DocumentReference? _workPlaceUnitRef;
  DocumentReference? get workPlaceUnitRef => _workPlaceUnitRef;
  bool hasWorkPlaceUnitRef() => _workPlaceUnitRef != null;

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
    _departmenRef = snapshotData['departmenRef'] as DocumentReference?;
    _workplaceRef = snapshotData['workplaceRef'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlaceUnitRef = snapshotData['workPlaceUnitRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _deletedBy = snapshotData['deletedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyUnits')
          : FirebaseFirestore.instance.collectionGroup('companyUnits');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyUnits').doc(id);

  static Stream<CompanyUnitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyUnitsRecord.fromSnapshot(s));

  static Future<CompanyUnitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyUnitsRecord.fromSnapshot(s));

  static CompanyUnitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyUnitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyUnitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyUnitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyUnitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyUnitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyUnitsRecordData({
  String? name,
  DocumentReference? departmenRef,
  DocumentReference? workplaceRef,
  bool? isDelete,
  DocumentReference? workPlaceUnitRef,
  DocumentReference? createdBy,
  DocumentReference? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'departmenRef': departmenRef,
      'workplaceRef': workplaceRef,
      'isDelete': isDelete,
      'workPlaceUnitRef': workPlaceUnitRef,
      'createdBy': createdBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyUnitsRecordDocumentEquality
    implements Equality<CompanyUnitsRecord> {
  const CompanyUnitsRecordDocumentEquality();

  @override
  bool equals(CompanyUnitsRecord? e1, CompanyUnitsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.departmenRef == e2?.departmenRef &&
        e1?.workplaceRef == e2?.workplaceRef &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlaceUnitRef == e2?.workPlaceUnitRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(CompanyUnitsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.departmenRef,
        e?.workplaceRef,
        e?.isDelete,
        e?.workPlaceUnitRef,
        e?.createdBy,
        e?.deletedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyUnitsRecord;
}
