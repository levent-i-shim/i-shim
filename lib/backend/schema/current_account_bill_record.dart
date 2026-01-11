import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentAccountBillRecord extends FirestoreRecord {
  CurrentAccountBillRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activities" field.
  List<DocumentReference>? _activities;
  List<DocumentReference> get activities => _activities ?? const [];
  bool hasActivities() => _activities != null;

  // "totalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  // "isSideOneSeller" field.
  bool? _isSideOneSeller;
  bool get isSideOneSeller => _isSideOneSeller ?? false;
  bool hasIsSideOneSeller() => _isSideOneSeller != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "expendedDate" field.
  DateTime? _expendedDate;
  DateTime? get expendedDate => _expendedDate;
  bool hasExpendedDate() => _expendedDate != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "totalKdv" field.
  double? _totalKdv;
  double get totalKdv => _totalKdv ?? 0.0;
  bool hasTotalKdv() => _totalKdv != null;

  // "totalTevkifat" field.
  double? _totalTevkifat;
  double get totalTevkifat => _totalTevkifat ?? 0.0;
  bool hasTotalTevkifat() => _totalTevkifat != null;

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

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _activities = getDataList(snapshotData['activities']);
    _totalValue = castToType<double>(snapshotData['totalValue']);
    _isSideOneSeller = snapshotData['isSideOneSeller'] as bool?;
    _isPaid = snapshotData['isPaid'] as bool?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _expendedDate = snapshotData['expendedDate'] as DateTime?;
    _isReject = snapshotData['isReject'] as bool?;
    _totalKdv = castToType<double>(snapshotData['totalKdv']);
    _totalTevkifat = castToType<double>(snapshotData['totalTevkifat']);
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('currentAccountBill')
          : FirebaseFirestore.instance.collectionGroup('currentAccountBill');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('currentAccountBill').doc(id);

  static Stream<CurrentAccountBillRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentAccountBillRecord.fromSnapshot(s));

  static Future<CurrentAccountBillRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CurrentAccountBillRecord.fromSnapshot(s));

  static CurrentAccountBillRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentAccountBillRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentAccountBillRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentAccountBillRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentAccountBillRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentAccountBillRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentAccountBillRecordData({
  double? totalValue,
  bool? isSideOneSeller,
  bool? isPaid,
  bool? isAccept,
  DateTime? createdDate,
  DateTime? expendedDate,
  bool? isReject,
  double? totalKdv,
  double? totalTevkifat,
  DocumentReference? creatorUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'totalValue': totalValue,
      'isSideOneSeller': isSideOneSeller,
      'isPaid': isPaid,
      'isAccept': isAccept,
      'createdDate': createdDate,
      'expendedDate': expendedDate,
      'isReject': isReject,
      'totalKdv': totalKdv,
      'totalTevkifat': totalTevkifat,
      'creatorUserRef': creatorUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurrentAccountBillRecordDocumentEquality
    implements Equality<CurrentAccountBillRecord> {
  const CurrentAccountBillRecordDocumentEquality();

  @override
  bool equals(CurrentAccountBillRecord? e1, CurrentAccountBillRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.activities, e2?.activities) &&
        e1?.totalValue == e2?.totalValue &&
        e1?.isSideOneSeller == e2?.isSideOneSeller &&
        e1?.isPaid == e2?.isPaid &&
        e1?.isAccept == e2?.isAccept &&
        e1?.createdDate == e2?.createdDate &&
        e1?.expendedDate == e2?.expendedDate &&
        e1?.isReject == e2?.isReject &&
        e1?.totalKdv == e2?.totalKdv &&
        e1?.totalTevkifat == e2?.totalTevkifat &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.creatorUserRef == e2?.creatorUserRef;
  }

  @override
  int hash(CurrentAccountBillRecord? e) => const ListEquality().hash([
        e?.activities,
        e?.totalValue,
        e?.isSideOneSeller,
        e?.isPaid,
        e?.isAccept,
        e?.createdDate,
        e?.expendedDate,
        e?.isReject,
        e?.totalKdv,
        e?.totalTevkifat,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.creatorUserRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CurrentAccountBillRecord;
}
