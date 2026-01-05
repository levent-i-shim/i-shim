import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyNotificationsRecord extends FirestoreRecord {
  CompanyNotificationsRecord._(
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

  // "currentAccount" field.
  DocumentReference? _currentAccount;
  DocumentReference? get currentAccount => _currentAccount;
  bool hasCurrentAccount() => _currentAccount != null;

  // "currentAccountBill" field.
  DocumentReference? _currentAccountBill;
  DocumentReference? get currentAccountBill => _currentAccountBill;
  bool hasCurrentAccountBill() => _currentAccountBill != null;

  // "fullDescription" field.
  String? _fullDescription;
  String get fullDescription => _fullDescription ?? '';
  bool hasFullDescription() => _fullDescription != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "triggeredBy" field.
  DocumentReference? _triggeredBy;
  DocumentReference? get triggeredBy => _triggeredBy;
  bool hasTriggeredBy() => _triggeredBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _content = snapshotData['content'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _company = snapshotData['company'] as DocumentReference?;
    _currentAccount = snapshotData['currentAccount'] as DocumentReference?;
    _currentAccountBill =
        snapshotData['currentAccountBill'] as DocumentReference?;
    _fullDescription = snapshotData['fullDescription'] as String?;
    _image = snapshotData['image'] as String?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isReject = snapshotData['isReject'] as bool?;
    _triggeredBy = snapshotData['triggeredBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyNotifications')
          : FirebaseFirestore.instance.collectionGroup('companyNotifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyNotifications').doc(id);

  static Stream<CompanyNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyNotificationsRecord.fromSnapshot(s));

  static Future<CompanyNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompanyNotificationsRecord.fromSnapshot(s));

  static CompanyNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyNotificationsRecordData({
  String? type,
  String? content,
  bool? isRead,
  DateTime? creationTime,
  bool? isDelete,
  DocumentReference? company,
  DocumentReference? currentAccount,
  DocumentReference? currentAccountBill,
  String? fullDescription,
  String? image,
  bool? isAccept,
  bool? isReject,
  DocumentReference? triggeredBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'content': content,
      'isRead': isRead,
      'creationTime': creationTime,
      'isDelete': isDelete,
      'company': company,
      'currentAccount': currentAccount,
      'currentAccountBill': currentAccountBill,
      'fullDescription': fullDescription,
      'image': image,
      'isAccept': isAccept,
      'isReject': isReject,
      'triggeredBy': triggeredBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyNotificationsRecordDocumentEquality
    implements Equality<CompanyNotificationsRecord> {
  const CompanyNotificationsRecordDocumentEquality();

  @override
  bool equals(CompanyNotificationsRecord? e1, CompanyNotificationsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.content == e2?.content &&
        e1?.isRead == e2?.isRead &&
        e1?.creationTime == e2?.creationTime &&
        e1?.isDelete == e2?.isDelete &&
        e1?.company == e2?.company &&
        e1?.currentAccount == e2?.currentAccount &&
        e1?.currentAccountBill == e2?.currentAccountBill &&
        e1?.fullDescription == e2?.fullDescription &&
        e1?.image == e2?.image &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isReject == e2?.isReject &&
        e1?.triggeredBy == e2?.triggeredBy;
  }

  @override
  int hash(CompanyNotificationsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.content,
        e?.isRead,
        e?.creationTime,
        e?.isDelete,
        e?.company,
        e?.currentAccount,
        e?.currentAccountBill,
        e?.fullDescription,
        e?.image,
        e?.isAccept,
        e?.isReject,
        e?.triggeredBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyNotificationsRecord;
}
