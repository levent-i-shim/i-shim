import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'company_add_vehicle_widget.dart' show CompanyAddVehicleWidget;
import 'package:flutter/material.dart';

class CompanyAddVehicleModel extends FlutterFlowModel<CompanyAddVehicleWidget> {
  ///  Local state fields for this page.

  bool isSelectedCar = true;

  bool isSelectedTruck = false;

  bool isSelectedConstruction = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextFieldPlate widget.
  FocusNode? textFieldPlateFocusNode;
  TextEditingController? textFieldPlateTextController;
  String? Function(BuildContext, String?)?
      textFieldPlateTextControllerValidator;
  String? _textFieldPlateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plaka is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldPlate2 widget.
  FocusNode? textFieldPlate2FocusNode;
  TextEditingController? textFieldPlate2TextController;
  String? Function(BuildContext, String?)?
      textFieldPlate2TextControllerValidator;
  // State field(s) for TextFieldBrand widget.
  FocusNode? textFieldBrandFocusNode;
  TextEditingController? textFieldBrandTextController;
  String? Function(BuildContext, String?)?
      textFieldBrandTextControllerValidator;
  String? _textFieldBrandTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plaka is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldModel widget.
  FocusNode? textFieldModelFocusNode;
  TextEditingController? textFieldModelTextController;
  String? Function(BuildContext, String?)?
      textFieldModelTextControllerValidator;
  String? _textFieldModelTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plaka is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for TextFieldKm widget.
  FocusNode? textFieldKmFocusNode;
  TextEditingController? textFieldKmTextController;
  String? Function(BuildContext, String?)? textFieldKmTextControllerValidator;
  // State field(s) for TextFieldWorkingHour widget.
  FocusNode? textFieldWorkingHourFocusNode;
  TextEditingController? textFieldWorkingHourTextController;
  String? Function(BuildContext, String?)?
      textFieldWorkingHourTextControllerValidator;
  // State field(s) for TextFieldYear widget.
  FocusNode? textFieldYearFocusNode;
  TextEditingController? textFieldYearTextController;
  String? Function(BuildContext, String?)? textFieldYearTextControllerValidator;
  String? _textFieldYearTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plaka is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Custom Action - getWorkPlaceDocRef] action in Button widget.
  DocumentReference? workPlaceDocRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceVehicleRecord? vehicleWorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyVehiclesRecord? vehicle;

  @override
  void initState(BuildContext context) {
    textFieldPlateTextControllerValidator =
        _textFieldPlateTextControllerValidator;
    textFieldBrandTextControllerValidator =
        _textFieldBrandTextControllerValidator;
    textFieldModelTextControllerValidator =
        _textFieldModelTextControllerValidator;
    textFieldYearTextControllerValidator =
        _textFieldYearTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldPlateFocusNode?.dispose();
    textFieldPlateTextController?.dispose();

    textFieldPlate2FocusNode?.dispose();
    textFieldPlate2TextController?.dispose();

    textFieldBrandFocusNode?.dispose();
    textFieldBrandTextController?.dispose();

    textFieldModelFocusNode?.dispose();
    textFieldModelTextController?.dispose();

    textFieldKmFocusNode?.dispose();
    textFieldKmTextController?.dispose();

    textFieldWorkingHourFocusNode?.dispose();
    textFieldWorkingHourTextController?.dispose();

    textFieldYearFocusNode?.dispose();
    textFieldYearTextController?.dispose();
  }
}
