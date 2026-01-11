import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhoneConfirmationMessagesRecord extends FirestoreRecord {
  PhoneConfirmationMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "receiverRef" field.
  DocumentReference? _receiverRef;
  DocumentReference? get receiverRef => _receiverRef;
  bool hasReceiverRef() => _receiverRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "senderImageRef" field.
  String? _senderImageRef;
  String get senderImageRef => _senderImageRef ?? '';
  bool hasSenderImageRef() => _senderImageRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _isRead = snapshotData['isRead'] as bool?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _senderImageRef = snapshotData['senderImageRef'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PhoneConfirmationMessages')
          : FirebaseFirestore.instance
              .collectionGroup('PhoneConfirmationMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PhoneConfirmationMessages').doc(id);

  static Stream<PhoneConfirmationMessagesRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => PhoneConfirmationMessagesRecord.fromSnapshot(s));

  static Future<PhoneConfirmationMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PhoneConfirmationMessagesRecord.fromSnapshot(s));

  static PhoneConfirmationMessagesRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PhoneConfirmationMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhoneConfirmationMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhoneConfirmationMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhoneConfirmationMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhoneConfirmationMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhoneConfirmationMessagesRecordData({
  DocumentReference? senderRef,
  DocumentReference? receiverRef,
  String? message,
  DateTime? dateTime,
  bool? isRead,
  String? pdfUrl,
  String? imagePath,
  String? senderImageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderRef': senderRef,
      'receiverRef': receiverRef,
      'message': message,
      'dateTime': dateTime,
      'isRead': isRead,
      'pdfUrl': pdfUrl,
      'imagePath': imagePath,
      'senderImageRef': senderImageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhoneConfirmationMessagesRecordDocumentEquality
    implements Equality<PhoneConfirmationMessagesRecord> {
  const PhoneConfirmationMessagesRecordDocumentEquality();

  @override
  bool equals(PhoneConfirmationMessagesRecord? e1,
      PhoneConfirmationMessagesRecord? e2) {
    return e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef &&
        e1?.message == e2?.message &&
        e1?.dateTime == e2?.dateTime &&
        e1?.isRead == e2?.isRead &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imagePath == e2?.imagePath &&
        e1?.senderImageRef == e2?.senderImageRef;
  }

  @override
  int hash(PhoneConfirmationMessagesRecord? e) => const ListEquality().hash([
        e?.senderRef,
        e?.receiverRef,
        e?.message,
        e?.dateTime,
        e?.isRead,
        e?.pdfUrl,
        e?.imagePath,
        e?.senderImageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PhoneConfirmationMessagesRecord;
}
