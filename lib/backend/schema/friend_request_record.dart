import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestRecord extends FirestoreRecord {
  FriendRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _senderName = snapshotData['senderName'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isReject = snapshotData['isReject'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('friendRequest')
          : FirebaseFirestore.instance.collectionGroup('friendRequest');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('friendRequest').doc(id);

  static Stream<FriendRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestRecord.fromSnapshot(s));

  static Future<FriendRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestRecord.fromSnapshot(s));

  static FriendRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestRecordData({
  DocumentReference? sender,
  String? senderName,
  DateTime? date,
  bool? isAccept,
  bool? isReject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'senderName': senderName,
      'date': date,
      'isAccept': isAccept,
      'isReject': isReject,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestRecordDocumentEquality
    implements Equality<FriendRequestRecord> {
  const FriendRequestRecordDocumentEquality();

  @override
  bool equals(FriendRequestRecord? e1, FriendRequestRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.senderName == e2?.senderName &&
        e1?.date == e2?.date &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isReject == e2?.isReject;
  }

  @override
  int hash(FriendRequestRecord? e) => const ListEquality()
      .hash([e?.sender, e?.senderName, e?.date, e?.isAccept, e?.isReject]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestRecord;
}
