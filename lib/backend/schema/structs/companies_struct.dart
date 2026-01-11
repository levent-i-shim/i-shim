// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesStruct extends FFFirebaseStruct {
  CompaniesStruct({
    DocumentReference? companyId,
    String? companyName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyId = companyId,
        _companyName = companyName,
        super(firestoreUtilData);

  // "companyId" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  set companyId(DocumentReference? val) => _companyId = val;

  bool hasCompanyId() => _companyId != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  static CompaniesStruct fromMap(Map<String, dynamic> data) => CompaniesStruct(
        companyId: data['companyId'] as DocumentReference?,
        companyName: data['companyName'] as String?,
      );

  static CompaniesStruct? maybeFromMap(dynamic data) => data is Map
      ? CompaniesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'companyId': _companyId,
        'companyName': _companyName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'companyId': serializeParam(
          _companyId,
          ParamType.DocumentReference,
        ),
        'companyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
      }.withoutNulls;

  static CompaniesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompaniesStruct(
        companyId: deserializeParam(
          data['companyId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['companies'],
        ),
        companyName: deserializeParam(
          data['companyName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CompaniesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompaniesStruct &&
        companyId == other.companyId &&
        companyName == other.companyName;
  }

  @override
  int get hashCode => const ListEquality().hash([companyId, companyName]);
}

CompaniesStruct createCompaniesStruct({
  DocumentReference? companyId,
  String? companyName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompaniesStruct(
      companyId: companyId,
      companyName: companyName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompaniesStruct? updateCompaniesStruct(
  CompaniesStruct? companies, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    companies
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompaniesStructData(
  Map<String, dynamic> firestoreData,
  CompaniesStruct? companies,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (companies == null) {
    return;
  }
  if (companies.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && companies.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final companiesData = getCompaniesFirestoreData(companies, forFieldValue);
  final nestedData = companiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = companies.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompaniesFirestoreData(
  CompaniesStruct? companies, [
  bool forFieldValue = false,
]) {
  if (companies == null) {
    return {};
  }
  final firestoreData = mapToFirestore(companies.toMap());

  // Add any Firestore field values
  companies.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompaniesListFirestoreData(
  List<CompaniesStruct>? companiess,
) =>
    companiess?.map((e) => getCompaniesFirestoreData(e, true)).toList() ?? [];
