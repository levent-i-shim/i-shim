import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_bill_page_widget.dart' show UpdateBillPageWidget;
import 'package:flutter/material.dart';

class UpdateBillPageModel extends FlutterFlowModel<UpdateBillPageWidget> {
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for whichCompaniesDropDow widget.
  String? whichCompaniesDropDowValue;
  FormFieldController<String>? whichCompaniesDropDowValueController;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
