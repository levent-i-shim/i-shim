import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstructionsRecord extends FirestoreRecord {
  InstructionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "amISender" field.
  bool? _amISender;
  bool get amISender => _amISender ?? false;
  bool hasAmISender() => _amISender != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _company = snapshotData['company'] as DocumentReference?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _amISender = snapshotData['amISender'] as bool?;
    _id = snapshotData['id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('instructions')
          : FirebaseFirestore.instance.collectionGroup('instructions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('instructions').doc(id);

  static Stream<InstructionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstructionsRecord.fromSnapshot(s));

  static Future<InstructionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstructionsRecord.fromSnapshot(s));

  static InstructionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstructionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstructionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstructionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstructionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstructionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstructionsRecordData({
  String? description,
  DocumentReference? company,
  DateTime? creationTime,
  DocumentReference? workPlace,
  bool? amISender,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'company': company,
      'creationTime': creationTime,
      'workPlace': workPlace,
      'amISender': amISender,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstructionsRecordDocumentEquality
    implements Equality<InstructionsRecord> {
  const InstructionsRecordDocumentEquality();

  @override
  bool equals(InstructionsRecord? e1, InstructionsRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.company == e2?.company &&
        e1?.creationTime == e2?.creationTime &&
        e1?.workPlace == e2?.workPlace &&
        e1?.amISender == e2?.amISender &&
        e1?.id == e2?.id;
  }

  @override
  int hash(InstructionsRecord? e) => const ListEquality().hash([
        e?.description,
        e?.company,
        e?.creationTime,
        e?.workPlace,
        e?.amISender,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is InstructionsRecord;
}
