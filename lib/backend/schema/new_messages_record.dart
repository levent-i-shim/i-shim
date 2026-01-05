import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewMessagesRecord extends FirestoreRecord {
  NewMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "messageRef" field.
  DocumentReference? _messageRef;
  DocumentReference? get messageRef => _messageRef;
  bool hasMessageRef() => _messageRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "asnweredMessage" field.
  String? _asnweredMessage;
  String get asnweredMessage => _asnweredMessage ?? '';
  bool hasAsnweredMessage() => _asnweredMessage != null;

  // "firebaseId" field.
  String? _firebaseId;
  String get firebaseId => _firebaseId ?? '';
  bool hasFirebaseId() => _firebaseId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _messageRef = snapshotData['messageRef'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _asnweredMessage = snapshotData['asnweredMessage'] as String?;
    _firebaseId = snapshotData['firebaseId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('newMessages')
          : FirebaseFirestore.instance.collectionGroup('newMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('newMessages').doc(id);

  static Stream<NewMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewMessagesRecord.fromSnapshot(s));

  static Future<NewMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewMessagesRecord.fromSnapshot(s));

  static NewMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewMessagesRecordData({
  DocumentReference? senderRef,
  String? message,
  String? pdfUrl,
  String? imagePath,
  DateTime? date,
  DocumentReference? messageRef,
  String? type,
  String? asnweredMessage,
  String? firebaseId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderRef': senderRef,
      'message': message,
      'pdfUrl': pdfUrl,
      'imagePath': imagePath,
      'date': date,
      'messageRef': messageRef,
      'type': type,
      'asnweredMessage': asnweredMessage,
      'firebaseId': firebaseId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewMessagesRecordDocumentEquality implements Equality<NewMessagesRecord> {
  const NewMessagesRecordDocumentEquality();

  @override
  bool equals(NewMessagesRecord? e1, NewMessagesRecord? e2) {
    return e1?.senderRef == e2?.senderRef &&
        e1?.message == e2?.message &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imagePath == e2?.imagePath &&
        e1?.date == e2?.date &&
        e1?.messageRef == e2?.messageRef &&
        e1?.type == e2?.type &&
        e1?.asnweredMessage == e2?.asnweredMessage &&
        e1?.firebaseId == e2?.firebaseId;
  }

  @override
  int hash(NewMessagesRecord? e) => const ListEquality().hash([
        e?.senderRef,
        e?.message,
        e?.pdfUrl,
        e?.imagePath,
        e?.date,
        e?.messageRef,
        e?.type,
        e?.asnweredMessage,
        e?.firebaseId
      ]);

  @override
  bool isValidKey(Object? o) => o is NewMessagesRecord;
}
