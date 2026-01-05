import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlaceIncomes2025Record extends FirestoreRecord {
  WorkPlaceIncomes2025Record._(
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

  // "fromWhom" field.
  String? _fromWhom;
  String get fromWhom => _fromWhom ?? '';
  bool hasFromWhom() => _fromWhom != null;

  // "vkntcknor" field.
  String? _vkntcknor;
  String get vkntcknor => _vkntcknor ?? '';
  bool hasVkntcknor() => _vkntcknor != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

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

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "incomePeriodTime" field.
  String? _incomePeriodTime;
  String get incomePeriodTime => _incomePeriodTime ?? '';
  bool hasIncomePeriodTime() => _incomePeriodTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _value = castToType<double>(snapshotData['value']);
    _date = snapshotData['date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _fromWhom = snapshotData['fromWhom'] as String?;
    _vkntcknor = snapshotData['vkntcknor'] as String?;
    _description = snapshotData['description'] as String?;
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _isExpected = snapshotData['isExpected'] as bool?;
    _expectedDate = snapshotData['expectedDate'] as DateTime?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _incomePeriodTime = snapshotData['incomePeriodTime'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlaceIncomes2025')
          : FirebaseFirestore.instance.collectionGroup('workPlaceIncomes2025');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlaceIncomes2025').doc(id);

  static Stream<WorkPlaceIncomes2025Record> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlaceIncomes2025Record.fromSnapshot(s));

  static Future<WorkPlaceIncomes2025Record> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlaceIncomes2025Record.fromSnapshot(s));

  static WorkPlaceIncomes2025Record fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlaceIncomes2025Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlaceIncomes2025Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlaceIncomes2025Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlaceIncomes2025Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlaceIncomes2025Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlaceIncomes2025RecordData({
  double? value,
  DateTime? date,
  String? type,
  String? fromWhom,
  String? vkntcknor,
  String? description,
  DocumentReference? billRef,
  bool? isExpected,
  DateTime? expectedDate,
  bool? isDelete,
  String? incomePeriodTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'value': value,
      'date': date,
      'type': type,
      'fromWhom': fromWhom,
      'vkntcknor': vkntcknor,
      'description': description,
      'billRef': billRef,
      'isExpected': isExpected,
      'expectedDate': expectedDate,
      'isDelete': isDelete,
      'incomePeriodTime': incomePeriodTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlaceIncomes2025RecordDocumentEquality
    implements Equality<WorkPlaceIncomes2025Record> {
  const WorkPlaceIncomes2025RecordDocumentEquality();

  @override
  bool equals(WorkPlaceIncomes2025Record? e1, WorkPlaceIncomes2025Record? e2) {
    return e1?.value == e2?.value &&
        e1?.date == e2?.date &&
        e1?.type == e2?.type &&
        e1?.fromWhom == e2?.fromWhom &&
        e1?.vkntcknor == e2?.vkntcknor &&
        e1?.description == e2?.description &&
        e1?.billRef == e2?.billRef &&
        e1?.isExpected == e2?.isExpected &&
        e1?.expectedDate == e2?.expectedDate &&
        e1?.isDelete == e2?.isDelete &&
        e1?.incomePeriodTime == e2?.incomePeriodTime;
  }

  @override
  int hash(WorkPlaceIncomes2025Record? e) => const ListEquality().hash([
        e?.value,
        e?.date,
        e?.type,
        e?.fromWhom,
        e?.vkntcknor,
        e?.description,
        e?.billRef,
        e?.isExpected,
        e?.expectedDate,
        e?.isDelete,
        e?.incomePeriodTime
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlaceIncomes2025Record;
}
