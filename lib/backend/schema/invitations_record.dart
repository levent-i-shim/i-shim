import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitationsRecord extends FirestoreRecord {
  InvitationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "duties" field.
  List<String>? _duties;
  List<String> get duties => _duties ?? const [];
  bool hasDuties() => _duties != null;

  // "unit" field.
  DocumentReference? _unit;
  DocumentReference? get unit => _unit;
  bool hasUnit() => _unit != null;

  // "department" field.
  DocumentReference? _department;
  DocumentReference? get department => _department;
  bool hasDepartment() => _department != null;

  // "role" field.
  DocumentReference? _role;
  DocumentReference? get role => _role;
  bool hasRole() => _role != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  bool hasSalary() => _salary != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "workingHour" field.
  double? _workingHour;
  double get workingHour => _workingHour ?? 0.0;
  bool hasWorkingHour() => _workingHour != null;

  // "shiftSalary" field.
  double? _shiftSalary;
  double get shiftSalary => _shiftSalary ?? 0.0;
  bool hasShiftSalary() => _shiftSalary != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _company = snapshotData['company'] as DocumentReference?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _duties = getDataList(snapshotData['duties']);
    _unit = snapshotData['unit'] as DocumentReference?;
    _department = snapshotData['department'] as DocumentReference?;
    _role = snapshotData['role'] as DocumentReference?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isReject = snapshotData['isReject'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _companyName = snapshotData['companyName'] as String?;
    _salary = castToType<double>(snapshotData['salary']);
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _version = castToType<int>(snapshotData['version']);
    _workingHour = castToType<double>(snapshotData['workingHour']);
    _shiftSalary = castToType<double>(snapshotData['shiftSalary']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('invitations')
          : FirebaseFirestore.instance.collectionGroup('invitations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('invitations').doc(id);

  static Stream<InvitationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvitationsRecord.fromSnapshot(s));

  static Future<InvitationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvitationsRecord.fromSnapshot(s));

  static InvitationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvitationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvitationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvitationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvitationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvitationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvitationsRecordData({
  DateTime? timestamp,
  DocumentReference? company,
  DocumentReference? workPlace,
  DocumentReference? sender,
  String? status,
  DocumentReference? receiver,
  String? type,
  DocumentReference? unit,
  DocumentReference? department,
  DocumentReference? role,
  bool? isAccept,
  bool? isReject,
  bool? isDelete,
  String? companyName,
  double? salary,
  String? workPlaceName,
  int? version,
  double? workingHour,
  double? shiftSalary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'company': company,
      'workPlace': workPlace,
      'sender': sender,
      'status': status,
      'receiver': receiver,
      'type': type,
      'unit': unit,
      'department': department,
      'role': role,
      'isAccept': isAccept,
      'isReject': isReject,
      'isDelete': isDelete,
      'companyName': companyName,
      'salary': salary,
      'workPlaceName': workPlaceName,
      'version': version,
      'workingHour': workingHour,
      'shiftSalary': shiftSalary,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvitationsRecordDocumentEquality implements Equality<InvitationsRecord> {
  const InvitationsRecordDocumentEquality();

  @override
  bool equals(InvitationsRecord? e1, InvitationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timestamp == e2?.timestamp &&
        e1?.company == e2?.company &&
        e1?.workPlace == e2?.workPlace &&
        e1?.sender == e2?.sender &&
        e1?.status == e2?.status &&
        e1?.receiver == e2?.receiver &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.duties, e2?.duties) &&
        e1?.unit == e2?.unit &&
        e1?.department == e2?.department &&
        e1?.role == e2?.role &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isReject == e2?.isReject &&
        e1?.isDelete == e2?.isDelete &&
        e1?.companyName == e2?.companyName &&
        e1?.salary == e2?.salary &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.version == e2?.version &&
        e1?.workingHour == e2?.workingHour &&
        e1?.shiftSalary == e2?.shiftSalary;
  }

  @override
  int hash(InvitationsRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.company,
        e?.workPlace,
        e?.sender,
        e?.status,
        e?.receiver,
        e?.type,
        e?.duties,
        e?.unit,
        e?.department,
        e?.role,
        e?.isAccept,
        e?.isReject,
        e?.isDelete,
        e?.companyName,
        e?.salary,
        e?.workPlaceName,
        e?.version,
        e?.workingHour,
        e?.shiftSalary
      ]);

  @override
  bool isValidKey(Object? o) => o is InvitationsRecord;
}
