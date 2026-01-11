// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationCountStruct extends FFFirebaseStruct {
  NotificationCountStruct({
    int? invitation,
    int? insturiction,
    int? task,
    int? duty,
    int? report,
    int? confirmation,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _invitation = invitation,
        _insturiction = insturiction,
        _task = task,
        _duty = duty,
        _report = report,
        _confirmation = confirmation,
        super(firestoreUtilData);

  // "invitation" field.
  int? _invitation;
  int get invitation => _invitation ?? 0;
  set invitation(int? val) => _invitation = val;

  void incrementInvitation(int amount) => invitation = invitation + amount;

  bool hasInvitation() => _invitation != null;

  // "insturiction" field.
  int? _insturiction;
  int get insturiction => _insturiction ?? 0;
  set insturiction(int? val) => _insturiction = val;

  void incrementInsturiction(int amount) =>
      insturiction = insturiction + amount;

  bool hasInsturiction() => _insturiction != null;

  // "task" field.
  int? _task;
  int get task => _task ?? 0;
  set task(int? val) => _task = val;

  void incrementTask(int amount) => task = task + amount;

  bool hasTask() => _task != null;

  // "duty" field.
  int? _duty;
  int get duty => _duty ?? 0;
  set duty(int? val) => _duty = val;

  void incrementDuty(int amount) => duty = duty + amount;

  bool hasDuty() => _duty != null;

  // "report" field.
  int? _report;
  int get report => _report ?? 0;
  set report(int? val) => _report = val;

  void incrementReport(int amount) => report = report + amount;

  bool hasReport() => _report != null;

  // "confirmation" field.
  int? _confirmation;
  int get confirmation => _confirmation ?? 0;
  set confirmation(int? val) => _confirmation = val;

  void incrementConfirmation(int amount) =>
      confirmation = confirmation + amount;

  bool hasConfirmation() => _confirmation != null;

  static NotificationCountStruct fromMap(Map<String, dynamic> data) =>
      NotificationCountStruct(
        invitation: castToType<int>(data['invitation']),
        insturiction: castToType<int>(data['insturiction']),
        task: castToType<int>(data['task']),
        duty: castToType<int>(data['duty']),
        report: castToType<int>(data['report']),
        confirmation: castToType<int>(data['confirmation']),
      );

  static NotificationCountStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'invitation': _invitation,
        'insturiction': _insturiction,
        'task': _task,
        'duty': _duty,
        'report': _report,
        'confirmation': _confirmation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'invitation': serializeParam(
          _invitation,
          ParamType.int,
        ),
        'insturiction': serializeParam(
          _insturiction,
          ParamType.int,
        ),
        'task': serializeParam(
          _task,
          ParamType.int,
        ),
        'duty': serializeParam(
          _duty,
          ParamType.int,
        ),
        'report': serializeParam(
          _report,
          ParamType.int,
        ),
        'confirmation': serializeParam(
          _confirmation,
          ParamType.int,
        ),
      }.withoutNulls;

  static NotificationCountStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationCountStruct(
        invitation: deserializeParam(
          data['invitation'],
          ParamType.int,
          false,
        ),
        insturiction: deserializeParam(
          data['insturiction'],
          ParamType.int,
          false,
        ),
        task: deserializeParam(
          data['task'],
          ParamType.int,
          false,
        ),
        duty: deserializeParam(
          data['duty'],
          ParamType.int,
          false,
        ),
        report: deserializeParam(
          data['report'],
          ParamType.int,
          false,
        ),
        confirmation: deserializeParam(
          data['confirmation'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NotificationCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationCountStruct &&
        invitation == other.invitation &&
        insturiction == other.insturiction &&
        task == other.task &&
        duty == other.duty &&
        report == other.report &&
        confirmation == other.confirmation;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([invitation, insturiction, task, duty, report, confirmation]);
}

NotificationCountStruct createNotificationCountStruct({
  int? invitation,
  int? insturiction,
  int? task,
  int? duty,
  int? report,
  int? confirmation,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationCountStruct(
      invitation: invitation,
      insturiction: insturiction,
      task: task,
      duty: duty,
      report: report,
      confirmation: confirmation,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationCountStruct? updateNotificationCountStruct(
  NotificationCountStruct? notificationCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationCountStructData(
  Map<String, dynamic> firestoreData,
  NotificationCountStruct? notificationCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationCount == null) {
    return;
  }
  if (notificationCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationCountData =
      getNotificationCountFirestoreData(notificationCount, forFieldValue);
  final nestedData =
      notificationCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notificationCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationCountFirestoreData(
  NotificationCountStruct? notificationCount, [
  bool forFieldValue = false,
]) {
  if (notificationCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationCount.toMap());

  // Add any Firestore field values
  notificationCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationCountListFirestoreData(
  List<NotificationCountStruct>? notificationCounts,
) =>
    notificationCounts
        ?.map((e) => getNotificationCountFirestoreData(e, true))
        .toList() ??
    [];
