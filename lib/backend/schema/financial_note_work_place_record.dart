import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialNoteWorkPlaceRecord extends FirestoreRecord {
  FinancialNoteWorkPlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financialNoteWorkPlace')
          : FirebaseFirestore.instance
              .collectionGroup('financialNoteWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financialNoteWorkPlace').doc(id);

  static Stream<FinancialNoteWorkPlaceRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialNoteWorkPlaceRecord.fromSnapshot(s));

  static Future<FinancialNoteWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialNoteWorkPlaceRecord.fromSnapshot(s));

  static FinancialNoteWorkPlaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialNoteWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialNoteWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialNoteWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialNoteWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialNoteWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialNoteWorkPlaceRecordData({
  double? value,
  DocumentReference? creator,
  String? creatorName,
  String? workPlaceName,
  DocumentReference? workPlaceRef,
  DateTime? creationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'creator': creator,
      'creatorName': creatorName,
      'workPlaceName': workPlaceName,
      'workPlaceRef': workPlaceRef,
      'creationDate': creationDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialNoteWorkPlaceRecordDocumentEquality
    implements Equality<FinancialNoteWorkPlaceRecord> {
  const FinancialNoteWorkPlaceRecordDocumentEquality();

  @override
  bool equals(
      FinancialNoteWorkPlaceRecord? e1, FinancialNoteWorkPlaceRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.creator == e2?.creator &&
        e1?.creatorName == e2?.creatorName &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.creationDate == e2?.creationDate;
  }

  @override
  int hash(FinancialNoteWorkPlaceRecord? e) => const ListEquality().hash([
        e?.value,
        e?.creator,
        e?.creatorName,
        e?.workPlaceName,
        e?.workPlaceRef,
        e?.creationDate
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialNoteWorkPlaceRecord;
}
