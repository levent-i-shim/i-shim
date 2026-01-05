import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DutyStepsForCompanyRecord extends FirestoreRecord {
  DutyStepsForCompanyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "duty" field.
  DocumentReference? _duty;
  DocumentReference? get duty => _duty;
  bool hasDuty() => _duty != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "step01Name" field.
  String? _step01Name;
  String get step01Name => _step01Name ?? '';
  bool hasStep01Name() => _step01Name != null;

  // "step01Value1" field.
  double? _step01Value1;
  double get step01Value1 => _step01Value1 ?? 0.0;
  bool hasStep01Value1() => _step01Value1 != null;

  // "step01Value2" field.
  double? _step01Value2;
  double get step01Value2 => _step01Value2 ?? 0.0;
  bool hasStep01Value2() => _step01Value2 != null;

  // "step01Note1" field.
  String? _step01Note1;
  String get step01Note1 => _step01Note1 ?? '';
  bool hasStep01Note1() => _step01Note1 != null;

  // "stepTaskDuty" field.
  DocumentReference? _stepTaskDuty;
  DocumentReference? get stepTaskDuty => _stepTaskDuty;
  bool hasStepTaskDuty() => _stepTaskDuty != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _duty = snapshotData['duty'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _step01Name = snapshotData['step01Name'] as String?;
    _step01Value1 = castToType<double>(snapshotData['step01Value1']);
    _step01Value2 = castToType<double>(snapshotData['step01Value2']);
    _step01Note1 = snapshotData['step01Note1'] as String?;
    _stepTaskDuty = snapshotData['stepTaskDuty'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dutyStepsForCompany')
          : FirebaseFirestore.instance.collectionGroup('dutyStepsForCompany');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dutyStepsForCompany').doc(id);

  static Stream<DutyStepsForCompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DutyStepsForCompanyRecord.fromSnapshot(s));

  static Future<DutyStepsForCompanyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DutyStepsForCompanyRecord.fromSnapshot(s));

  static DutyStepsForCompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DutyStepsForCompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DutyStepsForCompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DutyStepsForCompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DutyStepsForCompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DutyStepsForCompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDutyStepsForCompanyRecordData({
  DocumentReference? duty,
  DocumentReference? userRef,
  String? step01Name,
  double? step01Value1,
  double? step01Value2,
  String? step01Note1,
  DocumentReference? stepTaskDuty,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'duty': duty,
      'userRef': userRef,
      'step01Name': step01Name,
      'step01Value1': step01Value1,
      'step01Value2': step01Value2,
      'step01Note1': step01Note1,
      'stepTaskDuty': stepTaskDuty,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class DutyStepsForCompanyRecordDocumentEquality
    implements Equality<DutyStepsForCompanyRecord> {
  const DutyStepsForCompanyRecordDocumentEquality();

  @override
  bool equals(DutyStepsForCompanyRecord? e1, DutyStepsForCompanyRecord? e2) {
    return e1?.duty == e2?.duty &&
        e1?.userRef == e2?.userRef &&
        e1?.step01Name == e2?.step01Name &&
        e1?.step01Value1 == e2?.step01Value1 &&
        e1?.step01Value2 == e2?.step01Value2 &&
        e1?.step01Note1 == e2?.step01Note1 &&
        e1?.stepTaskDuty == e2?.stepTaskDuty &&
        e1?.image == e2?.image;
  }

  @override
  int hash(DutyStepsForCompanyRecord? e) => const ListEquality().hash([
        e?.duty,
        e?.userRef,
        e?.step01Name,
        e?.step01Value1,
        e?.step01Value2,
        e?.step01Note1,
        e?.stepTaskDuty,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is DutyStepsForCompanyRecord;
}
