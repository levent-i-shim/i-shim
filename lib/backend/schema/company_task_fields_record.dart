import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyTaskFieldsRecord extends FirestoreRecord {
  CompanyTaskFieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fieldName" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  bool hasFieldName() => _fieldName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fieldName = snapshotData['fieldName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyTaskFields')
          : FirebaseFirestore.instance.collectionGroup('companyTaskFields');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyTaskFields').doc(id);

  static Stream<CompanyTaskFieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyTaskFieldsRecord.fromSnapshot(s));

  static Future<CompanyTaskFieldsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyTaskFieldsRecord.fromSnapshot(s));

  static CompanyTaskFieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyTaskFieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyTaskFieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyTaskFieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyTaskFieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyTaskFieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyTaskFieldsRecordData({
  String? fieldName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fieldName': fieldName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyTaskFieldsRecordDocumentEquality
    implements Equality<CompanyTaskFieldsRecord> {
  const CompanyTaskFieldsRecordDocumentEquality();

  @override
  bool equals(CompanyTaskFieldsRecord? e1, CompanyTaskFieldsRecord? e2) {
    return e1?.fieldName == e2?.fieldName;
  }

  @override
  int hash(CompanyTaskFieldsRecord? e) =>
      const ListEquality().hash([e?.fieldName]);

  @override
  bool isValidKey(Object? o) => o is CompanyTaskFieldsRecord;
}
