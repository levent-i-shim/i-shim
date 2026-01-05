import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyTransactionsRecord extends FirestoreRecord {
  CompanyTransactionsRecord._(
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

  // "companyReports" field.
  DocumentReference? _companyReports;
  DocumentReference? get companyReports => _companyReports;
  bool hasCompanyReports() => _companyReports != null;

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "receiverRef" field.
  DocumentReference? _receiverRef;
  DocumentReference? get receiverRef => _receiverRef;
  bool hasReceiverRef() => _receiverRef != null;

  // "totalAmount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "isConfirmed" field.
  bool? _isConfirmed;
  bool get isConfirmed => _isConfirmed ?? false;
  bool hasIsConfirmed() => _isConfirmed != null;

  // "isRejected" field.
  bool? _isRejected;
  bool get isRejected => _isRejected ?? false;
  bool hasIsRejected() => _isRejected != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "vehiclePayment" field.
  DocumentReference? _vehiclePayment;
  DocumentReference? get vehiclePayment => _vehiclePayment;
  bool hasVehiclePayment() => _vehiclePayment != null;

  // "workPlaceTransaction" field.
  DocumentReference? _workPlaceTransaction;
  DocumentReference? get workPlaceTransaction => _workPlaceTransaction;
  bool hasWorkPlaceTransaction() => _workPlaceTransaction != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _companyReports = snapshotData['companyReports'] as DocumentReference?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
    _totalAmount = castToType<double>(snapshotData['totalAmount']);
    _isConfirmed = snapshotData['isConfirmed'] as bool?;
    _isRejected = snapshotData['isRejected'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _vehiclePayment = snapshotData['vehiclePayment'] as DocumentReference?;
    _workPlaceTransaction =
        snapshotData['workPlaceTransaction'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyTransactions')
          : FirebaseFirestore.instance.collectionGroup('companyTransactions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyTransactions').doc(id);

  static Stream<CompanyTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyTransactionsRecord.fromSnapshot(s));

  static Future<CompanyTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyTransactionsRecord.fromSnapshot(s));

  static CompanyTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyTransactionsRecordData({
  String? name,
  String? description,
  DocumentReference? companyReports,
  DocumentReference? senderRef,
  DocumentReference? receiverRef,
  double? totalAmount,
  bool? isConfirmed,
  bool? isRejected,
  DateTime? date,
  DocumentReference? vehiclePayment,
  DocumentReference? workPlaceTransaction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'companyReports': companyReports,
      'senderRef': senderRef,
      'receiverRef': receiverRef,
      'totalAmount': totalAmount,
      'isConfirmed': isConfirmed,
      'isRejected': isRejected,
      'date': date,
      'vehiclePayment': vehiclePayment,
      'workPlaceTransaction': workPlaceTransaction,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyTransactionsRecordDocumentEquality
    implements Equality<CompanyTransactionsRecord> {
  const CompanyTransactionsRecordDocumentEquality();

  @override
  bool equals(CompanyTransactionsRecord? e1, CompanyTransactionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.companyReports == e2?.companyReports &&
        e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.isConfirmed == e2?.isConfirmed &&
        e1?.isRejected == e2?.isRejected &&
        e1?.date == e2?.date &&
        e1?.vehiclePayment == e2?.vehiclePayment &&
        e1?.workPlaceTransaction == e2?.workPlaceTransaction;
  }

  @override
  int hash(CompanyTransactionsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.companyReports,
        e?.senderRef,
        e?.receiverRef,
        e?.totalAmount,
        e?.isConfirmed,
        e?.isRejected,
        e?.date,
        e?.vehiclePayment,
        e?.workPlaceTransaction
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyTransactionsRecord;
}
