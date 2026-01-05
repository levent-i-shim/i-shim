import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'copmany_vehicle_add_payment_widget.dart'
    show CopmanyVehicleAddPaymentWidget;
import 'package:flutter/material.dart';

class CopmanyVehicleAddPaymentModel
    extends FlutterFlowModel<CopmanyVehicleAddPaymentWidget> {
  ///  Local state fields for this page.

  bool isFuel = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plaka is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isDataUploading_uploadDataRsh = false;
  FFUploadedFile uploadedLocalFile_uploadDataRsh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  bool isDataUploading_uploadDataMrxl = false;
  FFUploadedFile uploadedLocalFile_uploadDataMrxl =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataMrxl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceVehiclePaymentsRecord? vehiclePaymentWorkPlaceOwner;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyVehiclePaymentsRecord? vehiclePaymentOwner;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlacePayments2025Record? payment2workPlaceOwner;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyPayments2025Record? payment2Owner;
  // Stores action output result for [Custom Action - calculateCostVehicle] action in Button widget.
  List<double>? average;
  // Stores action output result for [Custom Action - calculateCostVehicle] action in Button widget.
  List<double>? average2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceVehiclePaymentsRecord? vehiclePaymentWorkPlace;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyVehiclePaymentsRecord? vehiclePayment;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceTransactionRecord? workPlaceTransaction;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
