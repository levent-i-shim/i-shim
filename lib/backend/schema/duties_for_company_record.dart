import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DutiesForCompanyRecord extends FirestoreRecord {
  DutiesForCompanyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "companyTaskDuties" field.
  List<DocumentReference>? _companyTaskDuties;
  List<DocumentReference> get companyTaskDuties =>
      _companyTaskDuties ?? const [];
  bool hasCompanyTaskDuties() => _companyTaskDuties != null;

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlaceDutiesForCompany" field.
  DocumentReference? _workPlaceDutiesForCompany;
  DocumentReference? get workPlaceDutiesForCompany =>
      _workPlaceDutiesForCompany;
  bool hasWorkPlaceDutiesForCompany() => _workPlaceDutiesForCompany != null;

  // "visibleTo" field.
  List<DocumentReference>? _visibleTo;
  List<DocumentReference> get visibleTo => _visibleTo ?? const [];
  bool hasVisibleTo() => _visibleTo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _companyTaskDuties = getDataList(snapshotData['companyTaskDuties']);
    _taskName = snapshotData['taskName'] as String?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlaceDutiesForCompany =
        snapshotData['workPlaceDutiesForCompany'] as DocumentReference?;
    _visibleTo = getDataList(snapshotData['visibleTo']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dutiesForCompany')
          : FirebaseFirestore.instance.collectionGroup('dutiesForCompany');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dutiesForCompany').doc(id);

  static Stream<DutiesForCompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DutiesForCompanyRecord.fromSnapshot(s));

  static Future<DutiesForCompanyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DutiesForCompanyRecord.fromSnapshot(s));

  static DutiesForCompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DutiesForCompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DutiesForCompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DutiesForCompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DutiesForCompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DutiesForCompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDutiesForCompanyRecordData({
  String? type,
  DocumentReference? userRef,
  DocumentReference? companyRef,
  DocumentReference? workPlaceRef,
  DocumentReference? createdUserRef,
  String? taskName,
  bool? isComplete,
  bool? isDelete,
  DocumentReference? workPlaceDutiesForCompany,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'userRef': userRef,
      'companyRef': companyRef,
      'workPlaceRef': workPlaceRef,
      'createdUserRef': createdUserRef,
      'taskName': taskName,
      'isComplete': isComplete,
      'isDelete': isDelete,
      'workPlaceDutiesForCompany': workPlaceDutiesForCompany,
    }.withoutNulls,
  );

  return firestoreData;
}

class DutiesForCompanyRecordDocumentEquality
    implements Equality<DutiesForCompanyRecord> {
  const DutiesForCompanyRecordDocumentEquality();

  @override
  bool equals(DutiesForCompanyRecord? e1, DutiesForCompanyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.userRef == e2?.userRef &&
        e1?.companyRef == e2?.companyRef &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.createdUserRef == e2?.createdUserRef &&
        listEquality.equals(e1?.companyTaskDuties, e2?.companyTaskDuties) &&
        e1?.taskName == e2?.taskName &&
        e1?.isComplete == e2?.isComplete &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlaceDutiesForCompany == e2?.workPlaceDutiesForCompany &&
        listEquality.equals(e1?.visibleTo, e2?.visibleTo);
  }

  @override
  int hash(DutiesForCompanyRecord? e) => const ListEquality().hash([
        e?.type,
        e?.userRef,
        e?.companyRef,
        e?.workPlaceRef,
        e?.createdUserRef,
        e?.companyTaskDuties,
        e?.taskName,
        e?.isComplete,
        e?.isDelete,
        e?.workPlaceDutiesForCompany,
        e?.visibleTo
      ]);

  @override
  bool isValidKey(Object? o) => o is DutiesForCompanyRecord;
}
