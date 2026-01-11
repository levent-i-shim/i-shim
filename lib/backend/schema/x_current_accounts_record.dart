import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class XCurrentAccountsRecord extends FirestoreRecord {
  XCurrentAccountsRecord._(
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

  // "creatorUserName" field.
  String? _creatorUserName;
  String get creatorUserName => _creatorUserName ?? '';
  bool hasCreatorUserName() => _creatorUserName != null;

  // "creatorUserId" field.
  String? _creatorUserId;
  String get creatorUserId => _creatorUserId ?? '';
  bool hasCreatorUserId() => _creatorUserId != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "supplierName" field.
  String? _supplierName;
  String get supplierName => _supplierName ?? '';
  bool hasSupplierName() => _supplierName != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "isThisAMixedCurrent" field.
  bool? _isThisAMixedCurrent;
  bool get isThisAMixedCurrent => _isThisAMixedCurrent ?? false;
  bool hasIsThisAMixedCurrent() => _isThisAMixedCurrent != null;

  // "sideOneName" field.
  String? _sideOneName;
  String get sideOneName => _sideOneName ?? '';
  bool hasSideOneName() => _sideOneName != null;

  // "sideTwoName" field.
  String? _sideTwoName;
  String get sideTwoName => _sideTwoName ?? '';
  bool hasSideTwoName() => _sideTwoName != null;

  // "isSideOnePerson" field.
  bool? _isSideOnePerson;
  bool get isSideOnePerson => _isSideOnePerson ?? false;
  bool hasIsSideOnePerson() => _isSideOnePerson != null;

  // "isSideTwoPerson" field.
  bool? _isSideTwoPerson;
  bool get isSideTwoPerson => _isSideTwoPerson ?? false;
  bool hasIsSideTwoPerson() => _isSideTwoPerson != null;

  // "isSideOneWorkPlace" field.
  bool? _isSideOneWorkPlace;
  bool get isSideOneWorkPlace => _isSideOneWorkPlace ?? false;
  bool hasIsSideOneWorkPlace() => _isSideOneWorkPlace != null;

  // "isSideTwoWorkPlace" field.
  bool? _isSideTwoWorkPlace;
  bool get isSideTwoWorkPlace => _isSideTwoWorkPlace ?? false;
  bool hasIsSideTwoWorkPlace() => _isSideTwoWorkPlace != null;

  // "isSideOneCompany" field.
  bool? _isSideOneCompany;
  bool get isSideOneCompany => _isSideOneCompany ?? false;
  bool hasIsSideOneCompany() => _isSideOneCompany != null;

  // "isSideTwoCompany" field.
  bool? _isSideTwoCompany;
  bool get isSideTwoCompany => _isSideTwoCompany ?? false;
  bool hasIsSideTwoCompany() => _isSideTwoCompany != null;

  // "sideOnePersonUserRef" field.
  DocumentReference? _sideOnePersonUserRef;
  DocumentReference? get sideOnePersonUserRef => _sideOnePersonUserRef;
  bool hasSideOnePersonUserRef() => _sideOnePersonUserRef != null;

  // "sideTwoPersonUserRef" field.
  DocumentReference? _sideTwoPersonUserRef;
  DocumentReference? get sideTwoPersonUserRef => _sideTwoPersonUserRef;
  bool hasSideTwoPersonUserRef() => _sideTwoPersonUserRef != null;

  // "sideOneWorkPlaceRef" field.
  DocumentReference? _sideOneWorkPlaceRef;
  DocumentReference? get sideOneWorkPlaceRef => _sideOneWorkPlaceRef;
  bool hasSideOneWorkPlaceRef() => _sideOneWorkPlaceRef != null;

  // "sideTwoWorkPlaceRef" field.
  DocumentReference? _sideTwoWorkPlaceRef;
  DocumentReference? get sideTwoWorkPlaceRef => _sideTwoWorkPlaceRef;
  bool hasSideTwoWorkPlaceRef() => _sideTwoWorkPlaceRef != null;

  // "sideOneCompanyRef" field.
  DocumentReference? _sideOneCompanyRef;
  DocumentReference? get sideOneCompanyRef => _sideOneCompanyRef;
  bool hasSideOneCompanyRef() => _sideOneCompanyRef != null;

  // "sideTwoCompanyRef" field.
  DocumentReference? _sideTwoCompanyRef;
  DocumentReference? get sideTwoCompanyRef => _sideTwoCompanyRef;
  bool hasSideTwoCompanyRef() => _sideTwoCompanyRef != null;

  // "currentNameGivenBySupplier" field.
  String? _currentNameGivenBySupplier;
  String get currentNameGivenBySupplier => _currentNameGivenBySupplier ?? '';
  bool hasCurrentNameGivenBySupplier() => _currentNameGivenBySupplier != null;

  // "currentNameGivenByCustomer" field.
  String? _currentNameGivenByCustomer;
  String get currentNameGivenByCustomer => _currentNameGivenByCustomer ?? '';
  bool hasCurrentNameGivenByCustomer() => _currentNameGivenByCustomer != null;

  // "sideOneCompanyOwner" field.
  DocumentReference? _sideOneCompanyOwner;
  DocumentReference? get sideOneCompanyOwner => _sideOneCompanyOwner;
  bool hasSideOneCompanyOwner() => _sideOneCompanyOwner != null;

  // "sideTwoCompanyOwner" field.
  DocumentReference? _sideTwoCompanyOwner;
  DocumentReference? get sideTwoCompanyOwner => _sideTwoCompanyOwner;
  bool hasSideTwoCompanyOwner() => _sideTwoCompanyOwner != null;

  // "sideOneCompanyPartners" field.
  List<DocumentReference>? _sideOneCompanyPartners;
  List<DocumentReference> get sideOneCompanyPartners =>
      _sideOneCompanyPartners ?? const [];
  bool hasSideOneCompanyPartners() => _sideOneCompanyPartners != null;

  // "sideTwoCompanyPartners" field.
  List<DocumentReference>? _sideTwoCompanyPartners;
  List<DocumentReference> get sideTwoCompanyPartners =>
      _sideTwoCompanyPartners ?? const [];
  bool hasSideTwoCompanyPartners() => _sideTwoCompanyPartners != null;

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
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _creatorUserId = snapshotData['creatorUserId'] as String?;
    _customerName = snapshotData['customerName'] as String?;
    _supplierName = snapshotData['supplierName'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _isThisAMixedCurrent = snapshotData['isThisAMixedCurrent'] as bool?;
    _sideOneName = snapshotData['sideOneName'] as String?;
    _sideTwoName = snapshotData['sideTwoName'] as String?;
    _isSideOnePerson = snapshotData['isSideOnePerson'] as bool?;
    _isSideTwoPerson = snapshotData['isSideTwoPerson'] as bool?;
    _isSideOneWorkPlace = snapshotData['isSideOneWorkPlace'] as bool?;
    _isSideTwoWorkPlace = snapshotData['isSideTwoWorkPlace'] as bool?;
    _isSideOneCompany = snapshotData['isSideOneCompany'] as bool?;
    _isSideTwoCompany = snapshotData['isSideTwoCompany'] as bool?;
    _sideOnePersonUserRef =
        snapshotData['sideOnePersonUserRef'] as DocumentReference?;
    _sideTwoPersonUserRef =
        snapshotData['sideTwoPersonUserRef'] as DocumentReference?;
    _sideOneWorkPlaceRef =
        snapshotData['sideOneWorkPlaceRef'] as DocumentReference?;
    _sideTwoWorkPlaceRef =
        snapshotData['sideTwoWorkPlaceRef'] as DocumentReference?;
    _sideOneCompanyRef =
        snapshotData['sideOneCompanyRef'] as DocumentReference?;
    _sideTwoCompanyRef =
        snapshotData['sideTwoCompanyRef'] as DocumentReference?;
    _currentNameGivenBySupplier =
        snapshotData['currentNameGivenBySupplier'] as String?;
    _currentNameGivenByCustomer =
        snapshotData['currentNameGivenByCustomer'] as String?;
    _sideOneCompanyOwner =
        snapshotData['sideOneCompanyOwner'] as DocumentReference?;
    _sideTwoCompanyOwner =
        snapshotData['sideTwoCompanyOwner'] as DocumentReference?;
    _sideOneCompanyPartners =
        getDataList(snapshotData['sideOneCompanyPartners']);
    _sideTwoCompanyPartners =
        getDataList(snapshotData['sideTwoCompanyPartners']);
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('xCurrentAccounts');

  static Stream<XCurrentAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => XCurrentAccountsRecord.fromSnapshot(s));

  static Future<XCurrentAccountsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => XCurrentAccountsRecord.fromSnapshot(s));

  static XCurrentAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      XCurrentAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static XCurrentAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      XCurrentAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'XCurrentAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is XCurrentAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createXCurrentAccountsRecordData({
  DateTime? creationTime,
  DocumentReference? creatorUserRef,
  String? creatorUserName,
  String? creatorUserId,
  String? customerName,
  String? supplierName,
  bool? isDeleted,
  bool? isThisAMixedCurrent,
  String? sideOneName,
  String? sideTwoName,
  bool? isSideOnePerson,
  bool? isSideTwoPerson,
  bool? isSideOneWorkPlace,
  bool? isSideTwoWorkPlace,
  bool? isSideOneCompany,
  bool? isSideTwoCompany,
  DocumentReference? sideOnePersonUserRef,
  DocumentReference? sideTwoPersonUserRef,
  DocumentReference? sideOneWorkPlaceRef,
  DocumentReference? sideTwoWorkPlaceRef,
  DocumentReference? sideOneCompanyRef,
  DocumentReference? sideTwoCompanyRef,
  String? currentNameGivenBySupplier,
  String? currentNameGivenByCustomer,
  DocumentReference? sideOneCompanyOwner,
  DocumentReference? sideTwoCompanyOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creationTime': creationTime,
      'creatorUserRef': creatorUserRef,
      'creatorUserName': creatorUserName,
      'creatorUserId': creatorUserId,
      'customerName': customerName,
      'supplierName': supplierName,
      'isDeleted': isDeleted,
      'isThisAMixedCurrent': isThisAMixedCurrent,
      'sideOneName': sideOneName,
      'sideTwoName': sideTwoName,
      'isSideOnePerson': isSideOnePerson,
      'isSideTwoPerson': isSideTwoPerson,
      'isSideOneWorkPlace': isSideOneWorkPlace,
      'isSideTwoWorkPlace': isSideTwoWorkPlace,
      'isSideOneCompany': isSideOneCompany,
      'isSideTwoCompany': isSideTwoCompany,
      'sideOnePersonUserRef': sideOnePersonUserRef,
      'sideTwoPersonUserRef': sideTwoPersonUserRef,
      'sideOneWorkPlaceRef': sideOneWorkPlaceRef,
      'sideTwoWorkPlaceRef': sideTwoWorkPlaceRef,
      'sideOneCompanyRef': sideOneCompanyRef,
      'sideTwoCompanyRef': sideTwoCompanyRef,
      'currentNameGivenBySupplier': currentNameGivenBySupplier,
      'currentNameGivenByCustomer': currentNameGivenByCustomer,
      'sideOneCompanyOwner': sideOneCompanyOwner,
      'sideTwoCompanyOwner': sideTwoCompanyOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class XCurrentAccountsRecordDocumentEquality
    implements Equality<XCurrentAccountsRecord> {
  const XCurrentAccountsRecordDocumentEquality();

  @override
  bool equals(XCurrentAccountsRecord? e1, XCurrentAccountsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creationTime == e2?.creationTime &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.creatorUserId == e2?.creatorUserId &&
        e1?.customerName == e2?.customerName &&
        e1?.supplierName == e2?.supplierName &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.isThisAMixedCurrent == e2?.isThisAMixedCurrent &&
        e1?.sideOneName == e2?.sideOneName &&
        e1?.sideTwoName == e2?.sideTwoName &&
        e1?.isSideOnePerson == e2?.isSideOnePerson &&
        e1?.isSideTwoPerson == e2?.isSideTwoPerson &&
        e1?.isSideOneWorkPlace == e2?.isSideOneWorkPlace &&
        e1?.isSideTwoWorkPlace == e2?.isSideTwoWorkPlace &&
        e1?.isSideOneCompany == e2?.isSideOneCompany &&
        e1?.isSideTwoCompany == e2?.isSideTwoCompany &&
        e1?.sideOnePersonUserRef == e2?.sideOnePersonUserRef &&
        e1?.sideTwoPersonUserRef == e2?.sideTwoPersonUserRef &&
        e1?.sideOneWorkPlaceRef == e2?.sideOneWorkPlaceRef &&
        e1?.sideTwoWorkPlaceRef == e2?.sideTwoWorkPlaceRef &&
        e1?.sideOneCompanyRef == e2?.sideOneCompanyRef &&
        e1?.sideTwoCompanyRef == e2?.sideTwoCompanyRef &&
        e1?.currentNameGivenBySupplier == e2?.currentNameGivenBySupplier &&
        e1?.currentNameGivenByCustomer == e2?.currentNameGivenByCustomer &&
        e1?.sideOneCompanyOwner == e2?.sideOneCompanyOwner &&
        e1?.sideTwoCompanyOwner == e2?.sideTwoCompanyOwner &&
        listEquality.equals(
            e1?.sideOneCompanyPartners, e2?.sideOneCompanyPartners) &&
        listEquality.equals(
            e1?.sideTwoCompanyPartners, e2?.sideTwoCompanyPartners) &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify);
  }

  @override
  int hash(XCurrentAccountsRecord? e) => const ListEquality().hash([
        e?.creationTime,
        e?.creatorUserRef,
        e?.creatorUserName,
        e?.creatorUserId,
        e?.customerName,
        e?.supplierName,
        e?.isDeleted,
        e?.isThisAMixedCurrent,
        e?.sideOneName,
        e?.sideTwoName,
        e?.isSideOnePerson,
        e?.isSideTwoPerson,
        e?.isSideOneWorkPlace,
        e?.isSideTwoWorkPlace,
        e?.isSideOneCompany,
        e?.isSideTwoCompany,
        e?.sideOnePersonUserRef,
        e?.sideTwoPersonUserRef,
        e?.sideOneWorkPlaceRef,
        e?.sideTwoWorkPlaceRef,
        e?.sideOneCompanyRef,
        e?.sideTwoCompanyRef,
        e?.currentNameGivenBySupplier,
        e?.currentNameGivenByCustomer,
        e?.sideOneCompanyOwner,
        e?.sideTwoCompanyOwner,
        e?.sideOneCompanyPartners,
        e?.sideTwoCompanyPartners,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify
      ]);

  @override
  bool isValidKey(Object? o) => o is XCurrentAccountsRecord;
}
