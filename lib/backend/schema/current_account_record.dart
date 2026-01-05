import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentAccountRecord extends FirestoreRecord {
  CurrentAccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sideOneType" field.
  String? _sideOneType;
  String get sideOneType => _sideOneType ?? '';
  bool hasSideOneType() => _sideOneType != null;

  // "sideOneID" field.
  String? _sideOneID;
  String get sideOneID => _sideOneID ?? '';
  bool hasSideOneID() => _sideOneID != null;

  // "sideTwoType" field.
  String? _sideTwoType;
  String get sideTwoType => _sideTwoType ?? '';
  bool hasSideTwoType() => _sideTwoType != null;

  // "sideTwoID" field.
  String? _sideTwoID;
  String get sideTwoID => _sideTwoID ?? '';
  bool hasSideTwoID() => _sideTwoID != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "totalValueForSideOne" field.
  double? _totalValueForSideOne;
  double get totalValueForSideOne => _totalValueForSideOne ?? 0.0;
  bool hasTotalValueForSideOne() => _totalValueForSideOne != null;

  // "totalValueForSideTwo" field.
  double? _totalValueForSideTwo;
  double get totalValueForSideTwo => _totalValueForSideTwo ?? 0.0;
  bool hasTotalValueForSideTwo() => _totalValueForSideTwo != null;

  // "totalBillCount" field.
  int? _totalBillCount;
  int get totalBillCount => _totalBillCount ?? 0;
  bool hasTotalBillCount() => _totalBillCount != null;

  // "totalUnPaidBillCount" field.
  int? _totalUnPaidBillCount;
  int get totalUnPaidBillCount => _totalUnPaidBillCount ?? 0;
  bool hasTotalUnPaidBillCount() => _totalUnPaidBillCount != null;

  // "isAccepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "expandedValueForSideOne" field.
  double? _expandedValueForSideOne;
  double get expandedValueForSideOne => _expandedValueForSideOne ?? 0.0;
  bool hasExpandedValueForSideOne() => _expandedValueForSideOne != null;

  // "expandedValueForTwo" field.
  double? _expandedValueForTwo;
  double get expandedValueForTwo => _expandedValueForTwo ?? 0.0;
  bool hasExpandedValueForTwo() => _expandedValueForTwo != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "sideOneRef" field.
  DocumentReference? _sideOneRef;
  DocumentReference? get sideOneRef => _sideOneRef;
  bool hasSideOneRef() => _sideOneRef != null;

  // "sideOneName" field.
  String? _sideOneName;
  String get sideOneName => _sideOneName ?? '';
  bool hasSideOneName() => _sideOneName != null;

  // "sideTwoRef" field.
  DocumentReference? _sideTwoRef;
  DocumentReference? get sideTwoRef => _sideTwoRef;
  bool hasSideTwoRef() => _sideTwoRef != null;

  // "sideTwoName" field.
  String? _sideTwoName;
  String get sideTwoName => _sideTwoName ?? '';
  bool hasSideTwoName() => _sideTwoName != null;

  // "sideTwoOwnerRef" field.
  DocumentReference? _sideTwoOwnerRef;
  DocumentReference? get sideTwoOwnerRef => _sideTwoOwnerRef;
  bool hasSideTwoOwnerRef() => _sideTwoOwnerRef != null;

  // "sideTwoOwnerName" field.
  String? _sideTwoOwnerName;
  String get sideTwoOwnerName => _sideTwoOwnerName ?? '';
  bool hasSideTwoOwnerName() => _sideTwoOwnerName != null;

  // "sideTwoStamp" field.
  String? _sideTwoStamp;
  String get sideTwoStamp => _sideTwoStamp ?? '';
  bool hasSideTwoStamp() => _sideTwoStamp != null;

  // "sideTwoOwnerPicture" field.
  String? _sideTwoOwnerPicture;
  String get sideTwoOwnerPicture => _sideTwoOwnerPicture ?? '';
  bool hasSideTwoOwnerPicture() => _sideTwoOwnerPicture != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

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

  void _initializeFields() {
    _sideOneType = snapshotData['sideOneType'] as String?;
    _sideOneID = snapshotData['sideOneID'] as String?;
    _sideTwoType = snapshotData['sideTwoType'] as String?;
    _sideTwoID = snapshotData['sideTwoID'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _totalValueForSideOne =
        castToType<double>(snapshotData['totalValueForSideOne']);
    _totalValueForSideTwo =
        castToType<double>(snapshotData['totalValueForSideTwo']);
    _totalBillCount = castToType<int>(snapshotData['totalBillCount']);
    _totalUnPaidBillCount =
        castToType<int>(snapshotData['totalUnPaidBillCount']);
    _isAccepted = snapshotData['isAccepted'] as bool?;
    _expandedValueForSideOne =
        castToType<double>(snapshotData['expandedValueForSideOne']);
    _expandedValueForTwo =
        castToType<double>(snapshotData['expandedValueForTwo']);
    _isReject = snapshotData['isReject'] as bool?;
    _sideOneRef = snapshotData['sideOneRef'] as DocumentReference?;
    _sideOneName = snapshotData['sideOneName'] as String?;
    _sideTwoRef = snapshotData['sideTwoRef'] as DocumentReference?;
    _sideTwoName = snapshotData['sideTwoName'] as String?;
    _sideTwoOwnerRef = snapshotData['sideTwoOwnerRef'] as DocumentReference?;
    _sideTwoOwnerName = snapshotData['sideTwoOwnerName'] as String?;
    _sideTwoStamp = snapshotData['sideTwoStamp'] as String?;
    _sideTwoOwnerPicture = snapshotData['sideTwoOwnerPicture'] as String?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('currentAccount');

  static Stream<CurrentAccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentAccountRecord.fromSnapshot(s));

  static Future<CurrentAccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurrentAccountRecord.fromSnapshot(s));

  static CurrentAccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentAccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentAccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentAccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentAccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentAccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentAccountRecordData({
  String? sideOneType,
  String? sideOneID,
  String? sideTwoType,
  String? sideTwoID,
  DateTime? creationTime,
  bool? status,
  double? totalValueForSideOne,
  double? totalValueForSideTwo,
  int? totalBillCount,
  int? totalUnPaidBillCount,
  bool? isAccepted,
  double? expandedValueForSideOne,
  double? expandedValueForTwo,
  bool? isReject,
  DocumentReference? sideOneRef,
  String? sideOneName,
  DocumentReference? sideTwoRef,
  String? sideTwoName,
  DocumentReference? sideTwoOwnerRef,
  String? sideTwoOwnerName,
  String? sideTwoStamp,
  String? sideTwoOwnerPicture,
  DocumentReference? creatorUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sideOneType': sideOneType,
      'sideOneID': sideOneID,
      'sideTwoType': sideTwoType,
      'sideTwoID': sideTwoID,
      'creationTime': creationTime,
      'status': status,
      'totalValueForSideOne': totalValueForSideOne,
      'totalValueForSideTwo': totalValueForSideTwo,
      'totalBillCount': totalBillCount,
      'totalUnPaidBillCount': totalUnPaidBillCount,
      'isAccepted': isAccepted,
      'expandedValueForSideOne': expandedValueForSideOne,
      'expandedValueForTwo': expandedValueForTwo,
      'isReject': isReject,
      'sideOneRef': sideOneRef,
      'sideOneName': sideOneName,
      'sideTwoRef': sideTwoRef,
      'sideTwoName': sideTwoName,
      'sideTwoOwnerRef': sideTwoOwnerRef,
      'sideTwoOwnerName': sideTwoOwnerName,
      'sideTwoStamp': sideTwoStamp,
      'sideTwoOwnerPicture': sideTwoOwnerPicture,
      'creatorUserRef': creatorUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurrentAccountRecordDocumentEquality
    implements Equality<CurrentAccountRecord> {
  const CurrentAccountRecordDocumentEquality();

  @override
  bool equals(CurrentAccountRecord? e1, CurrentAccountRecord? e2) {
    const listEquality = ListEquality();
    return e1?.sideOneType == e2?.sideOneType &&
        e1?.sideOneID == e2?.sideOneID &&
        e1?.sideTwoType == e2?.sideTwoType &&
        e1?.sideTwoID == e2?.sideTwoID &&
        e1?.creationTime == e2?.creationTime &&
        e1?.status == e2?.status &&
        e1?.totalValueForSideOne == e2?.totalValueForSideOne &&
        e1?.totalValueForSideTwo == e2?.totalValueForSideTwo &&
        e1?.totalBillCount == e2?.totalBillCount &&
        e1?.totalUnPaidBillCount == e2?.totalUnPaidBillCount &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.expandedValueForSideOne == e2?.expandedValueForSideOne &&
        e1?.expandedValueForTwo == e2?.expandedValueForTwo &&
        e1?.isReject == e2?.isReject &&
        e1?.sideOneRef == e2?.sideOneRef &&
        e1?.sideOneName == e2?.sideOneName &&
        e1?.sideTwoRef == e2?.sideTwoRef &&
        e1?.sideTwoName == e2?.sideTwoName &&
        e1?.sideTwoOwnerRef == e2?.sideTwoOwnerRef &&
        e1?.sideTwoOwnerName == e2?.sideTwoOwnerName &&
        e1?.sideTwoStamp == e2?.sideTwoStamp &&
        e1?.sideTwoOwnerPicture == e2?.sideTwoOwnerPicture &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify);
  }

  @override
  int hash(CurrentAccountRecord? e) => const ListEquality().hash([
        e?.sideOneType,
        e?.sideOneID,
        e?.sideTwoType,
        e?.sideTwoID,
        e?.creationTime,
        e?.status,
        e?.totalValueForSideOne,
        e?.totalValueForSideTwo,
        e?.totalBillCount,
        e?.totalUnPaidBillCount,
        e?.isAccepted,
        e?.expandedValueForSideOne,
        e?.expandedValueForTwo,
        e?.isReject,
        e?.sideOneRef,
        e?.sideOneName,
        e?.sideTwoRef,
        e?.sideTwoName,
        e?.sideTwoOwnerRef,
        e?.sideTwoOwnerName,
        e?.sideTwoStamp,
        e?.sideTwoOwnerPicture,
        e?.creatorUserRef,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify
      ]);

  @override
  bool isValidKey(Object? o) => o is CurrentAccountRecord;
}
