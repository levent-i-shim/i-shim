import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VirtualPositionsCompanyRecord extends FirestoreRecord {
  VirtualPositionsCompanyRecord._(
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
          ? parent.collection('virtualPositionsCompany')
          : FirebaseFirestore.instance
              .collectionGroup('virtualPositionsCompany');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('virtualPositionsCompany').doc(id);

  static Stream<VirtualPositionsCompanyRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => VirtualPositionsCompanyRecord.fromSnapshot(s));

  static Future<VirtualPositionsCompanyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VirtualPositionsCompanyRecord.fromSnapshot(s));

  static VirtualPositionsCompanyRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      VirtualPositionsCompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VirtualPositionsCompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VirtualPositionsCompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VirtualPositionsCompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VirtualPositionsCompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVirtualPositionsCompanyRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class VirtualPositionsCompanyRecordDocumentEquality
    implements Equality<VirtualPositionsCompanyRecord> {
  const VirtualPositionsCompanyRecordDocumentEquality();

  @override
  bool equals(
      VirtualPositionsCompanyRecord? e1, VirtualPositionsCompanyRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(VirtualPositionsCompanyRecord? e) =>
      const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is VirtualPositionsCompanyRecord;
}
