import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "relatedDoc" field.
  String? _relatedDoc;
  String get relatedDoc => _relatedDoc ?? '';
  bool hasRelatedDoc() => _relatedDoc != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "isDuty" field.
  bool? _isDuty;
  bool get isDuty => _isDuty ?? false;
  bool hasIsDuty() => _isDuty != null;

  // "fullDescription" field.
  String? _fullDescription;
  String get fullDescription => _fullDescription ?? '';
  bool hasFullDescription() => _fullDescription != null;

  // "workplace" field.
  DocumentReference? _workplace;
  DocumentReference? get workplace => _workplace;
  bool hasWorkplace() => _workplace != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "triggeredUser" field.
  DocumentReference? _triggeredUser;
  DocumentReference? get triggeredUser => _triggeredUser;
  bool hasTriggeredUser() => _triggeredUser != null;

  // "messageType" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _content = snapshotData['content'] as String?;
    _relatedDoc = snapshotData['relatedDoc'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _company = snapshotData['company'] as DocumentReference?;
    _isDuty = snapshotData['isDuty'] as bool?;
    _fullDescription = snapshotData['fullDescription'] as String?;
    _workplace = snapshotData['workplace'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _triggeredUser = snapshotData['triggeredUser'] as DocumentReference?;
    _messageType = snapshotData['messageType'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notifications')
          : FirebaseFirestore.instance.collectionGroup('notifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notifications').doc(id);

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? type,
  String? content,
  String? relatedDoc,
  bool? isRead,
  DateTime? creationTime,
  bool? isDelete,
  DocumentReference? company,
  bool? isDuty,
  String? fullDescription,
  DocumentReference? workplace,
  String? image,
  bool? isAccept,
  DocumentReference? triggeredUser,
  String? messageType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'content': content,
      'relatedDoc': relatedDoc,
      'isRead': isRead,
      'creationTime': creationTime,
      'isDelete': isDelete,
      'company': company,
      'isDuty': isDuty,
      'fullDescription': fullDescription,
      'workplace': workplace,
      'image': image,
      'isAccept': isAccept,
      'triggeredUser': triggeredUser,
      'messageType': messageType,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.content == e2?.content &&
        e1?.relatedDoc == e2?.relatedDoc &&
        e1?.isRead == e2?.isRead &&
        e1?.creationTime == e2?.creationTime &&
        e1?.isDelete == e2?.isDelete &&
        e1?.company == e2?.company &&
        e1?.isDuty == e2?.isDuty &&
        e1?.fullDescription == e2?.fullDescription &&
        e1?.workplace == e2?.workplace &&
        e1?.image == e2?.image &&
        e1?.isAccept == e2?.isAccept &&
        e1?.triggeredUser == e2?.triggeredUser &&
        e1?.messageType == e2?.messageType;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.content,
        e?.relatedDoc,
        e?.isRead,
        e?.creationTime,
        e?.isDelete,
        e?.company,
        e?.isDuty,
        e?.fullDescription,
        e?.workplace,
        e?.image,
        e?.isAccept,
        e?.triggeredUser,
        e?.messageType
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
