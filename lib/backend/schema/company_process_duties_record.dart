import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyProcessDutiesRecord extends FirestoreRecord {
  CompanyProcessDutiesRecord._(
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
          ? parent.collection('companyProcessDuties')
          : FirebaseFirestore.instance.collectionGroup('companyProcessDuties');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyProcessDuties').doc(id);

  static Stream<CompanyProcessDutiesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyProcessDutiesRecord.fromSnapshot(s));

  static Future<CompanyProcessDutiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyProcessDutiesRecord.fromSnapshot(s));

  static CompanyProcessDutiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyProcessDutiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyProcessDutiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyProcessDutiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyProcessDutiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyProcessDutiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyProcessDutiesRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyProcessDutiesRecordDocumentEquality
    implements Equality<CompanyProcessDutiesRecord> {
  const CompanyProcessDutiesRecordDocumentEquality();

  @override
  bool equals(CompanyProcessDutiesRecord? e1, CompanyProcessDutiesRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(CompanyProcessDutiesRecord? e) =>
      const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is CompanyProcessDutiesRecord;
}
