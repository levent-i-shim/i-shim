import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceNotesRecord extends FirestoreRecord {
  WorkPlaceNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "hasVehicleFault" field.
  bool? _hasVehicleFault;
  bool get hasVehicleFault => _hasVehicleFault ?? false;
  bool hasHasVehicleFault() => _hasVehicleFault != null;

  // "hasMachineFault" field.
  bool? _hasMachineFault;
  bool get hasMachineFault => _hasMachineFault ?? false;
  bool hasHasMachineFault() => _hasMachineFault != null;

  // "hasFinancialNotes" field.
  bool? _hasFinancialNotes;
  bool get hasFinancialNotes => _hasFinancialNotes ?? false;
  bool hasHasFinancialNotes() => _hasFinancialNotes != null;

  // "hasTaxNotes" field.
  bool? _hasTaxNotes;
  bool get hasTaxNotes => _hasTaxNotes ?? false;
  bool hasHasTaxNotes() => _hasTaxNotes != null;

  // "hasPersonnelNotes" field.
  bool? _hasPersonnelNotes;
  bool get hasPersonnelNotes => _hasPersonnelNotes ?? false;
  bool hasHasPersonnelNotes() => _hasPersonnelNotes != null;

  // "hasWorkplaceNotes" field.
  bool? _hasWorkplaceNotes;
  bool get hasWorkplaceNotes => _hasWorkplaceNotes ?? false;
  bool hasHasWorkplaceNotes() => _hasWorkplaceNotes != null;

  // "addedBy" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "content2" field.
  String? _content2;
  String get content2 => _content2 ?? '';
  bool hasContent2() => _content2 != null;

  // "content3" field.
  String? _content3;
  String get content3 => _content3 ?? '';
  bool hasContent3() => _content3 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _hasVehicleFault = snapshotData['hasVehicleFault'] as bool?;
    _hasMachineFault = snapshotData['hasMachineFault'] as bool?;
    _hasFinancialNotes = snapshotData['hasFinancialNotes'] as bool?;
    _hasTaxNotes = snapshotData['hasTaxNotes'] as bool?;
    _hasPersonnelNotes = snapshotData['hasPersonnelNotes'] as bool?;
    _hasWorkplaceNotes = snapshotData['hasWorkplaceNotes'] as bool?;
    _addedBy = snapshotData['addedBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _version = castToType<int>(snapshotData['version']);
    _content2 = snapshotData['content2'] as String?;
    _content3 = snapshotData['content3'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceNotes')
          : FirebaseFirestore.instance.collectionGroup('workPlaceNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceNotes').doc(id);

  static Stream<WorkPlaceNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceNotesRecord.fromSnapshot(s));

  static Future<WorkPlaceNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceNotesRecord.fromSnapshot(s));

  static WorkPlaceNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceNotesRecordData({
  String? title,
  String? content,
  DateTime? date,
  bool? isDelete,
  bool? hasVehicleFault,
  bool? hasMachineFault,
  bool? hasFinancialNotes,
  bool? hasTaxNotes,
  bool? hasPersonnelNotes,
  bool? hasWorkplaceNotes,
  DocumentReference? addedBy,
  DocumentReference? updatedBy,
  int? version,
  String? content2,
  String? content3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'date': date,
      'isDelete': isDelete,
      'hasVehicleFault': hasVehicleFault,
      'hasMachineFault': hasMachineFault,
      'hasFinancialNotes': hasFinancialNotes,
      'hasTaxNotes': hasTaxNotes,
      'hasPersonnelNotes': hasPersonnelNotes,
      'hasWorkplaceNotes': hasWorkplaceNotes,
      'addedBy': addedBy,
      'updatedBy': updatedBy,
      'version': version,
      'content2': content2,
      'content3': content3,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceNotesRecordDocumentEquality
    implements Equality<WorkPlaceNotesRecord> {
  const WorkPlaceNotesRecordDocumentEquality();

  @override
  bool equals(WorkPlaceNotesRecord? e1, WorkPlaceNotesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.date == e2?.date &&
        e1?.isDelete == e2?.isDelete &&
        e1?.hasVehicleFault == e2?.hasVehicleFault &&
        e1?.hasMachineFault == e2?.hasMachineFault &&
        e1?.hasFinancialNotes == e2?.hasFinancialNotes &&
        e1?.hasTaxNotes == e2?.hasTaxNotes &&
        e1?.hasPersonnelNotes == e2?.hasPersonnelNotes &&
        e1?.hasWorkplaceNotes == e2?.hasWorkplaceNotes &&
        e1?.addedBy == e2?.addedBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.version == e2?.version &&
        e1?.content2 == e2?.content2 &&
        e1?.content3 == e2?.content3;
  }

  @override
  int hash(WorkPlaceNotesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.date,
        e?.isDelete,
        e?.hasVehicleFault,
        e?.hasMachineFault,
        e?.hasFinancialNotes,
        e?.hasTaxNotes,
        e?.hasPersonnelNotes,
        e?.hasWorkplaceNotes,
        e?.addedBy,
        e?.updatedBy,
        e?.version,
        e?.content2,
        e?.content3
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceNotesRecord;
}
