import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calculate_cost_page_model.dart';
export 'calculate_cost_page_model.dart';

class CalculateCostPageWidget extends StatefulWidget {
  const CalculateCostPageWidget({
    super.key,
    required this.product,
    required this.productFields,
    required this.parentProduct,
    required this.workPlace,
  });

  final ProductsRecord? product;
  final List<ProductFieldsRecord>? productFields;
  final ParentProductsRecord? parentProduct;
  final DocumentReference? workPlace;

  static String routeName = 'CalculateCostPage';
  static String routePath = '/calculateCostPage';

  @override
  State<CalculateCostPageWidget> createState() =>
      _CalculateCostPageWidgetState();
}

class _CalculateCostPageWidgetState extends State<CalculateCostPageWidget> {
  late CalculateCostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalculateCostPageModel());

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
          title: Text(
            valueOrDefault<String>(
              widget.product?.name,
              'isim',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
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
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 6.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                child: custom_widgets.ProductCalculationForm(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  product: widget.product!.reference,
                  productFields: widget.productFields!,
                  totalCost: widget.product!.totalCost,
                  counter: widget.product!.counter,
                  totalProduct: widget.product!.totalProduct,
                  parentTotalCost: widget.parentProduct!.totalCost,
                  parentTotalQuantity: widget.parentProduct!.totalQuantity,
                  parentProduct: widget.parentProduct!.reference,
                  parentProductName: widget.parentProduct!.name,
                  childProductName: widget.product!.name,
                  workPlace: widget.workPlace!,
                  company: widget.parentProduct!.parentReference,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
