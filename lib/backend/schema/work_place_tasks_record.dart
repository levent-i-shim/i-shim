import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceTasksRecord extends FirestoreRecord {
  WorkPlaceTasksRecord._(
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

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "companyTask" field.
  DocumentReference? _companyTask;
  DocumentReference? get companyTask => _companyTask;
  bool hasCompanyTask() => _companyTask != null;

  // "visibleTo" field.
  List<DocumentReference>? _visibleTo;
  List<DocumentReference> get visibleTo => _visibleTo ?? const [];
  bool hasVisibleTo() => _visibleTo != null;

  // "requiresAction" field.
  bool? _requiresAction;
  bool get requiresAction => _requiresAction ?? false;
  bool hasRequiresAction() => _requiresAction != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _userRef = snapshotData['userRef'] as String?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _form = snapshotData['form'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _company = snapshotData['company'] as DocumentReference?;
    _companyTask = snapshotData['companyTask'] as DocumentReference?;
    _visibleTo = getDataList(snapshotData['visibleTo']);
    _requiresAction = snapshotData['requiresAction'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceTasks')
          : FirebaseFirestore.instance.collectionGroup('workPlaceTasks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceTasks').doc(id);

  static Stream<WorkPlaceTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceTasksRecord.fromSnapshot(s));

  static Future<WorkPlaceTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceTasksRecord.fromSnapshot(s));

  static WorkPlaceTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceTasksRecordData({
  String? name,
  String? description,
  String? userRef,
  bool? isComplete,
  DocumentReference? createdUserRef,
  DocumentReference? form,
  bool? isDelete,
  DocumentReference? company,
  DocumentReference? companyTask,
  bool? requiresAction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'userRef': userRef,
      'isComplete': isComplete,
      'createdUserRef': createdUserRef,
      'form': form,
      'isDelete': isDelete,
      'company': company,
      'companyTask': companyTask,
      'requiresAction': requiresAction,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceTasksRecordDocumentEquality
    implements Equality<WorkPlaceTasksRecord> {
  const WorkPlaceTasksRecordDocumentEquality();

  @override
  bool equals(WorkPlaceTasksRecord? e1, WorkPlaceTasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.userRef == e2?.userRef &&
        e1?.isComplete == e2?.isComplete &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.form == e2?.form &&
        e1?.isDelete == e2?.isDelete &&
        e1?.company == e2?.company &&
        e1?.companyTask == e2?.companyTask &&
        listEquality.equals(e1?.visibleTo, e2?.visibleTo) &&
        e1?.requiresAction == e2?.requiresAction;
  }

  @override
  int hash(WorkPlaceTasksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.userRef,
        e?.isComplete,
        e?.createdUserRef,
        e?.form,
        e?.isDelete,
        e?.company,
        e?.companyTask,
        e?.visibleTo,
        e?.requiresAction
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceTasksRecord;
}
