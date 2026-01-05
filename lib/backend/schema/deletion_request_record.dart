import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeletionRequestRecord extends FirestoreRecord {
  DeletionRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "calculation" field.
  DocumentReference? _calculation;
  DocumentReference? get calculation => _calculation;
  bool hasCalculation() => _calculation != null;

  // "parentProduct" field.
  DocumentReference? _parentProduct;
  DocumentReference? get parentProduct => _parentProduct;
  bool hasParentProduct() => _parentProduct != null;

  // "childProduct" field.
  DocumentReference? _childProduct;
  DocumentReference? get childProduct => _childProduct;
  bool hasChildProduct() => _childProduct != null;

  // "income" field.
  DocumentReference? _income;
  DocumentReference? get income => _income;
  bool hasIncome() => _income != null;

  // "payment" field.
  DocumentReference? _payment;
  DocumentReference? get payment => _payment;
  bool hasPayment() => _payment != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "triggeredUser" field.
  DocumentReference? _triggeredUser;
  DocumentReference? get triggeredUser => _triggeredUser;
  bool hasTriggeredUser() => _triggeredUser != null;

  // "isDeleteRequest" field.
  bool? _isDeleteRequest;
  bool get isDeleteRequest => _isDeleteRequest ?? false;
  bool hasIsDeleteRequest() => _isDeleteRequest != null;

  // "workPlace" field.
  DocumentReference? _workPlace;
  DocumentReference? get workPlace => _workPlace;
  bool hasWorkPlace() => _workPlace != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _calculation = snapshotData['calculation'] as DocumentReference?;
    _parentProduct = snapshotData['parentProduct'] as DocumentReference?;
    _childProduct = snapshotData['childProduct'] as DocumentReference?;
    _income = snapshotData['income'] as DocumentReference?;
    _payment = snapshotData['payment'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _triggeredUser = snapshotData['triggeredUser'] as DocumentReference?;
    _isDeleteRequest = snapshotData['isDeleteRequest'] as bool?;
    _workPlace = snapshotData['workPlace'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('deletionRequest')
          : FirebaseFirestore.instance.collectionGroup('deletionRequest');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('deletionRequest').doc(id);

  static Stream<DeletionRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeletionRequestRecord.fromSnapshot(s));

  static Future<DeletionRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeletionRequestRecord.fromSnapshot(s));

  static DeletionRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeletionRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeletionRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeletionRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeletionRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeletionRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeletionRequestRecordData({
  String? type,
  DocumentReference? calculation,
  DocumentReference? parentProduct,
  DocumentReference? childProduct,
  DocumentReference? income,
  DocumentReference? payment,
  String? description,
  DocumentReference? triggeredUser,
  bool? isDeleteRequest,
  DocumentReference? workPlace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'calculation': calculation,
      'parentProduct': parentProduct,
      'childProduct': childProduct,
      'income': income,
      'payment': payment,
      'description': description,
      'triggeredUser': triggeredUser,
      'isDeleteRequest': isDeleteRequest,
      'workPlace': workPlace,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeletionRequestRecordDocumentEquality
    implements Equality<DeletionRequestRecord> {
  const DeletionRequestRecordDocumentEquality();

  @override
  bool equals(DeletionRequestRecord? e1, DeletionRequestRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.calculation == e2?.calculation &&
        e1?.parentProduct == e2?.parentProduct &&
        e1?.childProduct == e2?.childProduct &&
        e1?.income == e2?.income &&
        e1?.payment == e2?.payment &&
        e1?.description == e2?.description &&
        e1?.triggeredUser == e2?.triggeredUser &&
        e1?.isDeleteRequest == e2?.isDeleteRequest &&
        e1?.workPlace == e2?.workPlace;
  }

  @override
  int hash(DeletionRequestRecord? e) => const ListEquality().hash([
        e?.type,
        e?.calculation,
        e?.parentProduct,
        e?.childProduct,
        e?.income,
        e?.payment,
        e?.description,
        e?.triggeredUser,
        e?.isDeleteRequest,
        e?.workPlace
      ]);

  @override
  bool isValidKey(Object? o) => o is DeletionRequestRecord;
}
