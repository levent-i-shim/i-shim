import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyWorkersRecord extends FirestoreRecord {
  CompanyWorkersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "departmentRefs" field.
  List<DocumentReference>? _departmentRefs;
  List<DocumentReference> get departmentRefs => _departmentRefs ?? const [];
  bool hasDepartmentRefs() => _departmentRefs != null;

  // "unitRefs" field.
  List<DocumentReference>? _unitRefs;
  List<DocumentReference> get unitRefs => _unitRefs ?? const [];
  bool hasUnitRefs() => _unitRefs != null;

  // "roleRefs" field.
  List<DocumentReference>? _roleRefs;
  List<DocumentReference> get roleRefs => _roleRefs ?? const [];
  bool hasRoleRefs() => _roleRefs != null;

  // "reportRefs" field.
  List<DocumentReference>? _reportRefs;
  List<DocumentReference> get reportRefs => _reportRefs ?? const [];
  bool hasReportRefs() => _reportRefs != null;

  // "processDutiesRef" field.
  List<DocumentReference>? _processDutiesRef;
  List<DocumentReference> get processDutiesRef => _processDutiesRef ?? const [];
  bool hasProcessDutiesRef() => _processDutiesRef != null;

  // "taskDutiesRef" field.
  List<DocumentReference>? _taskDutiesRef;
  List<DocumentReference> get taskDutiesRef => _taskDutiesRef ?? const [];
  bool hasTaskDutiesRef() => _taskDutiesRef != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "formCreationAuthority" field.
  bool? _formCreationAuthority;
  bool get formCreationAuthority => _formCreationAuthority ?? false;
  bool hasFormCreationAuthority() => _formCreationAuthority != null;

  // "roleCreationAuthority" field.
  bool? _roleCreationAuthority;
  bool get roleCreationAuthority => _roleCreationAuthority ?? false;
  bool hasRoleCreationAuthority() => _roleCreationAuthority != null;

  // "unitCreationAuthority" field.
  bool? _unitCreationAuthority;
  bool get unitCreationAuthority => _unitCreationAuthority ?? false;
  bool hasUnitCreationAuthority() => _unitCreationAuthority != null;

  // "departmentCreationAuthority" field.
  bool? _departmentCreationAuthority;
  bool get departmentCreationAuthority => _departmentCreationAuthority ?? false;
  bool hasDepartmentCreationAuthority() => _departmentCreationAuthority != null;

  // "expanditureAuthority" field.
  bool? _expanditureAuthority;
  bool get expanditureAuthority => _expanditureAuthority ?? false;
  bool hasExpanditureAuthority() => _expanditureAuthority != null;

  // "allowence" field.
  double? _allowence;
  double get allowence => _allowence ?? 0.0;
  bool hasAllowence() => _allowence != null;

  // "authorizedByDepartment" field.
  DocumentReference? _authorizedByDepartment;
  DocumentReference? get authorizedByDepartment => _authorizedByDepartment;
  bool hasAuthorizedByDepartment() => _authorizedByDepartment != null;

  // "canAcceptTransaction" field.
  bool? _canAcceptTransaction;
  bool get canAcceptTransaction => _canAcceptTransaction ?? false;
  bool hasCanAcceptTransaction() => _canAcceptTransaction != null;

  // "stockAuthority" field.
  bool? _stockAuthority;
  bool get stockAuthority => _stockAuthority ?? false;
  bool hasStockAuthority() => _stockAuthority != null;

  // "departmenName" field.
  String? _departmenName;
  String get departmenName => _departmenName ?? '';
  bool hasDepartmenName() => _departmenName != null;

  // "roleName" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  bool hasRoleName() => _roleName != null;

  // "unitName" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  bool hasUnitName() => _unitName != null;

  // "currentAccountAuthority" field.
  bool? _currentAccountAuthority;
  bool get currentAccountAuthority => _currentAccountAuthority ?? false;
  bool hasCurrentAccountAuthority() => _currentAccountAuthority != null;

  // "vehicleCreationAuthority" field.
  bool? _vehicleCreationAuthority;
  bool get vehicleCreationAuthority => _vehicleCreationAuthority ?? false;
  bool hasVehicleCreationAuthority() => _vehicleCreationAuthority != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "canManageUsers" field.
  bool? _canManageUsers;
  bool get canManageUsers => _canManageUsers ?? false;
  bool hasCanManageUsers() => _canManageUsers != null;

  // "canCreateTask" field.
  bool? _canCreateTask;
  bool get canCreateTask => _canCreateTask ?? false;
  bool hasCanCreateTask() => _canCreateTask != null;

  // "canManageReports" field.
  bool? _canManageReports;
  bool get canManageReports => _canManageReports ?? false;
  bool hasCanManageReports() => _canManageReports != null;

  // "canSendMoney" field.
  bool? _canSendMoney;
  bool get canSendMoney => _canSendMoney ?? false;
  bool hasCanSendMoney() => _canSendMoney != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "canViewIncomeExpense" field.
  bool? _canViewIncomeExpense;
  bool get canViewIncomeExpense => _canViewIncomeExpense ?? false;
  bool hasCanViewIncomeExpense() => _canViewIncomeExpense != null;

  // "isWorker" field.
  bool? _isWorker;
  bool get isWorker => _isWorker ?? false;
  bool hasIsWorker() => _isWorker != null;

  // "canViewEmployee" field.
  bool? _canViewEmployee;
  bool get canViewEmployee => _canViewEmployee ?? false;
  bool hasCanViewEmployee() => _canViewEmployee != null;

  // "CanAddManuelIncomeExpense" field.
  bool? _canAddManuelIncomeExpense;
  bool get canAddManuelIncomeExpense => _canAddManuelIncomeExpense ?? false;
  bool hasCanAddManuelIncomeExpense() => _canAddManuelIncomeExpense != null;

  // "canSendInstruction" field.
  bool? _canSendInstruction;
  bool get canSendInstruction => _canSendInstruction ?? false;
  bool hasCanSendInstruction() => _canSendInstruction != null;

  // "canAddCostAccount" field.
  bool? _canAddCostAccount;
  bool get canAddCostAccount => _canAddCostAccount ?? false;
  bool hasCanAddCostAccount() => _canAddCostAccount != null;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  bool hasSalary() => _salary != null;

  // "workingHour" field.
  double? _workingHour;
  double get workingHour => _workingHour ?? 0.0;
  bool hasWorkingHour() => _workingHour != null;

  // "shiftSalary" field.
  double? _shiftSalary;
  double get shiftSalary => _shiftSalary ?? 0.0;
  bool hasShiftSalary() => _shiftSalary != null;

  // "canViewNotes" field.
  bool? _canViewNotes;
  bool get canViewNotes => _canViewNotes ?? false;
  bool hasCanViewNotes() => _canViewNotes != null;

  // "canManageNotes" field.
  bool? _canManageNotes;
  bool get canManageNotes => _canManageNotes ?? false;
  bool hasCanManageNotes() => _canManageNotes != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "userProfileImage" field.
  String? _userProfileImage;
  String get userProfileImage => _userProfileImage ?? '';
  bool hasUserProfileImage() => _userProfileImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _departmentRefs = getDataList(snapshotData['departmentRefs']);
    _unitRefs = getDataList(snapshotData['unitRefs']);
    _roleRefs = getDataList(snapshotData['roleRefs']);
    _reportRefs = getDataList(snapshotData['reportRefs']);
    _processDutiesRef = getDataList(snapshotData['processDutiesRef']);
    _taskDutiesRef = getDataList(snapshotData['taskDutiesRef']);
    _userName = snapshotData['userName'] as String?;
    _formCreationAuthority = snapshotData['formCreationAuthority'] as bool?;
    _roleCreationAuthority = snapshotData['roleCreationAuthority'] as bool?;
    _unitCreationAuthority = snapshotData['unitCreationAuthority'] as bool?;
    _departmentCreationAuthority =
        snapshotData['departmentCreationAuthority'] as bool?;
    _expanditureAuthority = snapshotData['expanditureAuthority'] as bool?;
    _allowence = castToType<double>(snapshotData['allowence']);
    _authorizedByDepartment =
        snapshotData['authorizedByDepartment'] as DocumentReference?;
    _canAcceptTransaction = snapshotData['canAcceptTransaction'] as bool?;
    _stockAuthority = snapshotData['stockAuthority'] as bool?;
    _departmenName = snapshotData['departmenName'] as String?;
    _roleName = snapshotData['roleName'] as String?;
    _unitName = snapshotData['unitName'] as String?;
    _currentAccountAuthority = snapshotData['currentAccountAuthority'] as bool?;
    _vehicleCreationAuthority =
        snapshotData['vehicleCreationAuthority'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _canManageUsers = snapshotData['canManageUsers'] as bool?;
    _canCreateTask = snapshotData['canCreateTask'] as bool?;
    _canManageReports = snapshotData['canManageReports'] as bool?;
    _canSendMoney = snapshotData['canSendMoney'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _canViewIncomeExpense = snapshotData['canViewIncomeExpense'] as bool?;
    _isWorker = snapshotData['isWorker'] as bool?;
    _canViewEmployee = snapshotData['canViewEmployee'] as bool?;
    _canAddManuelIncomeExpense =
        snapshotData['CanAddManuelIncomeExpense'] as bool?;
    _canSendInstruction = snapshotData['canSendInstruction'] as bool?;
    _canAddCostAccount = snapshotData['canAddCostAccount'] as bool?;
    _salary = castToType<double>(snapshotData['salary']);
    _workingHour = castToType<double>(snapshotData['workingHour']);
    _shiftSalary = castToType<double>(snapshotData['shiftSalary']);
    _canViewNotes = snapshotData['canViewNotes'] as bool?;
    _canManageNotes = snapshotData['canManageNotes'] as bool?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _userProfileImage = snapshotData['userProfileImage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyWorkers')
          : FirebaseFirestore.instance.collectionGroup('companyWorkers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyWorkers').doc(id);

  static Stream<CompanyWorkersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyWorkersRecord.fromSnapshot(s));

  static Future<CompanyWorkersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyWorkersRecord.fromSnapshot(s));

  static CompanyWorkersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyWorkersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyWorkersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyWorkersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyWorkersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyWorkersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyWorkersRecordData({
  DocumentReference? userRef,
  String? userName,
  bool? formCreationAuthority,
  bool? roleCreationAuthority,
  bool? unitCreationAuthority,
  bool? departmentCreationAuthority,
  bool? expanditureAuthority,
  double? allowence,
  DocumentReference? authorizedByDepartment,
  bool? canAcceptTransaction,
  bool? stockAuthority,
  String? departmenName,
  String? roleName,
  String? unitName,
  bool? currentAccountAuthority,
  bool? vehicleCreationAuthority,
  bool? isDelete,
  bool? canManageUsers,
  bool? canCreateTask,
  bool? canManageReports,
  bool? canSendMoney,
  DocumentReference? workPlace,
  bool? canViewIncomeExpense,
  bool? isWorker,
  bool? canViewEmployee,
  bool? canAddManuelIncomeExpense,
  bool? canSendInstruction,
  bool? canAddCostAccount,
  double? salary,
  double? workingHour,
  double? shiftSalary,
  bool? canViewNotes,
  bool? canManageNotes,
  DateTime? updatedAt,
  String? userProfileImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'userName': userName,
      'formCreationAuthority': formCreationAuthority,
      'roleCreationAuthority': roleCreationAuthority,
      'unitCreationAuthority': unitCreationAuthority,
      'departmentCreationAuthority': departmentCreationAuthority,
      'expanditureAuthority': expanditureAuthority,
      'allowence': allowence,
      'authorizedByDepartment': authorizedByDepartment,
      'canAcceptTransaction': canAcceptTransaction,
      'stockAuthority': stockAuthority,
      'departmenName': departmenName,
      'roleName': roleName,
      'unitName': unitName,
      'currentAccountAuthority': currentAccountAuthority,
      'vehicleCreationAuthority': vehicleCreationAuthority,
      'isDelete': isDelete,
      'canManageUsers': canManageUsers,
      'canCreateTask': canCreateTask,
      'canManageReports': canManageReports,
      'canSendMoney': canSendMoney,
      'workPlace': workPlace,
      'canViewIncomeExpense': canViewIncomeExpense,
      'isWorker': isWorker,
      'canViewEmployee': canViewEmployee,
      'CanAddManuelIncomeExpense': canAddManuelIncomeExpense,
      'canSendInstruction': canSendInstruction,
      'canAddCostAccount': canAddCostAccount,
      'salary': salary,
      'workingHour': workingHour,
      'shiftSalary': shiftSalary,
      'canViewNotes': canViewNotes,
      'canManageNotes': canManageNotes,
      'updatedAt': updatedAt,
      'userProfileImage': userProfileImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyWorkersRecordDocumentEquality
    implements Equality<CompanyWorkersRecord> {
  const CompanyWorkersRecordDocumentEquality();

  @override
  bool equals(CompanyWorkersRecord? e1, CompanyWorkersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.departmentRefs, e2?.departmentRefs) &&
        listEquality.equals(e1?.unitRefs, e2?.unitRefs) &&
        listEquality.equals(e1?.roleRefs, e2?.roleRefs) &&
        listEquality.equals(e1?.reportRefs, e2?.reportRefs) &&
        listEquality.equals(e1?.processDutiesRef, e2?.processDutiesRef) &&
        listEquality.equals(e1?.taskDutiesRef, e2?.taskDutiesRef) &&
        e1?.userName == e2?.userName &&
        e1?.formCreationAuthority == e2?.formCreationAuthority &&
        e1?.roleCreationAuthority == e2?.roleCreationAuthority &&
        e1?.unitCreationAuthority == e2?.unitCreationAuthority &&
        e1?.departmentCreationAuthority == e2?.departmentCreationAuthority &&
        e1?.expanditureAuthority == e2?.expanditureAuthority &&
        e1?.allowence == e2?.allowence &&
        e1?.authorizedByDepartment == e2?.authorizedByDepartment &&
        e1?.canAcceptTransaction == e2?.canAcceptTransaction &&
        e1?.stockAuthority == e2?.stockAuthority &&
        e1?.departmenName == e2?.departmenName &&
        e1?.roleName == e2?.roleName &&
        e1?.unitName == e2?.unitName &&
        e1?.currentAccountAuthority == e2?.currentAccountAuthority &&
        e1?.vehicleCreationAuthority == e2?.vehicleCreationAuthority &&
        e1?.isDelete == e2?.isDelete &&
        e1?.canManageUsers == e2?.canManageUsers &&
        e1?.canCreateTask == e2?.canCreateTask &&
        e1?.canManageReports == e2?.canManageReports &&
        e1?.canSendMoney == e2?.canSendMoney &&
        e1?.workPlace == e2?.workPlace &&
        e1?.canViewIncomeExpense == e2?.canViewIncomeExpense &&
        e1?.isWorker == e2?.isWorker &&
        e1?.canViewEmployee == e2?.canViewEmployee &&
        e1?.canAddManuelIncomeExpense == e2?.canAddManuelIncomeExpense &&
        e1?.canSendInstruction == e2?.canSendInstruction &&
        e1?.canAddCostAccount == e2?.canAddCostAccount &&
        e1?.salary == e2?.salary &&
        e1?.workingHour == e2?.workingHour &&
        e1?.shiftSalary == e2?.shiftSalary &&
        e1?.canViewNotes == e2?.canViewNotes &&
        e1?.canManageNotes == e2?.canManageNotes &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.userProfileImage == e2?.userProfileImage;
  }

  @override
  int hash(CompanyWorkersRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.departmentRefs,
        e?.unitRefs,
        e?.roleRefs,
        e?.reportRefs,
        e?.processDutiesRef,
        e?.taskDutiesRef,
        e?.userName,
        e?.formCreationAuthority,
        e?.roleCreationAuthority,
        e?.unitCreationAuthority,
        e?.departmentCreationAuthority,
        e?.expanditureAuthority,
        e?.allowence,
        e?.authorizedByDepartment,
        e?.canAcceptTransaction,
        e?.stockAuthority,
        e?.departmenName,
        e?.roleName,
        e?.unitName,
        e?.currentAccountAuthority,
        e?.vehicleCreationAuthority,
        e?.isDelete,
        e?.canManageUsers,
        e?.canCreateTask,
        e?.canManageReports,
        e?.canSendMoney,
        e?.workPlace,
        e?.canViewIncomeExpense,
        e?.isWorker,
        e?.canViewEmployee,
        e?.canAddManuelIncomeExpense,
        e?.canSendInstruction,
        e?.canAddCostAccount,
        e?.salary,
        e?.workingHour,
        e?.shiftSalary,
        e?.canViewNotes,
        e?.canManageNotes,
        e?.updatedAt,
        e?.userProfileImage
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyWorkersRecord;
}
