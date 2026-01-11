import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnershipsRecord extends FirestoreRecord {
  PartnershipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "isPartenerCompany" field.
  bool? _isPartenerCompany;
  bool get isPartenerCompany => _isPartenerCompany ?? false;
  bool hasIsPartenerCompany() => _isPartenerCompany != null;

  // "isPartnerWorkPlace" field.
  bool? _isPartnerWorkPlace;
  bool get isPartnerWorkPlace => _isPartnerWorkPlace ?? false;
  bool hasIsPartnerWorkPlace() => _isPartnerWorkPlace != null;

  // "isPartnershipMachineBased" field.
  bool? _isPartnershipMachineBased;
  bool get isPartnershipMachineBased => _isPartnershipMachineBased ?? false;
  bool hasIsPartnershipMachineBased() => _isPartnershipMachineBased != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "companyShareholdingPercentage" field.
  double? _companyShareholdingPercentage;
  double get companyShareholdingPercentage =>
      _companyShareholdingPercentage ?? 0.0;
  bool hasCompanyShareholdingPercentage() =>
      _companyShareholdingPercentage != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "workPlaceID" field.
  String? _workPlaceID;
  String get workPlaceID => _workPlaceID ?? '';
  bool hasWorkPlaceID() => _workPlaceID != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "workPlaceShareholdingPercentage" field.
  double? _workPlaceShareholdingPercentage;
  double get workPlaceShareholdingPercentage =>
      _workPlaceShareholdingPercentage ?? 0.0;
  bool hasWorkPlaceShareholdingPercentage() =>
      _workPlaceShareholdingPercentage != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "isPartnershipSuspended" field.
  bool? _isPartnershipSuspended;
  bool get isPartnershipSuspended => _isPartnershipSuspended ?? false;
  bool hasIsPartnershipSuspended() => _isPartnershipSuspended != null;

  // "isPartnershipTimeBased" field.
  bool? _isPartnershipTimeBased;
  bool get isPartnershipTimeBased => _isPartnershipTimeBased ?? false;
  bool hasIsPartnershipTimeBased() => _isPartnershipTimeBased != null;

  // "partnershipCalculationBeginningTime" field.
  DateTime? _partnershipCalculationBeginningTime;
  DateTime? get partnershipCalculationBeginningTime =>
      _partnershipCalculationBeginningTime;
  bool hasPartnershipCalculationBeginningTime() =>
      _partnershipCalculationBeginningTime != null;

  // "partnershipCalculationHaltTime" field.
  DateTime? _partnershipCalculationHaltTime;
  DateTime? get partnershipCalculationHaltTime =>
      _partnershipCalculationHaltTime;
  bool hasPartnershipCalculationHaltTime() =>
      _partnershipCalculationHaltTime != null;

  // "canViewIncomeExpenses" field.
  bool? _canViewIncomeExpenses;
  bool get canViewIncomeExpenses => _canViewIncomeExpenses ?? false;
  bool hasCanViewIncomeExpenses() => _canViewIncomeExpenses != null;

  // "canManagePendingIncomeExpenses" field.
  bool? _canManagePendingIncomeExpenses;
  bool get canManagePendingIncomeExpenses =>
      _canManagePendingIncomeExpenses ?? false;
  bool hasCanManagePendingIncomeExpenses() =>
      _canManagePendingIncomeExpenses != null;

  // "canViewCurrentAccounts" field.
  bool? _canViewCurrentAccounts;
  bool get canViewCurrentAccounts => _canViewCurrentAccounts ?? false;
  bool hasCanViewCurrentAccounts() => _canViewCurrentAccounts != null;

  // "canManageCurrentAccounts" field.
  bool? _canManageCurrentAccounts;
  bool get canManageCurrentAccounts => _canManageCurrentAccounts ?? false;
  bool hasCanManageCurrentAccounts() => _canManageCurrentAccounts != null;

  // "canViewEmployeeExpenses" field.
  bool? _canViewEmployeeExpenses;
  bool get canViewEmployeeExpenses => _canViewEmployeeExpenses ?? false;
  bool hasCanViewEmployeeExpenses() => _canViewEmployeeExpenses != null;

  // "canManageEmployeeExpenses" field.
  bool? _canManageEmployeeExpenses;
  bool get canManageEmployeeExpenses => _canManageEmployeeExpenses ?? false;
  bool hasCanManageEmployeeExpenses() => _canManageEmployeeExpenses != null;

  // "canViewVehicles" field.
  bool? _canViewVehicles;
  bool get canViewVehicles => _canViewVehicles ?? false;
  bool hasCanViewVehicles() => _canViewVehicles != null;

  // "canManageVehicles" field.
  bool? _canManageVehicles;
  bool get canManageVehicles => _canManageVehicles ?? false;
  bool hasCanManageVehicles() => _canManageVehicles != null;

  // "canViewTasks" field.
  bool? _canViewTasks;
  bool get canViewTasks => _canViewTasks ?? false;
  bool hasCanViewTasks() => _canViewTasks != null;

  // "canCreateTasks" field.
  bool? _canCreateTasks;
  bool get canCreateTasks => _canCreateTasks ?? false;
  bool hasCanCreateTasks() => _canCreateTasks != null;

  // "canManageTasks" field.
  bool? _canManageTasks;
  bool get canManageTasks => _canManageTasks ?? false;
  bool hasCanManageTasks() => _canManageTasks != null;

  // "canViewStock" field.
  bool? _canViewStock;
  bool get canViewStock => _canViewStock ?? false;
  bool hasCanViewStock() => _canViewStock != null;

  // "canManageStock" field.
  bool? _canManageStock;
  bool get canManageStock => _canManageStock ?? false;
  bool hasCanManageStock() => _canManageStock != null;

  // "canViewForms" field.
  bool? _canViewForms;
  bool get canViewForms => _canViewForms ?? false;
  bool hasCanViewForms() => _canViewForms != null;

  // "canManageForms" field.
  bool? _canManageForms;
  bool get canManageForms => _canManageForms ?? false;
  bool hasCanManageForms() => _canManageForms != null;

  // "canManageDepartments" field.
  bool? _canManageDepartments;
  bool get canManageDepartments => _canManageDepartments ?? false;
  bool hasCanManageDepartments() => _canManageDepartments != null;

  // "canManageRoles" field.
  bool? _canManageRoles;
  bool get canManageRoles => _canManageRoles ?? false;
  bool hasCanManageRoles() => _canManageRoles != null;

  // "canManageUnits" field.
  bool? _canManageUnits;
  bool get canManageUnits => _canManageUnits ?? false;
  bool hasCanManageUnits() => _canManageUnits != null;

  // "canCreateInstructions" field.
  bool? _canCreateInstructions;
  bool get canCreateInstructions => _canCreateInstructions ?? false;
  bool hasCanCreateInstructions() => _canCreateInstructions != null;

  // "canViewInstructions" field.
  bool? _canViewInstructions;
  bool get canViewInstructions => _canViewInstructions ?? false;
  bool hasCanViewInstructions() => _canViewInstructions != null;

  // "canManageWorkers" field.
  bool? _canManageWorkers;
  bool get canManageWorkers => _canManageWorkers ?? false;
  bool hasCanManageWorkers() => _canManageWorkers != null;

  // "canViewWorkers" field.
  bool? _canViewWorkers;
  bool get canViewWorkers => _canViewWorkers ?? false;
  bool hasCanViewWorkers() => _canViewWorkers != null;

  // "canAddManuelIncomeExpense" field.
  bool? _canAddManuelIncomeExpense;
  bool get canAddManuelIncomeExpense => _canAddManuelIncomeExpense ?? false;
  bool hasCanAddManuelIncomeExpense() => _canAddManuelIncomeExpense != null;

  // "canCalculateCost" field.
  bool? _canCalculateCost;
  bool get canCalculateCost => _canCalculateCost ?? false;
  bool hasCanCalculateCost() => _canCalculateCost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _type = snapshotData['type'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _isPartenerCompany = snapshotData['isPartenerCompany'] as bool?;
    _isPartnerWorkPlace = snapshotData['isPartnerWorkPlace'] as bool?;
    _isPartnershipMachineBased =
        snapshotData['isPartnershipMachineBased'] as bool?;
    _companyName = snapshotData['companyName'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _companyShareholdingPercentage =
        castToType<double>(snapshotData['companyShareholdingPercentage']);
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceID = snapshotData['workPlaceID'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceShareholdingPercentage =
        castToType<double>(snapshotData['workPlaceShareholdingPercentage']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _userName = snapshotData['userName'] as String?;
    _userID = snapshotData['userID'] as String?;
    _isPartnershipSuspended = snapshotData['isPartnershipSuspended'] as bool?;
    _isPartnershipTimeBased = snapshotData['isPartnershipTimeBased'] as bool?;
    _partnershipCalculationBeginningTime =
        snapshotData['partnershipCalculationBeginningTime'] as DateTime?;
    _partnershipCalculationHaltTime =
        snapshotData['partnershipCalculationHaltTime'] as DateTime?;
    _canViewIncomeExpenses = snapshotData['canViewIncomeExpenses'] as bool?;
    _canManagePendingIncomeExpenses =
        snapshotData['canManagePendingIncomeExpenses'] as bool?;
    _canViewCurrentAccounts = snapshotData['canViewCurrentAccounts'] as bool?;
    _canManageCurrentAccounts =
        snapshotData['canManageCurrentAccounts'] as bool?;
    _canViewEmployeeExpenses = snapshotData['canViewEmployeeExpenses'] as bool?;
    _canManageEmployeeExpenses =
        snapshotData['canManageEmployeeExpenses'] as bool?;
    _canViewVehicles = snapshotData['canViewVehicles'] as bool?;
    _canManageVehicles = snapshotData['canManageVehicles'] as bool?;
    _canViewTasks = snapshotData['canViewTasks'] as bool?;
    _canCreateTasks = snapshotData['canCreateTasks'] as bool?;
    _canManageTasks = snapshotData['canManageTasks'] as bool?;
    _canViewStock = snapshotData['canViewStock'] as bool?;
    _canManageStock = snapshotData['canManageStock'] as bool?;
    _canViewForms = snapshotData['canViewForms'] as bool?;
    _canManageForms = snapshotData['canManageForms'] as bool?;
    _canManageDepartments = snapshotData['canManageDepartments'] as bool?;
    _canManageRoles = snapshotData['canManageRoles'] as bool?;
    _canManageUnits = snapshotData['canManageUnits'] as bool?;
    _canCreateInstructions = snapshotData['canCreateInstructions'] as bool?;
    _canViewInstructions = snapshotData['canViewInstructions'] as bool?;
    _canManageWorkers = snapshotData['canManageWorkers'] as bool?;
    _canViewWorkers = snapshotData['canViewWorkers'] as bool?;
    _canAddManuelIncomeExpense =
        snapshotData['canAddManuelIncomeExpense'] as bool?;
    _canCalculateCost = snapshotData['canCalculateCost'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('partnerships')
          : FirebaseFirestore.instance.collectionGroup('partnerships');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('partnerships').doc(id);

  static Stream<PartnershipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartnershipsRecord.fromSnapshot(s));

  static Future<PartnershipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartnershipsRecord.fromSnapshot(s));

  static PartnershipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartnershipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartnershipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartnershipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartnershipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartnershipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartnershipsRecordData({
  String? status,
  String? type,
  DateTime? startDate,
  DateTime? endDate,
  bool? isPartenerCompany,
  bool? isPartnerWorkPlace,
  bool? isPartnershipMachineBased,
  String? companyName,
  DocumentReference? companyRef,
  double? companyShareholdingPercentage,
  String? workPlaceName,
  String? workPlaceID,
  DocumentReference? workPlaceRef,
  double? workPlaceShareholdingPercentage,
  DocumentReference? userRef,
  String? userName,
  String? userID,
  bool? isPartnershipSuspended,
  bool? isPartnershipTimeBased,
  DateTime? partnershipCalculationBeginningTime,
  DateTime? partnershipCalculationHaltTime,
  bool? canViewIncomeExpenses,
  bool? canManagePendingIncomeExpenses,
  bool? canViewCurrentAccounts,
  bool? canManageCurrentAccounts,
  bool? canViewEmployeeExpenses,
  bool? canManageEmployeeExpenses,
  bool? canViewVehicles,
  bool? canManageVehicles,
  bool? canViewTasks,
  bool? canCreateTasks,
  bool? canManageTasks,
  bool? canViewStock,
  bool? canManageStock,
  bool? canViewForms,
  bool? canManageForms,
  bool? canManageDepartments,
  bool? canManageRoles,
  bool? canManageUnits,
  bool? canCreateInstructions,
  bool? canViewInstructions,
  bool? canManageWorkers,
  bool? canViewWorkers,
  bool? canAddManuelIncomeExpense,
  bool? canCalculateCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'isPartenerCompany': isPartenerCompany,
      'isPartnerWorkPlace': isPartnerWorkPlace,
      'isPartnershipMachineBased': isPartnershipMachineBased,
      'companyName': companyName,
      'companyRef': companyRef,
      'companyShareholdingPercentage': companyShareholdingPercentage,
      'workPlaceName': workPlaceName,
      'workPlaceID': workPlaceID,
      'workPlaceRef': workPlaceRef,
      'workPlaceShareholdingPercentage': workPlaceShareholdingPercentage,
      'userRef': userRef,
      'userName': userName,
      'userID': userID,
      'isPartnershipSuspended': isPartnershipSuspended,
      'isPartnershipTimeBased': isPartnershipTimeBased,
      'partnershipCalculationBeginningTime':
          partnershipCalculationBeginningTime,
      'partnershipCalculationHaltTime': partnershipCalculationHaltTime,
      'canViewIncomeExpenses': canViewIncomeExpenses,
      'canManagePendingIncomeExpenses': canManagePendingIncomeExpenses,
      'canViewCurrentAccounts': canViewCurrentAccounts,
      'canManageCurrentAccounts': canManageCurrentAccounts,
      'canViewEmployeeExpenses': canViewEmployeeExpenses,
      'canManageEmployeeExpenses': canManageEmployeeExpenses,
      'canViewVehicles': canViewVehicles,
      'canManageVehicles': canManageVehicles,
      'canViewTasks': canViewTasks,
      'canCreateTasks': canCreateTasks,
      'canManageTasks': canManageTasks,
      'canViewStock': canViewStock,
      'canManageStock': canManageStock,
      'canViewForms': canViewForms,
      'canManageForms': canManageForms,
      'canManageDepartments': canManageDepartments,
      'canManageRoles': canManageRoles,
      'canManageUnits': canManageUnits,
      'canCreateInstructions': canCreateInstructions,
      'canViewInstructions': canViewInstructions,
      'canManageWorkers': canManageWorkers,
      'canViewWorkers': canViewWorkers,
      'canAddManuelIncomeExpense': canAddManuelIncomeExpense,
      'canCalculateCost': canCalculateCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartnershipsRecordDocumentEquality
    implements Equality<PartnershipsRecord> {
  const PartnershipsRecordDocumentEquality();

  @override
  bool equals(PartnershipsRecord? e1, PartnershipsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.isPartenerCompany == e2?.isPartenerCompany &&
        e1?.isPartnerWorkPlace == e2?.isPartnerWorkPlace &&
        e1?.isPartnershipMachineBased == e2?.isPartnershipMachineBased &&
        e1?.companyName == e2?.companyName &&
        e1?.companyRef == e2?.companyRef &&
        e1?.companyShareholdingPercentage ==
            e2?.companyShareholdingPercentage &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceID == e2?.workPlaceID &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceShareholdingPercentage ==
            e2?.workPlaceShareholdingPercentage &&
        e1?.userRef == e2?.userRef &&
        e1?.userName == e2?.userName &&
        e1?.userID == e2?.userID &&
        e1?.isPartnershipSuspended == e2?.isPartnershipSuspended &&
        e1?.isPartnershipTimeBased == e2?.isPartnershipTimeBased &&
        e1?.partnershipCalculationBeginningTime ==
            e2?.partnershipCalculationBeginningTime &&
        e1?.partnershipCalculationHaltTime ==
            e2?.partnershipCalculationHaltTime &&
        e1?.canViewIncomeExpenses == e2?.canViewIncomeExpenses &&
        e1?.canManagePendingIncomeExpenses ==
            e2?.canManagePendingIncomeExpenses &&
        e1?.canViewCurrentAccounts == e2?.canViewCurrentAccounts &&
        e1?.canManageCurrentAccounts == e2?.canManageCurrentAccounts &&
        e1?.canViewEmployeeExpenses == e2?.canViewEmployeeExpenses &&
        e1?.canManageEmployeeExpenses == e2?.canManageEmployeeExpenses &&
        e1?.canViewVehicles == e2?.canViewVehicles &&
        e1?.canManageVehicles == e2?.canManageVehicles &&
        e1?.canViewTasks == e2?.canViewTasks &&
        e1?.canCreateTasks == e2?.canCreateTasks &&
        e1?.canManageTasks == e2?.canManageTasks &&
        e1?.canViewStock == e2?.canViewStock &&
        e1?.canManageStock == e2?.canManageStock &&
        e1?.canViewForms == e2?.canViewForms &&
        e1?.canManageForms == e2?.canManageForms &&
        e1?.canManageDepartments == e2?.canManageDepartments &&
        e1?.canManageRoles == e2?.canManageRoles &&
        e1?.canManageUnits == e2?.canManageUnits &&
        e1?.canCreateInstructions == e2?.canCreateInstructions &&
        e1?.canViewInstructions == e2?.canViewInstructions &&
        e1?.canManageWorkers == e2?.canManageWorkers &&
        e1?.canViewWorkers == e2?.canViewWorkers &&
        e1?.canAddManuelIncomeExpense == e2?.canAddManuelIncomeExpense &&
        e1?.canCalculateCost == e2?.canCalculateCost;
  }

  @override
  int hash(PartnershipsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.type,
        e?.startDate,
        e?.endDate,
        e?.isPartenerCompany,
        e?.isPartnerWorkPlace,
        e?.isPartnershipMachineBased,
        e?.companyName,
        e?.companyRef,
        e?.companyShareholdingPercentage,
        e?.workPlaceName,
        e?.workPlaceID,
        e?.workPlaceRef,
        e?.workPlaceShareholdingPercentage,
        e?.userRef,
        e?.userName,
        e?.userID,
        e?.isPartnershipSuspended,
        e?.isPartnershipTimeBased,
        e?.partnershipCalculationBeginningTime,
        e?.partnershipCalculationHaltTime,
        e?.canViewIncomeExpenses,
        e?.canManagePendingIncomeExpenses,
        e?.canViewCurrentAccounts,
        e?.canManageCurrentAccounts,
        e?.canViewEmployeeExpenses,
        e?.canManageEmployeeExpenses,
        e?.canViewVehicles,
        e?.canManageVehicles,
        e?.canViewTasks,
        e?.canCreateTasks,
        e?.canManageTasks,
        e?.canViewStock,
        e?.canManageStock,
        e?.canViewForms,
        e?.canManageForms,
        e?.canManageDepartments,
        e?.canManageRoles,
        e?.canManageUnits,
        e?.canCreateInstructions,
        e?.canViewInstructions,
        e?.canManageWorkers,
        e?.canViewWorkers,
        e?.canAddManuelIncomeExpense,
        e?.canCalculateCost
      ]);

  @override
  bool isValidKey(Object? o) => o is PartnershipsRecord;
}
