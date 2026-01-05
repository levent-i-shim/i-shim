import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentAccountActivityRecord extends FirestoreRecord {
  CurrentAccountActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "purchasedGood" field.
  String? _purchasedGood;
  String get purchasedGood => _purchasedGood ?? '';
  bool hasPurchasedGood() => _purchasedGood != null;

  // "purchaseType" field.
  String? _purchaseType;
  String get purchaseType => _purchaseType ?? '';
  bool hasPurchaseType() => _purchaseType != null;

  // "purchaseNote" field.
  String? _purchaseNote;
  String get purchaseNote => _purchaseNote ?? '';
  bool hasPurchaseNote() => _purchaseNote != null;

  // "purchaseImage" field.
  String? _purchaseImage;
  String get purchaseImage => _purchaseImage ?? '';
  bool hasPurchaseImage() => _purchaseImage != null;

  // "isThisActivityBilled" field.
  bool? _isThisActivityBilled;
  bool get isThisActivityBilled => _isThisActivityBilled ?? false;
  bool hasIsThisActivityBilled() => _isThisActivityBilled != null;

  // "purchaseDefinition" field.
  String? _purchaseDefinition;
  String get purchaseDefinition => _purchaseDefinition ?? '';
  bool hasPurchaseDefinition() => _purchaseDefinition != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "valuePerUnit" field.
  double? _valuePerUnit;
  double get valuePerUnit => _valuePerUnit ?? 0.0;
  bool hasValuePerUnit() => _valuePerUnit != null;

  // "activityValue" field.
  double? _activityValue;
  double get activityValue => _activityValue ?? 0.0;
  bool hasActivityValue() => _activityValue != null;

  // "kdv" field.
  double? _kdv;
  double get kdv => _kdv ?? 0.0;
  bool hasKdv() => _kdv != null;

  // "tevkifat" field.
  double? _tevkifat;
  double get tevkifat => _tevkifat ?? 0.0;
  bool hasTevkifat() => _tevkifat != null;

  // "authorizedUsersToMonitor" field.
  List<DocumentReference>? _authorizedUsersToMonitor;
  List<DocumentReference> get authorizedUsersToMonitor =>
      _authorizedUsersToMonitor ?? const [];
  bool hasAuthorizedUsersToMonitor() => _authorizedUsersToMonitor != null;

  // "authorizedUsersToModify" field.
  List<DocumentReference>? _authorizedUsersToModify;
  List<DocumentReference> get authorizedUsersToModify =>
      _authorizedUsersToModify ?? const [];
  bool hasAuthorizedUsersToModify() => _authorizedUsersToModify != null;

  // "creatorUser" field.
  DocumentReference? _creatorUser;
  DocumentReference? get creatorUser => _creatorUser;
  bool hasCreatorUser() => _creatorUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _purchasedGood = snapshotData['purchasedGood'] as String?;
    _purchaseType = snapshotData['purchaseType'] as String?;
    _purchaseNote = snapshotData['purchaseNote'] as String?;
    _purchaseImage = snapshotData['purchaseImage'] as String?;
    _isThisActivityBilled = snapshotData['isThisActivityBilled'] as bool?;
    _purchaseDefinition = snapshotData['purchaseDefinition'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _unit = snapshotData['unit'] as String?;
    _valuePerUnit = castToType<double>(snapshotData['valuePerUnit']);
    _activityValue = castToType<double>(snapshotData['activityValue']);
    _kdv = castToType<double>(snapshotData['kdv']);
    _tevkifat = castToType<double>(snapshotData['tevkifat']);
    _authorizedUsersToMonitor =
        getDataList(snapshotData['authorizedUsersToMonitor']);
    _authorizedUsersToModify =
        getDataList(snapshotData['authorizedUsersToModify']);
    _creatorUser = snapshotData['creatorUser'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('currentAccountActivity')
          : FirebaseFirestore.instance
              .collectionGroup('currentAccountActivity');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('currentAccountActivity').doc(id);

  static Stream<CurrentAccountActivityRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentAccountActivityRecord.fromSnapshot(s));

  static Future<CurrentAccountActivityRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CurrentAccountActivityRecord.fromSnapshot(s));

  static CurrentAccountActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentAccountActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentAccountActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentAccountActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentAccountActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentAccountActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentAccountActivityRecordData({
  String? purchasedGood,
  String? purchaseType,
  String? purchaseNote,
  String? purchaseImage,
  bool? isThisActivityBilled,
  String? purchaseDefinition,
  double? quantity,
  String? unit,
  double? valuePerUnit,
  double? activityValue,
  double? kdv,
  double? tevkifat,
  DocumentReference? creatorUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'purchasedGood': purchasedGood,
      'purchaseType': purchaseType,
      'purchaseNote': purchaseNote,
      'purchaseImage': purchaseImage,
      'isThisActivityBilled': isThisActivityBilled,
      'purchaseDefinition': purchaseDefinition,
      'quantity': quantity,
      'unit': unit,
      'valuePerUnit': valuePerUnit,
      'activityValue': activityValue,
      'kdv': kdv,
      'tevkifat': tevkifat,
      'creatorUser': creatorUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurrentAccountActivityRecordDocumentEquality
    implements Equality<CurrentAccountActivityRecord> {
  const CurrentAccountActivityRecordDocumentEquality();

  @override
  bool equals(
      CurrentAccountActivityRecord? e1, CurrentAccountActivityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.purchasedGood == e2?.purchasedGood &&
        e1?.purchaseType == e2?.purchaseType &&
        e1?.purchaseNote == e2?.purchaseNote &&
        e1?.purchaseImage == e2?.purchaseImage &&
        e1?.isThisActivityBilled == e2?.isThisActivityBilled &&
        e1?.purchaseDefinition == e2?.purchaseDefinition &&
        e1?.quantity == e2?.quantity &&
        e1?.unit == e2?.unit &&
        e1?.valuePerUnit == e2?.valuePerUnit &&
        e1?.activityValue == e2?.activityValue &&
        e1?.kdv == e2?.kdv &&
        e1?.tevkifat == e2?.tevkifat &&
        listEquality.equals(
            e1?.authorizedUsersToMonitor, e2?.authorizedUsersToMonitor) &&
        listEquality.equals(
            e1?.authorizedUsersToModify, e2?.authorizedUsersToModify) &&
        e1?.creatorUser == e2?.creatorUser;
  }

  @override
  int hash(CurrentAccountActivityRecord? e) => const ListEquality().hash([
        e?.purchasedGood,
        e?.purchaseType,
        e?.purchaseNote,
        e?.purchaseImage,
        e?.isThisActivityBilled,
        e?.purchaseDefinition,
        e?.quantity,
        e?.unit,
        e?.valuePerUnit,
        e?.activityValue,
        e?.kdv,
        e?.tevkifat,
        e?.authorizedUsersToMonitor,
        e?.authorizedUsersToModify,
        e?.creatorUser
      ]);

  @override
  bool isValidKey(Object? o) => o is CurrentAccountActivityRecord;
}
