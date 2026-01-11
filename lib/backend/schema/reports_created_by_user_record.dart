import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsCreatedByUserRecord extends FirestoreRecord {
  ReportsCreatedByUserRecord._(
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
          ? parent.collection('reportsCreatedByUser')
          : FirebaseFirestore.instance.collectionGroup('reportsCreatedByUser');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reportsCreatedByUser').doc(id);

  static Stream<ReportsCreatedByUserRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsCreatedByUserRecord.fromSnapshot(s));

  static Future<ReportsCreatedByUserRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ReportsCreatedByUserRecord.fromSnapshot(s));

  static ReportsCreatedByUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsCreatedByUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsCreatedByUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsCreatedByUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsCreatedByUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsCreatedByUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsCreatedByUserRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsCreatedByUserRecordDocumentEquality
    implements Equality<ReportsCreatedByUserRecord> {
  const ReportsCreatedByUserRecordDocumentEquality();

  @override
  bool equals(ReportsCreatedByUserRecord? e1, ReportsCreatedByUserRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ReportsCreatedByUserRecord? e) =>
      const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ReportsCreatedByUserRecord;
}
