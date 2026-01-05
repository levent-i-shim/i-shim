import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialNoteCompanyRecord extends FirestoreRecord {
  FinancialNoteCompanyRecord._(
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

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

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

  // "doesHaveBill" field.
  String? _doesHaveBill;
  String get doesHaveBill => _doesHaveBill ?? '';
  bool hasDoesHaveBill() => _doesHaveBill != null;

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "paidFromWhichAccount" field.
  String? _paidFromWhichAccount;
  String get paidFromWhichAccount => _paidFromWhichAccount ?? '';
  bool hasPaidFromWhichAccount() => _paidFromWhichAccount != null;

  // "workPlaceRef" field.
  DocumentReference? _workPlaceRef;
  DocumentReference? get workPlaceRef => _workPlaceRef;
  bool hasWorkPlaceRef() => _workPlaceRef != null;

  // "workPlaceId" field.
  String? _workPlaceId;
  String get workPlaceId => _workPlaceId ?? '';
  bool hasWorkPlaceId() => _workPlaceId != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "incomeOrExpense" field.
  String? _incomeOrExpense;
  String get incomeOrExpense => _incomeOrExpense ?? '';
  bool hasIncomeOrExpense() => _incomeOrExpense != null;

  // "whichCompaniesCurrentsDocRef" field.
  DocumentReference? _whichCompaniesCurrentsDocRef;
  DocumentReference? get whichCompaniesCurrentsDocRef =>
      _whichCompaniesCurrentsDocRef;
  bool hasWhichCompaniesCurrentsDocRef() =>
      _whichCompaniesCurrentsDocRef != null;

  // "whichCompaniesCurrentsDocId" field.
  String? _whichCompaniesCurrentsDocId;
  String get whichCompaniesCurrentsDocId => _whichCompaniesCurrentsDocId ?? '';
  bool hasWhichCompaniesCurrentsDocId() => _whichCompaniesCurrentsDocId != null;

  // "paidToWhomUserRef" field.
  DocumentReference? _paidToWhomUserRef;
  DocumentReference? get paidToWhomUserRef => _paidToWhomUserRef;
  bool hasPaidToWhomUserRef() => _paidToWhomUserRef != null;

  // "paidToWhomUserId" field.
  String? _paidToWhomUserId;
  String get paidToWhomUserId => _paidToWhomUserId ?? '';
  bool hasPaidToWhomUserId() => _paidToWhomUserId != null;

  // "paidToWhomUserName" field.
  String? _paidToWhomUserName;
  String get paidToWhomUserName => _paidToWhomUserName ?? '';
  bool hasPaidToWhomUserName() => _paidToWhomUserName != null;

  // "paidToWhichCompanyRef" field.
  DocumentReference? _paidToWhichCompanyRef;
  DocumentReference? get paidToWhichCompanyRef => _paidToWhichCompanyRef;
  bool hasPaidToWhichCompanyRef() => _paidToWhichCompanyRef != null;

  // "paidToWhichCompanyId" field.
  String? _paidToWhichCompanyId;
  String get paidToWhichCompanyId => _paidToWhichCompanyId ?? '';
  bool hasPaidToWhichCompanyId() => _paidToWhichCompanyId != null;

  // "paidToWhichCompanyName" field.
  String? _paidToWhichCompanyName;
  String get paidToWhichCompanyName => _paidToWhichCompanyName ?? '';
  bool hasPaidToWhichCompanyName() => _paidToWhichCompanyName != null;

  // "paidToWhichCompanyCurrentAccountRef" field.
  DocumentReference? _paidToWhichCompanyCurrentAccountRef;
  DocumentReference? get paidToWhichCompanyCurrentAccountRef =>
      _paidToWhichCompanyCurrentAccountRef;
  bool hasPaidToWhichCompanyCurrentAccountRef() =>
      _paidToWhichCompanyCurrentAccountRef != null;

  // "paidToWhichCompanyCurrentId" field.
  String? _paidToWhichCompanyCurrentId;
  String get paidToWhichCompanyCurrentId => _paidToWhichCompanyCurrentId ?? '';
  bool hasPaidToWhichCompanyCurrentId() => _paidToWhichCompanyCurrentId != null;

  // "collectedFromWhomUserRef" field.
  DocumentReference? _collectedFromWhomUserRef;
  DocumentReference? get collectedFromWhomUserRef => _collectedFromWhomUserRef;
  bool hasCollectedFromWhomUserRef() => _collectedFromWhomUserRef != null;

  // "collectedFromWhomUserId" field.
  String? _collectedFromWhomUserId;
  String get collectedFromWhomUserId => _collectedFromWhomUserId ?? '';
  bool hasCollectedFromWhomUserId() => _collectedFromWhomUserId != null;

  // "collectedFromWhomUserName" field.
  String? _collectedFromWhomUserName;
  String get collectedFromWhomUserName => _collectedFromWhomUserName ?? '';
  bool hasCollectedFromWhomUserName() => _collectedFromWhomUserName != null;

  // "collectedFromWhomCompanyRef" field.
  DocumentReference? _collectedFromWhomCompanyRef;
  DocumentReference? get collectedFromWhomCompanyRef =>
      _collectedFromWhomCompanyRef;
  bool hasCollectedFromWhomCompanyRef() => _collectedFromWhomCompanyRef != null;

  // "collectedFromWhomCompanyId" field.
  String? _collectedFromWhomCompanyId;
  String get collectedFromWhomCompanyId => _collectedFromWhomCompanyId ?? '';
  bool hasCollectedFromWhomCompanyId() => _collectedFromWhomCompanyId != null;

  // "collectedFromWhomCompanyName" field.
  String? _collectedFromWhomCompanyName;
  String get collectedFromWhomCompanyName =>
      _collectedFromWhomCompanyName ?? '';
  bool hasCollectedFromWhomCompanyName() =>
      _collectedFromWhomCompanyName != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _creatorName = snapshotData['creatorName'] as String?;
    _companyName = snapshotData['companyName'] as String?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _creatorTitle = snapshotData['creatorTitle'] as String?;
    _doesHaveBill = snapshotData['doesHaveBill'] as String?;
    _companyId = snapshotData['companyId'] as String?;
    _paidFromWhichAccount = snapshotData['paidFromWhichAccount'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _incomeOrExpense = snapshotData['incomeOrExpense'] as String?;
    _whichCompaniesCurrentsDocRef =
        snapshotData['whichCompaniesCurrentsDocRef'] as DocumentReference?;
    _whichCompaniesCurrentsDocId =
        snapshotData['whichCompaniesCurrentsDocId'] as String?;
    _paidToWhomUserRef =
        snapshotData['paidToWhomUserRef'] as DocumentReference?;
    _paidToWhomUserId = snapshotData['paidToWhomUserId'] as String?;
    _paidToWhomUserName = snapshotData['paidToWhomUserName'] as String?;
    _paidToWhichCompanyRef =
        snapshotData['paidToWhichCompanyRef'] as DocumentReference?;
    _paidToWhichCompanyId = snapshotData['paidToWhichCompanyId'] as String?;
    _paidToWhichCompanyName = snapshotData['paidToWhichCompanyName'] as String?;
    _paidToWhichCompanyCurrentAccountRef =
        snapshotData['paidToWhichCompanyCurrentAccountRef']
            as DocumentReference?;
    _paidToWhichCompanyCurrentId =
        snapshotData['paidToWhichCompanyCurrentId'] as String?;
    _collectedFromWhomUserRef =
        snapshotData['collectedFromWhomUserRef'] as DocumentReference?;
    _collectedFromWhomUserId =
        snapshotData['collectedFromWhomUserId'] as String?;
    _collectedFromWhomUserName =
        snapshotData['collectedFromWhomUserName'] as String?;
    _collectedFromWhomCompanyRef =
        snapshotData['collectedFromWhomCompanyRef'] as DocumentReference?;
    _collectedFromWhomCompanyId =
        snapshotData['collectedFromWhomCompanyId'] as String?;
    _collectedFromWhomCompanyName =
        snapshotData['collectedFromWhomCompanyName'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financialNoteCompany')
          : FirebaseFirestore.instance.collectionGroup('financialNoteCompany');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financialNoteCompany').doc(id);

  static Stream<FinancialNoteCompanyRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialNoteCompanyRecord.fromSnapshot(s));

  static Future<FinancialNoteCompanyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialNoteCompanyRecord.fromSnapshot(s));

  static FinancialNoteCompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialNoteCompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialNoteCompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialNoteCompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialNoteCompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialNoteCompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialNoteCompanyRecordData({
  double? value,
  DocumentReference? creator,
  String? creatorName,
  String? companyName,
  DocumentReference? companyRef,
  DateTime? creationDate,
  String? content,
  String? pdfUrl,
  String? imageUrl,
  String? creatorTitle,
  String? doesHaveBill,
  String? companyId,
  String? paidFromWhichAccount,
  DocumentReference? workPlaceRef,
  String? workPlaceId,
  String? workPlaceName,
  String? incomeOrExpense,
  DocumentReference? whichCompaniesCurrentsDocRef,
  String? whichCompaniesCurrentsDocId,
  DocumentReference? paidToWhomUserRef,
  String? paidToWhomUserId,
  String? paidToWhomUserName,
  DocumentReference? paidToWhichCompanyRef,
  String? paidToWhichCompanyId,
  String? paidToWhichCompanyName,
  DocumentReference? paidToWhichCompanyCurrentAccountRef,
  String? paidToWhichCompanyCurrentId,
  DocumentReference? collectedFromWhomUserRef,
  String? collectedFromWhomUserId,
  String? collectedFromWhomUserName,
  DocumentReference? collectedFromWhomCompanyRef,
  String? collectedFromWhomCompanyId,
  String? collectedFromWhomCompanyName,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'creator': creator,
      'creatorName': creatorName,
      'companyName': companyName,
      'companyRef': companyRef,
      'creationDate': creationDate,
      'content': content,
      'pdfUrl': pdfUrl,
      'imageUrl': imageUrl,
      'creatorTitle': creatorTitle,
      'doesHaveBill': doesHaveBill,
      'companyId': companyId,
      'paidFromWhichAccount': paidFromWhichAccount,
      'workPlaceRef': workPlaceRef,
      'workPlaceId': workPlaceId,
      'workPlaceName': workPlaceName,
      'incomeOrExpense': incomeOrExpense,
      'whichCompaniesCurrentsDocRef': whichCompaniesCurrentsDocRef,
      'whichCompaniesCurrentsDocId': whichCompaniesCurrentsDocId,
      'paidToWhomUserRef': paidToWhomUserRef,
      'paidToWhomUserId': paidToWhomUserId,
      'paidToWhomUserName': paidToWhomUserName,
      'paidToWhichCompanyRef': paidToWhichCompanyRef,
      'paidToWhichCompanyId': paidToWhichCompanyId,
      'paidToWhichCompanyName': paidToWhichCompanyName,
      'paidToWhichCompanyCurrentAccountRef':
          paidToWhichCompanyCurrentAccountRef,
      'paidToWhichCompanyCurrentId': paidToWhichCompanyCurrentId,
      'collectedFromWhomUserRef': collectedFromWhomUserRef,
      'collectedFromWhomUserId': collectedFromWhomUserId,
      'collectedFromWhomUserName': collectedFromWhomUserName,
      'collectedFromWhomCompanyRef': collectedFromWhomCompanyRef,
      'collectedFromWhomCompanyId': collectedFromWhomCompanyId,
      'collectedFromWhomCompanyName': collectedFromWhomCompanyName,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialNoteCompanyRecordDocumentEquality
    implements Equality<FinancialNoteCompanyRecord> {
  const FinancialNoteCompanyRecordDocumentEquality();

  @override
  bool equals(FinancialNoteCompanyRecord? e1, FinancialNoteCompanyRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.creator == e2?.creator &&
        e1?.creatorName == e2?.creatorName &&
        e1?.companyName == e2?.companyName &&
        e1?.companyRef == e2?.companyRef &&
        e1?.creationDate == e2?.creationDate &&
        e1?.content == e2?.content &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.creatorTitle == e2?.creatorTitle &&
        e1?.doesHaveBill == e2?.doesHaveBill &&
        e1?.companyId == e2?.companyId &&
        e1?.paidFromWhichAccount == e2?.paidFromWhichAccount &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.incomeOrExpense == e2?.incomeOrExpense &&
        e1?.whichCompaniesCurrentsDocRef == e2?.whichCompaniesCurrentsDocRef &&
        e1?.whichCompaniesCurrentsDocId == e2?.whichCompaniesCurrentsDocId &&
        e1?.paidToWhomUserRef == e2?.paidToWhomUserRef &&
        e1?.paidToWhomUserId == e2?.paidToWhomUserId &&
        e1?.paidToWhomUserName == e2?.paidToWhomUserName &&
        e1?.paidToWhichCompanyRef == e2?.paidToWhichCompanyRef &&
        e1?.paidToWhichCompanyId == e2?.paidToWhichCompanyId &&
        e1?.paidToWhichCompanyName == e2?.paidToWhichCompanyName &&
        e1?.paidToWhichCompanyCurrentAccountRef ==
            e2?.paidToWhichCompanyCurrentAccountRef &&
        e1?.paidToWhichCompanyCurrentId == e2?.paidToWhichCompanyCurrentId &&
        e1?.collectedFromWhomUserRef == e2?.collectedFromWhomUserRef &&
        e1?.collectedFromWhomUserId == e2?.collectedFromWhomUserId &&
        e1?.collectedFromWhomUserName == e2?.collectedFromWhomUserName &&
        e1?.collectedFromWhomCompanyRef == e2?.collectedFromWhomCompanyRef &&
        e1?.collectedFromWhomCompanyId == e2?.collectedFromWhomCompanyId &&
        e1?.collectedFromWhomCompanyName == e2?.collectedFromWhomCompanyName &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(FinancialNoteCompanyRecord? e) => const ListEquality().hash([
        e?.value,
        e?.creator,
        e?.creatorName,
        e?.companyName,
        e?.companyRef,
        e?.creationDate,
        e?.content,
        e?.pdfUrl,
        e?.imageUrl,
        e?.creatorTitle,
        e?.doesHaveBill,
        e?.companyId,
        e?.paidFromWhichAccount,
        e?.workPlaceRef,
        e?.workPlaceId,
        e?.workPlaceName,
        e?.incomeOrExpense,
        e?.whichCompaniesCurrentsDocRef,
        e?.whichCompaniesCurrentsDocId,
        e?.paidToWhomUserRef,
        e?.paidToWhomUserId,
        e?.paidToWhomUserName,
        e?.paidToWhichCompanyRef,
        e?.paidToWhichCompanyId,
        e?.paidToWhichCompanyName,
        e?.paidToWhichCompanyCurrentAccountRef,
        e?.paidToWhichCompanyCurrentId,
        e?.collectedFromWhomUserRef,
        e?.collectedFromWhomUserId,
        e?.collectedFromWhomUserName,
        e?.collectedFromWhomCompanyRef,
        e?.collectedFromWhomCompanyId,
        e?.collectedFromWhomCompanyName,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialNoteCompanyRecord;
}
