import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calculate_delete_component_model.dart';
export 'calculate_delete_component_model.dart';

class CalculateDeleteComponentWidget extends StatefulWidget {
  const CalculateDeleteComponentWidget({
    super.key,
    required this.calculate,
    required this.workPlace,
    required this.deleteRequest,
  });

  final CalculationsRecord? calculate;
  final DocumentReference? workPlace;
  final DeletionRequestRecord? deleteRequest;

  @override
  State<CalculateDeleteComponentWidget> createState() =>
      _CalculateDeleteComponentWidgetState();
}

class _CalculateDeleteComponentWidgetState
    extends State<CalculateDeleteComponentWidget> {
  late CalculateDeleteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalculateDeleteComponentModel());

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
                              'Bir alt ürün Öğesini silmek üzeresiniz.',
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
                          await widget.calculate!.reference
                              .update(createCalculationsRecordData(
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
                          if (widget.calculate!.companyIncomes.isNotEmpty) {
                            for (int loop1Index = 0;
                                loop1Index <
                                    widget.calculate!.companyIncomes.length;
                                loop1Index++) {
                              final currentLoop1Item =
                                  widget.calculate!.companyIncomes[loop1Index];

                              await currentLoop1Item
                                  .update(createCompanyIncomes2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget.calculate!.workPlaceIncomes.isNotEmpty) {
                            for (int loop2Index = 0;
                                loop2Index <
                                    widget.calculate!.workPlaceIncomes.length;
                                loop2Index++) {
                              final currentLoop2Item = widget
                                  .calculate!.workPlaceIncomes[loop2Index];

                              await currentLoop2Item
                                  .update(createWorkPlaceIncomes2025RecordData(
                                isDelete: true,
                              ));
                            }
                          }
                          if (widget.calculate!.bills.isNotEmpty) {
                            for (int loop3Index = 0;
                                loop3Index < widget.calculate!.bills.length;
                                loop3Index++) {
                              final currentLoop3Item =
                                  widget.calculate!.bills[loop3Index];
                              await currentLoop3Item.delete();
                            }
                          }

                          await widget.workPlace!.update({
                            ...mapToFirestore(
                              {
                                'totalMoney': FieldValue.increment((widget
                                            .calculate!.cost *
                                        widget.calculate!.productQuantity) -
                                    widget.calculate!.totalSoldCost),
                                'yearlyMoney': FieldValue.increment((widget
                                            .calculate!.cost *
                                        widget.calculate!.productQuantity) -
                                    widget.calculate!.totalSoldCost),
                              },
                            ),
                          });

                          await widget.deleteRequest!.parentReference.update({
                            ...mapToFirestore(
                              {
                                'totalMoney': FieldValue.increment((widget
                                            .calculate!.cost *
                                        widget.calculate!.productQuantity) -
                                    widget.calculate!.totalSoldCost),
                                'yearlyMoney': FieldValue.increment((widget
                                            .calculate!.cost *
                                        widget.calculate!.productQuantity) -
                                    widget.calculate!.totalSoldCost),
                              },
                            ),
                          });

                          await widget.deleteRequest!.reference
                              .update(createDeletionRequestRecordData(
                            isDeleteRequest: true,
                          ));
                          _model.parentProduct =
                              await ParentProductsRecord.getDocumentOnce(
                                  widget.calculate!.parentProduct!);

                          await widget.calculate!.parentProduct!
                              .update(createParentProductsRecordData(
                            averageCost: (_model.parentProduct!.totalCost -
                                    (widget.calculate!.cost *
                                        widget.calculate!.productQuantity)) /
                                (_model.parentProduct!.totalQuantity -
                                    widget.calculate!.productQuantity),
                            totalQuantity: _model.parentProduct!.totalQuantity -
                                widget.calculate!.productQuantity,
                            totalCost: _model.parentProduct!.totalCost -
                                (widget.calculate!.cost *
                                    widget.calculate!.productQuantity),
                            soldQuantity: (_model.parentProduct!.soldQuantity -
                                widget.calculate!.soldQuantity),
                            totalSoldCost:
                                (_model.parentProduct!.totalSoldCost -
                                    widget.calculate!.totalSoldCost),
                          ));
                          _model.childProductDocument =
                              await ProductsRecord.getDocumentOnce(
                                  widget.calculate!.parentReference);

                          await widget.calculate!.parentReference
                              .update(createProductsRecordData(
                            averageCost: (_model
                                        .childProductDocument!.totalCost -
                                    (widget.calculate!.cost *
                                        widget.calculate!.productQuantity)) /
                                (_model.childProductDocument!.totalProduct -
                                    widget.calculate!.productQuantity),
                            totalCost: _model.childProductDocument!.totalCost -
                                (widget.calculate!.cost *
                                    widget.calculate!.productQuantity),
                            soldQuantity:
                                (_model.childProductDocument!.soldQuantity -
                                    widget.calculate!.soldQuantity),
                            totalSoldCost:
                                (_model.childProductDocument!.totalSoldCost -
                                    widget.calculate!.totalSoldCost),
                            totalProduct:
                                _model.childProductDocument!.totalProduct -
                                    widget.calculate!.productQuantity,
                          ));

                          await widget.calculate!.workPlacePaymentRef!
                              .update(createWorkPlacePayments2025RecordData(
                            isDelete: true,
                          ));

                          await widget.calculate!.companyPaymentRef!
                              .update(createCompanyPayments2025RecordData(
                            isDelete: true,
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
