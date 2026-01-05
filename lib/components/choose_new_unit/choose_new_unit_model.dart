import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'choose_new_unit_widget.dart' show ChooseNewUnitWidget;
import 'package:flutter/material.dart';

class ChooseNewUnitModel extends FlutterFlowModel<ChooseNewUnitWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> newUnitRef = [];
  void addToNewUnitRef(DocumentReference item) => newUnitRef.add(item);
  void removeFromNewUnitRef(DocumentReference item) => newUnitRef.remove(item);
  void removeAtIndexFromNewUnitRef(int index) => newUnitRef.removeAt(index);
  void insertAtIndexInNewUnitRef(int index, DocumentReference item) =>
      newUnitRef.insert(index, item);
  void updateNewUnitRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newUnitRef[index] = updateFn(newUnitRef[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateForm;
  // Stores action output result for [Custom Action - getUnitDocRef] action in Button widget.
  DocumentReference? newUnit;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workers;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CompanyWorkersRecord>? workersCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
