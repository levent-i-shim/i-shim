import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceTaskDutiesRecord extends FirestoreRecord {
  WorkPlaceTaskDutiesRecord._(
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

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "dutiesForCompany" field.
  DocumentReference? _dutiesForCompany;
  DocumentReference? get dutiesForCompany => _dutiesForCompany;
  bool hasDutiesForCompany() => _dutiesForCompany != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  // "requiresAction" field.
  bool? _requiresAction;
  bool get requiresAction => _requiresAction ?? false;
  bool hasRequiresAction() => _requiresAction != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _dutiesForCompany = snapshotData['dutiesForCompany'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _form = snapshotData['Form'] as DocumentReference?;
    _requiresAction = snapshotData['requiresAction'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceTaskDuties')
          : FirebaseFirestore.instance.collectionGroup('workPlaceTaskDuties');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceTaskDuties').doc(id);

  static Stream<WorkPlaceTaskDutiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceTaskDutiesRecord.fromSnapshot(s));

  static Future<WorkPlaceTaskDutiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceTaskDutiesRecord.fromSnapshot(s));

  static WorkPlaceTaskDutiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceTaskDutiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceTaskDutiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceTaskDutiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceTaskDutiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceTaskDutiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceTaskDutiesRecordData({
  String? name,
  String? description,
  bool? isComplete,
  DocumentReference? dutiesForCompany,
  DateTime? createdAt,
  DocumentReference? form,
  bool? requiresAction,
  bool? isDelete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'isComplete': isComplete,
      'dutiesForCompany': dutiesForCompany,
      'createdAt': createdAt,
      'Form': form,
      'requiresAction': requiresAction,
      'isDelete': isDelete,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceTaskDutiesRecordDocumentEquality
    implements Equality<WorkPlaceTaskDutiesRecord> {
  const WorkPlaceTaskDutiesRecordDocumentEquality();

  @override
  bool equals(WorkPlaceTaskDutiesRecord? e1, WorkPlaceTaskDutiesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.isComplete == e2?.isComplete &&
        e1?.dutiesForCompany == e2?.dutiesForCompany &&
        e1?.createdAt == e2?.createdAt &&
        e1?.form == e2?.form &&
        e1?.requiresAction == e2?.requiresAction &&
        e1?.isDelete == e2?.isDelete;
  }

  @override
  int hash(WorkPlaceTaskDutiesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.isComplete,
        e?.dutiesForCompany,
        e?.createdAt,
        e?.form,
        e?.requiresAction,
        e?.isDelete
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceTaskDutiesRecord;
}
