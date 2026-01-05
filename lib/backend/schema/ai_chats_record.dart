import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiChatsRecord extends FirestoreRecord {
  AiChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aiChats');

  static Stream<AiChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiChatsRecord.fromSnapshot(s));

  static Future<AiChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiChatsRecord.fromSnapshot(s));

  static AiChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiChatsRecordData({
  DocumentReference? uid,
  DateTime? timeStamp,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'timeStamp': timeStamp,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiChatsRecordDocumentEquality implements Equality<AiChatsRecord> {
  const AiChatsRecordDocumentEquality();

  @override
  bool equals(AiChatsRecord? e1, AiChatsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.title == e2?.title;
  }

  @override
  int hash(AiChatsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.timeStamp, e?.title]);

  @override
  bool isValidKey(Object? o) => o is AiChatsRecord;
}
