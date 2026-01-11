import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialMessagesRecord extends FirestoreRecord {
  SocialMessagesRecord._(
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

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "isUser1Delete" field.
  bool? _isUser1Delete;
  bool get isUser1Delete => _isUser1Delete ?? false;
  bool hasIsUser1Delete() => _isUser1Delete != null;

  // "isUser2Delete" field.
  bool? _isUser2Delete;
  bool get isUser2Delete => _isUser2Delete ?? false;
  bool hasIsUser2Delete() => _isUser2Delete != null;

  // "isStaredFromUser1" field.
  bool? _isStaredFromUser1;
  bool get isStaredFromUser1 => _isStaredFromUser1 ?? false;
  bool hasIsStaredFromUser1() => _isStaredFromUser1 != null;

  // "isStaredFromUser2" field.
  bool? _isStaredFromUser2;
  bool get isStaredFromUser2 => _isStaredFromUser2 ?? false;
  bool hasIsStaredFromUser2() => _isStaredFromUser2 != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "answeredMessage" field.
  String? _answeredMessage;
  String get answeredMessage => _answeredMessage ?? '';
  bool hasAnsweredMessage() => _answeredMessage != null;

  // "reactionFromUser1" field.
  String? _reactionFromUser1;
  String get reactionFromUser1 => _reactionFromUser1 ?? '';
  bool hasReactionFromUser1() => _reactionFromUser1 != null;

  // "reactionFromUser2" field.
  String? _reactionFromUser2;
  String get reactionFromUser2 => _reactionFromUser2 ?? '';
  bool hasReactionFromUser2() => _reactionFromUser2 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _receiverRef = snapshotData['receiverRef'] as DocumentReference?;
    _isRead = snapshotData['isRead'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _isUser1Delete = snapshotData['isUser1Delete'] as bool?;
    _isUser2Delete = snapshotData['isUser2Delete'] as bool?;
    _isStaredFromUser1 = snapshotData['isStaredFromUser1'] as bool?;
    _isStaredFromUser2 = snapshotData['isStaredFromUser2'] as bool?;
    _isPinned = snapshotData['isPinned'] as bool?;
    _answeredMessage = snapshotData['answeredMessage'] as String?;
    _reactionFromUser1 = snapshotData['reactionFromUser1'] as String?;
    _reactionFromUser2 = snapshotData['reactionFromUser2'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('socialMessages')
          : FirebaseFirestore.instance.collectionGroup('socialMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('socialMessages').doc(id);

  static Stream<SocialMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialMessagesRecord.fromSnapshot(s));

  static Future<SocialMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SocialMessagesRecord.fromSnapshot(s));

  static SocialMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialMessagesRecordData({
  String? message,
  DocumentReference? senderRef,
  DocumentReference? receiverRef,
  bool? isRead,
  DateTime? date,
  String? pdfUrl,
  String? imagePath,
  bool? isUser1Delete,
  bool? isUser2Delete,
  bool? isStaredFromUser1,
  bool? isStaredFromUser2,
  bool? isPinned,
  String? answeredMessage,
  String? reactionFromUser1,
  String? reactionFromUser2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'senderRef': senderRef,
      'receiverRef': receiverRef,
      'isRead': isRead,
      'date': date,
      'pdfUrl': pdfUrl,
      'imagePath': imagePath,
      'isUser1Delete': isUser1Delete,
      'isUser2Delete': isUser2Delete,
      'isStaredFromUser1': isStaredFromUser1,
      'isStaredFromUser2': isStaredFromUser2,
      'isPinned': isPinned,
      'answeredMessage': answeredMessage,
      'reactionFromUser1': reactionFromUser1,
      'reactionFromUser2': reactionFromUser2,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialMessagesRecordDocumentEquality
    implements Equality<SocialMessagesRecord> {
  const SocialMessagesRecordDocumentEquality();

  @override
  bool equals(SocialMessagesRecord? e1, SocialMessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.senderRef == e2?.senderRef &&
        e1?.receiverRef == e2?.receiverRef &&
        e1?.isRead == e2?.isRead &&
        e1?.date == e2?.date &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.imagePath == e2?.imagePath &&
        e1?.isUser1Delete == e2?.isUser1Delete &&
        e1?.isUser2Delete == e2?.isUser2Delete &&
        e1?.isStaredFromUser1 == e2?.isStaredFromUser1 &&
        e1?.isStaredFromUser2 == e2?.isStaredFromUser2 &&
        e1?.isPinned == e2?.isPinned &&
        e1?.answeredMessage == e2?.answeredMessage &&
        e1?.reactionFromUser1 == e2?.reactionFromUser1 &&
        e1?.reactionFromUser2 == e2?.reactionFromUser2;
  }

  @override
  int hash(SocialMessagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.senderRef,
        e?.receiverRef,
        e?.isRead,
        e?.date,
        e?.pdfUrl,
        e?.imagePath,
        e?.isUser1Delete,
        e?.isUser2Delete,
        e?.isStaredFromUser1,
        e?.isStaredFromUser2,
        e?.isPinned,
        e?.answeredMessage,
        e?.reactionFromUser1,
        e?.reactionFromUser2
      ]);

  @override
  bool isValidKey(Object? o) => o is SocialMessagesRecord;
}
