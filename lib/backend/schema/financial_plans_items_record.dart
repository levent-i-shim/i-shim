import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialPlansItemsRecord extends FirestoreRecord {
  FinancialPlansItemsRecord._(
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

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

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

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "willBePostponed" field.
  bool? _willBePostponed;
  bool get willBePostponed => _willBePostponed ?? false;
  bool hasWillBePostponed() => _willBePostponed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _content = snapshotData['content'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _willBePostponed = snapshotData['willBePostponed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financialPlansItems')
          : FirebaseFirestore.instance.collectionGroup('financialPlansItems');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financialPlansItems').doc(id);

  static Stream<FinancialPlansItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialPlansItemsRecord.fromSnapshot(s));

  static Future<FinancialPlansItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialPlansItemsRecord.fromSnapshot(s));

  static FinancialPlansItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialPlansItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialPlansItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialPlansItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialPlansItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialPlansItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialPlansItemsRecordData({
  String? title,
  double? value,
  String? content,
  DateTime? creationTime,
  DocumentReference? creatorUserRef,
  DocumentReference? companyRef,
  DocumentReference? workPlaceRef,
  bool? isDeleted,
  bool? isPaid,
  bool? willBePostponed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'value': value,
      'content': content,
      'creationTime': creationTime,
      'creatorUserRef': creatorUserRef,
      'companyRef': companyRef,
      'workPlaceRef': workPlaceRef,
      'isDeleted': isDeleted,
      'isPaid': isPaid,
      'willBePostponed': willBePostponed,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialPlansItemsRecordDocumentEquality
    implements Equality<FinancialPlansItemsRecord> {
  const FinancialPlansItemsRecordDocumentEquality();

  @override
  bool equals(FinancialPlansItemsRecord? e1, FinancialPlansItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.value == e2?.value &&
        e1?.content == e2?.content &&
        e1?.creationTime == e2?.creationTime &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.companyRef == e2?.companyRef &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.isPaid == e2?.isPaid &&
        e1?.willBePostponed == e2?.willBePostponed;
  }

  @override
  int hash(FinancialPlansItemsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.value,
        e?.content,
        e?.creationTime,
        e?.creatorUserRef,
        e?.companyRef,
        e?.workPlaceRef,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.isDeleted,
        e?.isPaid,
        e?.willBePostponed
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialPlansItemsRecord;
}
