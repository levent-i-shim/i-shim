import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncomePlanItemsRecord extends FirestoreRecord {
  IncomePlanItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "workPlaceId" field.
  String? _workPlaceId;
  String get workPlaceId => _workPlaceId ?? '';
  bool hasWorkPlaceId() => _workPlaceId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _content = snapshotData['content'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _status = snapshotData['status'] as String?;
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('incomePlanItems')
          : FirebaseFirestore.instance.collectionGroup('incomePlanItems');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('incomePlanItems').doc(id);

  static Stream<IncomePlanItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncomePlanItemsRecord.fromSnapshot(s));

  static Future<IncomePlanItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IncomePlanItemsRecord.fromSnapshot(s));

  static IncomePlanItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncomePlanItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncomePlanItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncomePlanItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncomePlanItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncomePlanItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncomePlanItemsRecordData({
  String? title,
  double? value,
  String? content,
  DateTime? creationTime,
  DocumentReference? creatorUserRef,
  DocumentReference? companyRef,
  String? companyName,
  String? companyId,
  DocumentReference? workPlaceRef,
  String? workPlaceName,
  String? workPlaceId,
  String? status,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'value': value,
      'content': content,
      'creationTime': creationTime,
      'creatorUserRef': creatorUserRef,
      'companyRef': companyRef,
      'companyName': companyName,
      'companyId': companyId,
      'workPlaceRef': workPlaceRef,
      'workPlaceName': workPlaceName,
      'workPlaceId': workPlaceId,
      'status': status,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncomePlanItemsRecordDocumentEquality
    implements Equality<IncomePlanItemsRecord> {
  const IncomePlanItemsRecordDocumentEquality();

  @override
  bool equals(IncomePlanItemsRecord? e1, IncomePlanItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.value == e2?.value &&
        e1?.content == e2?.content &&
        e1?.creationTime == e2?.creationTime &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.companyRef == e2?.companyRef &&
        e1?.companyName == e2?.companyName &&
        e1?.companyId == e2?.companyId &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.status == e2?.status &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(IncomePlanItemsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.value,
        e?.content,
        e?.creationTime,
        e?.creatorUserRef,
        e?.companyRef,
        e?.companyName,
        e?.companyId,
        e?.workPlaceRef,
        e?.workPlaceName,
        e?.workPlaceId,
        e?.status,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is IncomePlanItemsRecord;
}
