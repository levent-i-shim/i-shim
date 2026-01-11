import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VirtualPositionsWorkPlaceRecord extends FirestoreRecord {
  VirtualPositionsWorkPlaceRecord._(
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
          ? parent.collection('virtualPositionsWorkPlace')
          : FirebaseFirestore.instance
              .collectionGroup('virtualPositionsWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('virtualPositionsWorkPlace').doc(id);

  static Stream<VirtualPositionsWorkPlaceRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => VirtualPositionsWorkPlaceRecord.fromSnapshot(s));

  static Future<VirtualPositionsWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VirtualPositionsWorkPlaceRecord.fromSnapshot(s));

  static VirtualPositionsWorkPlaceRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      VirtualPositionsWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VirtualPositionsWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VirtualPositionsWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VirtualPositionsWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VirtualPositionsWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVirtualPositionsWorkPlaceRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class VirtualPositionsWorkPlaceRecordDocumentEquality
    implements Equality<VirtualPositionsWorkPlaceRecord> {
  const VirtualPositionsWorkPlaceRecordDocumentEquality();

  @override
  bool equals(VirtualPositionsWorkPlaceRecord? e1,
      VirtualPositionsWorkPlaceRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(VirtualPositionsWorkPlaceRecord? e) =>
      const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is VirtualPositionsWorkPlaceRecord;
}
