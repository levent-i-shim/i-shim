import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "partners" field.
  List<DocumentReference>? _partners;
  List<DocumentReference> get partners => _partners ?? const [];
  bool hasPartners() => _partners != null;

  // "companyBio" field.
  String? _companyBio;
  String get companyBio => _companyBio ?? '';
  bool hasCompanyBio() => _companyBio != null;

  // "companyLogo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  bool hasCompanyLogo() => _companyLogo != null;

  // "companyCreationDate" field.
  DateTime? _companyCreationDate;
  DateTime? get companyCreationDate => _companyCreationDate;
  bool hasCompanyCreationDate() => _companyCreationDate != null;

  // "totalMoney" field.
  double? _totalMoney;
  double get totalMoney => _totalMoney ?? 0.0;
  bool hasTotalMoney() => _totalMoney != null;

  // "yearlyMoney" field.
  double? _yearlyMoney;
  double get yearlyMoney => _yearlyMoney ?? 0.0;
  bool hasYearlyMoney() => _yearlyMoney != null;

  // "partnerships" field.
  List<DocumentReference>? _partnerships;
  List<DocumentReference> get partnerships => _partnerships ?? const [];
  bool hasPartnerships() => _partnerships != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "headOffice" field.
  DocumentReference? _headOffice;
  DocumentReference? get headOffice => _headOffice;
  bool hasHeadOffice() => _headOffice != null;

  // "dailyIncome" field.
  double? _dailyIncome;
  double get dailyIncome => _dailyIncome ?? 0.0;
  bool hasDailyIncome() => _dailyIncome != null;

  // "dailyPayment" field.
  double? _dailyPayment;
  double get dailyPayment => _dailyPayment ?? 0.0;
  bool hasDailyPayment() => _dailyPayment != null;

  // "expenditureAuthorizedOfficers" field.
  List<DocumentReference>? _expenditureAuthorizedOfficers;
  List<DocumentReference> get expenditureAuthorizedOfficers =>
      _expenditureAuthorizedOfficers ?? const [];
  bool hasExpenditureAuthorizedOfficers() =>
      _expenditureAuthorizedOfficers != null;

  // "authorizedCompanyEmployeesForWorkers" field.
  List<DocumentReference>? _authorizedCompanyEmployeesForWorkers;
  List<DocumentReference> get authorizedCompanyEmployeesForWorkers =>
      _authorizedCompanyEmployeesForWorkers ?? const [];
  bool hasAuthorizedCompanyEmployeesForWorkers() =>
      _authorizedCompanyEmployeesForWorkers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _type = snapshotData['type'] as String?;
    _partners = getDataList(snapshotData['partners']);
    _companyBio = snapshotData['companyBio'] as String?;
    _companyLogo = snapshotData['companyLogo'] as String?;
    _companyCreationDate = snapshotData['companyCreationDate'] as DateTime?;
    _totalMoney = castToType<double>(snapshotData['totalMoney']);
    _yearlyMoney = castToType<double>(snapshotData['yearlyMoney']);
    _partnerships = getDataList(snapshotData['partnerships']);
    _isDelete = snapshotData['isDelete'] as bool?;
    _headOffice = snapshotData['headOffice'] as DocumentReference?;
    _dailyIncome = castToType<double>(snapshotData['dailyIncome']);
    _dailyPayment = castToType<double>(snapshotData['dailyPayment']);
    _expenditureAuthorizedOfficers =
        getDataList(snapshotData['expenditureAuthorizedOfficers']);
    _authorizedCompanyEmployeesForWorkers =
        getDataList(snapshotData['authorizedCompanyEmployeesForWorkers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? name,
  DocumentReference? owner,
  String? status,
  String? type,
  String? companyBio,
  String? companyLogo,
  DateTime? companyCreationDate,
  double? totalMoney,
  double? yearlyMoney,
  bool? isDelete,
  DocumentReference? headOffice,
  double? dailyIncome,
  double? dailyPayment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner': owner,
      'status': status,
      'type': type,
      'companyBio': companyBio,
      'companyLogo': companyLogo,
      'companyCreationDate': companyCreationDate,
      'totalMoney': totalMoney,
      'yearlyMoney': yearlyMoney,
      'isDelete': isDelete,
      'headOffice': headOffice,
      'dailyIncome': dailyIncome,
      'dailyPayment': dailyPayment,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.owner == e2?.owner &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.partners, e2?.partners) &&
        e1?.companyBio == e2?.companyBio &&
        e1?.companyLogo == e2?.companyLogo &&
        e1?.companyCreationDate == e2?.companyCreationDate &&
        e1?.totalMoney == e2?.totalMoney &&
        e1?.yearlyMoney == e2?.yearlyMoney &&
        listEquality.equals(e1?.partnerships, e2?.partnerships) &&
        e1?.isDelete == e2?.isDelete &&
        e1?.headOffice == e2?.headOffice &&
        e1?.dailyIncome == e2?.dailyIncome &&
        e1?.dailyPayment == e2?.dailyPayment &&
        listEquality.equals(e1?.expenditureAuthorizedOfficers,
            e2?.expenditureAuthorizedOfficers) &&
        listEquality.equals(e1?.authorizedCompanyEmployeesForWorkers,
            e2?.authorizedCompanyEmployeesForWorkers);
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.owner,
        e?.status,
        e?.type,
        e?.partners,
        e?.companyBio,
        e?.companyLogo,
        e?.companyCreationDate,
        e?.totalMoney,
        e?.yearlyMoney,
        e?.partnerships,
        e?.isDelete,
        e?.headOffice,
        e?.dailyIncome,
        e?.dailyPayment,
        e?.expenditureAuthorizedOfficers,
        e?.authorizedCompanyEmployeesForWorkers
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
