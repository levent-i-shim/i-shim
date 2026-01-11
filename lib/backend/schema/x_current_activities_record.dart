import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class XCurrentActivitiesRecord extends FirestoreRecord {
  XCurrentActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  // "createdOnBehalfOfCompanyRef" field.
  DocumentReference? _createdOnBehalfOfCompanyRef;
  DocumentReference? get createdOnBehalfOfCompanyRef =>
      _createdOnBehalfOfCompanyRef;
  bool hasCreatedOnBehalfOfCompanyRef() => _createdOnBehalfOfCompanyRef != null;

  // "createdOnBehalfOfCompanyName" field.
  String? _createdOnBehalfOfCompanyName;
  String get createdOnBehalfOfCompanyName =>
      _createdOnBehalfOfCompanyName ?? '';
  bool hasCreatedOnBehalfOfCompanyName() =>
      _createdOnBehalfOfCompanyName != null;

  // "createdOnBehalfOfWorkPlaceRef" field.
  DocumentReference? _createdOnBehalfOfWorkPlaceRef;
  DocumentReference? get createdOnBehalfOfWorkPlaceRef =>
      _createdOnBehalfOfWorkPlaceRef;
  bool hasCreatedOnBehalfOfWorkPlaceRef() =>
      _createdOnBehalfOfWorkPlaceRef != null;

  // "createdOnBehalfOfWorkPlaceName" field.
  String? _createdOnBehalfOfWorkPlaceName;
  String get createdOnBehalfOfWorkPlaceName =>
      _createdOnBehalfOfWorkPlaceName ?? '';
  bool hasCreatedOnBehalfOfWorkPlaceName() =>
      _createdOnBehalfOfWorkPlaceName != null;

  // "creatorUserName" field.
  String? _creatorUserName;
  String get creatorUserName => _creatorUserName ?? '';
  bool hasCreatorUserName() => _creatorUserName != null;

  // "creatorUserId" field.
  String? _creatorUserId;
  String get creatorUserId => _creatorUserId ?? '';
  bool hasCreatorUserId() => _creatorUserId != null;

  // "authorizedUsersToMonitor" field.
  List<DocumentReference>? _authorizedUsersToMonitor;
  List<DocumentReference> get authorizedUsersToMonitor =>
      _authorizedUsersToMonitor ?? const [];
  bool hasAuthorizedUsersToMonitor() => _authorizedUsersToMonitor != null;

  // "authorizedUsersToModify" field.
  List<DocumentReference>? _authorizedUsersToModify;
  List<DocumentReference> get authorizedUsersToModify =>
      _authorizedUsersToModify ?? const [];
  bool hasAuthorizedUsersToModify() => _authorizedUsersToModify != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _createdOnBehalfOfCompanyRef =
        snapshotData['createdOnBehalfOfCompanyRef'] as DocumentReference?;
    _createdOnBehalfOfCompanyName =
        snapshotData['createdOnBehalfOfCompanyName'] as String?;
    _createdOnBehalfOfWorkPlaceRef =
        snapshotData['createdOnBehalfOfWorkPlaceRef'] as DocumentReference?;
    _createdOnBehalfOfWorkPlaceName =
        snapshotData['createdOnBehalfOfWorkPlaceName'] as String?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _creatorUserId = snapshotData['creatorUserId'] as String?;
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _value = castToType<double>(snapshotData['value']);
    _content = snapshotData['content'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('xCurrentActivities')
          : FirebaseFirestore.instance.collectionGroup('xCurrentActivities');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('xCurrentActivities').doc(id);

  static Stream<XCurrentActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => XCurrentActivitiesRecord.fromSnapshot(s));

  static Future<XCurrentActivitiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => XCurrentActivitiesRecord.fromSnapshot(s));

  static XCurrentActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      XCurrentActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static XCurrentActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      XCurrentActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'XCurrentActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is XCurrentActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createXCurrentActivitiesRecordData({
  DateTime? creationTime,
  DocumentReference? creatorUserRef,
  DocumentReference? createdOnBehalfOfCompanyRef,
  String? createdOnBehalfOfCompanyName,
  DocumentReference? createdOnBehalfOfWorkPlaceRef,
  String? createdOnBehalfOfWorkPlaceName,
  String? creatorUserName,
  String? creatorUserId,
  bool? isDeleted,
  double? value,
  String? content,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creationTime': creationTime,
      'creatorUserRef': creatorUserRef,
      'createdOnBehalfOfCompanyRef': createdOnBehalfOfCompanyRef,
      'createdOnBehalfOfCompanyName': createdOnBehalfOfCompanyName,
      'createdOnBehalfOfWorkPlaceRef': createdOnBehalfOfWorkPlaceRef,
      'createdOnBehalfOfWorkPlaceName': createdOnBehalfOfWorkPlaceName,
      'creatorUserName': creatorUserName,
      'creatorUserId': creatorUserId,
      'isDeleted': isDeleted,
      'value': value,
      'content': content,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class XCurrentActivitiesRecordDocumentEquality
    implements Equality<XCurrentActivitiesRecord> {
  const XCurrentActivitiesRecordDocumentEquality();

  @override
  bool equals(XCurrentActivitiesRecord? e1, XCurrentActivitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creationTime == e2?.creationTime &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.createdOnBehalfOfCompanyRef == e2?.createdOnBehalfOfCompanyRef &&
        e1?.createdOnBehalfOfCompanyName == e2?.createdOnBehalfOfCompanyName &&
        e1?.createdOnBehalfOfWorkPlaceRef ==
            e2?.createdOnBehalfOfWorkPlaceRef &&
        e1?.createdOnBehalfOfWorkPlaceName ==
            e2?.createdOnBehalfOfWorkPlaceName &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.creatorUserId == e2?.creatorUserId &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.value == e2?.value &&
        e1?.content == e2?.content &&
        e1?.title == e2?.title;
  }

  @override
  int hash(XCurrentActivitiesRecord? e) => const ListEquality().hash([
        e?.creationTime,
        e?.creatorUserRef,
        e?.createdOnBehalfOfCompanyRef,
        e?.createdOnBehalfOfCompanyName,
        e?.createdOnBehalfOfWorkPlaceRef,
        e?.createdOnBehalfOfWorkPlaceName,
        e?.creatorUserName,
        e?.creatorUserId,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.isDeleted,
        e?.value,
        e?.content,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is XCurrentActivitiesRecord;
}
