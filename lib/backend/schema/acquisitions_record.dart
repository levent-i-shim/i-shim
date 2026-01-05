import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AcquisitionsRecord extends FirestoreRecord {
  AcquisitionsRecord._(
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
          ? parent.collection('acquisitions')
          : FirebaseFirestore.instance.collectionGroup('acquisitions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('acquisitions').doc(id);

  static Stream<AcquisitionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcquisitionsRecord.fromSnapshot(s));

  static Future<AcquisitionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcquisitionsRecord.fromSnapshot(s));

  static AcquisitionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcquisitionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcquisitionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcquisitionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcquisitionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcquisitionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcquisitionsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcquisitionsRecordDocumentEquality
    implements Equality<AcquisitionsRecord> {
  const AcquisitionsRecordDocumentEquality();

  @override
  bool equals(AcquisitionsRecord? e1, AcquisitionsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(AcquisitionsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is AcquisitionsRecord;
}
