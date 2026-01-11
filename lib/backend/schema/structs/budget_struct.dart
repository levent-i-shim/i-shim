// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetStruct extends FFFirebaseStruct {
  BudgetStruct({
    double? monthly,
    double? day15,
    double? week,
    double? day,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monthly = monthly,
        _day15 = day15,
        _week = week,
        _day = day,
        super(firestoreUtilData);

  // "monthly" field.
  double? _monthly;
  double get monthly => _monthly ?? 0.0;
  set monthly(double? val) => _monthly = val;

  void incrementMonthly(double amount) => monthly = monthly + amount;

  bool hasMonthly() => _monthly != null;

  // "day15" field.
  double? _day15;
  double get day15 => _day15 ?? 0.0;
  set day15(double? val) => _day15 = val;

  void incrementDay15(double amount) => day15 = day15 + amount;

  bool hasDay15() => _day15 != null;

  // "week" field.
  double? _week;
  double get week => _week ?? 0.0;
  set week(double? val) => _week = val;

  void incrementWeek(double amount) => week = week + amount;

  bool hasWeek() => _week != null;

  // "day" field.
  double? _day;
  double get day => _day ?? 0.0;
  set day(double? val) => _day = val;

  void incrementDay(double amount) => day = day + amount;

  bool hasDay() => _day != null;

  static BudgetStruct fromMap(Map<String, dynamic> data) => BudgetStruct(
        monthly: castToType<double>(data['monthly']),
        day15: castToType<double>(data['day15']),
        week: castToType<double>(data['week']),
        day: castToType<double>(data['day']),
      );

  static BudgetStruct? maybeFromMap(dynamic data) =>
      data is Map ? BudgetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'monthly': _monthly,
        'day15': _day15,
        'week': _week,
        'day': _day,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'monthly': serializeParam(
          _monthly,
          ParamType.double,
        ),
        'day15': serializeParam(
          _day15,
          ParamType.double,
        ),
        'week': serializeParam(
          _week,
          ParamType.double,
        ),
        'day': serializeParam(
          _day,
          ParamType.double,
        ),
      }.withoutNulls;

  static BudgetStruct fromSerializableMap(Map<String, dynamic> data) =>
      BudgetStruct(
        monthly: deserializeParam(
          data['monthly'],
          ParamType.double,
          false,
        ),
        day15: deserializeParam(
          data['day15'],
          ParamType.double,
          false,
        ),
        week: deserializeParam(
          data['week'],
          ParamType.double,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BudgetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BudgetStruct &&
        monthly == other.monthly &&
        day15 == other.day15 &&
        week == other.week &&
        day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([monthly, day15, week, day]);
}

BudgetStruct createBudgetStruct({
  double? monthly,
  double? day15,
  double? week,
  double? day,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BudgetStruct(
      monthly: monthly,
      day15: day15,
      week: week,
      day: day,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BudgetStruct? updateBudgetStruct(
  BudgetStruct? budget, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    budget
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBudgetStructData(
  Map<String, dynamic> firestoreData,
  BudgetStruct? budget,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (budget == null) {
    return;
  }
  if (budget.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && budget.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final budgetData = getBudgetFirestoreData(budget, forFieldValue);
  final nestedData = budgetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = budget.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBudgetFirestoreData(
  BudgetStruct? budget, [
  bool forFieldValue = false,
]) {
  if (budget == null) {
    return {};
  }
  final firestoreData = mapToFirestore(budget.toMap());

  // Add any Firestore field values
  budget.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBudgetListFirestoreData(
  List<BudgetStruct>? budgets,
) =>
    budgets?.map((e) => getBudgetFirestoreData(e, true)).toList() ?? [];
