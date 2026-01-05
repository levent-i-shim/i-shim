import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyProjectsRecord extends FirestoreRecord {
  CompanyProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyProjects')
          : FirebaseFirestore.instance.collectionGroup('companyProjects');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyProjects').doc(id);

  static Stream<CompanyProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyProjectsRecord.fromSnapshot(s));

  static Future<CompanyProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyProjectsRecord.fromSnapshot(s));

  static CompanyProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyProjectsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyProjectsRecordDocumentEquality
    implements Equality<CompanyProjectsRecord> {
  const CompanyProjectsRecordDocumentEquality();

  @override
  bool equals(CompanyProjectsRecord? e1, CompanyProjectsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(CompanyProjectsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is CompanyProjectsRecord;
}
