import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeavyMachineryRecord extends FirestoreRecord {
  HeavyMachineryRecord._(
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
          ? parent.collection('heavyMachinery')
          : FirebaseFirestore.instance.collectionGroup('heavyMachinery');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('heavyMachinery').doc(id);

  static Stream<HeavyMachineryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeavyMachineryRecord.fromSnapshot(s));

  static Future<HeavyMachineryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeavyMachineryRecord.fromSnapshot(s));

  static HeavyMachineryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HeavyMachineryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeavyMachineryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeavyMachineryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeavyMachineryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeavyMachineryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeavyMachineryRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class HeavyMachineryRecordDocumentEquality
    implements Equality<HeavyMachineryRecord> {
  const HeavyMachineryRecordDocumentEquality();

  @override
  bool equals(HeavyMachineryRecord? e1, HeavyMachineryRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(HeavyMachineryRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is HeavyMachineryRecord;
}
