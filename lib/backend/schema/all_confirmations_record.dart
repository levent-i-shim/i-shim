import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllConfirmationsRecord extends FirestoreRecord {
  AllConfirmationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "receiverName" field.
  String? _receiverName;
  String get receiverName => _receiverName ?? '';
  bool hasReceiverName() => _receiverName != null;

  // "createdRef" field.
  DocumentReference? _createdRef;
  DocumentReference? get createdRef => _createdRef;
  bool hasCreatedRef() => _createdRef != null;

  // "confirmationImage" field.
  String? _confirmationImage;
  String get confirmationImage => _confirmationImage ?? '';
  bool hasConfirmationImage() => _confirmationImage != null;

  // "message" field.
  DocumentReference? _message;
  DocumentReference? get message => _message;
  bool hasMessage() => _message != null;

  // "messageType" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isAccept = snapshotData['isAccept'] as bool?;
    _receiverName = snapshotData['receiverName'] as String?;
    _createdRef = snapshotData['createdRef'] as DocumentReference?;
    _confirmationImage = snapshotData['confirmationImage'] as String?;
    _message = snapshotData['message'] as DocumentReference?;
    _messageType = snapshotData['messageType'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('AllConfirmations')
          : FirebaseFirestore.instance.collectionGroup('AllConfirmations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('AllConfirmations').doc(id);

  static Stream<AllConfirmationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllConfirmationsRecord.fromSnapshot(s));

  static Future<AllConfirmationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AllConfirmationsRecord.fromSnapshot(s));

  static AllConfirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllConfirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllConfirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllConfirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllConfirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllConfirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllConfirmationsRecordData({
  bool? isAccept,
  String? receiverName,
  DocumentReference? createdRef,
  String? confirmationImage,
  DocumentReference? message,
  String? messageType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isAccept': isAccept,
      'receiverName': receiverName,
      'createdRef': createdRef,
      'confirmationImage': confirmationImage,
      'message': message,
      'messageType': messageType,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllConfirmationsRecordDocumentEquality
    implements Equality<AllConfirmationsRecord> {
  const AllConfirmationsRecordDocumentEquality();

  @override
  bool equals(AllConfirmationsRecord? e1, AllConfirmationsRecord? e2) {
    return e1?.isAccept == e2?.isAccept &&
        e1?.receiverName == e2?.receiverName &&
        e1?.createdRef == e2?.createdRef &&
        e1?.confirmationImage == e2?.confirmationImage &&
        e1?.message == e2?.message &&
        e1?.messageType == e2?.messageType;
  }

  @override
  int hash(AllConfirmationsRecord? e) => const ListEquality().hash([
        e?.isAccept,
        e?.receiverName,
        e?.createdRef,
        e?.confirmationImage,
        e?.message,
        e?.messageType
      ]);

  @override
  bool isValidKey(Object? o) => o is AllConfirmationsRecord;
}
