import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_calculations_page_model.dart';
export 'edit_calculations_page_model.dart';

class EditCalculationsPageWidget extends StatefulWidget {
  const EditCalculationsPageWidget({
    super.key,
    required this.calculation,
    required this.product,
    required this.parameters,
    required this.parentProduct,
    required this.workPlace,
  });

  final CalculationsRecord? calculation;
  final ProductsRecord? product;
  final List<ProductCostDataTypeStruct>? parameters;
  final ParentProductsRecord? parentProduct;
  final DocumentReference? workPlace;

  static String routeName = 'EditCalculationsPage';
  static String routePath = '/editCalculationsPage';

  @override
  State<EditCalculationsPageWidget> createState() =>
      _EditCalculationsPageWidgetState();
}

class _EditCalculationsPageWidgetState
    extends State<EditCalculationsPageWidget> {
  late EditCalculationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCalculationsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0x563F0E57),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF060418), Color(0xF4300232)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, -0.34),
                end: AlignmentDirectional(1.0, 0.34),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                child: custom_widgets.CalculationEditForm(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  calculation: widget!.parameters!,
                  totalCost: widget!.product!.totalCost,
                  counter: widget!.product!.counter,
                  productRef: widget!.product!.reference,
                  oldProductQuantity: widget!.calculation!.productQuantity,
                  oldCost: widget!.calculation!.productQuantity *
                      widget!.calculation!.cost,
                  calculationRef: widget!.calculation!.reference,
                  totalProduct: widget!.product!.totalProduct,
                  parentTotalCost: widget!.parentProduct!.totalCost,
                  parentTotalQuantity: widget!.parentProduct!.totalQuantity,
                  parentProdut: widget!.parentProduct!.reference,
                  oldSelectedDate: widget!.calculation!.date!,
                  company: widget!.parentProduct!.parentReference,
                  workPlace: widget!.workPlace!,
                  companyPayment: widget!.calculation!.companyPaymentRef!,
                  workPlacePayment: widget!.calculation!.workPlacePaymentRef!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
