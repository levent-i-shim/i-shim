// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllCurrentAccountStruct extends FFFirebaseStruct {
  AllCurrentAccountStruct({
    String? sideOneType,
    String? sideOneId,
    String? sideTwoType,
    String? sideTwoId,
    DateTime? creationTime,
    bool? status,
    double? totalValueForSideOne,
    double? totalValueForSideTwo,
    DocumentReference? currentAccountId,
    int? totalBillCount,
    int? totalUnPaidBillCount,
    bool? amISideOne,
    String? counterPartyName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sideOneType = sideOneType,
        _sideOneId = sideOneId,
        _sideTwoType = sideTwoType,
        _sideTwoId = sideTwoId,
        _creationTime = creationTime,
        _status = status,
        _totalValueForSideOne = totalValueForSideOne,
        _totalValueForSideTwo = totalValueForSideTwo,
        _currentAccountId = currentAccountId,
        _totalBillCount = totalBillCount,
        _totalUnPaidBillCount = totalUnPaidBillCount,
        _amISideOne = amISideOne,
        _counterPartyName = counterPartyName,
        super(firestoreUtilData);

  // "sideOneType" field.
  String? _sideOneType;
  String get sideOneType => _sideOneType ?? '';
  set sideOneType(String? val) => _sideOneType = val;

  bool hasSideOneType() => _sideOneType != null;

  // "sideOneId" field.
  String? _sideOneId;
  String get sideOneId => _sideOneId ?? '';
  set sideOneId(String? val) => _sideOneId = val;

  bool hasSideOneId() => _sideOneId != null;

  // "sideTwoType" field.
  String? _sideTwoType;
  String get sideTwoType => _sideTwoType ?? '';
  set sideTwoType(String? val) => _sideTwoType = val;

  bool hasSideTwoType() => _sideTwoType != null;

  // "sideTwoId" field.
  String? _sideTwoId;
  String get sideTwoId => _sideTwoId ?? '';
  set sideTwoId(String? val) => _sideTwoId = val;

  bool hasSideTwoId() => _sideTwoId != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  set creationTime(DateTime? val) => _creationTime = val;

  bool hasCreationTime() => _creationTime != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;

  bool hasStatus() => _status != null;

  // "totalValueForSideOne" field.
  double? _totalValueForSideOne;
  double get totalValueForSideOne => _totalValueForSideOne ?? 0.0;
  set totalValueForSideOne(double? val) => _totalValueForSideOne = val;

  void incrementTotalValueForSideOne(double amount) =>
      totalValueForSideOne = totalValueForSideOne + amount;

  bool hasTotalValueForSideOne() => _totalValueForSideOne != null;

  // "totalValueForSideTwo" field.
  double? _totalValueForSideTwo;
  double get totalValueForSideTwo => _totalValueForSideTwo ?? 0.0;
  set totalValueForSideTwo(double? val) => _totalValueForSideTwo = val;

  void incrementTotalValueForSideTwo(double amount) =>
      totalValueForSideTwo = totalValueForSideTwo + amount;

  bool hasTotalValueForSideTwo() => _totalValueForSideTwo != null;

  // "currentAccountId" field.
  DocumentReference? _currentAccountId;
  DocumentReference? get currentAccountId => _currentAccountId;
  set currentAccountId(DocumentReference? val) => _currentAccountId = val;

  bool hasCurrentAccountId() => _currentAccountId != null;

  // "totalBillCount" field.
  int? _totalBillCount;
  int get totalBillCount => _totalBillCount ?? 0;
  set totalBillCount(int? val) => _totalBillCount = val;

  void incrementTotalBillCount(int amount) =>
      totalBillCount = totalBillCount + amount;

  bool hasTotalBillCount() => _totalBillCount != null;

  // "totalUnPaidBillCount" field.
  int? _totalUnPaidBillCount;
  int get totalUnPaidBillCount => _totalUnPaidBillCount ?? 0;
  set totalUnPaidBillCount(int? val) => _totalUnPaidBillCount = val;

  void incrementTotalUnPaidBillCount(int amount) =>
      totalUnPaidBillCount = totalUnPaidBillCount + amount;

  bool hasTotalUnPaidBillCount() => _totalUnPaidBillCount != null;

  // "amISideOne" field.
  bool? _amISideOne;
  bool get amISideOne => _amISideOne ?? false;
  set amISideOne(bool? val) => _amISideOne = val;

  bool hasAmISideOne() => _amISideOne != null;

  // "counterPartyName" field.
  String? _counterPartyName;
  String get counterPartyName => _counterPartyName ?? '';
  set counterPartyName(String? val) => _counterPartyName = val;

  bool hasCounterPartyName() => _counterPartyName != null;

  static AllCurrentAccountStruct fromMap(Map<String, dynamic> data) =>
      AllCurrentAccountStruct(
        sideOneType: data['sideOneType'] as String?,
        sideOneId: data['sideOneId'] as String?,
        sideTwoType: data['sideTwoType'] as String?,
        sideTwoId: data['sideTwoId'] as String?,
        creationTime: data['creationTime'] as DateTime?,
        status: data['status'] as bool?,
        totalValueForSideOne: castToType<double>(data['totalValueForSideOne']),
        totalValueForSideTwo: castToType<double>(data['totalValueForSideTwo']),
        currentAccountId: data['currentAccountId'] as DocumentReference?,
        totalBillCount: castToType<int>(data['totalBillCount']),
        totalUnPaidBillCount: castToType<int>(data['totalUnPaidBillCount']),
        amISideOne: data['amISideOne'] as bool?,
        counterPartyName: data['counterPartyName'] as String?,
      );

  static AllCurrentAccountStruct? maybeFromMap(dynamic data) => data is Map
      ? AllCurrentAccountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sideOneType': _sideOneType,
        'sideOneId': _sideOneId,
        'sideTwoType': _sideTwoType,
        'sideTwoId': _sideTwoId,
        'creationTime': _creationTime,
        'status': _status,
        'totalValueForSideOne': _totalValueForSideOne,
        'totalValueForSideTwo': _totalValueForSideTwo,
        'currentAccountId': _currentAccountId,
        'totalBillCount': _totalBillCount,
        'totalUnPaidBillCount': _totalUnPaidBillCount,
        'amISideOne': _amISideOne,
        'counterPartyName': _counterPartyName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sideOneType': serializeParam(
          _sideOneType,
          ParamType.String,
        ),
        'sideOneId': serializeParam(
          _sideOneId,
          ParamType.String,
        ),
        'sideTwoType': serializeParam(
          _sideTwoType,
          ParamType.String,
        ),
        'sideTwoId': serializeParam(
          _sideTwoId,
          ParamType.String,
        ),
        'creationTime': serializeParam(
          _creationTime,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'totalValueForSideOne': serializeParam(
          _totalValueForSideOne,
          ParamType.double,
        ),
        'totalValueForSideTwo': serializeParam(
          _totalValueForSideTwo,
          ParamType.double,
        ),
        'currentAccountId': serializeParam(
          _currentAccountId,
          ParamType.DocumentReference,
        ),
        'totalBillCount': serializeParam(
          _totalBillCount,
          ParamType.int,
        ),
        'totalUnPaidBillCount': serializeParam(
          _totalUnPaidBillCount,
          ParamType.int,
        ),
        'amISideOne': serializeParam(
          _amISideOne,
          ParamType.bool,
        ),
        'counterPartyName': serializeParam(
          _counterPartyName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AllCurrentAccountStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AllCurrentAccountStruct(
        sideOneType: deserializeParam(
          data['sideOneType'],
          ParamType.String,
          false,
        ),
        sideOneId: deserializeParam(
          data['sideOneId'],
          ParamType.String,
          false,
        ),
        sideTwoType: deserializeParam(
          data['sideTwoType'],
          ParamType.String,
          false,
        ),
        sideTwoId: deserializeParam(
          data['sideTwoId'],
          ParamType.String,
          false,
        ),
        creationTime: deserializeParam(
          data['creationTime'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        totalValueForSideOne: deserializeParam(
          data['totalValueForSideOne'],
          ParamType.double,
          false,
        ),
        totalValueForSideTwo: deserializeParam(
          data['totalValueForSideTwo'],
          ParamType.double,
          false,
        ),
        currentAccountId: deserializeParam(
          data['currentAccountId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['currentAccount'],
        ),
        totalBillCount: deserializeParam(
          data['totalBillCount'],
          ParamType.int,
          false,
        ),
        totalUnPaidBillCount: deserializeParam(
          data['totalUnPaidBillCount'],
          ParamType.int,
          false,
        ),
        amISideOne: deserializeParam(
          data['amISideOne'],
          ParamType.bool,
          false,
        ),
        counterPartyName: deserializeParam(
          data['counterPartyName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AllCurrentAccountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AllCurrentAccountStruct &&
        sideOneType == other.sideOneType &&
        sideOneId == other.sideOneId &&
        sideTwoType == other.sideTwoType &&
        sideTwoId == other.sideTwoId &&
        creationTime == other.creationTime &&
        status == other.status &&
        totalValueForSideOne == other.totalValueForSideOne &&
        totalValueForSideTwo == other.totalValueForSideTwo &&
        currentAccountId == other.currentAccountId &&
        totalBillCount == other.totalBillCount &&
        totalUnPaidBillCount == other.totalUnPaidBillCount &&
        amISideOne == other.amISideOne &&
        counterPartyName == other.counterPartyName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sideOneType,
        sideOneId,
        sideTwoType,
        sideTwoId,
        creationTime,
        status,
        totalValueForSideOne,
        totalValueForSideTwo,
        currentAccountId,
        totalBillCount,
        totalUnPaidBillCount,
        amISideOne,
        counterPartyName
      ]);
}

AllCurrentAccountStruct createAllCurrentAccountStruct({
  String? sideOneType,
  String? sideOneId,
  String? sideTwoType,
  String? sideTwoId,
  DateTime? creationTime,
  bool? status,
  double? totalValueForSideOne,
  double? totalValueForSideTwo,
  DocumentReference? currentAccountId,
  int? totalBillCount,
  int? totalUnPaidBillCount,
  bool? amISideOne,
  String? counterPartyName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllCurrentAccountStruct(
      sideOneType: sideOneType,
      sideOneId: sideOneId,
      sideTwoType: sideTwoType,
      sideTwoId: sideTwoId,
      creationTime: creationTime,
      status: status,
      totalValueForSideOne: totalValueForSideOne,
      totalValueForSideTwo: totalValueForSideTwo,
      currentAccountId: currentAccountId,
      totalBillCount: totalBillCount,
      totalUnPaidBillCount: totalUnPaidBillCount,
      amISideOne: amISideOne,
      counterPartyName: counterPartyName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AllCurrentAccountStruct? updateAllCurrentAccountStruct(
  AllCurrentAccountStruct? allCurrentAccount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    allCurrentAccount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAllCurrentAccountStructData(
  Map<String, dynamic> firestoreData,
  AllCurrentAccountStruct? allCurrentAccount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allCurrentAccount == null) {
    return;
  }
  if (allCurrentAccount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && allCurrentAccount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allCurrentAccountData =
      getAllCurrentAccountFirestoreData(allCurrentAccount, forFieldValue);
  final nestedData =
      allCurrentAccountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = allCurrentAccount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAllCurrentAccountFirestoreData(
  AllCurrentAccountStruct? allCurrentAccount, [
  bool forFieldValue = false,
]) {
  if (allCurrentAccount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(allCurrentAccount.toMap());

  // Add any Firestore field values
  allCurrentAccount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllCurrentAccountListFirestoreData(
  List<AllCurrentAccountStruct>? allCurrentAccounts,
) =>
    allCurrentAccounts
        ?.map((e) => getAllCurrentAccountFirestoreData(e, true))
        .toList() ??
    [];
