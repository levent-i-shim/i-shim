import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalNotesRecord extends FirestoreRecord {
  GoalNotesRecord._(
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

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goalNotes')
          : FirebaseFirestore.instance.collectionGroup('goalNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('goalNotes').doc(id);

  static Stream<GoalNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalNotesRecord.fromSnapshot(s));

  static Future<GoalNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalNotesRecord.fromSnapshot(s));

  static GoalNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoalNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalNotesRecordData({
  String? title,
  String? content,
  DateTime? createdAt,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalNotesRecordDocumentEquality implements Equality<GoalNotesRecord> {
  const GoalNotesRecordDocumentEquality();

  @override
  bool equals(GoalNotesRecord? e1, GoalNotesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(GoalNotesRecord? e) => const ListEquality()
      .hash([e?.title, e?.content, e?.createdAt, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is GoalNotesRecord;
}
