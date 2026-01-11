import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SocialNotificationRecord extends FirestoreRecord {
  SocialNotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "triggeredBy" field.
  DocumentReference? _triggeredBy;
  DocumentReference? get triggeredBy => _triggeredBy;
  bool hasTriggeredBy() => _triggeredBy != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _triggeredBy = snapshotData['triggeredBy'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _isRead = snapshotData['isRead'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('socialNotification')
          : FirebaseFirestore.instance.collectionGroup('socialNotification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('socialNotification').doc(id);

  static Stream<SocialNotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SocialNotificationRecord.fromSnapshot(s));

  static Future<SocialNotificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SocialNotificationRecord.fromSnapshot(s));

  static SocialNotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SocialNotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SocialNotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SocialNotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SocialNotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SocialNotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSocialNotificationRecordData({
  String? type,
  DocumentReference? triggeredBy,
  String? title,
  String? description,
  DateTime? date,
  bool? isRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'triggeredBy': triggeredBy,
      'title': title,
      'description': description,
      'date': date,
      'isRead': isRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class SocialNotificationRecordDocumentEquality
    implements Equality<SocialNotificationRecord> {
  const SocialNotificationRecordDocumentEquality();

  @override
  bool equals(SocialNotificationRecord? e1, SocialNotificationRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.triggeredBy == e2?.triggeredBy &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.isRead == e2?.isRead;
  }

  @override
  int hash(SocialNotificationRecord? e) => const ListEquality().hash(
      [e?.type, e?.triggeredBy, e?.title, e?.description, e?.date, e?.isRead]);

  @override
  bool isValidKey(Object? o) => o is SocialNotificationRecord;
}
