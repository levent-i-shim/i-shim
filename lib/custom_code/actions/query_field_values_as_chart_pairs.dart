// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<List<ChartXYPairsStruct>> queryFieldValuesAsChartPairs(
  List<ConditionDataTypeStruct> conditions,
  DocumentReference form,
  String xFieldName,
  String yFieldName,
) async {
  final responsesRef = form.collection('formResponses');
  Query query = responsesRef;

  // 🔍 Koşulları Firestore sorgusuna ekle
  for (var condition in conditions) {
    dynamic value;
    if (condition.text.trim().isNotEmpty) {
      value = condition.text;
    } else if (condition.date != null) {
      value = condition.date!.toIso8601String();
    } else {
      value = condition.number;
    }

    switch (condition.conditionType) {
      case '==':
        query = query.where("fieldValue", isEqualTo: value);
        break;
      case '!=':
        query = query.where("fieldValue", isNotEqualTo: value);
        break;
      case '<':
        query = query.where("fieldValue", isLessThan: value);
        break;
      case '<=':
        query = query.where("fieldValue", isLessThanOrEqualTo: value);
        break;
      case '>':
        query = query.where("fieldValue", isGreaterThan: value);
        break;
      case '>=':
        query = query.where("fieldValue", isGreaterThanOrEqualTo: value);
        break;
      default:
        throw Exception('❌ Geçersiz conditionType: ${condition.conditionType}');
    }
  }

  final snapshot = await query.get();
  final docs =
      snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

  // 🔁 Gruplama (sentBy + date'ye göre)
  const int groupTimeSeconds = 10;
  final Map<String, List<Map<String, dynamic>>> sentByMap = {};
  for (var doc in docs) {
    final sentBy = doc['sentBy']?.toString() ?? 'unknown';
    sentByMap.putIfAbsent(sentBy, () => []).add(doc);
  }

  final Map<String, List<Map<String, dynamic>>> grouped = {};
  for (var entry in sentByMap.entries) {
    final docList = entry.value;
    docList.sort(
        (a, b) => (a['date'] as Timestamp).compareTo(b['date'] as Timestamp));
    int groupIndex = 0;
    DateTime? groupStart;

    for (var doc in docList) {
      final docDate = (doc['date'] as Timestamp).toDate();
      if (groupStart == null ||
          docDate.difference(groupStart).inSeconds > groupTimeSeconds) {
        groupStart = docDate;
        groupIndex++;
      }
      final groupKey = '${entry.key}-$groupIndex';
      grouped.putIfAbsent(groupKey, () => []).add(doc);
    }
  }

  // 📊 Chart verisi oluştur
  final List<ChartXYPairsStruct> result = [];

  for (var group in grouped.entries) {
    final fields = group.value;

    String? xVal;
    double? yVal;

    for (var field in fields) {
      final name = field['fieldName']?.toString();
      final value = field['fieldValue'];
      final type = field['fieldValueType']?.toString();

      if (name == xFieldName) {
        xVal = value?.toString();
      } else if (name == yFieldName) {
        if (value is num) {
          yVal = value.toDouble();
        } else if (value is String) {
          yVal = double.tryParse(value);
        }
      }
    }

    if (xVal != null && yVal != null) {
      result.add(ChartXYPairsStruct(xField: xVal, yField: yVal));
    }
  }

  print('✅ Toplam eşleşme: ${result.length}');
  return result;
}
