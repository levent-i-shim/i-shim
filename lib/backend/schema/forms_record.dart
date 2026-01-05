import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormsRecord extends FirestoreRecord {
  FormsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "formName" field.
  String? _formName;
  String get formName => _formName ?? '';
  bool hasFormName() => _formName != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  void _initializeFields() {
    _formName = snapshotData['formName'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('forms');

  static Stream<FormsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormsRecord.fromSnapshot(s));

  static Future<FormsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormsRecord.fromSnapshot(s));

  static FormsRecord fromSnapshot(DocumentSnapshot snapshot) => FormsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormsRecordData({
  String? formName,
  DocumentReference? companyRef,
  bool? isDelete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'formName': formName,
      'companyRef': companyRef,
      'isDelete': isDelete,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormsRecordDocumentEquality implements Equality<FormsRecord> {
  const FormsRecordDocumentEquality();

  @override
  bool equals(FormsRecord? e1, FormsRecord? e2) {
    return e1?.formName == e2?.formName &&
        e1?.companyRef == e2?.companyRef &&
        e1?.isDelete == e2?.isDelete;
  }

  @override
  int hash(FormsRecord? e) =>
      const ListEquality().hash([e?.formName, e?.companyRef, e?.isDelete]);

  @override
  bool isValidKey(Object? o) => o is FormsRecord;
}
