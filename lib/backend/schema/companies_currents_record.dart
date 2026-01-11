import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesCurrentsRecord extends FirestoreRecord {
  CompaniesCurrentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "refCompanyId" field.
  String? _refCompanyId;
  String get refCompanyId => _refCompanyId ?? '';
  bool hasRefCompanyId() => _refCompanyId != null;

  // "refCompanyName" field.
  String? _refCompanyName;
  String get refCompanyName => _refCompanyName ?? '';
  bool hasRefCompanyName() => _refCompanyName != null;

  // "currentAccountMainCollectionDocRef" field.
  DocumentReference? _currentAccountMainCollectionDocRef;
  DocumentReference? get currentAccountMainCollectionDocRef =>
      _currentAccountMainCollectionDocRef;
  bool hasCurrentAccountMainCollectionDocRef() =>
      _currentAccountMainCollectionDocRef != null;

  // "currentAccountMainCollectionDocId" field.
  String? _currentAccountMainCollectionDocId;
  String get currentAccountMainCollectionDocId =>
      _currentAccountMainCollectionDocId ?? '';
  bool hasCurrentAccountMainCollectionDocId() =>
      _currentAccountMainCollectionDocId != null;

  // "counterpartyType" field.
  String? _counterpartyType;
  String get counterpartyType => _counterpartyType ?? '';
  bool hasCounterpartyType() => _counterpartyType != null;

  // "counterpartyUserRef" field.
  DocumentReference? _counterpartyUserRef;
  DocumentReference? get counterpartyUserRef => _counterpartyUserRef;
  bool hasCounterpartyUserRef() => _counterpartyUserRef != null;

  // "counterpartyUserId" field.
  String? _counterpartyUserId;
  String get counterpartyUserId => _counterpartyUserId ?? '';
  bool hasCounterpartyUserId() => _counterpartyUserId != null;

  // "counterpartyUserName" field.
  String? _counterpartyUserName;
  String get counterpartyUserName => _counterpartyUserName ?? '';
  bool hasCounterpartyUserName() => _counterpartyUserName != null;

  // "counterpartyCompaniesRef" field.
  DocumentReference? _counterpartyCompaniesRef;
  DocumentReference? get counterpartyCompaniesRef => _counterpartyCompaniesRef;
  bool hasCounterpartyCompaniesRef() => _counterpartyCompaniesRef != null;

  // "counterpartyCompaniesId" field.
  String? _counterpartyCompaniesId;
  String get counterpartyCompaniesId => _counterpartyCompaniesId ?? '';
  bool hasCounterpartyCompaniesId() => _counterpartyCompaniesId != null;

  // "counterpartyCompaniesName" field.
  String? _counterpartyCompaniesName;
  String get counterpartyCompaniesName => _counterpartyCompaniesName ?? '';
  bool hasCounterpartyCompaniesName() => _counterpartyCompaniesName != null;

  // "companyPartners" field.
  List<DocumentReference>? _companyPartners;
  List<DocumentReference> get companyPartners => _companyPartners ?? const [];
  bool hasCompanyPartners() => _companyPartners != null;

  // "counterpartyStampPdfUrl" field.
  String? _counterpartyStampPdfUrl;
  String get counterpartyStampPdfUrl => _counterpartyStampPdfUrl ?? '';
  bool hasCounterpartyStampPdfUrl() => _counterpartyStampPdfUrl != null;

  // "counterpartyStampImageUrl" field.
  String? _counterpartyStampImageUrl;
  String get counterpartyStampImageUrl => _counterpartyStampImageUrl ?? '';
  bool hasCounterpartyStampImageUrl() => _counterpartyStampImageUrl != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "supplierOrCustomer" field.
  String? _supplierOrCustomer;
  String get supplierOrCustomer => _supplierOrCustomer ?? '';
  bool hasSupplierOrCustomer() => _supplierOrCustomer != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  // "creatorUserName" field.
  String? _creatorUserName;
  String get creatorUserName => _creatorUserName ?? '';
  bool hasCreatorUserName() => _creatorUserName != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "workPlaceId" field.
  String? _workPlaceId;
  String get workPlaceId => _workPlaceId ?? '';
  bool hasWorkPlaceId() => _workPlaceId != null;

  // "WorkPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "supplierPersonName" field.
  String? _supplierPersonName;
  String get supplierPersonName => _supplierPersonName ?? '';
  bool hasSupplierPersonName() => _supplierPersonName != null;

  // "supplierCompanyName" field.
  String? _supplierCompanyName;
  String get supplierCompanyName => _supplierCompanyName ?? '';
  bool hasSupplierCompanyName() => _supplierCompanyName != null;

  // "customerPersonName" field.
  String? _customerPersonName;
  String get customerPersonName => _customerPersonName ?? '';
  bool hasCustomerPersonName() => _customerPersonName != null;

  // "customerCompanyName" field.
  String? _customerCompanyName;
  String get customerCompanyName => _customerCompanyName ?? '';
  bool hasCustomerCompanyName() => _customerCompanyName != null;

  // "personOrCompany" field.
  String? _personOrCompany;
  String get personOrCompany => _personOrCompany ?? '';
  bool hasPersonOrCompany() => _personOrCompany != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _refCompanyId = snapshotData['refCompanyId'] as String?;
    _refCompanyName = snapshotData['refCompanyName'] as String?;
    _currentAccountMainCollectionDocRef =
        snapshotData['currentAccountMainCollectionDocRef']
            as DocumentReference?;
    _currentAccountMainCollectionDocId =
        snapshotData['currentAccountMainCollectionDocId'] as String?;
    _counterpartyType = snapshotData['counterpartyType'] as String?;
    _counterpartyUserRef =
        snapshotData['counterpartyUserRef'] as DocumentReference?;
    _counterpartyUserId = snapshotData['counterpartyUserId'] as String?;
    _counterpartyUserName = snapshotData['counterpartyUserName'] as String?;
    _counterpartyCompaniesRef =
        snapshotData['counterpartyCompaniesRef'] as DocumentReference?;
    _counterpartyCompaniesId =
        snapshotData['counterpartyCompaniesId'] as String?;
    _counterpartyCompaniesName =
        snapshotData['counterpartyCompaniesName'] as String?;
    _companyPartners = getDataList(snapshotData['companyPartners']);
    _counterpartyStampPdfUrl =
        snapshotData['counterpartyStampPdfUrl'] as String?;
    _counterpartyStampImageUrl =
        snapshotData['counterpartyStampImageUrl'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _supplierOrCustomer = snapshotData['supplierOrCustomer'] as String?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _workPlaceName = snapshotData['WorkPlaceName'] as String?;
    _supplierPersonName = snapshotData['supplierPersonName'] as String?;
    _supplierCompanyName = snapshotData['supplierCompanyName'] as String?;
    _customerPersonName = snapshotData['customerPersonName'] as String?;
    _customerCompanyName = snapshotData['customerCompanyName'] as String?;
    _personOrCompany = snapshotData['personOrCompany'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companiesCurrents')
          : FirebaseFirestore.instance.collectionGroup('companiesCurrents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companiesCurrents').doc(id);

  static Stream<CompaniesCurrentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesCurrentsRecord.fromSnapshot(s));

  static Future<CompaniesCurrentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompaniesCurrentsRecord.fromSnapshot(s));

  static CompaniesCurrentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesCurrentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesCurrentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesCurrentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesCurrentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesCurrentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesCurrentsRecordData({
  DocumentReference? companyRef,
  String? refCompanyId,
  String? refCompanyName,
  DocumentReference? currentAccountMainCollectionDocRef,
  String? currentAccountMainCollectionDocId,
  String? counterpartyType,
  DocumentReference? counterpartyUserRef,
  String? counterpartyUserId,
  String? counterpartyUserName,
  DocumentReference? counterpartyCompaniesRef,
  String? counterpartyCompaniesId,
  String? counterpartyCompaniesName,
  String? counterpartyStampPdfUrl,
  String? counterpartyStampImageUrl,
  DateTime? creationTime,
  String? content,
  String? supplierOrCustomer,
  DocumentReference? creatorUserRef,
  String? creatorUserName,
  DocumentReference? workPlaceRef,
  String? workPlaceId,
  String? workPlaceName,
  String? supplierPersonName,
  String? supplierCompanyName,
  String? customerPersonName,
  String? customerCompanyName,
  String? personOrCompany,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyRef': companyRef,
      'refCompanyId': refCompanyId,
      'refCompanyName': refCompanyName,
      'currentAccountMainCollectionDocRef': currentAccountMainCollectionDocRef,
      'currentAccountMainCollectionDocId': currentAccountMainCollectionDocId,
      'counterpartyType': counterpartyType,
      'counterpartyUserRef': counterpartyUserRef,
      'counterpartyUserId': counterpartyUserId,
      'counterpartyUserName': counterpartyUserName,
      'counterpartyCompaniesRef': counterpartyCompaniesRef,
      'counterpartyCompaniesId': counterpartyCompaniesId,
      'counterpartyCompaniesName': counterpartyCompaniesName,
      'counterpartyStampPdfUrl': counterpartyStampPdfUrl,
      'counterpartyStampImageUrl': counterpartyStampImageUrl,
      'creationTime': creationTime,
      'content': content,
      'supplierOrCustomer': supplierOrCustomer,
      'creatorUserRef': creatorUserRef,
      'creatorUserName': creatorUserName,
      'workPlaceRef': workPlaceRef,
      'workPlaceId': workPlaceId,
      'WorkPlaceName': workPlaceName,
      'supplierPersonName': supplierPersonName,
      'supplierCompanyName': supplierCompanyName,
      'customerPersonName': customerPersonName,
      'customerCompanyName': customerCompanyName,
      'personOrCompany': personOrCompany,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesCurrentsRecordDocumentEquality
    implements Equality<CompaniesCurrentsRecord> {
  const CompaniesCurrentsRecordDocumentEquality();

  @override
  bool equals(CompaniesCurrentsRecord? e1, CompaniesCurrentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyRef == e2?.companyRef &&
        e1?.refCompanyId == e2?.refCompanyId &&
        e1?.refCompanyName == e2?.refCompanyName &&
        e1?.currentAccountMainCollectionDocRef ==
            e2?.currentAccountMainCollectionDocRef &&
        e1?.currentAccountMainCollectionDocId ==
            e2?.currentAccountMainCollectionDocId &&
        e1?.counterpartyType == e2?.counterpartyType &&
        e1?.counterpartyUserRef == e2?.counterpartyUserRef &&
        e1?.counterpartyUserId == e2?.counterpartyUserId &&
        e1?.counterpartyUserName == e2?.counterpartyUserName &&
        e1?.counterpartyCompaniesRef == e2?.counterpartyCompaniesRef &&
        e1?.counterpartyCompaniesId == e2?.counterpartyCompaniesId &&
        e1?.counterpartyCompaniesName == e2?.counterpartyCompaniesName &&
        listEquality.equals(e1?.companyPartners, e2?.companyPartners) &&
        e1?.counterpartyStampPdfUrl == e2?.counterpartyStampPdfUrl &&
        e1?.counterpartyStampImageUrl == e2?.counterpartyStampImageUrl &&
        e1?.creationTime == e2?.creationTime &&
        e1?.content == e2?.content &&
        e1?.supplierOrCustomer == e2?.supplierOrCustomer &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.supplierPersonName == e2?.supplierPersonName &&
        e1?.supplierCompanyName == e2?.supplierCompanyName &&
        e1?.customerPersonName == e2?.customerPersonName &&
        e1?.customerCompanyName == e2?.customerCompanyName &&
        e1?.personOrCompany == e2?.personOrCompany;
  }

  @override
  int hash(CompaniesCurrentsRecord? e) => const ListEquality().hash([
        e?.companyRef,
        e?.refCompanyId,
        e?.refCompanyName,
        e?.currentAccountMainCollectionDocRef,
        e?.currentAccountMainCollectionDocId,
        e?.counterpartyType,
        e?.counterpartyUserRef,
        e?.counterpartyUserId,
        e?.counterpartyUserName,
        e?.counterpartyCompaniesRef,
        e?.counterpartyCompaniesId,
        e?.counterpartyCompaniesName,
        e?.companyPartners,
        e?.counterpartyStampPdfUrl,
        e?.counterpartyStampImageUrl,
        e?.creationTime,
        e?.content,
        e?.supplierOrCustomer,
        e?.creatorUserRef,
        e?.creatorUserName,
        e?.workPlaceRef,
        e?.workPlaceId,
        e?.workPlaceName,
        e?.supplierPersonName,
        e?.supplierCompanyName,
        e?.customerPersonName,
        e?.customerCompanyName,
        e?.personOrCompany
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesCurrentsRecord;
}
