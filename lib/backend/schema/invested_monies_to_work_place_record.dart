import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestedMoniesToWorkPlaceRecord extends FirestoreRecord {
  InvestedMoniesToWorkPlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "createdByWhichUserRef" field.
  DocumentReference? _createdByWhichUserRef;
  DocumentReference? get createdByWhichUserRef => _createdByWhichUserRef;
  bool hasCreatedByWhichUserRef() => _createdByWhichUserRef != null;

  // "paidOnBehalfOfUserRef" field.
  DocumentReference? _paidOnBehalfOfUserRef;
  DocumentReference? get paidOnBehalfOfUserRef => _paidOnBehalfOfUserRef;
  bool hasPaidOnBehalfOfUserRef() => _paidOnBehalfOfUserRef != null;

  // "paidOnBehalfOfWorkPlaceRef" field.
  DocumentReference? _paidOnBehalfOfWorkPlaceRef;
  DocumentReference? get paidOnBehalfOfWorkPlaceRef =>
      _paidOnBehalfOfWorkPlaceRef;
  bool hasPaidOnBehalfOfWorkPlaceRef() => _paidOnBehalfOfWorkPlaceRef != null;

  // "paidOnBehalfOfCompanyRef" field.
  DocumentReference? _paidOnBehalfOfCompanyRef;
  DocumentReference? get paidOnBehalfOfCompanyRef => _paidOnBehalfOfCompanyRef;
  bool hasPaidOnBehalfOfCompanyRef() => _paidOnBehalfOfCompanyRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _createdByWhichUserRef =
        snapshotData['createdByWhichUserRef'] as DocumentReference?;
    _paidOnBehalfOfUserRef =
        snapshotData['paidOnBehalfOfUserRef'] as DocumentReference?;
    _paidOnBehalfOfWorkPlaceRef =
        snapshotData['paidOnBehalfOfWorkPlaceRef'] as DocumentReference?;
    _paidOnBehalfOfCompanyRef =
        snapshotData['paidOnBehalfOfCompanyRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('investedMoniesToWorkPlace')
          : FirebaseFirestore.instance
              .collectionGroup('investedMoniesToWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('investedMoniesToWorkPlace').doc(id);

  static Stream<InvestedMoniesToWorkPlaceRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => InvestedMoniesToWorkPlaceRecord.fromSnapshot(s));

  static Future<InvestedMoniesToWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InvestedMoniesToWorkPlaceRecord.fromSnapshot(s));

  static InvestedMoniesToWorkPlaceRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      InvestedMoniesToWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvestedMoniesToWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvestedMoniesToWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvestedMoniesToWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvestedMoniesToWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvestedMoniesToWorkPlaceRecordData({
  double? value,
  DateTime? creationTime,
  DocumentReference? createdByWhichUserRef,
  DocumentReference? paidOnBehalfOfUserRef,
  DocumentReference? paidOnBehalfOfWorkPlaceRef,
  DocumentReference? paidOnBehalfOfCompanyRef,
  String? title,
  String? content,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'creationTime': creationTime,
      'createdByWhichUserRef': createdByWhichUserRef,
      'paidOnBehalfOfUserRef': paidOnBehalfOfUserRef,
      'paidOnBehalfOfWorkPlaceRef': paidOnBehalfOfWorkPlaceRef,
      'paidOnBehalfOfCompanyRef': paidOnBehalfOfCompanyRef,
      'title': title,
      'content': content,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvestedMoniesToWorkPlaceRecordDocumentEquality
    implements Equality<InvestedMoniesToWorkPlaceRecord> {
  const InvestedMoniesToWorkPlaceRecordDocumentEquality();

  @override
  bool equals(InvestedMoniesToWorkPlaceRecord? e1,
      InvestedMoniesToWorkPlaceRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.creationTime == e2?.creationTime &&
        e1?.createdByWhichUserRef == e2?.createdByWhichUserRef &&
        e1?.paidOnBehalfOfUserRef == e2?.paidOnBehalfOfUserRef &&
        e1?.paidOnBehalfOfWorkPlaceRef == e2?.paidOnBehalfOfWorkPlaceRef &&
        e1?.paidOnBehalfOfCompanyRef == e2?.paidOnBehalfOfCompanyRef &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(InvestedMoniesToWorkPlaceRecord? e) => const ListEquality().hash([
        e?.value,
        e?.creationTime,
        e?.createdByWhichUserRef,
        e?.paidOnBehalfOfUserRef,
        e?.paidOnBehalfOfWorkPlaceRef,
        e?.paidOnBehalfOfCompanyRef,
        e?.title,
        e?.content,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is InvestedMoniesToWorkPlaceRecord;
}
