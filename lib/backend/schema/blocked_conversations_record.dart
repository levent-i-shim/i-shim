import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockedConversationsRecord extends FirestoreRecord {
  BlockedConversationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('blockedConversations')
          : FirebaseFirestore.instance.collectionGroup('blockedConversations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('blockedConversations').doc(id);

  static Stream<BlockedConversationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BlockedConversationsRecord.fromSnapshot(s));

  static Future<BlockedConversationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BlockedConversationsRecord.fromSnapshot(s));

  static BlockedConversationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlockedConversationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlockedConversationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlockedConversationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlockedConversationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlockedConversationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlockedConversationsRecordData({
  DocumentReference? userRef,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlockedConversationsRecordDocumentEquality
    implements Equality<BlockedConversationsRecord> {
  const BlockedConversationsRecordDocumentEquality();

  @override
  bool equals(BlockedConversationsRecord? e1, BlockedConversationsRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.date == e2?.date;
  }

  @override
  int hash(BlockedConversationsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.date]);

  @override
  bool isValidKey(Object? o) => o is BlockedConversationsRecord;
}
