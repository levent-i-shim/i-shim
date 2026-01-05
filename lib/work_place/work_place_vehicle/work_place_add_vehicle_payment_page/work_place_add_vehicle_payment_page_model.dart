import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'work_place_add_vehicle_payment_page_widget.dart'
    show WorkPlaceAddVehiclePaymentPageWidget;
import 'package:flutter/material.dart';

class WorkPlaceAddVehiclePaymentPageModel
    extends FlutterFlowModel<WorkPlaceAddVehiclePaymentPageWidget> {
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isDataUploading_uploadDataRshddf = false;
  FFUploadedFile uploadedLocalFile_uploadDataRshddf =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  bool isDataUploading_uploadDataMrxlo = false;
  FFUploadedFile uploadedLocalFile_uploadDataMrxlo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataMrxlo = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WorkPlaceVehiclePaymentsRecord? workPlaceVehiclePayment;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyVehiclePaymentsRecord? companyVehiclePayment;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRef;
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

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
