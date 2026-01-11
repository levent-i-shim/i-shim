// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddPaymentValuesStruct extends FFFirebaseStruct {
  AddPaymentValuesStruct({
    double? paymentValues,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _paymentValues = paymentValues,
        super(firestoreUtilData);

  // "paymentValues" field.
  double? _paymentValues;
  double get paymentValues => _paymentValues ?? 0.0;
  set paymentValues(double? val) => _paymentValues = val;

  void incrementPaymentValues(double amount) =>
      paymentValues = paymentValues + amount;

  bool hasPaymentValues() => _paymentValues != null;

  static AddPaymentValuesStruct fromMap(Map<String, dynamic> data) =>
      AddPaymentValuesStruct(
        paymentValues: castToType<double>(data['paymentValues']),
      );

  static AddPaymentValuesStruct? maybeFromMap(dynamic data) => data is Map
      ? AddPaymentValuesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'paymentValues': _paymentValues,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'paymentValues': serializeParam(
          _paymentValues,
          ParamType.double,
        ),
      }.withoutNulls;

  static AddPaymentValuesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AddPaymentValuesStruct(
        paymentValues: deserializeParam(
          data['paymentValues'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AddPaymentValuesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddPaymentValuesStruct &&
        paymentValues == other.paymentValues;
  }

  @override
  int get hashCode => const ListEquality().hash([paymentValues]);
}

AddPaymentValuesStruct createAddPaymentValuesStruct({
  double? paymentValues,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddPaymentValuesStruct(
      paymentValues: paymentValues,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddPaymentValuesStruct? updateAddPaymentValuesStruct(
  AddPaymentValuesStruct? addPaymentValues, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addPaymentValues
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddPaymentValuesStructData(
  Map<String, dynamic> firestoreData,
  AddPaymentValuesStruct? addPaymentValues,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addPaymentValues == null) {
    return;
  }
  if (addPaymentValues.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addPaymentValues.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addPaymentValuesData =
      getAddPaymentValuesFirestoreData(addPaymentValues, forFieldValue);
  final nestedData =
      addPaymentValuesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addPaymentValues.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddPaymentValuesFirestoreData(
  AddPaymentValuesStruct? addPaymentValues, [
  bool forFieldValue = false,
]) {
  if (addPaymentValues == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addPaymentValues.toMap());

  // Add any Firestore field values
  addPaymentValues.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddPaymentValuesListFirestoreData(
  List<AddPaymentValuesStruct>? addPaymentValuess,
) =>
    addPaymentValuess
        ?.map((e) => getAddPaymentValuesFirestoreData(e, true))
        .toList() ??
    [];
