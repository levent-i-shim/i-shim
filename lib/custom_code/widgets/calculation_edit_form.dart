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

class CalculationEditForm extends StatefulWidget {
  final List<ProductCostDataTypeStruct> calculation;
  final double oldProductQuantity;
  final double totalProduct;
  final DocumentReference calculationRef;
  final double oldCost;
  final double width;
  final double height;
  final DocumentReference productRef;
  final double totalCost;
  final int counter;
  final double parentTotalCost;
  final double parentTotalQuantity;
  final DocumentReference parentProdut;
  final DocumentReference company;
  final DocumentReference workPlace;
  final DocumentReference companyPayment;
  final DocumentReference workPlacePayment;
  final DateTime oldSelectedDate;

  const CalculationEditForm({
    Key? key,
    required this.productRef,
    required this.parentTotalCost,
    required this.parentProdut,
    required this.parentTotalQuantity,
    required this.totalCost,
    required this.counter,
    required this.calculation,
    required this.width,
    required this.oldProductQuantity,
    required this.calculationRef,
    required this.oldCost,
    required this.height,
    required this.totalProduct,
    required this.company,
    required this.workPlace,
    required this.companyPayment,
    required this.workPlacePayment,
    required this.oldSelectedDate,
  }) : super(key: key);

  @override
  State<CalculationEditForm> createState() => _CalculationEditFormState();
}

class _CalculationEditFormState extends State<CalculationEditForm> {
  final Map<String, TextEditingController> _quantityControllers = {};
  final Map<String, TextEditingController> _priceControllers = {};
  final Map<String, double> _kdvValues = {};

  final TextEditingController _productQuantityController =
      TextEditingController();

  late List<Map<String, dynamic>> _parameters;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.oldSelectedDate;

    _parameters = widget.calculation.map((item) => item.toMap()).toList();

    for (final param in _parameters) {
      final name = param['name'];
      _quantityControllers[name] =
          TextEditingController(text: param['quantity'].toString());
      _priceControllers[name] =
          TextEditingController(text: param['price'].toString());
      _kdvValues[name] = param['kdv']?.toDouble() ?? 0.0;
    }

    _productQuantityController.text = widget.oldProductQuantity.toString();
  }

  @override
  void dispose() {
    for (final c in _quantityControllers.values) {
      c.dispose();
    }
    for (final c in _priceControllers.values) {
      c.dispose();
    }
    _productQuantityController.dispose();
    super.dispose();
  }

  void _updateCalculation() async {
    double totalCost = 0.0;
    List<Map<String, dynamic>> updatedParams = [];

    for (final param in _parameters) {
      final name = param['name'];
      final quantityText = _quantityControllers[name]?.text ?? '';
      final priceText = _priceControllers[name]?.text ?? '';
      final quantity = double.tryParse(quantityText);
      final price = double.tryParse(priceText);
      final kdv = _kdvValues[name] ?? 0.0;

      if (quantity == null || price == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Geçersiz değer: $name')),
        );
        return;
      }

      final cost = quantity * price;
      final costWithKdv = cost * (1 + kdv / 100);

      totalCost += costWithKdv;

      updatedParams.add({
        'name': name,
        'quantity': quantity,
        'price': price,
        'kdv': kdv,
      });
    }

    final productQuantityText = _productQuantityController.text;
    final productQuantity = double.tryParse(productQuantityText);

    if (productQuantity == null || productQuantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir toplam ürün miktarı girin')),
      );
      return;
    }

    final updatedData = {
      'parameters': updatedParams,
      'productQuantity': productQuantity,
      'cost': totalCost / productQuantity,
      'date': _selectedDate ?? DateTime.now(),
    };

    // Ürün için yeni toplam ve ortalama maliyet hesaplamaları.
    final adjustedTotalCost = widget.totalCost - widget.oldCost + totalCost;
    final adjustedTotalProduct =
        widget.totalProduct - widget.oldProductQuantity + productQuantity;
    final newAverageCost = adjustedTotalCost / adjustedTotalProduct;

    // Parent product için yeni hesaplamalar

    final newTotalQuantityParent = widget.parentTotalQuantity -
        widget.oldProductQuantity +
        productQuantity;
    final newTotalCostParent =
        widget.parentTotalCost - widget.oldCost + totalCost;
    final newAverageCostParent = newTotalCostParent / newTotalQuantityParent;

    try {
      await widget.calculationRef.update(updatedData);

      await widget.productRef.update({
        'averageCost': newAverageCost,
        'totalProduct': adjustedTotalProduct,
        'totalCost': adjustedTotalCost,
      });

      await widget.parentProdut.update({
        'averageCost': newAverageCostParent,
        'totalQuantity': newTotalQuantityParent,
        'totalCost': newTotalCostParent,
      });

      print(" old cost ");
      print(widget.oldCost);

      print(" new  cost ");
      print(adjustedTotalCost);
      await widget.workPlace.update({
        'totalMoney': FieldValue.increment(adjustedTotalCost - widget.oldCost),
        'yearlyMoney': FieldValue.increment(adjustedTotalCost - widget.oldCost)
      });

      await widget.company.update({
        'totalMoney': FieldValue.increment(adjustedTotalCost - widget.oldCost),
        'yearlyMoney': FieldValue.increment(adjustedTotalCost - widget.oldCost)
      });

      await widget.workPlacePayment.update({
        'value': totalCost,
      });

      await widget.companyPayment.update({
        'value': totalCost,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hesaplama başarıyla güncellendi.')),
      );

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Güncelleme hatası: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ..._parameters.map((param) {
            final name = param['name'];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Miktar'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _quantityControllers[name],
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  decoration: InputDecoration(
                                    hintText: '0.00',
                                    filled: true,
                                    fillColor: const Color(0xFFF7F9FB),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Fiyat'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _priceControllers[name],
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  decoration: InputDecoration(
                                    hintText: '0.00 ₺',
                                    filled: true,
                                    fillColor: const Color(0xFFF7F9FB),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('KDV Oranı'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<double>(
                        value: _kdvValues[name],
                        onChanged: (val) {
                          setState(() {
                            _kdvValues[name] = val ?? 0.0;
                          });
                        },
                        items: [0.0, 1.0, 10.0, 20.0].map((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text('%$value'),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF7F9FB),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
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
            controller: _productQuantityController,
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
            onPressed: _updateCalculation,
            icon: const Icon(Icons.save),
            label: const Text('Güncelle'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
