// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCalculationForm extends StatefulWidget {
  final DocumentReference product;
  final DocumentReference parentProduct;
  final double parentTotalCost;
  final double parentTotalQuantity;
  final double totalProduct;
  final List<ProductFieldsRecord> productFields;
  final double totalCost;
  final int counter;
  final double width;
  final double height;
  final DocumentReference workPlace;
  final DocumentReference company;
  final String parentProductName;
  final String childProductName;

  const ProductCalculationForm(
      {Key? key,
      required this.width,
      required this.workPlace,
      required this.company,
      required this.parentProductName,
      required this.childProductName,
      required this.parentProduct,
      required this.parentTotalCost,
      required this.parentTotalQuantity,
      required this.height,
      required this.totalCost,
      required this.counter,
      required this.product,
      required this.productFields,
      required this.totalProduct})
      : super(key: key);

  @override
  State<ProductCalculationForm> createState() => _ProductCalculationFormState();
}

class _ProductCalculationFormState extends State<ProductCalculationForm> {
  final Map<String, TextEditingController> _quantityControllers = {};
  final Map<String, TextEditingController> _priceControllers = {};
  final Map<String, double> _kdvValues = {};
  final TextEditingController _totalProductAmountController =
      TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    for (var field in widget.productFields) {
      if (!field.isDelete) {
        _quantityControllers[field.name] = TextEditingController();
        _priceControllers[field.name] = TextEditingController();
        _kdvValues[field.name] = field.defaultKdv ?? 0;
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _quantityControllers.values) {
      controller.dispose();
    }
    for (var controller in _priceControllers.values) {
      controller.dispose();
    }
    _totalProductAmountController.dispose();
    super.dispose();
  }

  void _saveCalculation() async {
    final parameters = <Map<String, dynamic>>[];
    double totalCost = 0.0;

    for (var field in widget.productFields) {
      if (!field.isDelete) {
        final name = field.name;
        final quantityText = _quantityControllers[name]?.text.trim();
        final priceText = _priceControllers[name]?.text.trim();
        final kdv = _kdvValues[name] ?? 0;

        if (quantityText == null ||
            quantityText.isEmpty ||
            priceText == null ||
            priceText.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'Lütfen tüm ürünler için miktar ve fiyat alanlarını doldurun')),
          );
          return;
        }

        final quantity = double.tryParse(quantityText);
        final price = double.tryParse(priceText);

        if (quantity != null && price != null) {
          final cost = quantity * price;
          final costWithKdv = cost * (1 + kdv / 100);
          totalCost += costWithKdv;

          parameters.add({
            'name': name,
            'quantity': quantity,
            'price': price,
            'kdv': kdv,
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Lütfen sayısal geçerli bir değer girin: $name')),
          );
          return;
        }
      }
    }

    if (parameters.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen en az bir geçerli değer girin')),
      );
      return;
    }

    final totalAmountText = _totalProductAmountController.text.trim();
    final totalAmount = double.tryParse(totalAmountText);

    if (totalAmount == null || totalAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Lütfen toplam ürün miktarını doğru girin')),
      );
      return;
    }

    final unitCost = totalCost / totalAmount;

    final newCounter = widget.counter + 1;
    final newTotalProduct = totalAmount + widget.totalProduct;
    final newTotalCost = widget.totalCost + totalCost;
    final newAverageCost = newTotalCost / newTotalProduct;

    final newTotalQuantityParent = widget.parentTotalQuantity + totalAmount;
    final newTotalCostParent = widget.parentTotalCost + totalCost;
    final newAverageCostParent = newTotalCostParent / newTotalQuantityParent;

    try {
      final workPlacePayment =
          await widget.workPlace.collection("workPlacePayments2025").add({
        'value': totalCost,
        'date': _selectedDate ?? DateTime.now(),
        'type': widget.parentProductName + " -> " + widget.childProductName,
        'description': widget.parentProductName +
            " -> " +
            widget.childProductName +
            " Günlük Maliyet",
        'isExpected': false,
        'isDelete': false,
        'toWhom': 'Ürün Maliyet'
      });

      final companyPayment =
          await widget.company.collection("companyPayments2025").add({
        'value': totalCost,
        'date': _selectedDate ?? DateTime.now(),
        'type': widget.parentProductName + " -> " + widget.childProductName,
        'description': widget.parentProductName +
            " -> " +
            widget.childProductName +
            " Günlük Maliyet",
        'isExpected': false,
        'isDelete': false,
        'toWhom': 'Ürün Maliyet',
        'workPlace': widget.workPlace,
        'workPlacePayment': workPlacePayment,
        'parentProduct': widget.parentProduct,
        'childProduct': widget.product,
        'isProductPayment': true
      });

      await widget.workPlace.update({
        'totalMoney': FieldValue.increment(-1 * newTotalCost),
        'yearlyMoney': FieldValue.increment(-1 * newTotalCost)
      });

      await widget.company.update({
        'totalMoney': FieldValue.increment(-1 * newTotalCost),
        'yearlyMoney': FieldValue.increment(-1 * newTotalCost)
      });

      final calculation = await widget.product.collection("calculations").add({
        'parameters': parameters,
        'productQuantity': totalAmount,
        'cost': unitCost,
        'date': _selectedDate ?? DateTime.now(),
        'companyPaymentRef': companyPayment,
        'workPlacePaymentRef': workPlacePayment,
        'isDelete': false,
        'soldQuantity': 0,
        'parentProduct': widget.parentProduct
      });

      await companyPayment.update({
        'calculation': calculation,
      });

      await widget.product.update({
        'averageCost': newAverageCost,
        'counter': newCounter,
        'totalProduct': newTotalProduct,
        'totalCost': newTotalCost,
        'companyPayments': FieldValue.arrayUnion([companyPayment]),
        'workPlacePayments': FieldValue.arrayUnion([workPlacePayment])
      });

      await widget.parentProduct.update({
        'averageCost': newAverageCostParent,
        'totalQuantity': newTotalQuantityParent,
        'totalCost': newTotalCostParent,
        'companyPayments': FieldValue.arrayUnion([companyPayment]),
        'workPlacePayments': FieldValue.arrayUnion([workPlacePayment])
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hesaplama başarıyla kaydedildi')),
      );

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);

      for (final controller in _quantityControllers.values) {
        controller.clear();
      }
      for (final controller in _priceControllers.values) {
        controller.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata oluştu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeFields =
        widget.productFields.where((f) => !f.isDelete).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...activeFields.map((field) {
            return ProductFieldInputCard(
              fieldName: field.name,
              quantityController: _quantityControllers[field.name]!,
              priceController: _priceControllers[field.name]!,
              selectedKdv: _kdvValues[field.name]!,
              onKdvChanged: (newVal) {
                setState(() {
                  _kdvValues[field.name] = newVal ?? 0;
                });
              },
            );
          }),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Toplam Ürün Miktarı',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _totalProductAmountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xC4F0F2F5),
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tarih Seçimi',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xC4F0F2F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _selectedDate != null
                    ? DateFormat('dd.MM.yyyy').format(_selectedDate!)
                    : 'Tarih seçiniz',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _saveCalculation,
            icon: const Icon(Icons.save),
            label: const Text("Kaydet"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductFieldInputCard extends StatelessWidget {
  final String fieldName;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final double selectedKdv;
  final ValueChanged<double?> onKdvChanged;

  const ProductFieldInputCard({
    super.key,
    required this.fieldName,
    required this.quantityController,
    required this.priceController,
    required this.selectedKdv,
    required this.onKdvChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldName,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ürün Miktarı',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: quantityController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: "0.00",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              filled: true,
                              fillColor: const Color(0xFFF7F9FB),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ürün Fiyatı',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: priceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: "0.00 ₺",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              filled: true,
                              fillColor: const Color(0xFFF7F9FB),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'KDV Oranı',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<double>(
                            value: selectedKdv,
                            onChanged: onKdvChanged,
                            items: [0.0, 1.0, 10.0, 20.0].map((double value) {
                              return DropdownMenuItem<double>(
                                value: value,
                                child: Text('%$value'),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF7F9FB),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
