import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'instruction_page_widget.dart' show InstructionPageWidget;
import 'package:flutter/material.dart';

class InstructionPageModel extends FlutterFlowModel<InstructionPageWidget> {
  ///  Local state fields for this page.

  List<CompaniesStruct> companyList = [];
  void addToCompanyList(CompaniesStruct item) => companyList.add(item);
  void removeFromCompanyList(CompaniesStruct item) => companyList.remove(item);
  void removeAtIndexFromCompanyList(int index) => companyList.removeAt(index);
  void insertAtIndexInCompanyList(int index, CompaniesStruct item) =>
      companyList.insert(index, item);
  void updateCompanyListAtIndex(
          int index, Function(CompaniesStruct) updateFn) =>
      companyList[index] = updateFn(companyList[index]);

  bool isSelected = false;

  List<WorkplaceStruct> workPlaceList = [];
  void addToWorkPlaceList(WorkplaceStruct item) => workPlaceList.add(item);
  void removeFromWorkPlaceList(WorkplaceStruct item) =>
      workPlaceList.remove(item);
  void removeAtIndexFromWorkPlaceList(int index) =>
      workPlaceList.removeAt(index);
  void insertAtIndexInWorkPlaceList(int index, WorkplaceStruct item) =>
      workPlaceList.insert(index, item);
  void updateWorkPlaceListAtIndex(
          int index, Function(WorkplaceStruct) updateFn) =>
      workPlaceList[index] = updateFn(workPlaceList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in InstructionPage widget.
  List<CompaniesRecord>? myCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in InstructionPage widget.
  List<MyWorkedWorkPlaceRecord>? myWorkedWorkPlace;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in DropDown widget.
  DocumentReference? companyRef;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<WorkPlacesRecord>? workPlaces;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in DropDown widget.
  DocumentReference? workPlaceRef;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<InstructionsRecord>? instructions;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<InstructionsRecord>? deleteList;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRefNavigation;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlaceRefNavigation;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyWorkersRecord? worker;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
