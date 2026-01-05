import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceSalaryRecord extends FirestoreRecord {
  WorkPlaceSalaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "paidForWhichMonth" field.
  String? _paidForWhichMonth;
  String get paidForWhichMonth => _paidForWhichMonth ?? '';
  bool hasPaidForWhichMonth() => _paidForWhichMonth != null;

  // "workerUserDocRef" field.
  DocumentReference? _workerUserDocRef;
  DocumentReference? get workerUserDocRef => _workerUserDocRef;
  bool hasWorkerUserDocRef() => _workerUserDocRef != null;

  // "paymentImageUrl" field.
  String? _paymentImageUrl;
  String get paymentImageUrl => _paymentImageUrl ?? '';
  bool hasPaymentImageUrl() => _paymentImageUrl != null;

  // "paymentPdfUrl" field.
  String? _paymentPdfUrl;
  String get paymentPdfUrl => _paymentPdfUrl ?? '';
  bool hasPaymentPdfUrl() => _paymentPdfUrl != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "paidToWhomName" field.
  String? _paidToWhomName;
  String get paidToWhomName => _paidToWhomName ?? '';
  bool hasPaidToWhomName() => _paidToWhomName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _value = castToType<double>(snapshotData['value']);
    _paidForWhichMonth = snapshotData['paidForWhichMonth'] as String?;
    _workerUserDocRef = snapshotData['workerUserDocRef'] as DocumentReference?;
    _paymentImageUrl = snapshotData['paymentImageUrl'] as String?;
    _paymentPdfUrl = snapshotData['paymentPdfUrl'] as String?;
    _content = snapshotData['content'] as String?;
    _paidToWhomName = snapshotData['paidToWhomName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceSalary')
          : FirebaseFirestore.instance.collectionGroup('workPlaceSalary');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceSalary').doc(id);

  static Stream<WorkPlaceSalaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceSalaryRecord.fromSnapshot(s));

  static Future<WorkPlaceSalaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceSalaryRecord.fromSnapshot(s));

  static WorkPlaceSalaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceSalaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceSalaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceSalaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceSalaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceSalaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceSalaryRecordData({
  DateTime? date,
  String? type,
  bool? isDelete,
  double? value,
  String? paidForWhichMonth,
  DocumentReference? workerUserDocRef,
  String? paymentImageUrl,
  String? paymentPdfUrl,
  String? content,
  String? paidToWhomName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'type': type,
      'isDelete': isDelete,
      'value': value,
      'paidForWhichMonth': paidForWhichMonth,
      'workerUserDocRef': workerUserDocRef,
      'paymentImageUrl': paymentImageUrl,
      'paymentPdfUrl': paymentPdfUrl,
      'content': content,
      'paidToWhomName': paidToWhomName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceSalaryRecordDocumentEquality
    implements Equality<WorkPlaceSalaryRecord> {
  const WorkPlaceSalaryRecordDocumentEquality();

  @override
  bool equals(WorkPlaceSalaryRecord? e1, WorkPlaceSalaryRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.isDelete == e2?.isDelete &&
        e1?.value == e2?.value &&
        e1?.paidForWhichMonth == e2?.paidForWhichMonth &&
        e1?.workerUserDocRef == e2?.workerUserDocRef &&
        e1?.paymentImageUrl == e2?.paymentImageUrl &&
        e1?.paymentPdfUrl == e2?.paymentPdfUrl &&
        e1?.content == e2?.content &&
        e1?.paidToWhomName == e2?.paidToWhomName;
  }

  @override
  int hash(WorkPlaceSalaryRecord? e) => const ListEquality().hash([
        e?.date,
        e?.type,
        e?.isDelete,
        e?.value,
        e?.paidForWhichMonth,
        e?.workerUserDocRef,
        e?.paymentImageUrl,
        e?.paymentPdfUrl,
        e?.content,
        e?.paidToWhomName
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceSalaryRecord;
}
