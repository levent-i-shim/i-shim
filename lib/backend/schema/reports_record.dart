import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creatorUserID" field.
  String? _creatorUserID;
  String get creatorUserID => _creatorUserID ?? '';
  bool hasCreatorUserID() => _creatorUserID != null;

  // "companyID" field.
  String? _companyID;
  String get companyID => _companyID ?? '';
  bool hasCompanyID() => _companyID != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creatorUserID = snapshotData['creatorUserID'] as String?;
    _companyID = snapshotData['companyID'] as String?;
    _category = snapshotData['category'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reports')
          : FirebaseFirestore.instance.collectionGroup('reports');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reports').doc(id);

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? creatorUserID,
  String? companyID,
  String? category,
  DateTime? date,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creatorUserID': creatorUserID,
      'companyID': companyID,
      'category': category,
      'date': date,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.creatorUserID == e2?.creatorUserID &&
        e1?.companyID == e2?.companyID &&
        e1?.category == e2?.category &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality()
      .hash([e?.creatorUserID, e?.companyID, e?.category, e?.date, e?.type]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
