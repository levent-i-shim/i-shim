import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialMonitoringNotesRecord extends FirestoreRecord {
  FinancialMonitoringNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "workplaceRef" field.
  DocumentReference? _workplaceRef;
  DocumentReference? get workplaceRef => _workplaceRef;
  bool hasWorkplaceRef() => _workplaceRef != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "isAchived" field.
  bool? _isAchived;
  bool get isAchived => _isAchived ?? false;
  bool hasIsAchived() => _isAchived != null;

  // "financeType" field.
  FinanceNoteType? _financeType;
  FinanceNoteType? get financeType => _financeType;
  bool hasFinanceType() => _financeType != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "doesHaveBill" field.
  bool? _doesHaveBill;
  bool get doesHaveBill => _doesHaveBill ?? false;
  bool hasDoesHaveBill() => _doesHaveBill != null;

  // "billUrl" field.
  String? _billUrl;
  String get billUrl => _billUrl ?? '';
  bool hasBillUrl() => _billUrl != null;

  // "personalName" field.
  String? _personalName;
  String get personalName => _personalName ?? '';
  bool hasPersonalName() => _personalName != null;

  // "familName" field.
  String? _familName;
  String get familName => _familName ?? '';
  bool hasFamilName() => _familName != null;

  // "whoCreated" field.
  DocumentReference? _whoCreated;
  DocumentReference? get whoCreated => _whoCreated;
  bool hasWhoCreated() => _whoCreated != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "paidFromWhichAccount" field.
  String? _paidFromWhichAccount;
  String get paidFromWhichAccount => _paidFromWhichAccount ?? '';
  bool hasPaidFromWhichAccount() => _paidFromWhichAccount != null;

  // "workPlaceId" field.
  String? _workPlaceId;
  String get workPlaceId => _workPlaceId ?? '';
  bool hasWorkPlaceId() => _workPlaceId != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "incomeOrExpense" field.
  String? _incomeOrExpense;
  String get incomeOrExpense => _incomeOrExpense ?? '';
  bool hasIncomeOrExpense() => _incomeOrExpense != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _workplaceRef = snapshotData['workplaceRef'] as DocumentReference?;
    _value = castToType<double>(snapshotData['value']);
    _isAchived = snapshotData['isAchived'] as bool?;
    _financeType = snapshotData['financeType'] is FinanceNoteType
        ? snapshotData['financeType']
        : deserializeEnum<FinanceNoteType>(snapshotData['financeType']);
    _companyName = snapshotData['companyName'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _doesHaveBill = snapshotData['doesHaveBill'] as bool?;
    _billUrl = snapshotData['billUrl'] as String?;
    _personalName = snapshotData['personalName'] as String?;
    _familName = snapshotData['familName'] as String?;
    _whoCreated = snapshotData['whoCreated'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _paidFromWhichAccount = snapshotData['paidFromWhichAccount'] as String?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _incomeOrExpense = snapshotData['incomeOrExpense'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financialMonitoringNotes')
          : FirebaseFirestore.instance
              .collectionGroup('financialMonitoringNotes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financialMonitoringNotes').doc(id);

  static Stream<FinancialMonitoringNotesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => FinancialMonitoringNotesRecord.fromSnapshot(s));

  static Future<FinancialMonitoringNotesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialMonitoringNotesRecord.fromSnapshot(s));

  static FinancialMonitoringNotesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FinancialMonitoringNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialMonitoringNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialMonitoringNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialMonitoringNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialMonitoringNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialMonitoringNotesRecordData({
  String? content,
  DateTime? creationDate,
  bool? isDeleted,
  DocumentReference? companyRef,
  DocumentReference? workplaceRef,
  double? value,
  bool? isAchived,
  FinanceNoteType? financeType,
  String? companyName,
  String? workPlaceName,
  String? imagePath,
  String? pdfUrl,
  bool? doesHaveBill,
  String? billUrl,
  String? personalName,
  String? familName,
  DocumentReference? whoCreated,
  String? creatorName,
  String? paidFromWhichAccount,
  String? workPlaceId,
  String? companyId,
  String? incomeOrExpense,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'creationDate': creationDate,
      'isDeleted': isDeleted,
      'companyRef': companyRef,
      'workplaceRef': workplaceRef,
      'value': value,
      'isAchived': isAchived,
      'financeType': financeType,
      'companyName': companyName,
      'workPlaceName': workPlaceName,
      'imagePath': imagePath,
      'pdfUrl': pdfUrl,
      'doesHaveBill': doesHaveBill,
      'billUrl': billUrl,
      'personalName': personalName,
      'familName': familName,
      'whoCreated': whoCreated,
      'creatorName': creatorName,
      'paidFromWhichAccount': paidFromWhichAccount,
      'workPlaceId': workPlaceId,
      'companyId': companyId,
      'incomeOrExpense': incomeOrExpense,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialMonitoringNotesRecordDocumentEquality
    implements Equality<FinancialMonitoringNotesRecord> {
  const FinancialMonitoringNotesRecordDocumentEquality();

  @override
  bool equals(
      FinancialMonitoringNotesRecord? e1, FinancialMonitoringNotesRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.creationDate == e2?.creationDate &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.companyRef == e2?.companyRef &&
        e1?.workplaceRef == e2?.workplaceRef &&
        e1?.value == e2?.value &&
        e1?.isAchived == e2?.isAchived &&
        e1?.financeType == e2?.financeType &&
        e1?.companyName == e2?.companyName &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.imagePath == e2?.imagePath &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.doesHaveBill == e2?.doesHaveBill &&
        e1?.billUrl == e2?.billUrl &&
        e1?.personalName == e2?.personalName &&
        e1?.familName == e2?.familName &&
        e1?.whoCreated == e2?.whoCreated &&
        e1?.creatorName == e2?.creatorName &&
        e1?.paidFromWhichAccount == e2?.paidFromWhichAccount &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.companyId == e2?.companyId &&
        e1?.incomeOrExpense == e2?.incomeOrExpense;
  }

  @override
  int hash(FinancialMonitoringNotesRecord? e) => const ListEquality().hash([
        e?.content,
        e?.creationDate,
        e?.isDeleted,
        e?.companyRef,
        e?.workplaceRef,
        e?.value,
        e?.isAchived,
        e?.financeType,
        e?.companyName,
        e?.workPlaceName,
        e?.imagePath,
        e?.pdfUrl,
        e?.doesHaveBill,
        e?.billUrl,
        e?.personalName,
        e?.familName,
        e?.whoCreated,
        e?.creatorName,
        e?.paidFromWhichAccount,
        e?.workPlaceId,
        e?.companyId,
        e?.incomeOrExpense
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialMonitoringNotesRecord;
}
