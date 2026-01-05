import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('friends')
          : FirebaseFirestore.instance.collectionGroup('friends');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('friends').doc(id);

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  DocumentReference? userRef,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(FriendsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
