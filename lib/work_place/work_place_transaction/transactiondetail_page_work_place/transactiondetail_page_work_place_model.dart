import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transactiondetail_page_work_place_widget.dart'
    show TransactiondetailPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class TransactiondetailPageWorkPlaceModel
    extends FlutterFlowModel<TransactiondetailPageWorkPlaceWidget> {
  ///  Local state fields for this page.

  bool isEnteredIncome = false;

  bool isEnteredPayment = false;

  List<WorkPlaceWorkerRecord> workers = [];
  void addToWorkers(WorkPlaceWorkerRecord item) => workers.add(item);
  void removeFromWorkers(WorkPlaceWorkerRecord item) => workers.remove(item);
  void removeAtIndexFromWorkers(int index) => workers.removeAt(index);
  void insertAtIndexInWorkers(int index, WorkPlaceWorkerRecord item) =>
      workers.insert(index, item);
  void updateWorkersAtIndex(
          int index, Function(WorkPlaceWorkerRecord) updateFn) =>
      workers[index] = updateFn(workers[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in TransactiondetailPageWorkPlace widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Firestore Query - Query a collection] action in TransactiondetailPageWorkPlace widget.
  List<WorkPlaceWorkerRecord>? worker;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? receiverUser;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyTransactionsRecord? companyTransaction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
