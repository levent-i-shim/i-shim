import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhoneIndexRecord extends FirestoreRecord {
  PhoneIndexRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('phone_index');

  static Stream<PhoneIndexRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhoneIndexRecord.fromSnapshot(s));

  static Future<PhoneIndexRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhoneIndexRecord.fromSnapshot(s));

  static PhoneIndexRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PhoneIndexRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhoneIndexRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhoneIndexRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhoneIndexRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhoneIndexRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhoneIndexRecordData({
  DocumentReference? userId,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhoneIndexRecordDocumentEquality implements Equality<PhoneIndexRecord> {
  const PhoneIndexRecordDocumentEquality();

  @override
  bool equals(PhoneIndexRecord? e1, PhoneIndexRecord? e2) {
    return e1?.userId == e2?.userId && e1?.name == e2?.name;
  }

  @override
  int hash(PhoneIndexRecord? e) =>
      const ListEquality().hash([e?.userId, e?.name]);

  @override
  bool isValidKey(Object? o) => o is PhoneIndexRecord;
}
