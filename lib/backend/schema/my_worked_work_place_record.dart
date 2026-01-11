import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyWorkedWorkPlaceRecord extends FirestoreRecord {
  MyWorkedWorkPlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "isWorking" field.
  bool? _isWorking;
  bool get isWorking => _isWorking ?? false;
  bool hasIsWorking() => _isWorking != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "copmanyName" field.
  String? _copmanyName;
  String get copmanyName => _copmanyName ?? '';
  bool hasCopmanyName() => _copmanyName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  bool hasSalary() => _salary != null;

  // "workPlaceIds" field.
  List<DocumentReference>? _workPlaceIds;
  List<DocumentReference> get workPlaceIds => _workPlaceIds ?? const [];
  bool hasWorkPlaceIds() => _workPlaceIds != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _company = snapshotData['company'] as DocumentReference?;
    _isWorking = snapshotData['isWorking'] as bool?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _copmanyName = snapshotData['copmanyName'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _salary = castToType<double>(snapshotData['salary']);
    _workPlaceIds = getDataList(snapshotData['workPlaceIds']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myWorkedWorkPlace')
          : FirebaseFirestore.instance.collectionGroup('myWorkedWorkPlace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('myWorkedWorkPlace').doc(id);

  static Stream<MyWorkedWorkPlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyWorkedWorkPlaceRecord.fromSnapshot(s));

  static Future<MyWorkedWorkPlaceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MyWorkedWorkPlaceRecord.fromSnapshot(s));

  static MyWorkedWorkPlaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyWorkedWorkPlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyWorkedWorkPlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyWorkedWorkPlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyWorkedWorkPlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyWorkedWorkPlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyWorkedWorkPlaceRecordData({
  DocumentReference? company,
  bool? isWorking,
  bool? isDelete,
  String? copmanyName,
  DateTime? date,
  double? salary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'isWorking': isWorking,
      'isDelete': isDelete,
      'copmanyName': copmanyName,
      'date': date,
      'salary': salary,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyWorkedWorkPlaceRecordDocumentEquality
    implements Equality<MyWorkedWorkPlaceRecord> {
  const MyWorkedWorkPlaceRecordDocumentEquality();

  @override
  bool equals(MyWorkedWorkPlaceRecord? e1, MyWorkedWorkPlaceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.company == e2?.company &&
        e1?.isWorking == e2?.isWorking &&
        e1?.isDelete == e2?.isDelete &&
        e1?.copmanyName == e2?.copmanyName &&
        e1?.date == e2?.date &&
        e1?.salary == e2?.salary &&
        listEquality.equals(e1?.workPlaceIds, e2?.workPlaceIds);
  }

  @override
  int hash(MyWorkedWorkPlaceRecord? e) => const ListEquality().hash([
        e?.company,
        e?.isWorking,
        e?.isDelete,
        e?.copmanyName,
        e?.date,
        e?.salary,
        e?.workPlaceIds
      ]);

  @override
  bool isValidKey(Object? o) => o is MyWorkedWorkPlaceRecord;
}
