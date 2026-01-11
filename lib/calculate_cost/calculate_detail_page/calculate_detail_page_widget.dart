import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/delete_request_component/delete_request_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calculate_detail_page_model.dart';
export 'calculate_detail_page_model.dart';

class CalculateDetailPageWidget extends StatefulWidget {
  const CalculateDetailPageWidget({
    super.key,
    required this.calculate,
    required this.product,
    required this.parentProduct,
    required this.workPlace,
    required this.isOwner,
  });

  final CalculationsRecord? calculate;
  final ProductsRecord? product;
  final ParentProductsRecord? parentProduct;
  final DocumentReference? workPlace;
  final bool? isOwner;

  static String routeName = 'CalculateDetailPage';
  static String routePath = '/calculateDetailPage';

  @override
  State<CalculateDetailPageWidget> createState() =>
      _CalculateDetailPageWidgetState();
}

class _CalculateDetailPageWidgetState extends State<CalculateDetailPageWidget> {
  late CalculateDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalculateDetailPageModel());

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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              for (int loop1Index = 0;
                                  loop1Index <
                                      widget!.calculate!.parameters.length;
                                  loop1Index++) {
                                final currentLoop1Item =
                                    widget!.calculate!.parameters[loop1Index];
                                _model
                                    .addToParameters(ProductCostDataTypeStruct(
                                  name: currentLoop1Item.name,
                                  quantity: currentLoop1Item.quantity,
                                  price: currentLoop1Item.price,
                                  kdv: valueOrDefault<double>(
                                    currentLoop1Item.kdv,
                                    0.0,
                                  ),
                                ));
                                safeSetState(() {});
                              }

                              context.pushNamed(
                                EditCalculationsPageWidget.routeName,
                                queryParameters: {
                                  'calculation': serializeParam(
                                    widget!.calculate,
                                    ParamType.Document,
                                  ),
                                  'product': serializeParam(
                                    widget!.product,
                                    ParamType.Document,
                                  ),
                                  'parameters': serializeParam(
                                    _model.parameters,
                                    ParamType.DataStruct,
                                    isList: true,
                                  ),
                                  'parentProduct': serializeParam(
                                    widget!.parentProduct,
                                    ParamType.Document,
                                  ),
                                  'workPlace': serializeParam(
                                    widget!.workPlace,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'calculation': widget!.calculate,
                                  'product': widget!.product,
                                  'parentProduct': widget!.parentProduct,
                                },
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: Color(0xFF00FF0A),
                              size: 24.0,
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                Text('Bu Hesaplama Silinecek'),
                                            content: Text(
                                                'Silmek İstediğinize Emin misiniz'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                if (widget!.isOwner!) {
                                  await widget!.calculate!.reference
                                      .update(createCalculationsRecordData(
                                    isDelete: true,
                                  ));
                                  if (widget!.product!.counter > 1) {
                                    await widget!.calculate!.parentReference
                                        .update({
                                      ...createProductsRecordData(
                                        averageCost: (widget!
                                                    .product!.totalCost -
                                                (widget!.calculate!
                                                        .productQuantity *
                                                    widget!.calculate!.cost)) /
                                            (widget!.product!.totalProduct -
                                                widget!.calculate!
                                                    .productQuantity),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'counter': FieldValue.increment(-(1)),
                                          'totalProduct': FieldValue.increment(
                                              -(widget!
                                                  .calculate!.productQuantity)),
                                          'totalCost': FieldValue.increment(
                                              -(widget!.calculate!
                                                      .productQuantity *
                                                  widget!.calculate!.cost)),
                                        },
                                      ),
                                    });
                                  } else {
                                    await widget!.calculate!.parentReference
                                        .update(createProductsRecordData(
                                      averageCost: 0.0,
                                      counter: 0,
                                      totalProduct: 0.0,
                                      totalCost: 0.0,
                                    ));
                                  }

                                  await widget!.parentProduct!.reference
                                      .update({
                                    ...createParentProductsRecordData(
                                      averageCost:
                                          (widget!.parentProduct!.totalCost -
                                                  (widget!.calculate!.cost *
                                                      widget!.calculate!
                                                          .productQuantity)) /
                                              (widget!.parentProduct!
                                                      .totalQuantity -
                                                  widget!.calculate!
                                                      .productQuantity),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'totalCost': FieldValue.increment(
                                            -(widget!.calculate!.cost *
                                                widget!.calculate!
                                                    .productQuantity)),
                                        'totalQuantity': FieldValue.increment(
                                            -(widget!
                                                .calculate!.productQuantity)),
                                      },
                                    ),
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: DeleteRequestComponentWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.description = value));

                                  if (_model.description != null &&
                                      _model.description != '') {
                                    var deletionRequestRecordReference =
                                        DeletionRequestRecord.createDoc(widget!
                                            .parentProduct!.parentReference);
                                    await deletionRequestRecordReference
                                        .set(createDeletionRequestRecordData(
                                      type: DeleteionRequestTypes
                                          .childProduct.name,
                                      parentProduct:
                                          widget!.parentProduct?.reference,
                                      description: _model.description,
                                      triggeredUser: currentUserReference,
                                      isDeleteRequest: false,
                                      workPlace: widget!.workPlace,
                                      childProduct: widget!.product?.reference,
                                      calculation: widget!.calculate?.reference,
                                    ));
                                    _model.deletionRequest =
                                        DeletionRequestRecord
                                            .getDocumentFromData(
                                                createDeletionRequestRecordData(
                                                  type: DeleteionRequestTypes
                                                      .childProduct.name,
                                                  parentProduct: widget!
                                                      .parentProduct?.reference,
                                                  description:
                                                      _model.description,
                                                  triggeredUser:
                                                      currentUserReference,
                                                  isDeleteRequest: false,
                                                  workPlace: widget!.workPlace,
                                                  childProduct: widget!
                                                      .product?.reference,
                                                  calculation: widget!
                                                      .calculate?.reference,
                                                ),
                                                deletionRequestRecordReference);
                                    _model.companyDetail =
                                        await CompaniesRecord.getDocumentOnce(
                                            widget!.parentProduct!
                                                .parentReference);

                                    await NotificationsRecord.createDoc(
                                            _model.companyDetail!.owner!)
                                        .set({
                                      ...createNotificationsRecordData(
                                        type: NotificationTypes
                                            .deleteRequest.name,
                                        content: 'Silme Talebi Gönderildi',
                                        relatedDoc: _model
                                            .deletionRequest?.reference.id,
                                        isRead: false,
                                        isDelete: false,
                                        company: widget!
                                            .parentProduct?.parentReference,
                                        fullDescription:
                                            '${widget!.product?.name} İsimli Alt Ürün için ${dateTimeFormat("d/M/y", widget!.calculate?.date)} tarihli Hesaplamayı ${currentUserDisplayName} isimli kişi silinme talebinde bulundu',
                                        workplace: widget!.workPlace,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'creationTime':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });

                                    await _model.companyDetail!.owner!.update({
                                      ...mapToFirestore(
                                        {
                                          'notificationCount':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Silme Talebi Gönderildi',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Silme Talebi Gönderilemedi',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Başarıyla Silindi',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                context.safePop();
                                context.safePop();
                              }

                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.delete,
                              color: Color(0xFFFF0004),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                              16.0, 8.0, 0.0, 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Toplam Ürün Miktarı',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  widget!.calculate?.productQuantity
                                      ?.toString(),
                                  '0',
                                )}',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final calculation =
                          widget!.calculate?.parameters?.toList() ?? [];

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(calculation.length,
                            (calculationIndex) {
                          final calculationItem = calculation[calculationIndex];
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
                                  color: Color(0xE6FFFFFF),
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
                                      16.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            (widget!.calculate?.parameters
                                                    ?.elementAtOrNull(
                                                        calculationIndex))
                                                ?.name,
                                            'Öğe İsmi',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Fiyatı ${valueOrDefault<String>(
                                            (widget!.calculate?.parameters
                                                    ?.elementAtOrNull(
                                                        calculationIndex))
                                                ?.price
                                                ?.toString(),
                                            '0',
                                          )}',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xC8101518),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Miktarı ${valueOrDefault<String>(
                                          (widget!.calculate?.parameters
                                                  ?.elementAtOrNull(
                                                      calculationIndex))
                                              ?.quantity
                                              ?.toString(),
                                          '0',
                                        )}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xC8101518),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'KDV Oranı ${valueOrDefault<String>(
                                          (widget!.calculate?.parameters
                                                  ?.elementAtOrNull(
                                                      calculationIndex))
                                              ?.kdv
                                              ?.toString(),
                                          '0',
                                        )}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xC8101518),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
