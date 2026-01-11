import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhonesRecord extends FirestoreRecord {
  PhonesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "linkedUserId" field.
  DocumentReference? _linkedUserId;
  DocumentReference? get linkedUserId => _linkedUserId;
  bool hasLinkedUserId() => _linkedUserId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _linkedUserId = snapshotData['linkedUserId'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('phones')
          : FirebaseFirestore.instance.collectionGroup('phones');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('phones').doc(id);

  static Stream<PhonesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhonesRecord.fromSnapshot(s));

  static Future<PhonesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhonesRecord.fromSnapshot(s));

  static PhonesRecord fromSnapshot(DocumentSnapshot snapshot) => PhonesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhonesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhonesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhonesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhonesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhonesRecordData({
  DocumentReference? linkedUserId,
  String? name,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'linkedUserId': linkedUserId,
      'name': name,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhonesRecordDocumentEquality implements Equality<PhonesRecord> {
  const PhonesRecordDocumentEquality();

  @override
  bool equals(PhonesRecord? e1, PhonesRecord? e2) {
    return e1?.linkedUserId == e2?.linkedUserId &&
        e1?.name == e2?.name &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(PhonesRecord? e) =>
      const ListEquality().hash([e?.linkedUserId, e?.name, e?.phone]);

  @override
  bool isValidKey(Object? o) => o is PhonesRecord;
}
