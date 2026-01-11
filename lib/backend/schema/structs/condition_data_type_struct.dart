// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConditionDataTypeStruct extends FFFirebaseStruct {
  ConditionDataTypeStruct({
    String? fieldName,
    String? conditionType,
    String? text,
    DateTime? date,
    double? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fieldName = fieldName,
        _conditionType = conditionType,
        _text = text,
        _date = date,
        _number = number,
        super(firestoreUtilData);

  // "fieldName" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  set fieldName(String? val) => _fieldName = val;

  bool hasFieldName() => _fieldName != null;

  // "conditionType" field.
  String? _conditionType;
  String get conditionType => _conditionType ?? '';
  set conditionType(String? val) => _conditionType = val;

  bool hasConditionType() => _conditionType != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "number" field.
  double? _number;
  double get number => _number ?? 0.0;
  set number(double? val) => _number = val;

  void incrementNumber(double amount) => number = number + amount;

  bool hasNumber() => _number != null;

  static ConditionDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ConditionDataTypeStruct(
        fieldName: data['fieldName'] as String?,
        conditionType: data['conditionType'] as String?,
        text: data['text'] as String?,
        date: data['date'] as DateTime?,
        number: castToType<double>(data['number']),
      );

  static ConditionDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ConditionDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fieldName': _fieldName,
        'conditionType': _conditionType,
        'text': _text,
        'date': _date,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fieldName': serializeParam(
          _fieldName,
          ParamType.String,
        ),
        'conditionType': serializeParam(
          _conditionType,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'number': serializeParam(
          _number,
          ParamType.double,
        ),
      }.withoutNulls;

  static ConditionDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConditionDataTypeStruct(
        fieldName: deserializeParam(
          data['fieldName'],
          ParamType.String,
          false,
        ),
        conditionType: deserializeParam(
          data['conditionType'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ConditionDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConditionDataTypeStruct &&
        fieldName == other.fieldName &&
        conditionType == other.conditionType &&
        text == other.text &&
        date == other.date &&
        number == other.number;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fieldName, conditionType, text, date, number]);
}

ConditionDataTypeStruct createConditionDataTypeStruct({
  String? fieldName,
  String? conditionType,
  String? text,
  DateTime? date,
  double? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConditionDataTypeStruct(
      fieldName: fieldName,
      conditionType: conditionType,
      text: text,
      date: date,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConditionDataTypeStruct? updateConditionDataTypeStruct(
  ConditionDataTypeStruct? conditionDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    conditionDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConditionDataTypeStructData(
  Map<String, dynamic> firestoreData,
  ConditionDataTypeStruct? conditionDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (conditionDataType == null) {
    return;
  }
  if (conditionDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && conditionDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final conditionDataTypeData =
      getConditionDataTypeFirestoreData(conditionDataType, forFieldValue);
  final nestedData =
      conditionDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = conditionDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConditionDataTypeFirestoreData(
  ConditionDataTypeStruct? conditionDataType, [
  bool forFieldValue = false,
]) {
  if (conditionDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(conditionDataType.toMap());

  // Add any Firestore field values
  conditionDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConditionDataTypeListFirestoreData(
  List<ConditionDataTypeStruct>? conditionDataTypes,
) =>
    conditionDataTypes
        ?.map((e) => getConditionDataTypeFirestoreData(e, true))
        .toList() ??
    [];
