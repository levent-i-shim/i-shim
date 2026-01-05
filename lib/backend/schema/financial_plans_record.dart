import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialPlansRecord extends FirestoreRecord {
  FinancialPlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  // "creatorUserName" field.
  String? _creatorUserName;
  String get creatorUserName => _creatorUserName ?? '';
  bool hasCreatorUserName() => _creatorUserName != null;

  // "creatorUserDocId" field.
  String? _creatorUserDocId;
  String get creatorUserDocId => _creatorUserDocId ?? '';
  bool hasCreatorUserDocId() => _creatorUserDocId != null;

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

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "totalCapitalRequirement" field.
  double? _totalCapitalRequirement;
  double get totalCapitalRequirement => _totalCapitalRequirement ?? 0.0;
  bool hasTotalCapitalRequirement() => _totalCapitalRequirement != null;

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

  void _initializeFields() {
    _planName = snapshotData['planName'] as String?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _creatorUserDocId = snapshotData['creatorUserDocId'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _totalCapitalRequirement =
        castToType<double>(snapshotData['totalCapitalRequirement']);
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('financialPlans');

  static Stream<FinancialPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialPlansRecord.fromSnapshot(s));

  static Future<FinancialPlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FinancialPlansRecord.fromSnapshot(s));

  static FinancialPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialPlansRecordData({
  String? planName,
  DocumentReference? creatorUserRef,
  String? creatorUserName,
  String? creatorUserDocId,
  DocumentReference? companyRef,
  String? companyName,
  String? companyId,
  DocumentReference? workPlaceRef,
  String? workPlaceName,
  String? workPlaceId,
  DateTime? creationTime,
  double? totalCapitalRequirement,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'planName': planName,
      'creatorUserRef': creatorUserRef,
      'creatorUserName': creatorUserName,
      'creatorUserDocId': creatorUserDocId,
      'companyRef': companyRef,
      'companyName': companyName,
      'companyId': companyId,
      'workPlaceRef': workPlaceRef,
      'workPlaceName': workPlaceName,
      'workPlaceId': workPlaceId,
      'creationTime': creationTime,
      'totalCapitalRequirement': totalCapitalRequirement,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialPlansRecordDocumentEquality
    implements Equality<FinancialPlansRecord> {
  const FinancialPlansRecordDocumentEquality();

  @override
  bool equals(FinancialPlansRecord? e1, FinancialPlansRecord? e2) {
    const listEquality = ListEquality();
    return e1?.planName == e2?.planName &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.creatorUserDocId == e2?.creatorUserDocId &&
        e1?.companyRef == e2?.companyRef &&
        e1?.companyName == e2?.companyName &&
        e1?.companyId == e2?.companyId &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.creationTime == e2?.creationTime &&
        e1?.totalCapitalRequirement == e2?.totalCapitalRequirement &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(FinancialPlansRecord? e) => const ListEquality().hash([
        e?.planName,
        e?.creatorUserRef,
        e?.creatorUserName,
        e?.creatorUserDocId,
        e?.companyRef,
        e?.companyName,
        e?.companyId,
        e?.workPlaceRef,
        e?.workPlaceName,
        e?.workPlaceId,
        e?.creationTime,
        e?.totalCapitalRequirement,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialPlansRecord;
}
