import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlacesRecord extends FirestoreRecord {
  WorkPlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "workPlaceLogo" field.
  String? _workPlaceLogo;
  String get workPlaceLogo => _workPlaceLogo ?? '';
  bool hasWorkPlaceLogo() => _workPlaceLogo != null;

  // "workPlaceCreationDate" field.
  DateTime? _workPlaceCreationDate;
  DateTime? get workPlaceCreationDate => _workPlaceCreationDate;
  bool hasWorkPlaceCreationDate() => _workPlaceCreationDate != null;

  // "workPlaceBio" field.
  String? _workPlaceBio;
  String get workPlaceBio => _workPlaceBio ?? '';
  bool hasWorkPlaceBio() => _workPlaceBio != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "partnerships" field.
  List<DocumentReference>? _partnerships;
  List<DocumentReference> get partnerships => _partnerships ?? const [];
  bool hasPartnerships() => _partnerships != null;

  // "yearlyMoney" field.
  double? _yearlyMoney;
  double get yearlyMoney => _yearlyMoney ?? 0.0;
  bool hasYearlyMoney() => _yearlyMoney != null;

  // "totalMoney" field.
  double? _totalMoney;
  double get totalMoney => _totalMoney ?? 0.0;
  bool hasTotalMoney() => _totalMoney != null;

  // "dailyIncome" field.
  double? _dailyIncome;
  double get dailyIncome => _dailyIncome ?? 0.0;
  bool hasDailyIncome() => _dailyIncome != null;

  // "dailyPayment" field.
  double? _dailyPayment;
  double get dailyPayment => _dailyPayment ?? 0.0;
  bool hasDailyPayment() => _dailyPayment != null;

  // "workPlaceType" field.
  WorkPlaceTypes? _workPlaceType;
  WorkPlaceTypes? get workPlaceType => _workPlaceType;
  bool hasWorkPlaceType() => _workPlaceType != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "expenditureAuthorizedOfficers" field.
  List<DocumentReference>? _expenditureAuthorizedOfficers;
  List<DocumentReference> get expenditureAuthorizedOfficers =>
      _expenditureAuthorizedOfficers ?? const [];
  bool hasExpenditureAuthorizedOfficers() =>
      _expenditureAuthorizedOfficers != null;

  // "partners" field.
  List<DocumentReference>? _partners;
  List<DocumentReference> get partners => _partners ?? const [];
  bool hasPartners() => _partners != null;

  // "ExpenditureAuthorizedWorkers" field.
  List<DocumentReference>? _expenditureAuthorizedWorkers;
  List<DocumentReference> get expenditureAuthorizedWorkers =>
      _expenditureAuthorizedWorkers ?? const [];
  bool hasExpenditureAuthorizedWorkers() =>
      _expenditureAuthorizedWorkers != null;

  // "authorizedWorkPlaceEmployeesForWorkers" field.
  List<DocumentReference>? _authorizedWorkPlaceEmployeesForWorkers;
  List<DocumentReference> get authorizedWorkPlaceEmployeesForWorkers =>
      _authorizedWorkPlaceEmployeesForWorkers ?? const [];
  bool hasAuthorizedWorkPlaceEmployeesForWorkers() =>
      _authorizedWorkPlaceEmployeesForWorkers != null;

  // "investedMoneyTotal" field.
  double? _investedMoneyTotal;
  double get investedMoneyTotal => _investedMoneyTotal ?? 0.0;
  bool hasInvestedMoneyTotal() => _investedMoneyTotal != null;

  // "currentPaidToSupplierTotal" field.
  double? _currentPaidToSupplierTotal;
  double get currentPaidToSupplierTotal => _currentPaidToSupplierTotal ?? 0.0;
  bool hasCurrentPaidToSupplierTotal() => _currentPaidToSupplierTotal != null;

  // "currentCollectedFromCustomerTotal" field.
  double? _currentCollectedFromCustomerTotal;
  double get currentCollectedFromCustomerTotal =>
      _currentCollectedFromCustomerTotal ?? 0.0;
  bool hasCurrentCollectedFromCustomerTotal() =>
      _currentCollectedFromCustomerTotal != null;

  // "paidTaxAndSocialSecurityMoneyTotal" field.
  double? _paidTaxAndSocialSecurityMoneyTotal;
  double get paidTaxAndSocialSecurityMoneyTotal =>
      _paidTaxAndSocialSecurityMoneyTotal ?? 0.0;
  bool hasPaidTaxAndSocialSecurityMoneyTotal() =>
      _paidTaxAndSocialSecurityMoneyTotal != null;

  // "paidTaxTotalMoney" field.
  double? _paidTaxTotalMoney;
  double get paidTaxTotalMoney => _paidTaxTotalMoney ?? 0.0;
  bool hasPaidTaxTotalMoney() => _paidTaxTotalMoney != null;

  // "paidSocialSecurityTotalMoney" field.
  double? _paidSocialSecurityTotalMoney;
  double get paidSocialSecurityTotalMoney =>
      _paidSocialSecurityTotalMoney ?? 0.0;
  bool hasPaidSocialSecurityTotalMoney() =>
      _paidSocialSecurityTotalMoney != null;

  // "paidWorkerSalaryTotalMoney" field.
  double? _paidWorkerSalaryTotalMoney;
  double get paidWorkerSalaryTotalMoney => _paidWorkerSalaryTotalMoney ?? 0.0;
  bool hasPaidWorkerSalaryTotalMoney() => _paidWorkerSalaryTotalMoney != null;

  // "paidToSupplierWithoutCurrentTotal" field.
  double? _paidToSupplierWithoutCurrentTotal;
  double get paidToSupplierWithoutCurrentTotal =>
      _paidToSupplierWithoutCurrentTotal ?? 0.0;
  bool hasPaidToSupplierWithoutCurrentTotal() =>
      _paidToSupplierWithoutCurrentTotal != null;

  // "collectedFromCustomerWithoutCurrentTotal" field.
  double? _collectedFromCustomerWithoutCurrentTotal;
  double get collectedFromCustomerWithoutCurrentTotal =>
      _collectedFromCustomerWithoutCurrentTotal ?? 0.0;
  bool hasCollectedFromCustomerWithoutCurrentTotal() =>
      _collectedFromCustomerWithoutCurrentTotal != null;

  // "withdrawnMoneyTotal" field.
  double? _withdrawnMoneyTotal;
  double get withdrawnMoneyTotal => _withdrawnMoneyTotal ?? 0.0;
  bool hasWithdrawnMoneyTotal() => _withdrawnMoneyTotal != null;

  // "workPlaceFinalPerformance" field.
  double? _workPlaceFinalPerformance;
  double get workPlaceFinalPerformance => _workPlaceFinalPerformance ?? 0.0;
  bool hasWorkPlaceFinalPerformance() => _workPlaceFinalPerformance != null;

  // "workPlaceFinalWorth" field.
  double? _workPlaceFinalWorth;
  double get workPlaceFinalWorth => _workPlaceFinalWorth ?? 0.0;
  bool hasWorkPlaceFinalWorth() => _workPlaceFinalWorth != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _country = snapshotData['country'] as String?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _workPlaceLogo = snapshotData['workPlaceLogo'] as String?;
    _workPlaceCreationDate = snapshotData['workPlaceCreationDate'] as DateTime?;
    _workPlaceBio = snapshotData['workPlaceBio'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _partnerships = getDataList(snapshotData['partnerships']);
    _yearlyMoney = castToType<double>(snapshotData['yearlyMoney']);
    _totalMoney = castToType<double>(snapshotData['totalMoney']);
    _dailyIncome = castToType<double>(snapshotData['dailyIncome']);
    _dailyPayment = castToType<double>(snapshotData['dailyPayment']);
    _workPlaceType = snapshotData['workPlaceType'] is WorkPlaceTypes
        ? snapshotData['workPlaceType']
        : deserializeEnum<WorkPlaceTypes>(snapshotData['workPlaceType']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _expenditureAuthorizedOfficers =
        getDataList(snapshotData['expenditureAuthorizedOfficers']);
    _partners = getDataList(snapshotData['partners']);
    _expenditureAuthorizedWorkers =
        getDataList(snapshotData['ExpenditureAuthorizedWorkers']);
    _authorizedWorkPlaceEmployeesForWorkers =
        getDataList(snapshotData['authorizedWorkPlaceEmployeesForWorkers']);
    _investedMoneyTotal =
        castToType<double>(snapshotData['investedMoneyTotal']);
    _currentPaidToSupplierTotal =
        castToType<double>(snapshotData['currentPaidToSupplierTotal']);
    _currentCollectedFromCustomerTotal =
        castToType<double>(snapshotData['currentCollectedFromCustomerTotal']);
    _paidTaxAndSocialSecurityMoneyTotal =
        castToType<double>(snapshotData['paidTaxAndSocialSecurityMoneyTotal']);
    _paidTaxTotalMoney = castToType<double>(snapshotData['paidTaxTotalMoney']);
    _paidSocialSecurityTotalMoney =
        castToType<double>(snapshotData['paidSocialSecurityTotalMoney']);
    _paidWorkerSalaryTotalMoney =
        castToType<double>(snapshotData['paidWorkerSalaryTotalMoney']);
    _paidToSupplierWithoutCurrentTotal =
        castToType<double>(snapshotData['paidToSupplierWithoutCurrentTotal']);
    _collectedFromCustomerWithoutCurrentTotal = castToType<double>(
        snapshotData['collectedFromCustomerWithoutCurrentTotal']);
    _withdrawnMoneyTotal =
        castToType<double>(snapshotData['withdrawnMoneyTotal']);
    _workPlaceFinalPerformance =
        castToType<double>(snapshotData['workPlaceFinalPerformance']);
    _workPlaceFinalWorth =
        castToType<double>(snapshotData['workPlaceFinalWorth']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workPlaces');

  static Stream<WorkPlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlacesRecord.fromSnapshot(s));

  static Future<WorkPlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlacesRecord.fromSnapshot(s));

  static WorkPlacesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlacesRecordData({
  String? name,
  DocumentReference? owner,
  String? country,
  String? state,
  String? city,
  String? type,
  String? status,
  DocumentReference? companyRef,
  String? workPlaceLogo,
  DateTime? workPlaceCreationDate,
  String? workPlaceBio,
  bool? isDelete,
  double? yearlyMoney,
  double? totalMoney,
  double? dailyIncome,
  double? dailyPayment,
  WorkPlaceTypes? workPlaceType,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? investedMoneyTotal,
  double? currentPaidToSupplierTotal,
  double? currentCollectedFromCustomerTotal,
  double? paidTaxAndSocialSecurityMoneyTotal,
  double? paidTaxTotalMoney,
  double? paidSocialSecurityTotalMoney,
  double? paidWorkerSalaryTotalMoney,
  double? paidToSupplierWithoutCurrentTotal,
  double? collectedFromCustomerWithoutCurrentTotal,
  double? withdrawnMoneyTotal,
  double? workPlaceFinalPerformance,
  double? workPlaceFinalWorth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner': owner,
      'country': country,
      'state': state,
      'city': city,
      'type': type,
      'status': status,
      'companyRef': companyRef,
      'workPlaceLogo': workPlaceLogo,
      'workPlaceCreationDate': workPlaceCreationDate,
      'workPlaceBio': workPlaceBio,
      'isDelete': isDelete,
      'yearlyMoney': yearlyMoney,
      'totalMoney': totalMoney,
      'dailyIncome': dailyIncome,
      'dailyPayment': dailyPayment,
      'workPlaceType': workPlaceType,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'investedMoneyTotal': investedMoneyTotal,
      'currentPaidToSupplierTotal': currentPaidToSupplierTotal,
      'currentCollectedFromCustomerTotal': currentCollectedFromCustomerTotal,
      'paidTaxAndSocialSecurityMoneyTotal': paidTaxAndSocialSecurityMoneyTotal,
      'paidTaxTotalMoney': paidTaxTotalMoney,
      'paidSocialSecurityTotalMoney': paidSocialSecurityTotalMoney,
      'paidWorkerSalaryTotalMoney': paidWorkerSalaryTotalMoney,
      'paidToSupplierWithoutCurrentTotal': paidToSupplierWithoutCurrentTotal,
      'collectedFromCustomerWithoutCurrentTotal':
          collectedFromCustomerWithoutCurrentTotal,
      'withdrawnMoneyTotal': withdrawnMoneyTotal,
      'workPlaceFinalPerformance': workPlaceFinalPerformance,
      'workPlaceFinalWorth': workPlaceFinalWorth,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlacesRecordDocumentEquality implements Equality<WorkPlacesRecord> {
  const WorkPlacesRecordDocumentEquality();

  @override
  bool equals(WorkPlacesRecord? e1, WorkPlacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.owner == e2?.owner &&
        e1?.country == e2?.country &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.companyRef == e2?.companyRef &&
        e1?.workPlaceLogo == e2?.workPlaceLogo &&
        e1?.workPlaceCreationDate == e2?.workPlaceCreationDate &&
        e1?.workPlaceBio == e2?.workPlaceBio &&
        e1?.isDelete == e2?.isDelete &&
        listEquality.equals(e1?.partnerships, e2?.partnerships) &&
        e1?.yearlyMoney == e2?.yearlyMoney &&
        e1?.totalMoney == e2?.totalMoney &&
        e1?.dailyIncome == e2?.dailyIncome &&
        e1?.dailyPayment == e2?.dailyPayment &&
        e1?.workPlaceType == e2?.workPlaceType &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.expenditureAuthorizedOfficers,
            e2?.expenditureAuthorizedOfficers) &&
        listEquality.equals(e1?.partners, e2?.partners) &&
        listEquality.equals(e1?.expenditureAuthorizedWorkers,
            e2?.expenditureAuthorizedWorkers) &&
        listEquality.equals(e1?.authorizedWorkPlaceEmployeesForWorkers,
            e2?.authorizedWorkPlaceEmployeesForWorkers) &&
        e1?.investedMoneyTotal == e2?.investedMoneyTotal &&
        e1?.currentPaidToSupplierTotal == e2?.currentPaidToSupplierTotal &&
        e1?.currentCollectedFromCustomerTotal ==
            e2?.currentCollectedFromCustomerTotal &&
        e1?.paidTaxAndSocialSecurityMoneyTotal ==
            e2?.paidTaxAndSocialSecurityMoneyTotal &&
        e1?.paidTaxTotalMoney == e2?.paidTaxTotalMoney &&
        e1?.paidSocialSecurityTotalMoney == e2?.paidSocialSecurityTotalMoney &&
        e1?.paidWorkerSalaryTotalMoney == e2?.paidWorkerSalaryTotalMoney &&
        e1?.paidToSupplierWithoutCurrentTotal ==
            e2?.paidToSupplierWithoutCurrentTotal &&
        e1?.collectedFromCustomerWithoutCurrentTotal ==
            e2?.collectedFromCustomerWithoutCurrentTotal &&
        e1?.withdrawnMoneyTotal == e2?.withdrawnMoneyTotal &&
        e1?.workPlaceFinalPerformance == e2?.workPlaceFinalPerformance &&
        e1?.workPlaceFinalWorth == e2?.workPlaceFinalWorth;
  }

  @override
  int hash(WorkPlacesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.owner,
        e?.country,
        e?.state,
        e?.city,
        e?.type,
        e?.status,
        e?.companyRef,
        e?.workPlaceLogo,
        e?.workPlaceCreationDate,
        e?.workPlaceBio,
        e?.isDelete,
        e?.partnerships,
        e?.yearlyMoney,
        e?.totalMoney,
        e?.dailyIncome,
        e?.dailyPayment,
        e?.workPlaceType,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.expenditureAuthorizedOfficers,
        e?.partners,
        e?.expenditureAuthorizedWorkers,
        e?.authorizedWorkPlaceEmployeesForWorkers,
        e?.investedMoneyTotal,
        e?.currentPaidToSupplierTotal,
        e?.currentCollectedFromCustomerTotal,
        e?.paidTaxAndSocialSecurityMoneyTotal,
        e?.paidTaxTotalMoney,
        e?.paidSocialSecurityTotalMoney,
        e?.paidWorkerSalaryTotalMoney,
        e?.paidToSupplierWithoutCurrentTotal,
        e?.collectedFromCustomerWithoutCurrentTotal,
        e?.withdrawnMoneyTotal,
        e?.workPlaceFinalPerformance,
        e?.workPlaceFinalWorth
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlacesRecord;
}
