import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyTaskDutiesRecord extends FirestoreRecord {
  CompanyTaskDutiesRecord._(
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

  // "creadetAt" field.
  DateTime? _creadetAt;
  DateTime? get creadetAt => _creadetAt;
  bool hasCreadetAt() => _creadetAt != null;

  // "Form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  // "workPlaceTaskDuties" field.
  DocumentReference? _workPlaceTaskDuties;
  DocumentReference? get workPlaceTaskDuties => _workPlaceTaskDuties;
  bool hasWorkPlaceTaskDuties() => _workPlaceTaskDuties != null;

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
    _creadetAt = snapshotData['creadetAt'] as DateTime?;
    _form = snapshotData['Form'] as DocumentReference?;
    _workPlaceTaskDuties =
        snapshotData['workPlaceTaskDuties'] as DocumentReference?;
    _requiresAction = snapshotData['requiresAction'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyTaskDuties')
          : FirebaseFirestore.instance.collectionGroup('companyTaskDuties');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyTaskDuties').doc(id);

  static Stream<CompanyTaskDutiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyTaskDutiesRecord.fromSnapshot(s));

  static Future<CompanyTaskDutiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyTaskDutiesRecord.fromSnapshot(s));

  static CompanyTaskDutiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyTaskDutiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyTaskDutiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyTaskDutiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyTaskDutiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyTaskDutiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyTaskDutiesRecordData({
  String? name,
  String? description,
  bool? isComplete,
  DocumentReference? dutiesForCompany,
  DateTime? creadetAt,
  DocumentReference? form,
  DocumentReference? workPlaceTaskDuties,
  bool? requiresAction,
  bool? isDelete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'isComplete': isComplete,
      'dutiesForCompany': dutiesForCompany,
      'creadetAt': creadetAt,
      'Form': form,
      'workPlaceTaskDuties': workPlaceTaskDuties,
      'requiresAction': requiresAction,
      'isDelete': isDelete,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyTaskDutiesRecordDocumentEquality
    implements Equality<CompanyTaskDutiesRecord> {
  const CompanyTaskDutiesRecordDocumentEquality();

  @override
  bool equals(CompanyTaskDutiesRecord? e1, CompanyTaskDutiesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.isComplete == e2?.isComplete &&
        e1?.dutiesForCompany == e2?.dutiesForCompany &&
        e1?.creadetAt == e2?.creadetAt &&
        e1?.form == e2?.form &&
        e1?.workPlaceTaskDuties == e2?.workPlaceTaskDuties &&
        e1?.requiresAction == e2?.requiresAction &&
        e1?.isDelete == e2?.isDelete;
  }

  @override
  int hash(CompanyTaskDutiesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.isComplete,
        e?.dutiesForCompany,
        e?.creadetAt,
        e?.form,
        e?.workPlaceTaskDuties,
        e?.requiresAction,
        e?.isDelete
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyTaskDutiesRecord;
}
