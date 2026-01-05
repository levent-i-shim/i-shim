// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkplaceStruct extends FFFirebaseStruct {
  WorkplaceStruct({
    DocumentReference? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static WorkplaceStruct fromMap(Map<String, dynamic> data) => WorkplaceStruct(
        id: data['id'] as DocumentReference?,
        name: data['name'] as String?,
      );

  static WorkplaceStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkplaceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkplaceStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkplaceStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['workPlaces'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkplaceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkplaceStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

WorkplaceStruct createWorkplaceStruct({
  DocumentReference? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkplaceStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkplaceStruct? updateWorkplaceStruct(
  WorkplaceStruct? workplace, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workplace
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkplaceStructData(
  Map<String, dynamic> firestoreData,
  WorkplaceStruct? workplace,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workplace == null) {
    return;
  }
  if (workplace.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workplace.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workplaceData = getWorkplaceFirestoreData(workplace, forFieldValue);
  final nestedData = workplaceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workplace.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkplaceFirestoreData(
  WorkplaceStruct? workplace, [
  bool forFieldValue = false,
]) {
  if (workplace == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workplace.toMap());

  // Add any Firestore field values
  workplace.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkplaceListFirestoreData(
  List<WorkplaceStruct>? workplaces,
) =>
    workplaces?.map((e) => getWorkplaceFirestoreData(e, true)).toList() ?? [];
