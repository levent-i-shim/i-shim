import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_graphic_page_model.dart';
export 'form_graphic_page_model.dart';

class FormGraphicPageWidget extends StatefulWidget {
  const FormGraphicPageWidget({
    super.key,
    required this.graphicPairs,
    String? xName,
    String? yName,
  })  : this.xName = xName ?? ' ',
        this.yName = yName ?? ' ';

  final List<ChartXYPairsStruct>? graphicPairs;
  final String xName;
  final String yName;

  static String routeName = 'FormGraphicPage';
  static String routePath = '/formGraphicPage';

  @override
  State<FormGraphicPageWidget> createState() => _FormGraphicPageWidgetState();
}

class _FormGraphicPageWidgetState extends State<FormGraphicPageWidget> {
  late FormGraphicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormGraphicPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.graphicPairsPageState =
          widget.graphicPairs!.toList().cast<ChartXYPairsStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList2 = [
      Color(0xFF8F47E9),
      Color(0xFF7029CC),
      Color(0xFF2636A5),
      Color(0xFF4A57C2)
    ];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
            'Grafik Sayfası',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 300.0,
                      child: FlutterFlowBarChart(
                        barData: [
                          FFBarChartData(
                            yData: widget.graphicPairs!
                                .map((e) => e.yField)
                                .toList(),
                            color: FlutterFlowTheme.of(context).primary,
                          )
                        ],
                        xLabels:
                            widget.graphicPairs!.map((e) => e.xField).toList(),
                        barWidth: 16.0,
                        barBorderRadius: BorderRadius.circular(8.0),
                        groupSpace: 8.0,
                        alignment: BarChartAlignment.spaceAround,
                        chartStylingInfo: ChartStylingInfo(
                          enableTooltip: true,
                          tooltipBackgroundColor: Color(0xFF0100FF),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          showGrid: true,
                          showBorder: false,
                        ),
                        axisBounds: AxisBounds(),
                        xAxisLabelInfo: AxisLabelInfo(
                          title: widget.xName,
                          titleTextStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          showLabels: true,
                          labelTextStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          labelInterval: 10.0,
                          reservedSize: 28.0,
                        ),
                        yAxisLabelInfo: AxisLabelInfo(
                          title: widget.yName,
                          titleTextStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          showLabels: true,
                          labelTextStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          labelInterval: 1000.0,
                          reservedSize: 36.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 36.0),
                    child: Container(
                      width: double.infinity,
                      height: 400.0,
                      child: FlutterFlowPieChart(
                        data: FFPieChartData(
                          values: widget.graphicPairs!
                              .map((e) => e.yField)
                              .toList(),
                          colors: chartPieChartColorsList2,
                          radius: [150.0],
                        ),
                        donutHoleRadius: 0.0,
                        donutHoleColor: Colors.transparent,
                        sectionLabelType: PieChartSectionLabelType.value,
                        sectionLabelStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                    ),
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
