import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyVehiclesRecord extends FirestoreRecord {
  CompanyVehiclesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "plate" field.
  String? _plate;
  String get plate => _plate ?? '';
  bool hasPlate() => _plate != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "totalPayment" field.
  double? _totalPayment;
  double get totalPayment => _totalPayment ?? 0.0;
  bool hasTotalPayment() => _totalPayment != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  // "workPlaceVehicles" field.
  DocumentReference? _workPlaceVehicles;
  DocumentReference? get workPlaceVehicles => _workPlaceVehicles;
  bool hasWorkPlaceVehicles() => _workPlaceVehicles != null;

  // "plate2" field.
  String? _plate2;
  String get plate2 => _plate2 ?? '';
  bool hasPlate2() => _plate2 != null;

  // "workingHours" field.
  double? _workingHours;
  double get workingHours => _workingHours ?? 0.0;
  bool hasWorkingHours() => _workingHours != null;

  // "litersPerKm" field.
  double? _litersPerKm;
  double get litersPerKm => _litersPerKm ?? 0.0;
  bool hasLitersPerKm() => _litersPerKm != null;

  // "litersPerHour" field.
  double? _litersPerHour;
  double get litersPerHour => _litersPerHour ?? 0.0;
  bool hasLitersPerHour() => _litersPerHour != null;

  // "km" field.
  double? _km;
  double get km => _km ?? 0.0;
  bool hasKm() => _km != null;

  // "averageLitersPerKm" field.
  double? _averageLitersPerKm;
  double get averageLitersPerKm => _averageLitersPerKm ?? 0.0;
  bool hasAverageLitersPerKm() => _averageLitersPerKm != null;

  // "averageLitersPerHour" field.
  double? _averageLitersPerHour;
  double get averageLitersPerHour => _averageLitersPerHour ?? 0.0;
  bool hasAverageLitersPerHour() => _averageLitersPerHour != null;

  // "averageCounter" field.
  int? _averageCounter;
  int get averageCounter => _averageCounter ?? 0;
  bool hasAverageCounter() => _averageCounter != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _plate = snapshotData['plate'] as String?;
    _brand = snapshotData['brand'] as String?;
    _model = snapshotData['model'] as String?;
    _year = snapshotData['year'] as String?;
    _totalPayment = castToType<double>(snapshotData['totalPayment']);
    _time = snapshotData['time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
    _workPlaceVehicles =
        snapshotData['workPlaceVehicles'] as DocumentReference?;
    _plate2 = snapshotData['plate2'] as String?;
    _workingHours = castToType<double>(snapshotData['workingHours']);
    _litersPerKm = castToType<double>(snapshotData['litersPerKm']);
    _litersPerHour = castToType<double>(snapshotData['litersPerHour']);
    _km = castToType<double>(snapshotData['km']);
    _averageLitersPerKm =
        castToType<double>(snapshotData['averageLitersPerKm']);
    _averageLitersPerHour =
        castToType<double>(snapshotData['averageLitersPerHour']);
    _averageCounter = castToType<int>(snapshotData['averageCounter']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyVehicles')
          : FirebaseFirestore.instance.collectionGroup('companyVehicles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyVehicles').doc(id);

  static Stream<CompanyVehiclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyVehiclesRecord.fromSnapshot(s));

  static Future<CompanyVehiclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyVehiclesRecord.fromSnapshot(s));

  static CompanyVehiclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyVehiclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyVehiclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyVehiclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyVehiclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyVehiclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyVehiclesRecordData({
  String? plate,
  String? brand,
  String? model,
  String? year,
  double? totalPayment,
  DateTime? time,
  String? type,
  DocumentReference? workPlace,
  DocumentReference? workPlaceVehicles,
  String? plate2,
  double? workingHours,
  double? litersPerKm,
  double? litersPerHour,
  double? km,
  double? averageLitersPerKm,
  double? averageLitersPerHour,
  int? averageCounter,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plate': plate,
      'brand': brand,
      'model': model,
      'year': year,
      'totalPayment': totalPayment,
      'time': time,
      'type': type,
      'workPlace': workPlace,
      'workPlaceVehicles': workPlaceVehicles,
      'plate2': plate2,
      'workingHours': workingHours,
      'litersPerKm': litersPerKm,
      'litersPerHour': litersPerHour,
      'km': km,
      'averageLitersPerKm': averageLitersPerKm,
      'averageLitersPerHour': averageLitersPerHour,
      'averageCounter': averageCounter,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyVehiclesRecordDocumentEquality
    implements Equality<CompanyVehiclesRecord> {
  const CompanyVehiclesRecordDocumentEquality();

  @override
  bool equals(CompanyVehiclesRecord? e1, CompanyVehiclesRecord? e2) {
    return e1?.plate == e2?.plate &&
        e1?.brand == e2?.brand &&
        e1?.model == e2?.model &&
        e1?.year == e2?.year &&
        e1?.totalPayment == e2?.totalPayment &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.workPlace == e2?.workPlace &&
        e1?.workPlaceVehicles == e2?.workPlaceVehicles &&
        e1?.plate2 == e2?.plate2 &&
        e1?.workingHours == e2?.workingHours &&
        e1?.litersPerKm == e2?.litersPerKm &&
        e1?.litersPerHour == e2?.litersPerHour &&
        e1?.km == e2?.km &&
        e1?.averageLitersPerKm == e2?.averageLitersPerKm &&
        e1?.averageLitersPerHour == e2?.averageLitersPerHour &&
        e1?.averageCounter == e2?.averageCounter &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(CompanyVehiclesRecord? e) => const ListEquality().hash([
        e?.plate,
        e?.brand,
        e?.model,
        e?.year,
        e?.totalPayment,
        e?.time,
        e?.type,
        e?.workPlace,
        e?.workPlaceVehicles,
        e?.plate2,
        e?.workingHours,
        e?.litersPerKm,
        e?.litersPerHour,
        e?.km,
        e?.averageLitersPerKm,
        e?.averageLitersPerHour,
        e?.averageCounter,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyVehiclesRecord;
}
