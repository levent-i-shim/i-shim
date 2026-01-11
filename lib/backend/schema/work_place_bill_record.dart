import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceBillRecord extends FirestoreRecord {
  WorkPlaceBillRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "workPlaceId" field.
  String? _workPlaceId;
  String get workPlaceId => _workPlaceId ?? '';
  bool hasWorkPlaceId() => _workPlaceId != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "incomeOrExpense" field.
  IncomeOrExpense? _incomeOrExpense;
  IncomeOrExpense? get incomeOrExpense => _incomeOrExpense;
  bool hasIncomeOrExpense() => _incomeOrExpense != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "creatorTitle" field.
  String? _creatorTitle;
  String get creatorTitle => _creatorTitle ?? '';
  bool hasCreatorTitle() => _creatorTitle != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _incomeOrExpense = snapshotData['incomeOrExpense'] is IncomeOrExpense
        ? snapshotData['incomeOrExpense']
        : deserializeEnum<IncomeOrExpense>(snapshotData['incomeOrExpense']);
    _content = snapshotData['content'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _creatorTitle = snapshotData['creatorTitle'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceBill')
          : FirebaseFirestore.instance.collectionGroup('workPlaceBill');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceBill').doc(id);

  static Stream<WorkPlaceBillRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceBillRecord.fromSnapshot(s));

  static Future<WorkPlaceBillRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceBillRecord.fromSnapshot(s));

  static WorkPlaceBillRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceBillRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceBillRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceBillRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceBillRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceBillRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceBillRecordData({
  double? value,
  DocumentReference? creator,
  String? creatorName,
  String? workPlaceName,
  DocumentReference? workPlaceRef,
  String? workPlaceId,
  DateTime? creationDate,
  IncomeOrExpense? incomeOrExpense,
  String? content,
  String? pdfUrl,
  String? imageUrl,
  String? creatorTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'creator': creator,
      'creatorName': creatorName,
      'workPlaceName': workPlaceName,
      'workPlaceRef': workPlaceRef,
      'workPlaceId': workPlaceId,
      'creationDate': creationDate,
      'incomeOrExpense': incomeOrExpense,
      'content': content,
      'pdfUrl': pdfUrl,
      'imageUrl': imageUrl,
      'creatorTitle': creatorTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceBillRecordDocumentEquality
    implements Equality<WorkPlaceBillRecord> {
  const WorkPlaceBillRecordDocumentEquality();

  @override
  bool equals(WorkPlaceBillRecord? e1, WorkPlaceBillRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.creator == e2?.creator &&
        e1?.creatorName == e2?.creatorName &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.creationDate == e2?.creationDate &&
        e1?.incomeOrExpense == e2?.incomeOrExpense &&
        e1?.content == e2?.content &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.creatorTitle == e2?.creatorTitle;
  }

  @override
  int hash(WorkPlaceBillRecord? e) => const ListEquality().hash([
        e?.value,
        e?.creator,
        e?.creatorName,
        e?.workPlaceName,
        e?.workPlaceRef,
        e?.workPlaceId,
        e?.creationDate,
        e?.incomeOrExpense,
        e?.content,
        e?.pdfUrl,
        e?.imageUrl,
        e?.creatorTitle
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceBillRecord;
}
