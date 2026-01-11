import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceIncomesRecord extends FirestoreRecord {
  WorkPlaceIncomesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

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

  // "creatorUser" field.
  DocumentReference? _creatorUser;
  DocumentReference? get creatorUser => _creatorUser;
  bool hasCreatorUser() => _creatorUser != null;

  // "accrualTime" field.
  DateTime? _accrualTime;
  DateTime? get accrualTime => _accrualTime;
  bool hasAccrualTime() => _accrualTime != null;

  // "collectionTime" field.
  DateTime? _collectionTime;
  DateTime? get collectionTime => _collectionTime;
  bool hasCollectionTime() => _collectionTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUser = snapshotData['creatorUser'] as DocumentReference?;
    _accrualTime = snapshotData['accrualTime'] as DateTime?;
    _collectionTime = snapshotData['collectionTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceIncomes')
          : FirebaseFirestore.instance.collectionGroup('workPlaceIncomes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceIncomes').doc(id);

  static Stream<WorkPlaceIncomesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceIncomesRecord.fromSnapshot(s));

  static Future<WorkPlaceIncomesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceIncomesRecord.fromSnapshot(s));

  static WorkPlaceIncomesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceIncomesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceIncomesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceIncomesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceIncomesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceIncomesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceIncomesRecordData({
  double? value,
  String? title,
  String? content,
  DateTime? creationTime,
  DocumentReference? creatorUser,
  DateTime? accrualTime,
  DateTime? collectionTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'title': title,
      'content': content,
      'creationTime': creationTime,
      'creatorUser': creatorUser,
      'accrualTime': accrualTime,
      'collectionTime': collectionTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceIncomesRecordDocumentEquality
    implements Equality<WorkPlaceIncomesRecord> {
  const WorkPlaceIncomesRecordDocumentEquality();

  @override
  bool equals(WorkPlaceIncomesRecord? e1, WorkPlaceIncomesRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.creationTime == e2?.creationTime &&
        e1?.creatorUser == e2?.creatorUser &&
        e1?.accrualTime == e2?.accrualTime &&
        e1?.collectionTime == e2?.collectionTime;
  }

  @override
  int hash(WorkPlaceIncomesRecord? e) => const ListEquality().hash([
        e?.value,
        e?.title,
        e?.content,
        e?.creationTime,
        e?.creatorUser,
        e?.accrualTime,
        e?.collectionTime
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceIncomesRecord;
}
