import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialNoteCompanyCheckRecord extends FirestoreRecord {
  FinancialNoteCompanyCheckRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creatorUserDocRef" field.
  DocumentReference? _creatorUserDocRef;
  DocumentReference? get creatorUserDocRef => _creatorUserDocRef;
  bool hasCreatorUserDocRef() => _creatorUserDocRef != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "creatorUserDocId" field.
  String? _creatorUserDocId;
  String get creatorUserDocId => _creatorUserDocId ?? '';
  bool hasCreatorUserDocId() => _creatorUserDocId != null;

  // "companyDocRef" field.
  DocumentReference? _companyDocRef;
  DocumentReference? get companyDocRef => _companyDocRef;
  bool hasCompanyDocRef() => _companyDocRef != null;

  // "companyDocId" field.
  String? _companyDocId;
  String get companyDocId => _companyDocId ?? '';
  bool hasCompanyDocId() => _companyDocId != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

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

  // "doesHaveABill" field.
  bool? _doesHaveABill;
  bool get doesHaveABill => _doesHaveABill ?? false;
  bool hasDoesHaveABill() => _doesHaveABill != null;

  // "workPlaceDocRef" field.
  DocumentReference? _workPlaceDocRef;
  DocumentReference? get workPlaceDocRef => _workPlaceDocRef;
  bool hasWorkPlaceDocRef() => _workPlaceDocRef != null;

  // "workPlaceDocId" field.
  String? _workPlaceDocId;
  String get workPlaceDocId => _workPlaceDocId ?? '';
  bool hasWorkPlaceDocId() => _workPlaceDocId != null;

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

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "writeDate" field.
  DateTime? _writeDate;
  DateTime? get writeDate => _writeDate;
  bool hasWriteDate() => _writeDate != null;

  // "givenToWhomCompanyRef" field.
  DocumentReference? _givenToWhomCompanyRef;
  DocumentReference? get givenToWhomCompanyRef => _givenToWhomCompanyRef;
  bool hasGivenToWhomCompanyRef() => _givenToWhomCompanyRef != null;

  // "givenToWhomCompanyName" field.
  String? _givenToWhomCompanyName;
  String get givenToWhomCompanyName => _givenToWhomCompanyName ?? '';
  bool hasGivenToWhomCompanyName() => _givenToWhomCompanyName != null;

  // "givenToWhomCompanyId" field.
  String? _givenToWhomCompanyId;
  String get givenToWhomCompanyId => _givenToWhomCompanyId ?? '';
  bool hasGivenToWhomCompanyId() => _givenToWhomCompanyId != null;

  // "givenToWhomUserRef" field.
  DocumentReference? _givenToWhomUserRef;
  DocumentReference? get givenToWhomUserRef => _givenToWhomUserRef;
  bool hasGivenToWhomUserRef() => _givenToWhomUserRef != null;

  // "givenToWhomUserName" field.
  String? _givenToWhomUserName;
  String get givenToWhomUserName => _givenToWhomUserName ?? '';
  bool hasGivenToWhomUserName() => _givenToWhomUserName != null;

  // "givenToWhomUserId" field.
  String? _givenToWhomUserId;
  String get givenToWhomUserId => _givenToWhomUserId ?? '';
  bool hasGivenToWhomUserId() => _givenToWhomUserId != null;

  // "takenFromWhomCompanyRef" field.
  DocumentReference? _takenFromWhomCompanyRef;
  DocumentReference? get takenFromWhomCompanyRef => _takenFromWhomCompanyRef;
  bool hasTakenFromWhomCompanyRef() => _takenFromWhomCompanyRef != null;

  // "takenFromWhomCompanyName" field.
  String? _takenFromWhomCompanyName;
  String get takenFromWhomCompanyName => _takenFromWhomCompanyName ?? '';
  bool hasTakenFromWhomCompanyName() => _takenFromWhomCompanyName != null;

  // "takenFromWhomCompanyId" field.
  String? _takenFromWhomCompanyId;
  String get takenFromWhomCompanyId => _takenFromWhomCompanyId ?? '';
  bool hasTakenFromWhomCompanyId() => _takenFromWhomCompanyId != null;

  // "takenFromWhomUserRef" field.
  DocumentReference? _takenFromWhomUserRef;
  DocumentReference? get takenFromWhomUserRef => _takenFromWhomUserRef;
  bool hasTakenFromWhomUserRef() => _takenFromWhomUserRef != null;

  // "takenFromWhomUserName" field.
  String? _takenFromWhomUserName;
  String get takenFromWhomUserName => _takenFromWhomUserName ?? '';
  bool hasTakenFromWhomUserName() => _takenFromWhomUserName != null;

  // "takenFromWhomUserId" field.
  String? _takenFromWhomUserId;
  String get takenFromWhomUserId => _takenFromWhomUserId ?? '';
  bool hasTakenFromWhomUserId() => _takenFromWhomUserId != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "paymentNote" field.
  String? _paymentNote;
  String get paymentNote => _paymentNote ?? '';
  bool hasPaymentNote() => _paymentNote != null;

  // "transactionType" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creatorUserDocRef =
        snapshotData['creatorUserDocRef'] as DocumentReference?;
    _value = castToType<double>(snapshotData['value']);
    _creatorName = snapshotData['creatorName'] as String?;
    _creatorUserDocId = snapshotData['creatorUserDocId'] as String?;
    _companyDocRef = snapshotData['companyDocRef'] as DocumentReference?;
    _companyDocId = snapshotData['companyDocId'] as String?;
    _companyName = snapshotData['companyName'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _creatorTitle = snapshotData['creatorTitle'] as String?;
    _doesHaveABill = snapshotData['doesHaveABill'] as bool?;
    _workPlaceDocRef = snapshotData['workPlaceDocRef'] as DocumentReference?;
    _workPlaceDocId = snapshotData['workPlaceDocId'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _incomeOrExpense = snapshotData['incomeOrExpense'] as String?;
    _whichCompaniesCurrentsDocRef =
        snapshotData['whichCompaniesCurrentsDocRef'] as DocumentReference?;
    _whichCompaniesCurrentsDocId =
        snapshotData['whichCompaniesCurrentsDocId'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _writeDate = snapshotData['writeDate'] as DateTime?;
    _givenToWhomCompanyRef =
        snapshotData['givenToWhomCompanyRef'] as DocumentReference?;
    _givenToWhomCompanyName = snapshotData['givenToWhomCompanyName'] as String?;
    _givenToWhomCompanyId = snapshotData['givenToWhomCompanyId'] as String?;
    _givenToWhomUserRef =
        snapshotData['givenToWhomUserRef'] as DocumentReference?;
    _givenToWhomUserName = snapshotData['givenToWhomUserName'] as String?;
    _givenToWhomUserId = snapshotData['givenToWhomUserId'] as String?;
    _takenFromWhomCompanyRef =
        snapshotData['takenFromWhomCompanyRef'] as DocumentReference?;
    _takenFromWhomCompanyName =
        snapshotData['takenFromWhomCompanyName'] as String?;
    _takenFromWhomCompanyId = snapshotData['takenFromWhomCompanyId'] as String?;
    _takenFromWhomUserRef =
        snapshotData['takenFromWhomUserRef'] as DocumentReference?;
    _takenFromWhomUserName = snapshotData['takenFromWhomUserName'] as String?;
    _takenFromWhomUserId = snapshotData['takenFromWhomUserId'] as String?;
    _paymentStatus = snapshotData['paymentStatus'] as String?;
    _paymentNote = snapshotData['paymentNote'] as String?;
    _transactionType = snapshotData['transactionType'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('financialNoteCompanyCheck')
          : FirebaseFirestore.instance
              .collectionGroup('financialNoteCompanyCheck');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('financialNoteCompanyCheck').doc(id);

  static Stream<FinancialNoteCompanyCheckRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => FinancialNoteCompanyCheckRecord.fromSnapshot(s));

  static Future<FinancialNoteCompanyCheckRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FinancialNoteCompanyCheckRecord.fromSnapshot(s));

  static FinancialNoteCompanyCheckRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FinancialNoteCompanyCheckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialNoteCompanyCheckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialNoteCompanyCheckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialNoteCompanyCheckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialNoteCompanyCheckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialNoteCompanyCheckRecordData({
  DocumentReference? creatorUserDocRef,
  double? value,
  String? creatorName,
  String? creatorUserDocId,
  DocumentReference? companyDocRef,
  String? companyDocId,
  String? companyName,
  DateTime? creationTime,
  String? content,
  String? pdfUrl,
  String? imageUrl,
  String? creatorTitle,
  bool? doesHaveABill,
  DocumentReference? workPlaceDocRef,
  String? workPlaceDocId,
  String? workPlaceName,
  String? incomeOrExpense,
  DocumentReference? whichCompaniesCurrentsDocRef,
  String? whichCompaniesCurrentsDocId,
  DateTime? dueDate,
  DateTime? writeDate,
  DocumentReference? givenToWhomCompanyRef,
  String? givenToWhomCompanyName,
  String? givenToWhomCompanyId,
  DocumentReference? givenToWhomUserRef,
  String? givenToWhomUserName,
  String? givenToWhomUserId,
  DocumentReference? takenFromWhomCompanyRef,
  String? takenFromWhomCompanyName,
  String? takenFromWhomCompanyId,
  DocumentReference? takenFromWhomUserRef,
  String? takenFromWhomUserName,
  String? takenFromWhomUserId,
  String? paymentStatus,
  String? paymentNote,
  String? transactionType,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creatorUserDocRef': creatorUserDocRef,
      'value': value,
      'creatorName': creatorName,
      'creatorUserDocId': creatorUserDocId,
      'companyDocRef': companyDocRef,
      'companyDocId': companyDocId,
      'companyName': companyName,
      'creationTime': creationTime,
      'content': content,
      'pdfUrl': pdfUrl,
      'imageUrl': imageUrl,
      'creatorTitle': creatorTitle,
      'doesHaveABill': doesHaveABill,
      'workPlaceDocRef': workPlaceDocRef,
      'workPlaceDocId': workPlaceDocId,
      'workPlaceName': workPlaceName,
      'incomeOrExpense': incomeOrExpense,
      'whichCompaniesCurrentsDocRef': whichCompaniesCurrentsDocRef,
      'whichCompaniesCurrentsDocId': whichCompaniesCurrentsDocId,
      'dueDate': dueDate,
      'writeDate': writeDate,
      'givenToWhomCompanyRef': givenToWhomCompanyRef,
      'givenToWhomCompanyName': givenToWhomCompanyName,
      'givenToWhomCompanyId': givenToWhomCompanyId,
      'givenToWhomUserRef': givenToWhomUserRef,
      'givenToWhomUserName': givenToWhomUserName,
      'givenToWhomUserId': givenToWhomUserId,
      'takenFromWhomCompanyRef': takenFromWhomCompanyRef,
      'takenFromWhomCompanyName': takenFromWhomCompanyName,
      'takenFromWhomCompanyId': takenFromWhomCompanyId,
      'takenFromWhomUserRef': takenFromWhomUserRef,
      'takenFromWhomUserName': takenFromWhomUserName,
      'takenFromWhomUserId': takenFromWhomUserId,
      'paymentStatus': paymentStatus,
      'paymentNote': paymentNote,
      'transactionType': transactionType,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialNoteCompanyCheckRecordDocumentEquality
    implements Equality<FinancialNoteCompanyCheckRecord> {
  const FinancialNoteCompanyCheckRecordDocumentEquality();

  @override
  bool equals(FinancialNoteCompanyCheckRecord? e1,
      FinancialNoteCompanyCheckRecord? e2) {
    return e1?.creatorUserDocRef == e2?.creatorUserDocRef &&
        e1?.value == e2?.value &&
        e1?.creatorName == e2?.creatorName &&
        e1?.creatorUserDocId == e2?.creatorUserDocId &&
        e1?.companyDocRef == e2?.companyDocRef &&
        e1?.companyDocId == e2?.companyDocId &&
        e1?.companyName == e2?.companyName &&
        e1?.creationTime == e2?.creationTime &&
        e1?.content == e2?.content &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.creatorTitle == e2?.creatorTitle &&
        e1?.doesHaveABill == e2?.doesHaveABill &&
        e1?.workPlaceDocRef == e2?.workPlaceDocRef &&
        e1?.workPlaceDocId == e2?.workPlaceDocId &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.incomeOrExpense == e2?.incomeOrExpense &&
        e1?.whichCompaniesCurrentsDocRef == e2?.whichCompaniesCurrentsDocRef &&
        e1?.whichCompaniesCurrentsDocId == e2?.whichCompaniesCurrentsDocId &&
        e1?.dueDate == e2?.dueDate &&
        e1?.writeDate == e2?.writeDate &&
        e1?.givenToWhomCompanyRef == e2?.givenToWhomCompanyRef &&
        e1?.givenToWhomCompanyName == e2?.givenToWhomCompanyName &&
        e1?.givenToWhomCompanyId == e2?.givenToWhomCompanyId &&
        e1?.givenToWhomUserRef == e2?.givenToWhomUserRef &&
        e1?.givenToWhomUserName == e2?.givenToWhomUserName &&
        e1?.givenToWhomUserId == e2?.givenToWhomUserId &&
        e1?.takenFromWhomCompanyRef == e2?.takenFromWhomCompanyRef &&
        e1?.takenFromWhomCompanyName == e2?.takenFromWhomCompanyName &&
        e1?.takenFromWhomCompanyId == e2?.takenFromWhomCompanyId &&
        e1?.takenFromWhomUserRef == e2?.takenFromWhomUserRef &&
        e1?.takenFromWhomUserName == e2?.takenFromWhomUserName &&
        e1?.takenFromWhomUserId == e2?.takenFromWhomUserId &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.paymentNote == e2?.paymentNote &&
        e1?.transactionType == e2?.transactionType &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(FinancialNoteCompanyCheckRecord? e) => const ListEquality().hash([
        e?.creatorUserDocRef,
        e?.value,
        e?.creatorName,
        e?.creatorUserDocId,
        e?.companyDocRef,
        e?.companyDocId,
        e?.companyName,
        e?.creationTime,
        e?.content,
        e?.pdfUrl,
        e?.imageUrl,
        e?.creatorTitle,
        e?.doesHaveABill,
        e?.workPlaceDocRef,
        e?.workPlaceDocId,
        e?.workPlaceName,
        e?.incomeOrExpense,
        e?.whichCompaniesCurrentsDocRef,
        e?.whichCompaniesCurrentsDocId,
        e?.dueDate,
        e?.writeDate,
        e?.givenToWhomCompanyRef,
        e?.givenToWhomCompanyName,
        e?.givenToWhomCompanyId,
        e?.givenToWhomUserRef,
        e?.givenToWhomUserName,
        e?.givenToWhomUserId,
        e?.takenFromWhomCompanyRef,
        e?.takenFromWhomCompanyName,
        e?.takenFromWhomCompanyId,
        e?.takenFromWhomUserRef,
        e?.takenFromWhomUserName,
        e?.takenFromWhomUserId,
        e?.paymentStatus,
        e?.paymentNote,
        e?.transactionType,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialNoteCompanyCheckRecord;
}
