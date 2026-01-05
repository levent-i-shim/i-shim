import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormResponsesRecord extends FirestoreRecord {
  FormResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fieldName" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  bool hasFieldName() => _fieldName != null;

  // "fieldValue" field.
  String? _fieldValue;
  String get fieldValue => _fieldValue ?? '';
  bool hasFieldValue() => _fieldValue != null;

  // "fieldValueType" field.
  String? _fieldValueType;
  String get fieldValueType => _fieldValueType ?? '';
  bool hasFieldValueType() => _fieldValueType != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "companyTask" field.
  DocumentReference? _companyTask;
  DocumentReference? get companyTask => _companyTask;
  bool hasCompanyTask() => _companyTask != null;

  // "companyTaskDuties" field.
  DocumentReference? _companyTaskDuties;
  DocumentReference? get companyTaskDuties => _companyTaskDuties;
  bool hasCompanyTaskDuties() => _companyTaskDuties != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "sentBy" field.
  DocumentReference? _sentBy;
  DocumentReference? get sentBy => _sentBy;
  bool hasSentBy() => _sentBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fieldName = snapshotData['fieldName'] as String?;
    _fieldValue = snapshotData['fieldValue'] as String?;
    _fieldValueType = snapshotData['fieldValueType'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _companyTask = snapshotData['companyTask'] as DocumentReference?;
    _companyTaskDuties =
        snapshotData['companyTaskDuties'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _sentBy = snapshotData['sentBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('formResponses')
          : FirebaseFirestore.instance.collectionGroup('formResponses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('formResponses').doc(id);

  static Stream<FormResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormResponsesRecord.fromSnapshot(s));

  static Future<FormResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormResponsesRecord.fromSnapshot(s));

  static FormResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormResponsesRecordData({
  String? fieldName,
  String? fieldValue,
  String? fieldValueType,
  String? imagePath,
  DocumentReference? companyTask,
  DocumentReference? companyTaskDuties,
  DateTime? date,
  DocumentReference? sentBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fieldName': fieldName,
      'fieldValue': fieldValue,
      'fieldValueType': fieldValueType,
      'imagePath': imagePath,
      'companyTask': companyTask,
      'companyTaskDuties': companyTaskDuties,
      'date': date,
      'sentBy': sentBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormResponsesRecordDocumentEquality
    implements Equality<FormResponsesRecord> {
  const FormResponsesRecordDocumentEquality();

  @override
  bool equals(FormResponsesRecord? e1, FormResponsesRecord? e2) {
    return e1?.fieldName == e2?.fieldName &&
        e1?.fieldValue == e2?.fieldValue &&
        e1?.fieldValueType == e2?.fieldValueType &&
        e1?.imagePath == e2?.imagePath &&
        e1?.companyTask == e2?.companyTask &&
        e1?.companyTaskDuties == e2?.companyTaskDuties &&
        e1?.date == e2?.date &&
        e1?.sentBy == e2?.sentBy;
  }

  @override
  int hash(FormResponsesRecord? e) => const ListEquality().hash([
        e?.fieldName,
        e?.fieldValue,
        e?.fieldValueType,
        e?.imagePath,
        e?.companyTask,
        e?.companyTaskDuties,
        e?.date,
        e?.sentBy
      ]);

  @override
  bool isValidKey(Object? o) => o is FormResponsesRecord;
}
