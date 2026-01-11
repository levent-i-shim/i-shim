// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalConfirmationDataTypeStruct extends FFFirebaseStruct {
  PersonalConfirmationDataTypeStruct({
    DocumentReference? id,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _lastMessage = lastMessage,
        _lastMessageTime = lastMessageTime,
        _userName = userName,
        super(firestoreUtilData);

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;

  bool hasId() => _id != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;

  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  set lastMessageTime(DateTime? val) => _lastMessageTime = val;

  bool hasLastMessageTime() => _lastMessageTime != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  static PersonalConfirmationDataTypeStruct fromMap(
          Map<String, dynamic> data) =>
      PersonalConfirmationDataTypeStruct(
        id: data['id'] as DocumentReference?,
        lastMessage: data['lastMessage'] as String?,
        lastMessageTime: data['lastMessageTime'] as DateTime?,
        userName: data['userName'] as String?,
      );

  static PersonalConfirmationDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? PersonalConfirmationDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'lastMessage': _lastMessage,
        'lastMessageTime': _lastMessageTime,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'lastMessage': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'lastMessageTime': serializeParam(
          _lastMessageTime,
          ParamType.DateTime,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonalConfirmationDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PersonalConfirmationDataTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['PersonalConfirmations'],
        ),
        lastMessage: deserializeParam(
          data['lastMessage'],
          ParamType.String,
          false,
        ),
        lastMessageTime: deserializeParam(
          data['lastMessageTime'],
          ParamType.DateTime,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PersonalConfirmationDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonalConfirmationDataTypeStruct &&
        id == other.id &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        userName == other.userName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, lastMessage, lastMessageTime, userName]);
}

PersonalConfirmationDataTypeStruct createPersonalConfirmationDataTypeStruct({
  DocumentReference? id,
  String? lastMessage,
  DateTime? lastMessageTime,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonalConfirmationDataTypeStruct(
      id: id,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonalConfirmationDataTypeStruct? updatePersonalConfirmationDataTypeStruct(
  PersonalConfirmationDataTypeStruct? personalConfirmationDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personalConfirmationDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonalConfirmationDataTypeStructData(
  Map<String, dynamic> firestoreData,
  PersonalConfirmationDataTypeStruct? personalConfirmationDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personalConfirmationDataType == null) {
    return;
  }
  if (personalConfirmationDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      personalConfirmationDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personalConfirmationDataTypeData =
      getPersonalConfirmationDataTypeFirestoreData(
          personalConfirmationDataType, forFieldValue);
  final nestedData = personalConfirmationDataTypeData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      personalConfirmationDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonalConfirmationDataTypeFirestoreData(
  PersonalConfirmationDataTypeStruct? personalConfirmationDataType, [
  bool forFieldValue = false,
]) {
  if (personalConfirmationDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personalConfirmationDataType.toMap());

  // Add any Firestore field values
  personalConfirmationDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonalConfirmationDataTypeListFirestoreData(
  List<PersonalConfirmationDataTypeStruct>? personalConfirmationDataTypes,
) =>
    personalConfirmationDataTypes
        ?.map((e) => getPersonalConfirmationDataTypeFirestoreData(e, true))
        .toList() ??
    [];
