import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceWorkerRecord extends FirestoreRecord {
  WorkPlaceWorkerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "companyWorkerRef" field.
  DocumentReference? _companyWorkerRef;
  DocumentReference? get companyWorkerRef => _companyWorkerRef;
  bool hasCompanyWorkerRef() => _companyWorkerRef != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "canAcceptTransaction" field.
  bool? _canAcceptTransaction;
  bool get canAcceptTransaction => _canAcceptTransaction ?? false;
  bool hasCanAcceptTransaction() => _canAcceptTransaction != null;

  // "authorizedByDepartment" field.
  DocumentReference? _authorizedByDepartment;
  DocumentReference? get authorizedByDepartment => _authorizedByDepartment;
  bool hasAuthorizedByDepartment() => _authorizedByDepartment != null;

  // "departmentName" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  // "unitName" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  bool hasUnitName() => _unitName != null;

  // "roleName" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  bool hasRoleName() => _roleName != null;

  // "isWorker" field.
  bool? _isWorker;
  bool get isWorker => _isWorker ?? false;
  bool hasIsWorker() => _isWorker != null;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  bool hasSalary() => _salary != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _userName = snapshotData['userName'] as String?;
    _companyWorkerRef = snapshotData['companyWorkerRef'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _canAcceptTransaction = snapshotData['canAcceptTransaction'] as bool?;
    _authorizedByDepartment =
        snapshotData['authorizedByDepartment'] as DocumentReference?;
    _departmentName = snapshotData['departmentName'] as String?;
    _unitName = snapshotData['unitName'] as String?;
    _roleName = snapshotData['roleName'] as String?;
    _isWorker = snapshotData['isWorker'] as bool?;
    _salary = castToType<double>(snapshotData['salary']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceWorker')
          : FirebaseFirestore.instance.collectionGroup('workPlaceWorker');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceWorker').doc(id);

  static Stream<WorkPlaceWorkerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceWorkerRecord.fromSnapshot(s));

  static Future<WorkPlaceWorkerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceWorkerRecord.fromSnapshot(s));

  static WorkPlaceWorkerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceWorkerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceWorkerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceWorkerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceWorkerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceWorkerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceWorkerRecordData({
  DocumentReference? user,
  String? userName,
  DocumentReference? companyWorkerRef,
  bool? isDelete,
  bool? canAcceptTransaction,
  DocumentReference? authorizedByDepartment,
  String? departmentName,
  String? unitName,
  String? roleName,
  bool? isWorker,
  double? salary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'userName': userName,
      'companyWorkerRef': companyWorkerRef,
      'isDelete': isDelete,
      'canAcceptTransaction': canAcceptTransaction,
      'authorizedByDepartment': authorizedByDepartment,
      'departmentName': departmentName,
      'unitName': unitName,
      'roleName': roleName,
      'isWorker': isWorker,
      'salary': salary,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceWorkerRecordDocumentEquality
    implements Equality<WorkPlaceWorkerRecord> {
  const WorkPlaceWorkerRecordDocumentEquality();

  @override
  bool equals(WorkPlaceWorkerRecord? e1, WorkPlaceWorkerRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.userName == e2?.userName &&
        e1?.companyWorkerRef == e2?.companyWorkerRef &&
        e1?.isDelete == e2?.isDelete &&
        e1?.canAcceptTransaction == e2?.canAcceptTransaction &&
        e1?.authorizedByDepartment == e2?.authorizedByDepartment &&
        e1?.departmentName == e2?.departmentName &&
        e1?.unitName == e2?.unitName &&
        e1?.roleName == e2?.roleName &&
        e1?.isWorker == e2?.isWorker &&
        e1?.salary == e2?.salary;
  }

  @override
  int hash(WorkPlaceWorkerRecord? e) => const ListEquality().hash([
        e?.user,
        e?.userName,
        e?.companyWorkerRef,
        e?.isDelete,
        e?.canAcceptTransaction,
        e?.authorizedByDepartment,
        e?.departmentName,
        e?.unitName,
        e?.roleName,
        e?.isWorker,
        e?.salary
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceWorkerRecord;
}
