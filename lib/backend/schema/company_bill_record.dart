import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyBillRecord extends FirestoreRecord {
  CompanyBillRecord._(
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

  // "companyId" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "paymentDocumentPdfUrl" field.
  String? _paymentDocumentPdfUrl;
  String get paymentDocumentPdfUrl => _paymentDocumentPdfUrl ?? '';
  bool hasPaymentDocumentPdfUrl() => _paymentDocumentPdfUrl != null;

  // "paymentDocumentImageUrl" field.
  String? _paymentDocumentImageUrl;
  String get paymentDocumentImageUrl => _paymentDocumentImageUrl ?? '';
  bool hasPaymentDocumentImageUrl() => _paymentDocumentImageUrl != null;

  // "billPdfUrl" field.
  String? _billPdfUrl;
  String get billPdfUrl => _billPdfUrl ?? '';
  bool hasBillPdfUrl() => _billPdfUrl != null;

  // "billImageUrl" field.
  String? _billImageUrl;
  String get billImageUrl => _billImageUrl ?? '';
  bool hasBillImageUrl() => _billImageUrl != null;

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

  // "fromWhomRef" field.
  DocumentReference? _fromWhomRef;
  DocumentReference? get fromWhomRef => _fromWhomRef;
  bool hasFromWhomRef() => _fromWhomRef != null;

  // "fromWhomName" field.
  String? _fromWhomName;
  String get fromWhomName => _fromWhomName ?? '';
  bool hasFromWhomName() => _fromWhomName != null;

  // "toWhomRef" field.
  DocumentReference? _toWhomRef;
  DocumentReference? get toWhomRef => _toWhomRef;
  bool hasToWhomRef() => _toWhomRef != null;

  // "toWhomName" field.
  String? _toWhomName;
  String get toWhomName => _toWhomName ?? '';
  bool hasToWhomName() => _toWhomName != null;

  // "relatedCurretAccountRef" field.
  DocumentReference? _relatedCurretAccountRef;
  DocumentReference? get relatedCurretAccountRef => _relatedCurretAccountRef;
  bool hasRelatedCurretAccountRef() => _relatedCurretAccountRef != null;

  // "relatedCurrentAccountId" field.
  String? _relatedCurrentAccountId;
  String get relatedCurrentAccountId => _relatedCurrentAccountId ?? '';
  bool hasRelatedCurrentAccountId() => _relatedCurrentAccountId != null;

  // "incomeOrExpense" field.
  String? _incomeOrExpense;
  String get incomeOrExpense => _incomeOrExpense ?? '';
  bool hasIncomeOrExpense() => _incomeOrExpense != null;

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
    _companyId = snapshotData['companyId'] as String?;
    _paymentDocumentPdfUrl = snapshotData['paymentDocumentPdfUrl'] as String?;
    _paymentDocumentImageUrl =
        snapshotData['paymentDocumentImageUrl'] as String?;
    _billPdfUrl = snapshotData['billPdfUrl'] as String?;
    _billImageUrl = snapshotData['billImageUrl'] as String?;
    _paidFromWhichAccount = snapshotData['paidFromWhichAccount'] as String?;
    _workPlaceRef = snapshotData['workPlaceRef'] as DocumentReference?;
    _workPlaceId = snapshotData['workPlaceId'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _fromWhomRef = snapshotData['fromWhomRef'] as DocumentReference?;
    _fromWhomName = snapshotData['fromWhomName'] as String?;
    _toWhomRef = snapshotData['toWhomRef'] as DocumentReference?;
    _toWhomName = snapshotData['toWhomName'] as String?;
    _relatedCurretAccountRef =
        snapshotData['relatedCurretAccountRef'] as DocumentReference?;
    _relatedCurrentAccountId =
        snapshotData['relatedCurrentAccountId'] as String?;
    _incomeOrExpense = snapshotData['incomeOrExpense'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyBill')
          : FirebaseFirestore.instance.collectionGroup('companyBill');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyBill').doc(id);

  static Stream<CompanyBillRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyBillRecord.fromSnapshot(s));

  static Future<CompanyBillRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyBillRecord.fromSnapshot(s));

  static CompanyBillRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyBillRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyBillRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyBillRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyBillRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyBillRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyBillRecordData({
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
  String? companyId,
  String? paymentDocumentPdfUrl,
  String? paymentDocumentImageUrl,
  String? billPdfUrl,
  String? billImageUrl,
  String? paidFromWhichAccount,
  DocumentReference? workPlaceRef,
  String? workPlaceId,
  String? workPlaceName,
  DocumentReference? fromWhomRef,
  String? fromWhomName,
  DocumentReference? toWhomRef,
  String? toWhomName,
  DocumentReference? relatedCurretAccountRef,
  String? relatedCurrentAccountId,
  String? incomeOrExpense,
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
      'companyId': companyId,
      'paymentDocumentPdfUrl': paymentDocumentPdfUrl,
      'paymentDocumentImageUrl': paymentDocumentImageUrl,
      'billPdfUrl': billPdfUrl,
      'billImageUrl': billImageUrl,
      'paidFromWhichAccount': paidFromWhichAccount,
      'workPlaceRef': workPlaceRef,
      'workPlaceId': workPlaceId,
      'workPlaceName': workPlaceName,
      'fromWhomRef': fromWhomRef,
      'fromWhomName': fromWhomName,
      'toWhomRef': toWhomRef,
      'toWhomName': toWhomName,
      'relatedCurretAccountRef': relatedCurretAccountRef,
      'relatedCurrentAccountId': relatedCurrentAccountId,
      'incomeOrExpense': incomeOrExpense,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyBillRecordDocumentEquality implements Equality<CompanyBillRecord> {
  const CompanyBillRecordDocumentEquality();

  @override
  bool equals(CompanyBillRecord? e1, CompanyBillRecord? e2) {
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
        e1?.companyId == e2?.companyId &&
        e1?.paymentDocumentPdfUrl == e2?.paymentDocumentPdfUrl &&
        e1?.paymentDocumentImageUrl == e2?.paymentDocumentImageUrl &&
        e1?.billPdfUrl == e2?.billPdfUrl &&
        e1?.billImageUrl == e2?.billImageUrl &&
        e1?.paidFromWhichAccount == e2?.paidFromWhichAccount &&
        e1?.workPlaceRef == e2?.workPlaceRef &&
        e1?.workPlaceId == e2?.workPlaceId &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.fromWhomRef == e2?.fromWhomRef &&
        e1?.fromWhomName == e2?.fromWhomName &&
        e1?.toWhomRef == e2?.toWhomRef &&
        e1?.toWhomName == e2?.toWhomName &&
        e1?.relatedCurretAccountRef == e2?.relatedCurretAccountRef &&
        e1?.relatedCurrentAccountId == e2?.relatedCurrentAccountId &&
        e1?.incomeOrExpense == e2?.incomeOrExpense;
  }

  @override
  int hash(CompanyBillRecord? e) => const ListEquality().hash([
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
        e?.companyId,
        e?.paymentDocumentPdfUrl,
        e?.paymentDocumentImageUrl,
        e?.billPdfUrl,
        e?.billImageUrl,
        e?.paidFromWhichAccount,
        e?.workPlaceRef,
        e?.workPlaceId,
        e?.workPlaceName,
        e?.fromWhomRef,
        e?.fromWhomName,
        e?.toWhomRef,
        e?.toWhomName,
        e?.relatedCurretAccountRef,
        e?.relatedCurrentAccountId,
        e?.incomeOrExpense
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyBillRecord;
}
