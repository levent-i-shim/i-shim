import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceVehiclePaymentsRecord extends FirestoreRecord {
  WorkPlaceVehiclePaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isAccept" field.
  bool? _isAccept;
  bool get isAccept => _isAccept ?? false;
  bool hasIsAccept() => _isAccept != null;

  // "vehicle" field.
  DocumentReference? _vehicle;
  DocumentReference? get vehicle => _vehicle;
  bool hasVehicle() => _vehicle != null;

  // "createdByUser" field.
  DocumentReference? _createdByUser;
  DocumentReference? get createdByUser => _createdByUser;
  bool hasCreatedByUser() => _createdByUser != null;

  // "km" field.
  double? _km;
  double get km => _km ?? 0.0;
  bool hasKm() => _km != null;

  // "workingHour" field.
  double? _workingHour;
  double get workingHour => _workingHour ?? 0.0;
  bool hasWorkingHour() => _workingHour != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _image = snapshotData['image'] as String?;
    _isAccept = snapshotData['isAccept'] as bool?;
    _vehicle = snapshotData['vehicle'] as DocumentReference?;
    _createdByUser = snapshotData['createdByUser'] as DocumentReference?;
    _km = castToType<double>(snapshotData['km']);
    _workingHour = castToType<double>(snapshotData['workingHour']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceVehiclePayments')
          : FirebaseFirestore.instance
              .collectionGroup('workPlaceVehiclePayments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceVehiclePayments').doc(id);

  static Stream<WorkPlaceVehiclePaymentsRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => WorkPlaceVehiclePaymentsRecord.fromSnapshot(s));

  static Future<WorkPlaceVehiclePaymentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceVehiclePaymentsRecord.fromSnapshot(s));

  static WorkPlaceVehiclePaymentsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      WorkPlaceVehiclePaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceVehiclePaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceVehiclePaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceVehiclePaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceVehiclePaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceVehiclePaymentsRecordData({
  String? type,
  String? description,
  double? value,
  String? image,
  bool? isAccept,
  DocumentReference? vehicle,
  DocumentReference? createdByUser,
  double? km,
  double? workingHour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'description': description,
      'value': value,
      'image': image,
      'isAccept': isAccept,
      'vehicle': vehicle,
      'createdByUser': createdByUser,
      'km': km,
      'workingHour': workingHour,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceVehiclePaymentsRecordDocumentEquality
    implements Equality<WorkPlaceVehiclePaymentsRecord> {
  const WorkPlaceVehiclePaymentsRecordDocumentEquality();

  @override
  bool equals(
      WorkPlaceVehiclePaymentsRecord? e1, WorkPlaceVehiclePaymentsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.value == e2?.value &&
        e1?.image == e2?.image &&
        e1?.isAccept == e2?.isAccept &&
        e1?.vehicle == e2?.vehicle &&
        e1?.createdByUser == e2?.createdByUser &&
        e1?.km == e2?.km &&
        e1?.workingHour == e2?.workingHour;
  }

  @override
  int hash(WorkPlaceVehiclePaymentsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.description,
        e?.value,
        e?.image,
        e?.isAccept,
        e?.vehicle,
        e?.createdByUser,
        e?.km,
        e?.workingHour
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceVehiclePaymentsRecord;
}
