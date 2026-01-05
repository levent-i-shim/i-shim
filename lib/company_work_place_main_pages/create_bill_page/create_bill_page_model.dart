import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_bill_page_widget.dart' show CreateBillPageWidget;
import 'package:flutter/material.dart';

class CreateBillPageModel extends FlutterFlowModel<CreateBillPageWidget> {
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
  // Stores action output result for [Custom Action - getCompanyDocRef] action in whichCompaniesDropDow widget.
  DocumentReference? companyRefFromDD;
  // State field(s) for workPlaceDropDown widget.
  String? workPlaceDropDownValue;
  FormFieldController<String>? workPlaceDropDownValueController;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in workPlaceDropDown widget.
  DocumentReference? workPlaceRefFromDD;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
