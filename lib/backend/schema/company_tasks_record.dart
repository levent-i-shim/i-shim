import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyTasksRecord extends FirestoreRecord {
  CompanyTasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "userRef" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  bool hasUserRef() => _userRef != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceTask" field.
  DocumentReference? _workPlaceTask;
  DocumentReference? get workPlaceTask => _workPlaceTask;
  bool hasWorkPlaceTask() => _workPlaceTask != null;

  // "processThisTask" field.
  bool? _processThisTask;
  bool get processThisTask => _processThisTask ?? false;
  bool hasProcessThisTask() => _processThisTask != null;

  // "visibleTo" field.
  List<DocumentReference>? _visibleTo;
  List<DocumentReference> get visibleTo => _visibleTo ?? const [];
  bool hasVisibleTo() => _visibleTo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _userRef = snapshotData['userRef'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _form = snapshotData['form'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceTask = snapshotData['workPlaceTask'] as DocumentReference?;
    _processThisTask = snapshotData['processThisTask'] as bool?;
    _visibleTo = getDataList(snapshotData['visibleTo']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyTasks')
          : FirebaseFirestore.instance.collectionGroup('companyTasks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyTasks').doc(id);

  static Stream<CompanyTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyTasksRecord.fromSnapshot(s));

  static Future<CompanyTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyTasksRecord.fromSnapshot(s));

  static CompanyTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyTasksRecordData({
  String? name,
  String? description,
  String? userRef,
  DocumentReference? companyRef,
  bool? isComplete,
  DocumentReference? createdUserRef,
  DocumentReference? form,
  bool? isDelete,
  DocumentReference? workPlace,
  DocumentReference? workPlaceTask,
  bool? processThisTask,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'userRef': userRef,
      'companyRef': companyRef,
      'isComplete': isComplete,
      'createdUserRef': createdUserRef,
      'form': form,
      'isDelete': isDelete,
      'workPlace': workPlace,
      'workPlaceTask': workPlaceTask,
      'processThisTask': processThisTask,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyTasksRecordDocumentEquality
    implements Equality<CompanyTasksRecord> {
  const CompanyTasksRecordDocumentEquality();

  @override
  bool equals(CompanyTasksRecord? e1, CompanyTasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.userRef == e2?.userRef &&
        e1?.companyRef == e2?.companyRef &&
        e1?.isComplete == e2?.isComplete &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.form == e2?.form &&
        e1?.isDelete == e2?.isDelete &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceTask == e2?.workPlaceTask &&
        e1?.processThisTask == e2?.processThisTask &&
        listEquality.equals(e1?.visibleTo, e2?.visibleTo);
  }

  @override
  int hash(CompanyTasksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.userRef,
        e?.companyRef,
        e?.isComplete,
        e?.createdUserRef,
        e?.form,
        e?.isDelete,
        e?.workPlace,
        e?.workPlaceTask,
        e?.processThisTask,
        e?.visibleTo
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyTasksRecord;
}
