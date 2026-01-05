import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_new_product_page_model.dart';
export 'add_new_product_page_model.dart';

class AddNewProductPageWidget extends StatefulWidget {
  const AddNewProductPageWidget({
    super.key,
    required this.company,
    required this.parentProduct,
    required this.workPlace,
  });

  final DocumentReference? company;
  final ParentProductsRecord? parentProduct;
  final DocumentReference? workPlace;

  static String routeName = 'AddNewProductPage';
  static String routePath = '/addNewProductPage';

  @override
  State<AddNewProductPageWidget> createState() =>
      _AddNewProductPageWidgetState();
}

class _AddNewProductPageWidgetState extends State<AddNewProductPageWidget> {
  late AddNewProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewProductPageModel());

    _model.textFieldTitleTextController ??= TextEditingController();
    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldNameTextController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();

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
            'Ürün',
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
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.safePop();

                  context.pushNamed(
                    CalculateCostPageWidget.routeName,
                    queryParameters: {
                      'product': serializeParam(
                        _model.product,
                        ParamType.Document,
                      ),
                      'productFields': serializeParam(
                        _model.fields,
                        ParamType.Document,
                        isList: true,
                      ),
                      'parentProduct': serializeParam(
                        widget.parentProduct,
                        ParamType.Document,
                      ),
                      'workPlace': serializeParam(
                        widget.workPlace,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'product': _model.product,
                      'productFields': _model.fields,
                      'parentProduct': widget.parentProduct,
                    },
                  );
                },
                text: 'Kaydet',
                icon: Icon(
                  Icons.save_as,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF090D9F),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _model.formKey1,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Ürün Adı',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textFieldTitleTextController,
                            focusNode: _model.textFieldTitleFocusNode,
                            autofocus: false,
                            readOnly: _model.isProductAdded ? true : false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xC4F0F2F5),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            maxLines: 2,
                            minLines: 1,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .textFieldTitleTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Birimi',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownUnitValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            'Adet',
                            'Kutu',
                            'Paket',
                            'Kilogram',
                            'Gram',
                            'Ton',
                            'Litre',
                            'Mililitre',
                            'Metre',
                            'Santimetre',
                            'MetreKare(m²)',
                            'MetreKüp(m³)',
                            'Rulo',
                            'Çuval',
                            'Palet',
                            'Bidon',
                            'Saat',
                            'Gün',
                            'Ay',
                            'Yıl',
                            'Kullanım'
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.dropDownUnitValue = val),
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          disabled: _model.isProductAdded ? true : false,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      if (!_model.isProductAdded)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.validate = true;
                                if (_model.formKey1.currentState == null ||
                                    !_model.formKey1.currentState!.validate()) {
                                  safeSetState(() => _model.validate = false);
                                  return;
                                }
                                if (_model.dropDownUnitValue == null) {
                                  _model.validate = false;
                                  safeSetState(() {});
                                  return;
                                }
                                if (_model.validate!) {
                                  var productsRecordReference =
                                      ProductsRecord.collection.doc();
                                  await productsRecordReference.set({
                                    ...createProductsRecordData(
                                      name: _model
                                          .textFieldTitleTextController.text,
                                      company: widget.company,
                                      isDelete: false,
                                      averageCost: 0.0,
                                      counter: 0,
                                      unit: _model.dropDownUnitValue,
                                      totalProduct: 0.0,
                                      totalCost: 0.0,
                                      soldQuantity: 0.0,
                                      totalSoldCost: 0.0,
                                      parentProduct:
                                          widget.parentProduct?.reference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'date': FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.product =
                                      ProductsRecord.getDocumentFromData({
                                    ...createProductsRecordData(
                                      name: _model
                                          .textFieldTitleTextController.text,
                                      company: widget.company,
                                      isDelete: false,
                                      averageCost: 0.0,
                                      counter: 0,
                                      unit: _model.dropDownUnitValue,
                                      totalProduct: 0.0,
                                      totalCost: 0.0,
                                      soldQuantity: 0.0,
                                      totalSoldCost: 0.0,
                                      parentProduct:
                                          widget.parentProduct?.reference,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'date': DateTime.now(),
                                      },
                                    ),
                                  }, productsRecordReference);
                                  _model.isProductAdded = true;
                                  safeSetState(() {});

                                  await widget.parentProduct!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'products': FieldValue.arrayUnion(
                                            [_model.product?.reference]),
                                      },
                                    ),
                                  });
                                }

                                safeSetState(() {});
                              },
                              text: 'Ürünü Kaydet',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF090D9F),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (_model.isProductAdded)
                  Form(
                    key: _model.formKey2,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 24.0, 0.0, 0.0),
                          child: Text(
                            'Maliyet Öğesi',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldNameTextController,
                              focusNode: _model.textFieldNameFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Color(0xC4F0F2F5),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLines: 2,
                              minLines: 1,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .textFieldNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'KDV Oranı',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownKdvValueController ??=
                                FormFieldController<String>(null),
                            options: ['0', '1', '10', '20'],
                            onChanged: (val) => safeSetState(
                                () => _model.dropDownKdvValue = val),
                            width: 200.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.validateField = true;
                                if (_model.formKey2.currentState == null ||
                                    !_model.formKey2.currentState!.validate()) {
                                  safeSetState(
                                      () => _model.validateField = false);
                                  return;
                                }
                                if (_model.dropDownKdvValue == null) {
                                  _model.validateField = false;
                                  safeSetState(() {});
                                  return;
                                }
                                if (_model.validateField!) {
                                  var productFieldsRecordReference =
                                      ProductFieldsRecord.createDoc(
                                          _model.product!.reference);
                                  await productFieldsRecordReference
                                      .set(createProductFieldsRecordData(
                                    name:
                                        _model.textFieldNameTextController.text,
                                    isDelete: false,
                                    defaultKdv: double.parse(
                                        (_model.dropDownKdvValue!)),
                                  ));
                                  _model.fieldProduct =
                                      ProductFieldsRecord.getDocumentFromData(
                                          createProductFieldsRecordData(
                                            name: _model
                                                .textFieldNameTextController
                                                .text,
                                            isDelete: false,
                                            defaultKdv: double.parse(
                                                (_model.dropDownKdvValue!)),
                                          ),
                                          productFieldsRecordReference);
                                  _model.addToFields(_model.fieldProduct!);
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.textFieldNameTextController?.text =
                                        '';
                                  });
                                }

                                safeSetState(() {});
                              },
                              text: 'Öğeyi Ekle',
                              icon: Icon(
                                Icons.add_rounded,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF090D9F),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_model.fields.isNotEmpty)
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final field = _model.fields.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: field.length,
                            itemBuilder: (context, fieldIndex) {
                              final fieldItem = field[fieldIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xE6E0E3E2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            fieldItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await fieldItem.reference
                                                    .delete();
                                                _model.removeFromFields(
                                                    fieldItem);
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.delete_sharp,
                                                color: Color(0xFFFD0404),
                                                size: 36.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
