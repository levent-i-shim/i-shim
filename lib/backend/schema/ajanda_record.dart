import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AjandaRecord extends FirestoreRecord {
  AjandaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "fullDescription" field.
  String? _fullDescription;
  String get fullDescription => _fullDescription ?? '';
  bool hasFullDescription() => _fullDescription != null;

  // "invitation" field.
  DocumentReference? _invitation;
  DocumentReference? get invitation => _invitation;
  bool hasInvitation() => _invitation != null;

  // "companyTask" field.
  DocumentReference? _companyTask;
  DocumentReference? get companyTask => _companyTask;
  bool hasCompanyTask() => _companyTask != null;

  // "CompanyDuty" field.
  DocumentReference? _companyDuty;
  DocumentReference? get companyDuty => _companyDuty;
  bool hasCompanyDuty() => _companyDuty != null;

  // "companyTaskDuties" field.
  DocumentReference? _companyTaskDuties;
  DocumentReference? get companyTaskDuties => _companyTaskDuties;
  bool hasCompanyTaskDuties() => _companyTaskDuties != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "companyDepartment" field.
  DocumentReference? _companyDepartment;
  DocumentReference? get companyDepartment => _companyDepartment;
  bool hasCompanyDepartment() => _companyDepartment != null;

  // "companyRole" field.
  DocumentReference? _companyRole;
  DocumentReference? get companyRole => _companyRole;
  bool hasCompanyRole() => _companyRole != null;

  // "companyUnit" field.
  DocumentReference? _companyUnit;
  DocumentReference? get companyUnit => _companyUnit;
  bool hasCompanyUnit() => _companyUnit != null;

  // "Form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "sentMoneyForAllowence" field.
  DocumentReference? _sentMoneyForAllowence;
  DocumentReference? get sentMoneyForAllowence => _sentMoneyForAllowence;
  bool hasSentMoneyForAllowence() => _sentMoneyForAllowence != null;

  // "transaction" field.
  DocumentReference? _transaction;
  DocumentReference? get transaction => _transaction;
  bool hasTransaction() => _transaction != null;

  // "confirmation" field.
  DocumentReference? _confirmation;
  DocumentReference? get confirmation => _confirmation;
  bool hasConfirmation() => _confirmation != null;

  // "companyIncome" field.
  DocumentReference? _companyIncome;
  DocumentReference? get companyIncome => _companyIncome;
  bool hasCompanyIncome() => _companyIncome != null;

  // "companyPayment" field.
  DocumentReference? _companyPayment;
  DocumentReference? get companyPayment => _companyPayment;
  bool hasCompanyPayment() => _companyPayment != null;

  // "isIncome" field.
  bool? _isIncome;
  bool get isIncome => _isIncome ?? false;
  bool hasIsIncome() => _isIncome != null;

  // "stock" field.
  DocumentReference? _stock;
  DocumentReference? get stock => _stock;
  bool hasStock() => _stock != null;

  // "stockMovement" field.
  DocumentReference? _stockMovement;
  DocumentReference? get stockMovement => _stockMovement;
  bool hasStockMovement() => _stockMovement != null;

  // "isChangedStock" field.
  bool? _isChangedStock;
  bool get isChangedStock => _isChangedStock ?? false;
  bool hasIsChangedStock() => _isChangedStock != null;

  // "currentAccount" field.
  DocumentReference? _currentAccount;
  DocumentReference? get currentAccount => _currentAccount;
  bool hasCurrentAccount() => _currentAccount != null;

  // "currentAccountBill" field.
  DocumentReference? _currentAccountBill;
  DocumentReference? get currentAccountBill => _currentAccountBill;
  bool hasCurrentAccountBill() => _currentAccountBill != null;

  // "currentAccountID" field.
  String? _currentAccountID;
  String get currentAccountID => _currentAccountID ?? '';
  bool hasCurrentAccountID() => _currentAccountID != null;

  // "companyVehicle" field.
  DocumentReference? _companyVehicle;
  DocumentReference? get companyVehicle => _companyVehicle;
  bool hasCompanyVehicle() => _companyVehicle != null;

  // "vehiclePayment" field.
  DocumentReference? _vehiclePayment;
  DocumentReference? get vehiclePayment => _vehiclePayment;
  bool hasVehiclePayment() => _vehiclePayment != null;

  // "SpendMoneyForAllowence" field.
  DocumentReference? _spendMoneyForAllowence;
  DocumentReference? get spendMoneyForAllowence => _spendMoneyForAllowence;
  bool hasSpendMoneyForAllowence() => _spendMoneyForAllowence != null;

  // "note" field.
  DocumentReference? _note;
  DocumentReference? get note => _note;
  bool hasNote() => _note != null;

  // "noteImportant" field.
  DocumentReference? _noteImportant;
  DocumentReference? get noteImportant => _noteImportant;
  bool hasNoteImportant() => _noteImportant != null;

  // "noteGoals" field.
  DocumentReference? _noteGoals;
  DocumentReference? get noteGoals => _noteGoals;
  bool hasNoteGoals() => _noteGoals != null;

  // "noteFinance" field.
  DocumentReference? _noteFinance;
  DocumentReference? get noteFinance => _noteFinance;
  bool hasNoteFinance() => _noteFinance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _fullDescription = snapshotData['fullDescription'] as String?;
    _invitation = snapshotData['invitation'] as DocumentReference?;
    _companyTask = snapshotData['companyTask'] as DocumentReference?;
    _companyDuty = snapshotData['CompanyDuty'] as DocumentReference?;
    _companyTaskDuties =
        snapshotData['companyTaskDuties'] as DocumentReference?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _company = snapshotData['company'] as DocumentReference?;
    _companyDepartment =
        snapshotData['companyDepartment'] as DocumentReference?;
    _companyRole = snapshotData['companyRole'] as DocumentReference?;
    _companyUnit = snapshotData['companyUnit'] as DocumentReference?;
    _form = snapshotData['Form'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _sentMoneyForAllowence =
        snapshotData['sentMoneyForAllowence'] as DocumentReference?;
    _transaction = snapshotData['transaction'] as DocumentReference?;
    _confirmation = snapshotData['confirmation'] as DocumentReference?;
    _companyIncome = snapshotData['companyIncome'] as DocumentReference?;
    _companyPayment = snapshotData['companyPayment'] as DocumentReference?;
    _isIncome = snapshotData['isIncome'] as bool?;
    _stock = snapshotData['stock'] as DocumentReference?;
    _stockMovement = snapshotData['stockMovement'] as DocumentReference?;
    _isChangedStock = snapshotData['isChangedStock'] as bool?;
    _currentAccount = snapshotData['currentAccount'] as DocumentReference?;
    _currentAccountBill =
        snapshotData['currentAccountBill'] as DocumentReference?;
    _currentAccountID = snapshotData['currentAccountID'] as String?;
    _companyVehicle = snapshotData['companyVehicle'] as DocumentReference?;
    _vehiclePayment = snapshotData['vehiclePayment'] as DocumentReference?;
    _spendMoneyForAllowence =
        snapshotData['SpendMoneyForAllowence'] as DocumentReference?;
    _note = snapshotData['note'] as DocumentReference?;
    _noteImportant = snapshotData['noteImportant'] as DocumentReference?;
    _noteGoals = snapshotData['noteGoals'] as DocumentReference?;
    _noteFinance = snapshotData['noteFinance'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ajanda')
          : FirebaseFirestore.instance.collectionGroup('ajanda');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ajanda').doc(id);

  static Stream<AjandaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AjandaRecord.fromSnapshot(s));

  static Future<AjandaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AjandaRecord.fromSnapshot(s));

  static AjandaRecord fromSnapshot(DocumentSnapshot snapshot) => AjandaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AjandaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AjandaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AjandaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AjandaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAjandaRecordData({
  String? description,
  String? type,
  DateTime? dateTime,
  String? fullDescription,
  DocumentReference? invitation,
  DocumentReference? companyTask,
  DocumentReference? companyDuty,
  DocumentReference? companyTaskDuties,
  DocumentReference? workPlace,
  DocumentReference? company,
  DocumentReference? companyDepartment,
  DocumentReference? companyRole,
  DocumentReference? companyUnit,
  DocumentReference? form,
  String? companyName,
  DocumentReference? sentMoneyForAllowence,
  DocumentReference? transaction,
  DocumentReference? confirmation,
  DocumentReference? companyIncome,
  DocumentReference? companyPayment,
  bool? isIncome,
  DocumentReference? stock,
  DocumentReference? stockMovement,
  bool? isChangedStock,
  DocumentReference? currentAccount,
  DocumentReference? currentAccountBill,
  String? currentAccountID,
  DocumentReference? companyVehicle,
  DocumentReference? vehiclePayment,
  DocumentReference? spendMoneyForAllowence,
  DocumentReference? note,
  DocumentReference? noteImportant,
  DocumentReference? noteGoals,
  DocumentReference? noteFinance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'type': type,
      'dateTime': dateTime,
      'fullDescription': fullDescription,
      'invitation': invitation,
      'companyTask': companyTask,
      'CompanyDuty': companyDuty,
      'companyTaskDuties': companyTaskDuties,
      'workPlace': workPlace,
      'company': company,
      'companyDepartment': companyDepartment,
      'companyRole': companyRole,
      'companyUnit': companyUnit,
      'Form': form,
      'companyName': companyName,
      'sentMoneyForAllowence': sentMoneyForAllowence,
      'transaction': transaction,
      'confirmation': confirmation,
      'companyIncome': companyIncome,
      'companyPayment': companyPayment,
      'isIncome': isIncome,
      'stock': stock,
      'stockMovement': stockMovement,
      'isChangedStock': isChangedStock,
      'currentAccount': currentAccount,
      'currentAccountBill': currentAccountBill,
      'currentAccountID': currentAccountID,
      'companyVehicle': companyVehicle,
      'vehiclePayment': vehiclePayment,
      'SpendMoneyForAllowence': spendMoneyForAllowence,
      'note': note,
      'noteImportant': noteImportant,
      'noteGoals': noteGoals,
      'noteFinance': noteFinance,
    }.withoutNulls,
  );

  return firestoreData;
}

class AjandaRecordDocumentEquality implements Equality<AjandaRecord> {
  const AjandaRecordDocumentEquality();

  @override
  bool equals(AjandaRecord? e1, AjandaRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.dateTime == e2?.dateTime &&
        e1?.fullDescription == e2?.fullDescription &&
        e1?.invitation == e2?.invitation &&
        e1?.companyTask == e2?.companyTask &&
        e1?.companyDuty == e2?.companyDuty &&
        e1?.companyTaskDuties == e2?.companyTaskDuties &&
        e1?.workPlace == e2?.workPlace &&
        e1?.company == e2?.company &&
        e1?.companyDepartment == e2?.companyDepartment &&
        e1?.companyRole == e2?.companyRole &&
        e1?.companyUnit == e2?.companyUnit &&
        e1?.form == e2?.form &&
        e1?.companyName == e2?.companyName &&
        e1?.sentMoneyForAllowence == e2?.sentMoneyForAllowence &&
        e1?.transaction == e2?.transaction &&
        e1?.confirmation == e2?.confirmation &&
        e1?.companyIncome == e2?.companyIncome &&
        e1?.companyPayment == e2?.companyPayment &&
        e1?.isIncome == e2?.isIncome &&
        e1?.stock == e2?.stock &&
        e1?.stockMovement == e2?.stockMovement &&
        e1?.isChangedStock == e2?.isChangedStock &&
        e1?.currentAccount == e2?.currentAccount &&
        e1?.currentAccountBill == e2?.currentAccountBill &&
        e1?.currentAccountID == e2?.currentAccountID &&
        e1?.companyVehicle == e2?.companyVehicle &&
        e1?.vehiclePayment == e2?.vehiclePayment &&
        e1?.spendMoneyForAllowence == e2?.spendMoneyForAllowence &&
        e1?.note == e2?.note &&
        e1?.noteImportant == e2?.noteImportant &&
        e1?.noteGoals == e2?.noteGoals &&
        e1?.noteFinance == e2?.noteFinance;
  }

  @override
  int hash(AjandaRecord? e) => const ListEquality().hash([
        e?.description,
        e?.type,
        e?.dateTime,
        e?.fullDescription,
        e?.invitation,
        e?.companyTask,
        e?.companyDuty,
        e?.companyTaskDuties,
        e?.workPlace,
        e?.company,
        e?.companyDepartment,
        e?.companyRole,
        e?.companyUnit,
        e?.form,
        e?.companyName,
        e?.sentMoneyForAllowence,
        e?.transaction,
        e?.confirmation,
        e?.companyIncome,
        e?.companyPayment,
        e?.isIncome,
        e?.stock,
        e?.stockMovement,
        e?.isChangedStock,
        e?.currentAccount,
        e?.currentAccountBill,
        e?.currentAccountID,
        e?.companyVehicle,
        e?.vehiclePayment,
        e?.spendMoneyForAllowence,
        e?.note,
        e?.noteImportant,
        e?.noteGoals,
        e?.noteFinance
      ]);

  @override
  bool isValidKey(Object? o) => o is AjandaRecord;
}
