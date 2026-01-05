import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnershipInvitationRecord extends FirestoreRecord {
  PartnershipInvitationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isCompanyPartnership" field.
  bool? _isCompanyPartnership;
  bool get isCompanyPartnership => _isCompanyPartnership ?? false;
  bool hasIsCompanyPartnership() => _isCompanyPartnership != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "workPlaceName" field.
  String? _workPlaceName;
  String get workPlaceName => _workPlaceName ?? '';
  bool hasWorkPlaceName() => _workPlaceName != null;

  // "sharePercent" field.
  double? _sharePercent;
  double get sharePercent => _sharePercent ?? 0.0;
  bool hasSharePercent() => _sharePercent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isCompanyPartnership = snapshotData['isCompanyPartnership'] as bool?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _isReject = snapshotData['isReject'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _company = snapshotData['company'] as DocumentReference?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _companyName = snapshotData['companyName'] as String?;
    _workPlaceName = snapshotData['workPlaceName'] as String?;
    _sharePercent = castToType<double>(snapshotData['sharePercent']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('partnershipInvitation')
          : FirebaseFirestore.instance.collectionGroup('partnershipInvitation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('partnershipInvitation').doc(id);

  static Stream<PartnershipInvitationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PartnershipInvitationRecord.fromSnapshot(s));

  static Future<PartnershipInvitationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PartnershipInvitationRecord.fromSnapshot(s));

  static PartnershipInvitationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartnershipInvitationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartnershipInvitationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartnershipInvitationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartnershipInvitationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartnershipInvitationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartnershipInvitationRecordData({
  bool? isCompanyPartnership,
  bool? isAccept,
  bool? isReject,
  DateTime? date,
  DocumentReference? company,
  DocumentReference? workPlace,
  bool? isDelete,
  DocumentReference? sender,
  DocumentReference? receiver,
  String? companyName,
  String? workPlaceName,
  double? sharePercent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isCompanyPartnership': isCompanyPartnership,
      'isAccept': isAccept,
      'isReject': isReject,
      'date': date,
      'company': company,
      'workPlace': workPlace,
      'isDelete': isDelete,
      'sender': sender,
      'receiver': receiver,
      'companyName': companyName,
      'workPlaceName': workPlaceName,
      'sharePercent': sharePercent,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartnershipInvitationRecordDocumentEquality
    implements Equality<PartnershipInvitationRecord> {
  const PartnershipInvitationRecordDocumentEquality();

  @override
  bool equals(
      PartnershipInvitationRecord? e1, PartnershipInvitationRecord? e2) {
    return e1?.isCompanyPartnership == e2?.isCompanyPartnership &&
        e1?.isAccept == e2?.isAccept &&
        e1?.isReject == e2?.isReject &&
        e1?.date == e2?.date &&
        e1?.company == e2?.company &&
        e1?.workPlace == e2?.workPlace &&
        e1?.isDelete == e2?.isDelete &&
        e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.companyName == e2?.companyName &&
        e1?.workPlaceName == e2?.workPlaceName &&
        e1?.sharePercent == e2?.sharePercent;
  }

  @override
  int hash(PartnershipInvitationRecord? e) => const ListEquality().hash([
        e?.isCompanyPartnership,
        e?.isAccept,
        e?.isReject,
        e?.date,
        e?.company,
        e?.workPlace,
        e?.isDelete,
        e?.sender,
        e?.receiver,
        e?.companyName,
        e?.workPlaceName,
        e?.sharePercent
      ]);

  @override
  bool isValidKey(Object? o) => o is PartnershipInvitationRecord;
}
