// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class YesterdayBudgetStruct extends FFFirebaseStruct {
  YesterdayBudgetStruct({
    String? id,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _value = value,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static YesterdayBudgetStruct fromMap(Map<String, dynamic> data) =>
      YesterdayBudgetStruct(
        id: data['id'] as String?,
        value: castToType<double>(data['value']),
      );

  static YesterdayBudgetStruct? maybeFromMap(dynamic data) => data is Map
      ? YesterdayBudgetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static YesterdayBudgetStruct fromSerializableMap(Map<String, dynamic> data) =>
      YesterdayBudgetStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'YesterdayBudgetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is YesterdayBudgetStruct &&
        id == other.id &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([id, value]);
}

YesterdayBudgetStruct createYesterdayBudgetStruct({
  String? id,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    YesterdayBudgetStruct(
      id: id,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

YesterdayBudgetStruct? updateYesterdayBudgetStruct(
  YesterdayBudgetStruct? yesterdayBudget, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    yesterdayBudget
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addYesterdayBudgetStructData(
  Map<String, dynamic> firestoreData,
  YesterdayBudgetStruct? yesterdayBudget,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (yesterdayBudget == null) {
    return;
  }
  if (yesterdayBudget.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && yesterdayBudget.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final yesterdayBudgetData =
      getYesterdayBudgetFirestoreData(yesterdayBudget, forFieldValue);
  final nestedData =
      yesterdayBudgetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = yesterdayBudget.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getYesterdayBudgetFirestoreData(
  YesterdayBudgetStruct? yesterdayBudget, [
  bool forFieldValue = false,
]) {
  if (yesterdayBudget == null) {
    return {};
  }
  final firestoreData = mapToFirestore(yesterdayBudget.toMap());

  // Add any Firestore field values
  yesterdayBudget.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getYesterdayBudgetListFirestoreData(
  List<YesterdayBudgetStruct>? yesterdayBudgets,
) =>
    yesterdayBudgets
        ?.map((e) => getYesterdayBudgetFirestoreData(e, true))
        .toList() ??
    [];
