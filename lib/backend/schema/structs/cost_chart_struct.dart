// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CostChartStruct extends FFFirebaseStruct {
  CostChartStruct({
    String? date,
    double? cost,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _cost = cost,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  set cost(double? val) => _cost = val;

  void incrementCost(double amount) => cost = cost + amount;

  bool hasCost() => _cost != null;

  static CostChartStruct fromMap(Map<String, dynamic> data) => CostChartStruct(
        date: data['date'] as String?,
        cost: castToType<double>(data['cost']),
      );

  static CostChartStruct? maybeFromMap(dynamic data) => data is Map
      ? CostChartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'cost': _cost,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.double,
        ),
      }.withoutNulls;

  static CostChartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CostChartStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        cost: deserializeParam(
          data['cost'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CostChartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CostChartStruct && date == other.date && cost == other.cost;
  }

  @override
  int get hashCode => const ListEquality().hash([date, cost]);
}

CostChartStruct createCostChartStruct({
  String? date,
  double? cost,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CostChartStruct(
      date: date,
      cost: cost,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CostChartStruct? updateCostChartStruct(
  CostChartStruct? costChart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    costChart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCostChartStructData(
  Map<String, dynamic> firestoreData,
  CostChartStruct? costChart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (costChart == null) {
    return;
  }
  if (costChart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && costChart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final costChartData = getCostChartFirestoreData(costChart, forFieldValue);
  final nestedData = costChartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = costChart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCostChartFirestoreData(
  CostChartStruct? costChart, [
  bool forFieldValue = false,
]) {
  if (costChart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(costChart.toMap());

  // Add any Firestore field values
  costChart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCostChartListFirestoreData(
  List<CostChartStruct>? costCharts,
) =>
    costCharts?.map((e) => getCostChartFirestoreData(e, true)).toList() ?? [];
