// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsersDataStruct extends FFFirebaseStruct {
  UsersDataStruct({
    String? userName,
    DocumentReference? userRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userName = userName,
        _userRef = userRef,
        super(firestoreUtilData);

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  static UsersDataStruct fromMap(Map<String, dynamic> data) => UsersDataStruct(
        userName: data['userName'] as String?,
        userRef: data['userRef'] as DocumentReference?,
      );

  static UsersDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UsersDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userName': _userName,
        'userRef': _userRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UsersDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersDataStruct(
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UsersDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersDataStruct &&
        userName == other.userName &&
        userRef == other.userRef;
  }

  @override
  int get hashCode => const ListEquality().hash([userName, userRef]);
}

UsersDataStruct createUsersDataStruct({
  String? userName,
  DocumentReference? userRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersDataStruct(
      userName: userName,
      userRef: userRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersDataStruct? updateUsersDataStruct(
  UsersDataStruct? usersData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersDataStructData(
  Map<String, dynamic> firestoreData,
  UsersDataStruct? usersData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersData == null) {
    return;
  }
  if (usersData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usersData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersDataData = getUsersDataFirestoreData(usersData, forFieldValue);
  final nestedData = usersDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usersData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersDataFirestoreData(
  UsersDataStruct? usersData, [
  bool forFieldValue = false,
]) {
  if (usersData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersData.toMap());

  // Add any Firestore field values
  usersData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersDataListFirestoreData(
  List<UsersDataStruct>? usersDatas,
) =>
    usersDatas?.map((e) => getUsersDataFirestoreData(e, true)).toList() ?? [];
