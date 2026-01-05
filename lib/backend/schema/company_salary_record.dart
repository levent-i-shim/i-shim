import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanySalaryRecord extends FirestoreRecord {
  CompanySalaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "toWhom" field.
  String? _toWhom;
  String get toWhom => _toWhom ?? '';
  bool hasToWhom() => _toWhom != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceSalary" field.
  DocumentReference? _workPlaceSalary;
  DocumentReference? get workPlaceSalary => _workPlaceSalary;
  bool hasWorkPlaceSalary() => _workPlaceSalary != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _toWhom = snapshotData['toWhom'] as String?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceSalary = snapshotData['workPlaceSalary'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _value = castToType<double>(snapshotData['value']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companySalary')
          : FirebaseFirestore.instance.collectionGroup('companySalary');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companySalary').doc(id);

  static Stream<CompanySalaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanySalaryRecord.fromSnapshot(s));

  static Future<CompanySalaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanySalaryRecord.fromSnapshot(s));

  static CompanySalaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanySalaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanySalaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanySalaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanySalaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanySalaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanySalaryRecordData({
  DateTime? date,
  String? type,
  bool? isDelete,
  String? toWhom,
  DocumentReference? workPlace,
  DocumentReference? workPlaceSalary,
  String? description,
  double? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'type': type,
      'isDelete': isDelete,
      'toWhom': toWhom,
      'workPlace': workPlace,
      'workPlaceSalary': workPlaceSalary,
      'description': description,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanySalaryRecordDocumentEquality
    implements Equality<CompanySalaryRecord> {
  const CompanySalaryRecordDocumentEquality();

  @override
  bool equals(CompanySalaryRecord? e1, CompanySalaryRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.isDelete == e2?.isDelete &&
        e1?.toWhom == e2?.toWhom &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceSalary == e2?.workPlaceSalary &&
        e1?.description == e2?.description &&
        e1?.value == e2?.value;
  }

  @override
  int hash(CompanySalaryRecord? e) => const ListEquality().hash([
        e?.date,
        e?.type,
        e?.isDelete,
        e?.toWhom,
        e?.workPlace,
        e?.workPlaceSalary,
        e?.description,
        e?.value
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanySalaryRecord;
}
