// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserDetailDataStruct extends FFFirebaseStruct {
  UserDetailDataStruct({
    DocumentReference? id,
    String? name,
    String? roleName,
    String? unitName,
    String? departmentName,
    DocumentReference? companyRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _roleName = roleName,
        _unitName = unitName,
        _departmentName = departmentName,
        _companyRef = companyRef,
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

  // "roleName" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  set roleName(String? val) => _roleName = val;

  bool hasRoleName() => _roleName != null;

  // "unitName" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  set unitName(String? val) => _unitName = val;

  bool hasUnitName() => _unitName != null;

  // "departmentName" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  set departmentName(String? val) => _departmentName = val;

  bool hasDepartmentName() => _departmentName != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  set companyRef(DocumentReference? val) => _companyRef = val;

  bool hasCompanyRef() => _companyRef != null;

  static UserDetailDataStruct fromMap(Map<String, dynamic> data) =>
      UserDetailDataStruct(
        id: data['id'] as DocumentReference?,
        name: data['name'] as String?,
        roleName: data['roleName'] as String?,
        unitName: data['unitName'] as String?,
        departmentName: data['departmentName'] as String?,
        companyRef: data['companyRef'] as DocumentReference?,
      );

  static UserDetailDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDetailDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'roleName': _roleName,
        'unitName': _unitName,
        'departmentName': _departmentName,
        'companyRef': _companyRef,
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
        'roleName': serializeParam(
          _roleName,
          ParamType.String,
        ),
        'unitName': serializeParam(
          _unitName,
          ParamType.String,
        ),
        'departmentName': serializeParam(
          _departmentName,
          ParamType.String,
        ),
        'companyRef': serializeParam(
          _companyRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserDetailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDetailDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        roleName: deserializeParam(
          data['roleName'],
          ParamType.String,
          false,
        ),
        unitName: deserializeParam(
          data['unitName'],
          ParamType.String,
          false,
        ),
        departmentName: deserializeParam(
          data['departmentName'],
          ParamType.String,
          false,
        ),
        companyRef: deserializeParam(
          data['companyRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['companies'],
        ),
      );

  @override
  String toString() => 'UserDetailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDetailDataStruct &&
        id == other.id &&
        name == other.name &&
        roleName == other.roleName &&
        unitName == other.unitName &&
        departmentName == other.departmentName &&
        companyRef == other.companyRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, roleName, unitName, departmentName, companyRef]);
}

UserDetailDataStruct createUserDetailDataStruct({
  DocumentReference? id,
  String? name,
  String? roleName,
  String? unitName,
  String? departmentName,
  DocumentReference? companyRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDetailDataStruct(
      id: id,
      name: name,
      roleName: roleName,
      unitName: unitName,
      departmentName: departmentName,
      companyRef: companyRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDetailDataStruct? updateUserDetailDataStruct(
  UserDetailDataStruct? userDetailData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userDetailData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDetailDataStructData(
  Map<String, dynamic> firestoreData,
  UserDetailDataStruct? userDetailData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userDetailData == null) {
    return;
  }
  if (userDetailData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userDetailData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDetailDataData =
      getUserDetailDataFirestoreData(userDetailData, forFieldValue);
  final nestedData =
      userDetailDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userDetailData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDetailDataFirestoreData(
  UserDetailDataStruct? userDetailData, [
  bool forFieldValue = false,
]) {
  if (userDetailData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userDetailData.toMap());

  // Add any Firestore field values
  userDetailData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDetailDataListFirestoreData(
  List<UserDetailDataStruct>? userDetailDatas,
) =>
    userDetailDatas
        ?.map((e) => getUserDetailDataFirestoreData(e, true))
        .toList() ??
    [];
