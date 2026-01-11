import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductFieldsRecord extends FirestoreRecord {
  ProductFieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "defaultKdv" field.
  double? _defaultKdv;
  double get defaultKdv => _defaultKdv ?? 0.0;
  bool hasDefaultKdv() => _defaultKdv != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _defaultKdv = castToType<double>(snapshotData['defaultKdv']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('productFields')
          : FirebaseFirestore.instance.collectionGroup('productFields');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('productFields').doc(id);

  static Stream<ProductFieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductFieldsRecord.fromSnapshot(s));

  static Future<ProductFieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductFieldsRecord.fromSnapshot(s));

  static ProductFieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductFieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductFieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductFieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductFieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductFieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductFieldsRecordData({
  String? name,
  bool? isDelete,
  double? defaultKdv,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isDelete': isDelete,
      'defaultKdv': defaultKdv,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductFieldsRecordDocumentEquality
    implements Equality<ProductFieldsRecord> {
  const ProductFieldsRecordDocumentEquality();

  @override
  bool equals(ProductFieldsRecord? e1, ProductFieldsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isDelete == e2?.isDelete &&
        e1?.defaultKdv == e2?.defaultKdv;
  }

  @override
  int hash(ProductFieldsRecord? e) =>
      const ListEquality().hash([e?.name, e?.isDelete, e?.defaultKdv]);

  @override
  bool isValidKey(Object? o) => o is ProductFieldsRecord;
}
