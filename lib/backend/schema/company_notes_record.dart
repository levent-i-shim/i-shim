import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyNotesRecord extends FirestoreRecord {
  CompanyNotesRecord._(
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

  // "hasCompanyRecord" field.
  bool? _hasCompanyRecord;
  bool get hasCompanyRecord => _hasCompanyRecord ?? false;
  bool hasHasCompanyRecord() => _hasCompanyRecord != null;

  // "hasMachineFailure" field.
  bool? _hasMachineFailure;
  bool get hasMachineFailure => _hasMachineFailure ?? false;
  bool hasHasMachineFailure() => _hasMachineFailure != null;

  // "hasPersonnelNote" field.
  bool? _hasPersonnelNote;
  bool get hasPersonnelNote => _hasPersonnelNote ?? false;
  bool hasHasPersonnelNote() => _hasPersonnelNote != null;

  // "hasFinancialNote" field.
  bool? _hasFinancialNote;
  bool get hasFinancialNote => _hasFinancialNote ?? false;
  bool hasHasFinancialNote() => _hasFinancialNote != null;

  // "hasTaxNote" field.
  bool? _hasTaxNote;
  bool get hasTaxNote => _hasTaxNote ?? false;
  bool hasHasTaxNote() => _hasTaxNote != null;

  // "addedBy" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "content2" field.
  String? _content2;
  String get content2 => _content2 ?? '';
  bool hasContent2() => _content2 != null;

  // "content3" field.
  String? _content3;
  String get content3 => _content3 ?? '';
  bool hasContent3() => _content3 != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _hasCompanyRecord = snapshotData['hasCompanyRecord'] as bool?;
    _hasMachineFailure = snapshotData['hasMachineFailure'] as bool?;
    _hasPersonnelNote = snapshotData['hasPersonnelNote'] as bool?;
    _hasFinancialNote = snapshotData['hasFinancialNote'] as bool?;
    _hasTaxNote = snapshotData['hasTaxNote'] as bool?;
    _addedBy = snapshotData['addedBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _content2 = snapshotData['content2'] as String?;
    _content3 = snapshotData['content3'] as String?;
    _version = castToType<int>(snapshotData['version']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyNotes')
          : FirebaseFirestore.instance.collectionGroup('companyNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyNotes').doc(id);

  static Stream<CompanyNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyNotesRecord.fromSnapshot(s));

  static Future<CompanyNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyNotesRecord.fromSnapshot(s));

  static CompanyNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyNotesRecordData({
  String? title,
  String? content,
  DateTime? date,
  bool? isDelete,
  bool? hasCompanyRecord,
  bool? hasMachineFailure,
  bool? hasPersonnelNote,
  bool? hasFinancialNote,
  bool? hasTaxNote,
  DocumentReference? addedBy,
  DocumentReference? updatedBy,
  String? content2,
  String? content3,
  int? version,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'date': date,
      'isDelete': isDelete,
      'hasCompanyRecord': hasCompanyRecord,
      'hasMachineFailure': hasMachineFailure,
      'hasPersonnelNote': hasPersonnelNote,
      'hasFinancialNote': hasFinancialNote,
      'hasTaxNote': hasTaxNote,
      'addedBy': addedBy,
      'updatedBy': updatedBy,
      'content2': content2,
      'content3': content3,
      'version': version,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyNotesRecordDocumentEquality
    implements Equality<CompanyNotesRecord> {
  const CompanyNotesRecordDocumentEquality();

  @override
  bool equals(CompanyNotesRecord? e1, CompanyNotesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.date == e2?.date &&
        e1?.isDelete == e2?.isDelete &&
        e1?.hasCompanyRecord == e2?.hasCompanyRecord &&
        e1?.hasMachineFailure == e2?.hasMachineFailure &&
        e1?.hasPersonnelNote == e2?.hasPersonnelNote &&
        e1?.hasFinancialNote == e2?.hasFinancialNote &&
        e1?.hasTaxNote == e2?.hasTaxNote &&
        e1?.addedBy == e2?.addedBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.content2 == e2?.content2 &&
        e1?.content3 == e2?.content3 &&
        e1?.version == e2?.version;
  }

  @override
  int hash(CompanyNotesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.date,
        e?.isDelete,
        e?.hasCompanyRecord,
        e?.hasMachineFailure,
        e?.hasPersonnelNote,
        e?.hasFinancialNote,
        e?.hasTaxNote,
        e?.addedBy,
        e?.updatedBy,
        e?.content2,
        e?.content3,
        e?.version
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyNotesRecord;
}
