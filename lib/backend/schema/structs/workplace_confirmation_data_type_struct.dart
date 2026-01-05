// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkplaceConfirmationDataTypeStruct extends FFFirebaseStruct {
  WorkplaceConfirmationDataTypeStruct({
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

  static WorkplaceConfirmationDataTypeStruct fromMap(
          Map<String, dynamic> data) =>
      WorkplaceConfirmationDataTypeStruct(
        id: data['id'] as DocumentReference?,
        lastMessage: data['lastMessage'] as String?,
        lastMessageTime: data['lastMessageTime'] as DateTime?,
        userName: data['userName'] as String?,
      );

  static WorkplaceConfirmationDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? WorkplaceConfirmationDataTypeStruct.fromMap(
              data.cast<String, dynamic>())
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

  static WorkplaceConfirmationDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WorkplaceConfirmationDataTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['workplaceConfirmations'],
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
  String toString() => 'WorkplaceConfirmationDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkplaceConfirmationDataTypeStruct &&
        id == other.id &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        userName == other.userName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, lastMessage, lastMessageTime, userName]);
}

WorkplaceConfirmationDataTypeStruct createWorkplaceConfirmationDataTypeStruct({
  DocumentReference? id,
  String? lastMessage,
  DateTime? lastMessageTime,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkplaceConfirmationDataTypeStruct(
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

WorkplaceConfirmationDataTypeStruct? updateWorkplaceConfirmationDataTypeStruct(
  WorkplaceConfirmationDataTypeStruct? workplaceConfirmationDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workplaceConfirmationDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkplaceConfirmationDataTypeStructData(
  Map<String, dynamic> firestoreData,
  WorkplaceConfirmationDataTypeStruct? workplaceConfirmationDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workplaceConfirmationDataType == null) {
    return;
  }
  if (workplaceConfirmationDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      workplaceConfirmationDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workplaceConfirmationDataTypeData =
      getWorkplaceConfirmationDataTypeFirestoreData(
          workplaceConfirmationDataType, forFieldValue);
  final nestedData = workplaceConfirmationDataTypeData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      workplaceConfirmationDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkplaceConfirmationDataTypeFirestoreData(
  WorkplaceConfirmationDataTypeStruct? workplaceConfirmationDataType, [
  bool forFieldValue = false,
]) {
  if (workplaceConfirmationDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workplaceConfirmationDataType.toMap());

  // Add any Firestore field values
  workplaceConfirmationDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkplaceConfirmationDataTypeListFirestoreData(
  List<WorkplaceConfirmationDataTypeStruct>? workplaceConfirmationDataTypes,
) =>
    workplaceConfirmationDataTypes
        ?.map((e) => getWorkplaceConfirmationDataTypeFirestoreData(e, true))
        .toList() ??
    [];
