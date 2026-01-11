// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductCostDataTypeStruct extends FFFirebaseStruct {
  ProductCostDataTypeStruct({
    String? name,
    double? quantity,
    double? price,
    double? kdv,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _quantity = quantity,
        _price = price,
        _kdv = kdv,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "kdv" field.
  double? _kdv;
  double get kdv => _kdv ?? 0.0;
  set kdv(double? val) => _kdv = val;

  void incrementKdv(double amount) => kdv = kdv + amount;

  bool hasKdv() => _kdv != null;

  static ProductCostDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ProductCostDataTypeStruct(
        name: data['name'] as String?,
        quantity: castToType<double>(data['quantity']),
        price: castToType<double>(data['price']),
        kdv: castToType<double>(data['kdv']),
      );

  static ProductCostDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductCostDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'quantity': _quantity,
        'price': _price,
        'kdv': _kdv,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'kdv': serializeParam(
          _kdv,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductCostDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductCostDataTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        kdv: deserializeParam(
          data['kdv'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductCostDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductCostDataTypeStruct &&
        name == other.name &&
        quantity == other.quantity &&
        price == other.price &&
        kdv == other.kdv;
  }

  @override
  int get hashCode => const ListEquality().hash([name, quantity, price, kdv]);
}

ProductCostDataTypeStruct createProductCostDataTypeStruct({
  String? name,
  double? quantity,
  double? price,
  double? kdv,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductCostDataTypeStruct(
      name: name,
      quantity: quantity,
      price: price,
      kdv: kdv,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductCostDataTypeStruct? updateProductCostDataTypeStruct(
  ProductCostDataTypeStruct? productCostDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productCostDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductCostDataTypeStructData(
  Map<String, dynamic> firestoreData,
  ProductCostDataTypeStruct? productCostDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productCostDataType == null) {
    return;
  }
  if (productCostDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productCostDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productCostDataTypeData =
      getProductCostDataTypeFirestoreData(productCostDataType, forFieldValue);
  final nestedData =
      productCostDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productCostDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductCostDataTypeFirestoreData(
  ProductCostDataTypeStruct? productCostDataType, [
  bool forFieldValue = false,
]) {
  if (productCostDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productCostDataType.toMap());

  // Add any Firestore field values
  productCostDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductCostDataTypeListFirestoreData(
  List<ProductCostDataTypeStruct>? productCostDataTypes,
) =>
    productCostDataTypes
        ?.map((e) => getProductCostDataTypeFirestoreData(e, true))
        .toList() ??
    [];
