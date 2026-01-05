import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestmentPlansRecord extends FirestoreRecord {
  InvestmentPlansRecord._(
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

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "totalInvestmentCapitalRequirement" field.
  double? _totalInvestmentCapitalRequirement;
  double get totalInvestmentCapitalRequirement =>
      _totalInvestmentCapitalRequirement ?? 0.0;
  bool hasTotalInvestmentCapitalRequirement() =>
      _totalInvestmentCapitalRequirement != null;

  void _initializeFields() {
    _planName = snapshotData['planName'] as String?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _creatorUserId = snapshotData['creatorUserId'] as String?;
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _totalInvestmentCapitalRequirement =
        castToType<double>(snapshotData['totalInvestmentCapitalRequirement']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('investmentPlans');

  static Stream<InvestmentPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvestmentPlansRecord.fromSnapshot(s));

  static Future<InvestmentPlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvestmentPlansRecord.fromSnapshot(s));

  static InvestmentPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvestmentPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvestmentPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvestmentPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvestmentPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvestmentPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvestmentPlansRecordData({
  String? planName,
  DocumentReference? creatorUserRef,
  String? creatorUserName,
  String? creatorUserId,
  DocumentReference? companyRef,
  String? companyName,
  String? companyId,
  DocumentReference? workPlaceRef,
  String? workPlaceName,
  String? workPlaceId,
  DateTime? creationTime,
  bool? isDeleted,
  double? totalInvestmentCapitalRequirement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'planName': planName,
      'creatorUserRef': creatorUserRef,
      'creatorUserName': creatorUserName,
      'creatorUserId': creatorUserId,
      'companyRef': companyRef,
      'companyName': companyName,
      'companyId': companyId,
      'workPlaceRef': workPlaceRef,
      'workPlaceName': workPlaceName,
      'workPlaceId': workPlaceId,
      'creationTime': creationTime,
      'isDeleted': isDeleted,
      'totalInvestmentCapitalRequirement': totalInvestmentCapitalRequirement,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvestmentPlansRecordDocumentEquality
    implements Equality<InvestmentPlansRecord> {
  const InvestmentPlansRecordDocumentEquality();

  @override
  bool equals(InvestmentPlansRecord? e1, InvestmentPlansRecord? e2) {
    const listEquality = ListEquality();
    return e1?.planName == e2?.planName &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.creatorUserId == e2?.creatorUserId &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.companyRef == e2?.companyRef &&
        e1?.companyName == e2?.companyName &&
        e1?.companyId == e2?.companyId &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.creationTime == e2?.creationTime &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.totalInvestmentCapitalRequirement ==
            e2?.totalInvestmentCapitalRequirement;
  }

  @override
  int hash(InvestmentPlansRecord? e) => const ListEquality().hash([
        e?.planName,
        e?.creatorUserRef,
        e?.creatorUserName,
        e?.creatorUserId,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.companyRef,
        e?.companyName,
        e?.companyId,
        e?.workPlaceRef,
        e?.workPlaceName,
        e?.workPlaceId,
        e?.creationTime,
        e?.isDeleted,
        e?.totalInvestmentCapitalRequirement
      ]);

  @override
  bool isValidKey(Object? o) => o is InvestmentPlansRecord;
}
