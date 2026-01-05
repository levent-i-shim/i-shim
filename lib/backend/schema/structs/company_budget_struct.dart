// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CompanyBudgetStruct extends FFFirebaseStruct {
  CompanyBudgetStruct({
    String? companyName,
    DocumentReference? companyRef,
    double? totalIncome,
    double? totalPayment,
    double? totalExpanditury,
    double? totalSalary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _companyRef = companyRef,
        _totalIncome = totalIncome,
        _totalPayment = totalPayment,
        _totalExpanditury = totalExpanditury,
        _totalSalary = totalSalary,
        super(firestoreUtilData);

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  set companyRef(DocumentReference? val) => _companyRef = val;

  bool hasCompanyRef() => _companyRef != null;

  // "totalIncome" field.
  double? _totalIncome;
  double get totalIncome => _totalIncome ?? 0.0;
  set totalIncome(double? val) => _totalIncome = val;

  void incrementTotalIncome(double amount) =>
      totalIncome = totalIncome + amount;

  bool hasTotalIncome() => _totalIncome != null;

  // "totalPayment" field.
  double? _totalPayment;
  double get totalPayment => _totalPayment ?? 0.0;
  set totalPayment(double? val) => _totalPayment = val;

  void incrementTotalPayment(double amount) =>
      totalPayment = totalPayment + amount;

  bool hasTotalPayment() => _totalPayment != null;

  // "totalExpanditury" field.
  double? _totalExpanditury;
  double get totalExpanditury => _totalExpanditury ?? 0.0;
  set totalExpanditury(double? val) => _totalExpanditury = val;

  void incrementTotalExpanditury(double amount) =>
      totalExpanditury = totalExpanditury + amount;

  bool hasTotalExpanditury() => _totalExpanditury != null;

  // "totalSalary" field.
  double? _totalSalary;
  double get totalSalary => _totalSalary ?? 0.0;
  set totalSalary(double? val) => _totalSalary = val;

  void incrementTotalSalary(double amount) =>
      totalSalary = totalSalary + amount;

  bool hasTotalSalary() => _totalSalary != null;

  static CompanyBudgetStruct fromMap(Map<String, dynamic> data) =>
      CompanyBudgetStruct(
        companyName: data['companyName'] as String?,
        companyRef: data['companyRef'] as DocumentReference?,
        totalIncome: castToType<double>(data['totalIncome']),
        totalPayment: castToType<double>(data['totalPayment']),
        totalExpanditury: castToType<double>(data['totalExpanditury']),
        totalSalary: castToType<double>(data['totalSalary']),
      );

  static CompanyBudgetStruct? maybeFromMap(dynamic data) => data is Map
      ? CompanyBudgetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'companyName': _companyName,
        'companyRef': _companyRef,
        'totalIncome': _totalIncome,
        'totalPayment': _totalPayment,
        'totalExpanditury': _totalExpanditury,
        'totalSalary': _totalSalary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'companyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'companyRef': serializeParam(
          _companyRef,
          ParamType.DocumentReference,
        ),
        'totalIncome': serializeParam(
          _totalIncome,
          ParamType.double,
        ),
        'totalPayment': serializeParam(
          _totalPayment,
          ParamType.double,
        ),
        'totalExpanditury': serializeParam(
          _totalExpanditury,
          ParamType.double,
        ),
        'totalSalary': serializeParam(
          _totalSalary,
          ParamType.double,
        ),
      }.withoutNulls;

  static CompanyBudgetStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompanyBudgetStruct(
        companyName: deserializeParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
        companyRef: deserializeParam(
          data['companyRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['companies'],
        ),
        totalIncome: deserializeParam(
          data['totalIncome'],
          ParamType.double,
          false,
        ),
        totalPayment: deserializeParam(
          data['totalPayment'],
          ParamType.double,
          false,
        ),
        totalExpanditury: deserializeParam(
          data['totalExpanditury'],
          ParamType.double,
          false,
        ),
        totalSalary: deserializeParam(
          data['totalSalary'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CompanyBudgetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompanyBudgetStruct &&
        companyName == other.companyName &&
        companyRef == other.companyRef &&
        totalIncome == other.totalIncome &&
        totalPayment == other.totalPayment &&
        totalExpanditury == other.totalExpanditury &&
        totalSalary == other.totalSalary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyName,
        companyRef,
        totalIncome,
        totalPayment,
        totalExpanditury,
        totalSalary
      ]);
}

CompanyBudgetStruct createCompanyBudgetStruct({
  String? companyName,
  DocumentReference? companyRef,
  double? totalIncome,
  double? totalPayment,
  double? totalExpanditury,
  double? totalSalary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyBudgetStruct(
      companyName: companyName,
      companyRef: companyRef,
      totalIncome: totalIncome,
      totalPayment: totalPayment,
      totalExpanditury: totalExpanditury,
      totalSalary: totalSalary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompanyBudgetStruct? updateCompanyBudgetStruct(
  CompanyBudgetStruct? companyBudget, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    companyBudget
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompanyBudgetStructData(
  Map<String, dynamic> firestoreData,
  CompanyBudgetStruct? companyBudget,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (companyBudget == null) {
    return;
  }
  if (companyBudget.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && companyBudget.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyBudgetData =
      getCompanyBudgetFirestoreData(companyBudget, forFieldValue);
  final nestedData =
      companyBudgetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = companyBudget.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompanyBudgetFirestoreData(
  CompanyBudgetStruct? companyBudget, [
  bool forFieldValue = false,
]) {
  if (companyBudget == null) {
    return {};
  }
  final firestoreData = mapToFirestore(companyBudget.toMap());

  // Add any Firestore field values
  companyBudget.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyBudgetListFirestoreData(
  List<CompanyBudgetStruct>? companyBudgets,
) =>
    companyBudgets
        ?.map((e) => getCompanyBudgetFirestoreData(e, true))
        .toList() ??
    [];
