import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlacePaymentsRecord extends FirestoreRecord {
  WorkPlacePaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "creatorUser" field.
  DocumentReference? _creatorUser;
  DocumentReference? get creatorUser => _creatorUser;
  bool hasCreatorUser() => _creatorUser != null;

  // "capEx" field.
  bool? _capEx;
  bool get capEx => _capEx ?? false;
  bool hasCapEx() => _capEx != null;

  // "opEx" field.
  bool? _opEx;
  bool get opEx => _opEx ?? false;
  bool hasOpEx() => _opEx != null;

  // "accrualTime" field.
  DateTime? _accrualTime;
  DateTime? get accrualTime => _accrualTime;
  bool hasAccrualTime() => _accrualTime != null;

  // "paymentTime" field.
  DateTime? _paymentTime;
  DateTime? get paymentTime => _paymentTime;
  bool hasPaymentTime() => _paymentTime != null;

  // "isPayerPersonalUser" field.
  bool? _isPayerPersonalUser;
  bool get isPayerPersonalUser => _isPayerPersonalUser ?? false;
  bool hasIsPayerPersonalUser() => _isPayerPersonalUser != null;

  // "isPayerWorkPlace" field.
  bool? _isPayerWorkPlace;
  bool get isPayerWorkPlace => _isPayerWorkPlace ?? false;
  bool hasIsPayerWorkPlace() => _isPayerWorkPlace != null;

  // "isPayerCompany" field.
  bool? _isPayerCompany;
  bool get isPayerCompany => _isPayerCompany ?? false;
  bool hasIsPayerCompany() => _isPayerCompany != null;

  // "paidByWhomUserRef" field.
  DocumentReference? _paidByWhomUserRef;
  DocumentReference? get paidByWhomUserRef => _paidByWhomUserRef;
  bool hasPaidByWhomUserRef() => _paidByWhomUserRef != null;

  // "paidByWhichWorkPlaceRef" field.
  DocumentReference? _paidByWhichWorkPlaceRef;
  DocumentReference? get paidByWhichWorkPlaceRef => _paidByWhichWorkPlaceRef;
  bool hasPaidByWhichWorkPlaceRef() => _paidByWhichWorkPlaceRef != null;

  // "paidByWhichCompanyRef" field.
  DocumentReference? _paidByWhichCompanyRef;
  DocumentReference? get paidByWhichCompanyRef => _paidByWhichCompanyRef;
  bool hasPaidByWhichCompanyRef() => _paidByWhichCompanyRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUser = snapshotData['creatorUser'] as DocumentReference?;
    _capEx = snapshotData['capEx'] as bool?;
    _opEx = snapshotData['opEx'] as bool?;
    _accrualTime = snapshotData['accrualTime'] as DateTime?;
    _paymentTime = snapshotData['paymentTime'] as DateTime?;
    _isPayerPersonalUser = snapshotData['isPayerPersonalUser'] as bool?;
    _isPayerWorkPlace = snapshotData['isPayerWorkPlace'] as bool?;
    _isPayerCompany = snapshotData['isPayerCompany'] as bool?;
    _paidByWhomUserRef =
        snapshotData['paidByWhomUserRef'] as DocumentReference?;
    _paidByWhichWorkPlaceRef =
        snapshotData['paidByWhichWorkPlaceRef'] as DocumentReference?;
    _paidByWhichCompanyRef =
        snapshotData['paidByWhichCompanyRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlacePayments')
          : FirebaseFirestore.instance.collectionGroup('workPlacePayments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlacePayments').doc(id);

  static Stream<WorkPlacePaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlacePaymentsRecord.fromSnapshot(s));

  static Future<WorkPlacePaymentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlacePaymentsRecord.fromSnapshot(s));

  static WorkPlacePaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlacePaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlacePaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlacePaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlacePaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlacePaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlacePaymentsRecordData({
  double? value,
  String? title,
  String? content,
  DateTime? creationTime,
  DocumentReference? creatorUser,
  bool? capEx,
  bool? opEx,
  DateTime? accrualTime,
  DateTime? paymentTime,
  bool? isPayerPersonalUser,
  bool? isPayerWorkPlace,
  bool? isPayerCompany,
  DocumentReference? paidByWhomUserRef,
  DocumentReference? paidByWhichWorkPlaceRef,
  DocumentReference? paidByWhichCompanyRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'title': title,
      'content': content,
      'creationTime': creationTime,
      'creatorUser': creatorUser,
      'capEx': capEx,
      'opEx': opEx,
      'accrualTime': accrualTime,
      'paymentTime': paymentTime,
      'isPayerPersonalUser': isPayerPersonalUser,
      'isPayerWorkPlace': isPayerWorkPlace,
      'isPayerCompany': isPayerCompany,
      'paidByWhomUserRef': paidByWhomUserRef,
      'paidByWhichWorkPlaceRef': paidByWhichWorkPlaceRef,
      'paidByWhichCompanyRef': paidByWhichCompanyRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlacePaymentsRecordDocumentEquality
    implements Equality<WorkPlacePaymentsRecord> {
  const WorkPlacePaymentsRecordDocumentEquality();

  @override
  bool equals(WorkPlacePaymentsRecord? e1, WorkPlacePaymentsRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.creationTime == e2?.creationTime &&
        e1?.creatorUser == e2?.creatorUser &&
        e1?.capEx == e2?.capEx &&
        e1?.opEx == e2?.opEx &&
        e1?.accrualTime == e2?.accrualTime &&
        e1?.paymentTime == e2?.paymentTime &&
        e1?.isPayerPersonalUser == e2?.isPayerPersonalUser &&
        e1?.isPayerWorkPlace == e2?.isPayerWorkPlace &&
        e1?.isPayerCompany == e2?.isPayerCompany &&
        e1?.paidByWhomUserRef == e2?.paidByWhomUserRef &&
        e1?.paidByWhichWorkPlaceRef == e2?.paidByWhichWorkPlaceRef &&
        e1?.paidByWhichCompanyRef == e2?.paidByWhichCompanyRef;
  }

  @override
  int hash(WorkPlacePaymentsRecord? e) => const ListEquality().hash([
        e?.value,
        e?.title,
        e?.content,
        e?.creationTime,
        e?.creatorUser,
        e?.capEx,
        e?.opEx,
        e?.accrualTime,
        e?.paymentTime,
        e?.isPayerPersonalUser,
        e?.isPayerWorkPlace,
        e?.isPayerCompany,
        e?.paidByWhomUserRef,
        e?.paidByWhichWorkPlaceRef,
        e?.paidByWhichCompanyRef
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlacePaymentsRecord;
}
