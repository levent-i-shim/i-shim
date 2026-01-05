import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPaymentRecord extends FirestoreRecord {
  UserPaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "billRef" field.
  DocumentReference? _billRef;
  DocumentReference? get billRef => _billRef;
  bool hasBillRef() => _billRef != null;

  // "isExpected" field.
  bool? _isExpected;
  bool get isExpected => _isExpected ?? false;
  bool hasIsExpected() => _isExpected != null;

  // "expectedDate" field.
  DateTime? _expectedDate;
  DateTime? get expectedDate => _expectedDate;
  bool hasExpectedDate() => _expectedDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _isExpected = snapshotData['isExpected'] as bool?;
    _expectedDate = snapshotData['expectedDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userPayment')
          : FirebaseFirestore.instance.collectionGroup('userPayment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userPayment').doc(id);

  static Stream<UserPaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPaymentRecord.fromSnapshot(s));

  static Future<UserPaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPaymentRecord.fromSnapshot(s));

  static UserPaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPaymentRecordData({
  double? value,
  DateTime? date,
  String? type,
  DocumentReference? billRef,
  bool? isExpected,
  DateTime? expectedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'date': date,
      'type': type,
      'billRef': billRef,
      'isExpected': isExpected,
      'expectedDate': expectedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPaymentRecordDocumentEquality implements Equality<UserPaymentRecord> {
  const UserPaymentRecordDocumentEquality();

  @override
  bool equals(UserPaymentRecord? e1, UserPaymentRecord? e2) {
    return e1?.value == e2?.value &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.billRef == e2?.billRef &&
        e1?.isExpected == e2?.isExpected &&
        e1?.expectedDate == e2?.expectedDate;
  }

  @override
  int hash(UserPaymentRecord? e) => const ListEquality().hash(
      [e?.value, e?.date, e?.type, e?.billRef, e?.isExpected, e?.expectedDate]);

  @override
  bool isValidKey(Object? o) => o is UserPaymentRecord;
}
