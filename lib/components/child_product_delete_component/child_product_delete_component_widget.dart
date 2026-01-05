import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'child_product_delete_component_model.dart';
export 'child_product_delete_component_model.dart';

class ChildProductDeleteComponentWidget extends StatefulWidget {
  const ChildProductDeleteComponentWidget({
    super.key,
    required this.childProduct,
    required this.workPlace,
    required this.deleteRequest,
  });

  final ProductsRecord? childProduct;
  final DocumentReference? workPlace;
  final DeletionRequestRecord? deleteRequest;

  @override
  State<ChildProductDeleteComponentWidget> createState() =>
      _ChildProductDeleteComponentWidgetState();
}

class _ChildProductDeleteComponentWidgetState
    extends State<ChildProductDeleteComponentWidget> {
  late ChildProductDeleteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChildProductDeleteComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 530.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 9,
                            child: Text(
                              'Bir alt ürünü silmek üzeresiniz.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          ' Bu durumda ne yapmak istersiniz?',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '1. Sadece Ürünü Sil\nÜrüne ait gelir ve giderler korunur, sadece ürün kaydı silinir.\n\n2. Tüm Kayıtları Sil\nÜrünle birlikte tüm satışlar ve maliyetler de silinir. Bu işlem gelir/gider verilerini etkiler.',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await widget.childProduct!.reference
                              .update(createProductsRecordData(
                            isDelete: true,
                          ));

                          await widget.deleteRequest!.reference
                              .update(createDeletionRequestRecordData(
                            isDeleteRequest: true,
                          ));
                          Navigator.pop(context);
                        },
                        text: 'Sadece Ürünü Sil',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (widget.childProduct!.companyIncomes.isNotEmpty) {
                            for (int loop1Index = 0;
                                loop1Index <
                                    widget.childProduct!.companyIncomes.length;
                                loop1Index++) {
                              final currentLoop1Item = widget
                                  .childProduct!.companyIncomes[loop1Index];

                              await currentLoop1Item
                                  .update(createCompanyIncomes2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget
                              .childProduct!.companyPayments.isNotEmpty) {
                            for (int loop2Index = 0;
                                loop2Index <
                                    widget
                                        .childProduct!.companyPayments.length;
                                loop2Index++) {
                              final currentLoop2Item = widget
                                  .childProduct!.companyPayments[loop2Index];

                              await currentLoop2Item
                                  .update(createCompanyPayments2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget
                              .childProduct!.workPlaceIncomes.isNotEmpty) {
                            for (int loop3Index = 0;
                                loop3Index <
                                    widget
                                        .childProduct!.workPlaceIncomes.length;
                                loop3Index++) {
                              final currentLoop3Item = widget
                                  .childProduct!.workPlaceIncomes[loop3Index];

                              await currentLoop3Item
                                  .update(createWorkPlaceIncomes2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget
                              .childProduct!.workPlacePayments.isNotEmpty) {
                            for (int loop4Index = 0;
                                loop4Index <
                                    widget
                                        .childProduct!.workPlacePayments.length;
                                loop4Index++) {
                              final currentLoop4Item = widget
                                  .childProduct!.workPlacePayments[loop4Index];

                              await currentLoop4Item
                                  .update(createWorkPlacePayments2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget.childProduct!.bills.isNotEmpty) {
                            for (int loop5Index = 0;
                                loop5Index < widget.childProduct!.bills.length;
                                loop5Index++) {
                              final currentLoop5Item =
                                  widget.childProduct!.bills[loop5Index];
                              await currentLoop5Item.delete();
                            }
                          }
                          if (widget.childProduct!.totalCost >
                              widget.childProduct!.totalSoldCost) {
                            await widget.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                  'yearlyMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                },
                              ),
                            });

                            await widget.deleteRequest!.parentReference
                                .update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                  'yearlyMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                },
                              ),
                            });
                          } else {
                            await widget.workPlace!.update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                  'yearlyMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                },
                              ),
                            });

                            await widget.deleteRequest!.parentReference
                                .update({
                              ...mapToFirestore(
                                {
                                  'totalMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                  'yearlyMoney': FieldValue.increment(
                                      widget.childProduct!.totalCost -
                                          widget.childProduct!.totalSoldCost),
                                },
                              ),
                            });
                          }

                          await widget.deleteRequest!.reference
                              .update(createDeletionRequestRecordData(
                            isDeleteRequest: true,
                          ));
                          _model.parentProduct =
                              await ParentProductsRecord.getDocumentOnce(
                                  widget.childProduct!.parentProduct!);

                          await widget.childProduct!.parentProduct!
                              .update(createParentProductsRecordData(
                            averageCost: (_model.parentProduct!.totalCost -
                                    widget.childProduct!.totalCost) /
                                (_model.parentProduct!.totalQuantity -
                                    widget.childProduct!.totalProduct),
                            totalQuantity: _model.parentProduct!.totalQuantity -
                                widget.childProduct!.totalProduct,
                            totalCost: _model.parentProduct!.totalCost -
                                widget.childProduct!.totalCost,
                            soldQuantity: (_model.parentProduct!.soldQuantity -
                                widget.childProduct!.soldQuantity),
                            totalSoldCost:
                                (_model.parentProduct!.totalSoldCost -
                                    widget.childProduct!.totalSoldCost),
                          ));
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        text: 'Tüm Kayıtları Sil',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ],
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
