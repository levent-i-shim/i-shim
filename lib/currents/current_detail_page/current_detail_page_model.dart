import '/flutter_flow/flutter_flow_util.dart';
import 'current_detail_page_widget.dart' show CurrentDetailPageWidget;
import 'package:flutter/material.dart';

class CurrentDetailPageModel extends FlutterFlowModel<CurrentDetailPageWidget> {
  ///  Local state fields for this page.

  int? indexTotal;

  double? totalSpending;

  List<double> listOfValuesForPayment = [];
  void addToListOfValuesForPayment(double item) =>
      listOfValuesForPayment.add(item);
  void removeFromListOfValuesForPayment(double item) =>
      listOfValuesForPayment.remove(item);
  void removeAtIndexFromListOfValuesForPayment(int index) =>
      listOfValuesForPayment.removeAt(index);
  void insertAtIndexInListOfValuesForPayment(int index, double item) =>
      listOfValuesForPayment.insert(index, item);
  void updateListOfValuesForPaymentAtIndex(
          int index, Function(double) updateFn) =>
      listOfValuesForPayment[index] = updateFn(listOfValuesForPayment[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
