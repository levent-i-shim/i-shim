import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalDiaryRecord extends FirestoreRecord {
  PersonalDiaryRecord._(
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

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "content2" field.
  String? _content2;
  String get content2 => _content2 ?? '';
  bool hasContent2() => _content2 != null;

  // "content3" field.
  String? _content3;
  String get content3 => _content3 ?? '';
  bool hasContent3() => _content3 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _version = castToType<int>(snapshotData['version']);
    _content2 = snapshotData['content2'] as String?;
    _content3 = snapshotData['content3'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('personalDiary')
          : FirebaseFirestore.instance.collectionGroup('personalDiary');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('personalDiary').doc(id);

  static Stream<PersonalDiaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalDiaryRecord.fromSnapshot(s));

  static Future<PersonalDiaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PersonalDiaryRecord.fromSnapshot(s));

  static PersonalDiaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalDiaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalDiaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalDiaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalDiaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalDiaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalDiaryRecordData({
  String? title,
  String? content,
  DateTime? createdAt,
  bool? isDeleted,
  int? version,
  String? content2,
  String? content3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'isDeleted': isDeleted,
      'version': version,
      'content2': content2,
      'content3': content3,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalDiaryRecordDocumentEquality
    implements Equality<PersonalDiaryRecord> {
  const PersonalDiaryRecordDocumentEquality();

  @override
  bool equals(PersonalDiaryRecord? e1, PersonalDiaryRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.version == e2?.version &&
        e1?.content2 == e2?.content2 &&
        e1?.content3 == e2?.content3;
  }

  @override
  int hash(PersonalDiaryRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.createdAt,
        e?.isDeleted,
        e?.version,
        e?.content2,
        e?.content3
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalDiaryRecord;
}
