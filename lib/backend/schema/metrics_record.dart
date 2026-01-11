import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetricsRecord extends FirestoreRecord {
  MetricsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numberOfUsers" field.
  int? _numberOfUsers;
  int get numberOfUsers => _numberOfUsers ?? 0;
  bool hasNumberOfUsers() => _numberOfUsers != null;

  // "numberOfCompanies" field.
  int? _numberOfCompanies;
  int get numberOfCompanies => _numberOfCompanies ?? 0;
  bool hasNumberOfCompanies() => _numberOfCompanies != null;

  // "numberOfWorkPlaces" field.
  int? _numberOfWorkPlaces;
  int get numberOfWorkPlaces => _numberOfWorkPlaces ?? 0;
  bool hasNumberOfWorkPlaces() => _numberOfWorkPlaces != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "documentId" field.
  String? _documentId;
  String get documentId => _documentId ?? '';
  bool hasDocumentId() => _documentId != null;

  // "documentRef" field.
  DocumentReference? _documentRef;
  DocumentReference? get documentRef => _documentRef;
  bool hasDocumentRef() => _documentRef != null;

  void _initializeFields() {
    _numberOfUsers = castToType<int>(snapshotData['numberOfUsers']);
    _numberOfCompanies = castToType<int>(snapshotData['numberOfCompanies']);
    _numberOfWorkPlaces = castToType<int>(snapshotData['numberOfWorkPlaces']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _documentId = snapshotData['documentId'] as String?;
    _documentRef = snapshotData['documentRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('metrics');

  static Stream<MetricsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MetricsRecord.fromSnapshot(s));

  static Future<MetricsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MetricsRecord.fromSnapshot(s));

  static MetricsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MetricsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MetricsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MetricsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MetricsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MetricsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMetricsRecordData({
  int? numberOfUsers,
  int? numberOfCompanies,
  int? numberOfWorkPlaces,
  DocumentReference? creator,
  String? documentId,
  DocumentReference? documentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numberOfUsers': numberOfUsers,
      'numberOfCompanies': numberOfCompanies,
      'numberOfWorkPlaces': numberOfWorkPlaces,
      'creator': creator,
      'documentId': documentId,
      'documentRef': documentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MetricsRecordDocumentEquality implements Equality<MetricsRecord> {
  const MetricsRecordDocumentEquality();

  @override
  bool equals(MetricsRecord? e1, MetricsRecord? e2) {
    return e1?.numberOfUsers == e2?.numberOfUsers &&
        e1?.numberOfCompanies == e2?.numberOfCompanies &&
        e1?.numberOfWorkPlaces == e2?.numberOfWorkPlaces &&
        e1?.creator == e2?.creator &&
        e1?.documentId == e2?.documentId &&
        e1?.documentRef == e2?.documentRef;
  }

  @override
  int hash(MetricsRecord? e) => const ListEquality().hash([
        e?.numberOfUsers,
        e?.numberOfCompanies,
        e?.numberOfWorkPlaces,
        e?.creator,
        e?.documentId,
        e?.documentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is MetricsRecord;
}
