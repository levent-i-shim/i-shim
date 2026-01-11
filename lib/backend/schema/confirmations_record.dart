import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfirmationsRecord extends FirestoreRecord {
  ConfirmationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isAcccept" field.
  bool? _isAcccept;
  bool get isAcccept => _isAcccept ?? false;
  bool hasIsAcccept() => _isAcccept != null;

  // "isReject" field.
  bool? _isReject;
  bool get isReject => _isReject ?? false;
  bool hasIsReject() => _isReject != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _isAcccept = snapshotData['isAcccept'] as bool?;
    _isReject = snapshotData['isReject'] as bool?;
    _company = snapshotData['company'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('confirmations');

  static Stream<ConfirmationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfirmationsRecord.fromSnapshot(s));

  static Future<ConfirmationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfirmationsRecord.fromSnapshot(s));

  static ConfirmationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfirmationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfirmationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfirmationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfirmationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfirmationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfirmationsRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  DateTime? date,
  bool? isAcccept,
  bool? isReject,
  DocumentReference? company,
  String? name,
  bool? isDelete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'date': date,
      'isAcccept': isAcccept,
      'isReject': isReject,
      'company': company,
      'name': name,
      'isDelete': isDelete,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfirmationsRecordDocumentEquality
    implements Equality<ConfirmationsRecord> {
  const ConfirmationsRecordDocumentEquality();

  @override
  bool equals(ConfirmationsRecord? e1, ConfirmationsRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.date == e2?.date &&
        e1?.isAcccept == e2?.isAcccept &&
        e1?.isReject == e2?.isReject &&
        e1?.company == e2?.company &&
        e1?.name == e2?.name &&
        e1?.isDelete == e2?.isDelete;
  }

  @override
  int hash(ConfirmationsRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.date,
        e?.isAcccept,
        e?.isReject,
        e?.company,
        e?.name,
        e?.isDelete
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfirmationsRecord;
}
