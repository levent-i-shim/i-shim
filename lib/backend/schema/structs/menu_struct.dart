// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MenuStruct extends FFFirebaseStruct {
  MenuStruct({
    double? costsDataTypeField,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _costsDataTypeField = costsDataTypeField,
        super(firestoreUtilData);

  // "costsDataTypeField" field.
  double? _costsDataTypeField;
  double get costsDataTypeField => _costsDataTypeField ?? 0.0;
  set costsDataTypeField(double? val) => _costsDataTypeField = val;

  void incrementCostsDataTypeField(double amount) =>
      costsDataTypeField = costsDataTypeField + amount;

  bool hasCostsDataTypeField() => _costsDataTypeField != null;

  static MenuStruct fromMap(Map<String, dynamic> data) => MenuStruct(
        costsDataTypeField: castToType<double>(data['costsDataTypeField']),
      );

  static MenuStruct? maybeFromMap(dynamic data) =>
      data is Map ? MenuStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'costsDataTypeField': _costsDataTypeField,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'costsDataTypeField': serializeParam(
          _costsDataTypeField,
          ParamType.double,
        ),
      }.withoutNulls;

  static MenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuStruct(
        costsDataTypeField: deserializeParam(
          data['costsDataTypeField'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuStruct &&
        costsDataTypeField == other.costsDataTypeField;
  }

  @override
  int get hashCode => const ListEquality().hash([costsDataTypeField]);
}

MenuStruct createMenuStruct({
  double? costsDataTypeField,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MenuStruct(
      costsDataTypeField: costsDataTypeField,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MenuStruct? updateMenuStruct(
  MenuStruct? menu, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    menu
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMenuStructData(
  Map<String, dynamic> firestoreData,
  MenuStruct? menu,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (menu == null) {
    return;
  }
  if (menu.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && menu.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final menuData = getMenuFirestoreData(menu, forFieldValue);
  final nestedData = menuData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = menu.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMenuFirestoreData(
  MenuStruct? menu, [
  bool forFieldValue = false,
]) {
  if (menu == null) {
    return {};
  }
  final firestoreData = mapToFirestore(menu.toMap());

  // Add any Firestore field values
  menu.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMenuListFirestoreData(
  List<MenuStruct>? menus,
) =>
    menus?.map((e) => getMenuFirestoreData(e, true)).toList() ?? [];
