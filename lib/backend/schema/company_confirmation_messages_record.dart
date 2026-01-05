import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyConfirmationMessagesRecord extends FirestoreRecord {
  CompanyConfirmationMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "receiverRef" field.
  DocumentReference? _receiverRef;
  DocumentReference? get receiverRef => _receiverRef;
  bool hasReceiverRef() => _receiverRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "ImagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "senderImageRef" field.
  String? _senderImageRef;
  String get senderImageRef => _senderImageRef ?? '';
  bool hasSenderImageRef() => _senderImageRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _isRead = snapshotData['isRead'] as bool?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imagePath = snapshotData['ImagePath'] as String?;
    _senderImageRef = snapshotData['senderImageRef'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyConfirmationMessages')
          : FirebaseFirestore.instance
              .collectionGroup('companyConfirmationMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyConfirmationMessages').doc(id);

  static Stream<CompanyConfirmationMessagesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CompanyConfirmationMessagesRecord.fromSnapshot(s));

  static Future<CompanyConfirmationMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyConfirmationMessagesRecord.fromSnapshot(s));

  static CompanyConfirmationMessagesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CompanyConfirmationMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyConfirmationMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyConfirmationMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyConfirmationMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyConfirmationMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyConfirmationMessagesRecordData({
  String? message,
  DocumentReference? senderRef,
  DocumentReference? receiverRef,
  DateTime? date,
  bool? isRead,
  String? pdfUrl,
  String? imagePath,
  String? senderImageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'senderRef': senderRef,
      'receiverRef': receiverRef,
      'date': date,
      'isRead': isRead,
      'pdfUrl': pdfUrl,
      'ImagePath': imagePath,
      'senderImageRef': senderImageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyConfirmationMessagesRecordDocumentEquality
    implements Equality<CompanyConfirmationMessagesRecord> {
  const CompanyConfirmationMessagesRecordDocumentEquality();

  @override
  bool equals(CompanyConfirmationMessagesRecord? e1,
      CompanyConfirmationMessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef &&
        e1?.date == e2?.date &&
        e1?.isRead == e2?.isRead &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imagePath == e2?.imagePath &&
        e1?.senderImageRef == e2?.senderImageRef;
  }

  @override
  int hash(CompanyConfirmationMessagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.senderRef,
        e?.receiverRef,
        e?.date,
        e?.isRead,
        e?.pdfUrl,
        e?.imagePath,
        e?.senderImageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyConfirmationMessagesRecord;
}
