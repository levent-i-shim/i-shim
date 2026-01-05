import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Notes')
          : FirebaseFirestore.instance.collectionGroup('Notes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Notes').doc(id);

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? title,
  String? content,
  DateTime? createdAt,
  bool? isDelete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'isDelete': isDelete,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isDelete == e2?.isDelete;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality()
      .hash([e?.title, e?.content, e?.createdAt, e?.isDelete]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
