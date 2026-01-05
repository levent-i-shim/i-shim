// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChartXYPairsStruct extends FFFirebaseStruct {
  ChartXYPairsStruct({
    double? yField,
    String? xField,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _yField = yField,
        _xField = xField,
        super(firestoreUtilData);

  // "yField" field.
  double? _yField;
  double get yField => _yField ?? 0.0;
  set yField(double? val) => _yField = val;

  void incrementYField(double amount) => yField = yField + amount;

  bool hasYField() => _yField != null;

  // "xField" field.
  String? _xField;
  String get xField => _xField ?? '';
  set xField(String? val) => _xField = val;

  bool hasXField() => _xField != null;

  static ChartXYPairsStruct fromMap(Map<String, dynamic> data) =>
      ChartXYPairsStruct(
        yField: castToType<double>(data['yField']),
        xField: data['xField'] as String?,
      );

  static ChartXYPairsStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartXYPairsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'yField': _yField,
        'xField': _xField,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'yField': serializeParam(
          _yField,
          ParamType.double,
        ),
        'xField': serializeParam(
          _xField,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChartXYPairsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartXYPairsStruct(
        yField: deserializeParam(
          data['yField'],
          ParamType.double,
          false,
        ),
        xField: deserializeParam(
          data['xField'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChartXYPairsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartXYPairsStruct &&
        yField == other.yField &&
        xField == other.xField;
  }

  @override
  int get hashCode => const ListEquality().hash([yField, xField]);
}

ChartXYPairsStruct createChartXYPairsStruct({
  double? yField,
  String? xField,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChartXYPairsStruct(
      yField: yField,
      xField: xField,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChartXYPairsStruct? updateChartXYPairsStruct(
  ChartXYPairsStruct? chartXYPairs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chartXYPairs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChartXYPairsStructData(
  Map<String, dynamic> firestoreData,
  ChartXYPairsStruct? chartXYPairs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chartXYPairs == null) {
    return;
  }
  if (chartXYPairs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chartXYPairs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chartXYPairsData =
      getChartXYPairsFirestoreData(chartXYPairs, forFieldValue);
  final nestedData =
      chartXYPairsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chartXYPairs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChartXYPairsFirestoreData(
  ChartXYPairsStruct? chartXYPairs, [
  bool forFieldValue = false,
]) {
  if (chartXYPairs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chartXYPairs.toMap());

  // Add any Firestore field values
  chartXYPairs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChartXYPairsListFirestoreData(
  List<ChartXYPairsStruct>? chartXYPairss,
) =>
    chartXYPairss?.map((e) => getChartXYPairsFirestoreData(e, true)).toList() ??
    [];
