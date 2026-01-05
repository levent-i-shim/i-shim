// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CompanyConfirmationsDataTypeStruct extends FFFirebaseStruct {
  CompanyConfirmationsDataTypeStruct({
    DocumentReference? confirmationId,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _confirmationId = confirmationId,
        _lastMessage = lastMessage,
        _lastMessageTime = lastMessageTime,
        _userName = userName,
        super(firestoreUtilData);

  // "confirmationId" field.
  DocumentReference? _confirmationId;
  DocumentReference? get confirmationId => _confirmationId;
  set confirmationId(DocumentReference? val) => _confirmationId = val;

  bool hasConfirmationId() => _confirmationId != null;

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

  static CompanyConfirmationsDataTypeStruct fromMap(
          Map<String, dynamic> data) =>
      CompanyConfirmationsDataTypeStruct(
        confirmationId: data['confirmationId'] as DocumentReference?,
        lastMessage: data['lastMessage'] as String?,
        lastMessageTime: data['lastMessageTime'] as DateTime?,
        userName: data['userName'] as String?,
      );

  static CompanyConfirmationsDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CompanyConfirmationsDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'confirmationId': _confirmationId,
        'lastMessage': _lastMessage,
        'lastMessageTime': _lastMessageTime,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'confirmationId': serializeParam(
          _confirmationId,
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

  static CompanyConfirmationsDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CompanyConfirmationsDataTypeStruct(
        confirmationId: deserializeParam(
          data['confirmationId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['companyConfirmations'],
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
  String toString() => 'CompanyConfirmationsDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompanyConfirmationsDataTypeStruct &&
        confirmationId == other.confirmationId &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        userName == other.userName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([confirmationId, lastMessage, lastMessageTime, userName]);
}

CompanyConfirmationsDataTypeStruct createCompanyConfirmationsDataTypeStruct({
  DocumentReference? confirmationId,
  String? lastMessage,
  DateTime? lastMessageTime,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompanyConfirmationsDataTypeStruct(
      confirmationId: confirmationId,
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

CompanyConfirmationsDataTypeStruct? updateCompanyConfirmationsDataTypeStruct(
  CompanyConfirmationsDataTypeStruct? companyConfirmationsDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    companyConfirmationsDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompanyConfirmationsDataTypeStructData(
  Map<String, dynamic> firestoreData,
  CompanyConfirmationsDataTypeStruct? companyConfirmationsDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (companyConfirmationsDataType == null) {
    return;
  }
  if (companyConfirmationsDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      companyConfirmationsDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companyConfirmationsDataTypeData =
      getCompanyConfirmationsDataTypeFirestoreData(
          companyConfirmationsDataType, forFieldValue);
  final nestedData = companyConfirmationsDataTypeData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      companyConfirmationsDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompanyConfirmationsDataTypeFirestoreData(
  CompanyConfirmationsDataTypeStruct? companyConfirmationsDataType, [
  bool forFieldValue = false,
]) {
  if (companyConfirmationsDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(companyConfirmationsDataType.toMap());

  // Add any Firestore field values
  companyConfirmationsDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompanyConfirmationsDataTypeListFirestoreData(
  List<CompanyConfirmationsDataTypeStruct>? companyConfirmationsDataTypes,
) =>
    companyConfirmationsDataTypes
        ?.map((e) => getCompanyConfirmationsDataTypeFirestoreData(e, true))
        .toList() ??
    [];
