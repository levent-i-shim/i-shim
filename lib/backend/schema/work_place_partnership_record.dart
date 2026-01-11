import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlacePartnershipRecord extends FirestoreRecord {
  WorkPlacePartnershipRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "isUser" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  bool hasIsUser() => _isUser != null;

  // "isCompany" field.
  bool? _isCompany;
  bool get isCompany => _isCompany ?? false;
  bool hasIsCompany() => _isCompany != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "canViewIncomeExpense" field.
  bool? _canViewIncomeExpense;
  bool get canViewIncomeExpense => _canViewIncomeExpense ?? false;
  bool hasCanViewIncomeExpense() => _canViewIncomeExpense != null;

  // "canViewEmployeeExpense" field.
  bool? _canViewEmployeeExpense;
  bool get canViewEmployeeExpense => _canViewEmployeeExpense ?? false;
  bool hasCanViewEmployeeExpense() => _canViewEmployeeExpense != null;

  // "canManageEmployeeExpense" field.
  bool? _canManageEmployeeExpense;
  bool get canManageEmployeeExpense => _canManageEmployeeExpense ?? false;
  bool hasCanManageEmployeeExpense() => _canManageEmployeeExpense != null;

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

  // "canCreateTask" field.
  bool? _canCreateTask;
  bool get canCreateTask => _canCreateTask ?? false;
  bool hasCanCreateTask() => _canCreateTask != null;

  // "canManageTask" field.
  bool? _canManageTask;
  bool get canManageTask => _canManageTask ?? false;
  bool hasCanManageTask() => _canManageTask != null;

  // "canViewStock" field.
  bool? _canViewStock;
  bool get canViewStock => _canViewStock ?? false;
  bool hasCanViewStock() => _canViewStock != null;

  // "canManageStock" field.
  bool? _canManageStock;
  bool get canManageStock => _canManageStock ?? false;
  bool hasCanManageStock() => _canManageStock != null;

  // "canManageDepartments" field.
  bool? _canManageDepartments;
  bool get canManageDepartments => _canManageDepartments ?? false;
  bool hasCanManageDepartments() => _canManageDepartments != null;

  // "canManageUnits" field.
  bool? _canManageUnits;
  bool get canManageUnits => _canManageUnits ?? false;
  bool hasCanManageUnits() => _canManageUnits != null;

  // "canManageRoles" field.
  bool? _canManageRoles;
  bool get canManageRoles => _canManageRoles ?? false;
  bool hasCanManageRoles() => _canManageRoles != null;

  // "canManageWorkers" field.
  bool? _canManageWorkers;
  bool get canManageWorkers => _canManageWorkers ?? false;
  bool hasCanManageWorkers() => _canManageWorkers != null;

  // "canViewInstructions" field.
  bool? _canViewInstructions;
  bool get canViewInstructions => _canViewInstructions ?? false;
  bool hasCanViewInstructions() => _canViewInstructions != null;

  // "canManageInstructions" field.
  bool? _canManageInstructions;
  bool get canManageInstructions => _canManageInstructions ?? false;
  bool hasCanManageInstructions() => _canManageInstructions != null;

  // "canManagePendingIncomeExpense" field.
  bool? _canManagePendingIncomeExpense;
  bool get canManagePendingIncomeExpense =>
      _canManagePendingIncomeExpense ?? false;
  bool hasCanManagePendingIncomeExpense() =>
      _canManagePendingIncomeExpense != null;

  // "canViewForms" field.
  bool? _canViewForms;
  bool get canViewForms => _canViewForms ?? false;
  bool hasCanViewForms() => _canViewForms != null;

  // "canManageForms" field.
  bool? _canManageForms;
  bool get canManageForms => _canManageForms ?? false;
  bool hasCanManageForms() => _canManageForms != null;

  // "partnerName" field.
  String? _partnerName;
  String get partnerName => _partnerName ?? '';
  bool hasPartnerName() => _partnerName != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "canAddManuelExpenseIncome" field.
  bool? _canAddManuelExpenseIncome;
  bool get canAddManuelExpenseIncome => _canAddManuelExpenseIncome ?? false;
  bool hasCanAddManuelExpenseIncome() => _canAddManuelExpenseIncome != null;

  // "canViewEmployee" field.
  bool? _canViewEmployee;
  bool get canViewEmployee => _canViewEmployee ?? false;
  bool hasCanViewEmployee() => _canViewEmployee != null;

  // "canCalculateCost" field.
  bool? _canCalculateCost;
  bool get canCalculateCost => _canCalculateCost ?? false;
  bool hasCanCalculateCost() => _canCalculateCost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _isUser = snapshotData['isUser'] as bool?;
    _isCompany = snapshotData['isCompany'] as bool?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _company = snapshotData['company'] as DocumentReference?;
    _canViewIncomeExpense = snapshotData['canViewIncomeExpense'] as bool?;
    _canViewEmployeeExpense = snapshotData['canViewEmployeeExpense'] as bool?;
    _canManageEmployeeExpense =
        snapshotData['canManageEmployeeExpense'] as bool?;
    _canViewVehicles = snapshotData['canViewVehicles'] as bool?;
    _canManageVehicles = snapshotData['canManageVehicles'] as bool?;
    _canViewTasks = snapshotData['canViewTasks'] as bool?;
    _canCreateTask = snapshotData['canCreateTask'] as bool?;
    _canManageTask = snapshotData['canManageTask'] as bool?;
    _canViewStock = snapshotData['canViewStock'] as bool?;
    _canManageStock = snapshotData['canManageStock'] as bool?;
    _canManageDepartments = snapshotData['canManageDepartments'] as bool?;
    _canManageUnits = snapshotData['canManageUnits'] as bool?;
    _canManageRoles = snapshotData['canManageRoles'] as bool?;
    _canManageWorkers = snapshotData['canManageWorkers'] as bool?;
    _canViewInstructions = snapshotData['canViewInstructions'] as bool?;
    _canManageInstructions = snapshotData['canManageInstructions'] as bool?;
    _canManagePendingIncomeExpense =
        snapshotData['canManagePendingIncomeExpense'] as bool?;
    _canViewForms = snapshotData['canViewForms'] as bool?;
    _canManageForms = snapshotData['canManageForms'] as bool?;
    _partnerName = snapshotData['partnerName'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _canAddManuelExpenseIncome =
        snapshotData['canAddManuelExpenseIncome'] as bool?;
    _canViewEmployee = snapshotData['canViewEmployee'] as bool?;
    _canCalculateCost = snapshotData['canCalculateCost'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlacePartnership')
          : FirebaseFirestore.instance.collectionGroup('workPlacePartnership');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlacePartnership').doc(id);

  static Stream<WorkPlacePartnershipRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlacePartnershipRecord.fromSnapshot(s));

  static Future<WorkPlacePartnershipRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlacePartnershipRecord.fromSnapshot(s));

  static WorkPlacePartnershipRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlacePartnershipRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlacePartnershipRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlacePartnershipRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlacePartnershipRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlacePartnershipRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlacePartnershipRecordData({
  String? id,
  bool? isUser,
  bool? isCompany,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? workPlaceRef,
  DocumentReference? company,
  bool? canViewIncomeExpense,
  bool? canViewEmployeeExpense,
  bool? canManageEmployeeExpense,
  bool? canViewVehicles,
  bool? canManageVehicles,
  bool? canViewTasks,
  bool? canCreateTask,
  bool? canManageTask,
  bool? canViewStock,
  bool? canManageStock,
  bool? canManageDepartments,
  bool? canManageUnits,
  bool? canManageRoles,
  bool? canManageWorkers,
  bool? canViewInstructions,
  bool? canManageInstructions,
  bool? canManagePendingIncomeExpense,
  bool? canViewForms,
  bool? canManageForms,
  String? partnerName,
  String? workPlaceName,
  bool? canAddManuelExpenseIncome,
  bool? canViewEmployee,
  bool? canCalculateCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'isUser': isUser,
      'isCompany': isCompany,
      'startDate': startDate,
      'endDate': endDate,
      'workPlaceRef': workPlaceRef,
      'company': company,
      'canViewIncomeExpense': canViewIncomeExpense,
      'canViewEmployeeExpense': canViewEmployeeExpense,
      'canManageEmployeeExpense': canManageEmployeeExpense,
      'canViewVehicles': canViewVehicles,
      'canManageVehicles': canManageVehicles,
      'canViewTasks': canViewTasks,
      'canCreateTask': canCreateTask,
      'canManageTask': canManageTask,
      'canViewStock': canViewStock,
      'canManageStock': canManageStock,
      'canManageDepartments': canManageDepartments,
      'canManageUnits': canManageUnits,
      'canManageRoles': canManageRoles,
      'canManageWorkers': canManageWorkers,
      'canViewInstructions': canViewInstructions,
      'canManageInstructions': canManageInstructions,
      'canManagePendingIncomeExpense': canManagePendingIncomeExpense,
      'canViewForms': canViewForms,
      'canManageForms': canManageForms,
      'partnerName': partnerName,
      'workPlaceName': workPlaceName,
      'canAddManuelExpenseIncome': canAddManuelExpenseIncome,
      'canViewEmployee': canViewEmployee,
      'canCalculateCost': canCalculateCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlacePartnershipRecordDocumentEquality
    implements Equality<WorkPlacePartnershipRecord> {
  const WorkPlacePartnershipRecordDocumentEquality();

  @override
  bool equals(WorkPlacePartnershipRecord? e1, WorkPlacePartnershipRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.isUser == e2?.isUser &&
        e1?.isCompany == e2?.isCompany &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.company == e2?.company &&
        e1?.canViewIncomeExpense == e2?.canViewIncomeExpense &&
        e1?.canViewEmployeeExpense == e2?.canViewEmployeeExpense &&
        e1?.canManageEmployeeExpense == e2?.canManageEmployeeExpense &&
        e1?.canViewVehicles == e2?.canViewVehicles &&
        e1?.canManageVehicles == e2?.canManageVehicles &&
        e1?.canViewTasks == e2?.canViewTasks &&
        e1?.canCreateTask == e2?.canCreateTask &&
        e1?.canManageTask == e2?.canManageTask &&
        e1?.canViewStock == e2?.canViewStock &&
        e1?.canManageStock == e2?.canManageStock &&
        e1?.canManageDepartments == e2?.canManageDepartments &&
        e1?.canManageUnits == e2?.canManageUnits &&
        e1?.canManageRoles == e2?.canManageRoles &&
        e1?.canManageWorkers == e2?.canManageWorkers &&
        e1?.canViewInstructions == e2?.canViewInstructions &&
        e1?.canManageInstructions == e2?.canManageInstructions &&
        e1?.canManagePendingIncomeExpense ==
            e2?.canManagePendingIncomeExpense &&
        e1?.canViewForms == e2?.canViewForms &&
        e1?.canManageForms == e2?.canManageForms &&
        e1?.partnerName == e2?.partnerName &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.canAddManuelExpenseIncome == e2?.canAddManuelExpenseIncome &&
        e1?.canViewEmployee == e2?.canViewEmployee &&
        e1?.canCalculateCost == e2?.canCalculateCost;
  }

  @override
  int hash(WorkPlacePartnershipRecord? e) => const ListEquality().hash([
        e?.id,
        e?.isUser,
        e?.isCompany,
        e?.startDate,
        e?.endDate,
        e?.workPlaceRef,
        e?.company,
        e?.canViewIncomeExpense,
        e?.canViewEmployeeExpense,
        e?.canManageEmployeeExpense,
        e?.canViewVehicles,
        e?.canManageVehicles,
        e?.canViewTasks,
        e?.canCreateTask,
        e?.canManageTask,
        e?.canViewStock,
        e?.canManageStock,
        e?.canManageDepartments,
        e?.canManageUnits,
        e?.canManageRoles,
        e?.canManageWorkers,
        e?.canViewInstructions,
        e?.canManageInstructions,
        e?.canManagePendingIncomeExpense,
        e?.canViewForms,
        e?.canManageForms,
        e?.partnerName,
        e?.workPlaceName,
        e?.canAddManuelExpenseIncome,
        e?.canViewEmployee,
        e?.canCalculateCost
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlacePartnershipRecord;
}
