import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrgentNotesRecord extends FirestoreRecord {
  UrgentNotesRecord._(
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

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "completionTime" field.
  DateTime? _completionTime;
  DateTime? get completionTime => _completionTime;
  bool hasCompletionTime() => _completionTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _completed = snapshotData['completed'] as bool?;
    _completionTime = snapshotData['completionTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('urgentNotes')
          : FirebaseFirestore.instance.collectionGroup('urgentNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('urgentNotes').doc(id);

  static Stream<UrgentNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UrgentNotesRecord.fromSnapshot(s));

  static Future<UrgentNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UrgentNotesRecord.fromSnapshot(s));

  static UrgentNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UrgentNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UrgentNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UrgentNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UrgentNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UrgentNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUrgentNotesRecordData({
  String? title,
  String? content,
  DateTime? creationTime,
  bool? isDeleted,
  bool? completed,
  DateTime? completionTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'creationTime': creationTime,
      'isDeleted': isDeleted,
      'completed': completed,
      'completionTime': completionTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UrgentNotesRecordDocumentEquality implements Equality<UrgentNotesRecord> {
  const UrgentNotesRecordDocumentEquality();

  @override
  bool equals(UrgentNotesRecord? e1, UrgentNotesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.creationTime == e2?.creationTime &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.completed == e2?.completed &&
        e1?.completionTime == e2?.completionTime;
  }

  @override
  int hash(UrgentNotesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.creationTime,
        e?.isDeleted,
        e?.completed,
        e?.completionTime
      ]);

  @override
  bool isValidKey(Object? o) => o is UrgentNotesRecord;
}
