import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormFieldsRecord extends FirestoreRecord {
  FormFieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fieldName" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  bool hasFieldName() => _fieldName != null;

  // "fieldValueType" field.
  String? _fieldValueType;
  String get fieldValueType => _fieldValueType ?? '';
  bool hasFieldValueType() => _fieldValueType != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fieldName = snapshotData['fieldName'] as String?;
    _fieldValueType = snapshotData['fieldValueType'] as String?;
    _options = getDataList(snapshotData['options']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('formFields')
          : FirebaseFirestore.instance.collectionGroup('formFields');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('formFields').doc(id);

  static Stream<FormFieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormFieldsRecord.fromSnapshot(s));

  static Future<FormFieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormFieldsRecord.fromSnapshot(s));

  static FormFieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormFieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormFieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormFieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormFieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormFieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormFieldsRecordData({
  String? fieldName,
  String? fieldValueType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fieldName': fieldName,
      'fieldValueType': fieldValueType,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormFieldsRecordDocumentEquality implements Equality<FormFieldsRecord> {
  const FormFieldsRecordDocumentEquality();

  @override
  bool equals(FormFieldsRecord? e1, FormFieldsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fieldName == e2?.fieldName &&
        e1?.fieldValueType == e2?.fieldValueType &&
        listEquality.equals(e1?.options, e2?.options);
  }

  @override
  int hash(FormFieldsRecord? e) =>
      const ListEquality().hash([e?.fieldName, e?.fieldValueType, e?.options]);

  @override
  bool isValidKey(Object? o) => o is FormFieldsRecord;
}
