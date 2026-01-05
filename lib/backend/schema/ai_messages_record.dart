import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiMessagesRecord extends FirestoreRecord {
  AiMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "role" field.
  AiMessageRole? _role;
  AiMessageRole? get role => _role;
  bool hasRole() => _role != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _role = snapshotData['role'] is AiMessageRole
        ? snapshotData['role']
        : deserializeEnum<AiMessageRole>(snapshotData['role']);
    _creationTime = snapshotData['creationTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aiMessages')
          : FirebaseFirestore.instance.collectionGroup('aiMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('aiMessages').doc(id);

  static Stream<AiMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiMessagesRecord.fromSnapshot(s));

  static Future<AiMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiMessagesRecord.fromSnapshot(s));

  static AiMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiMessagesRecordData({
  String? content,
  AiMessageRole? role,
  DateTime? creationTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'role': role,
      'creationTime': creationTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiMessagesRecordDocumentEquality implements Equality<AiMessagesRecord> {
  const AiMessagesRecordDocumentEquality();

  @override
  bool equals(AiMessagesRecord? e1, AiMessagesRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.role == e2?.role &&
        e1?.creationTime == e2?.creationTime;
  }

  @override
  int hash(AiMessagesRecord? e) =>
      const ListEquality().hash([e?.content, e?.role, e?.creationTime]);

  @override
  bool isValidKey(Object? o) => o is AiMessagesRecord;
}
