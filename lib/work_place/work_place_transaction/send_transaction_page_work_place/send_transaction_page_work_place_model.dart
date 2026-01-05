import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'send_transaction_page_work_place_widget.dart'
    show SendTransactionPageWorkPlaceWidget;
import 'package:flutter/material.dart';

class SendTransactionPageWorkPlaceModel
    extends FlutterFlowModel<SendTransactionPageWorkPlaceWidget> {
  ///  Local state fields for this page.

  List<CompanyWorkersRecord> workers = [];
  void addToWorkers(CompanyWorkersRecord item) => workers.add(item);
  void removeFromWorkers(CompanyWorkersRecord item) => workers.remove(item);
  void removeAtIndexFromWorkers(int index) => workers.removeAt(index);
  void insertAtIndexInWorkers(int index, CompanyWorkersRecord item) =>
      workers.insert(index, item);
  void updateWorkersAtIndex(
          int index, Function(CompanyWorkersRecord) updateFn) =>
      workers[index] = updateFn(workers[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTransactionRecord? transaction2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
