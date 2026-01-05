import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirmation_medias_page_model.dart';
export 'confirmation_medias_page_model.dart';

class ConfirmationMediasPageWidget extends StatefulWidget {
  const ConfirmationMediasPageWidget({
    super.key,
    required this.conversationId,
    required this.name,
  });

  final int? conversationId;
  final String? name;

  static String routeName = 'confirmationMediasPage';
  static String routePath = '/confirmationMediasPage';

  @override
  State<ConfirmationMediasPageWidget> createState() =>
      _ConfirmationMediasPageWidgetState();
}

class _ConfirmationMediasPageWidgetState
    extends State<ConfirmationMediasPageWidget> with TickerProviderStateMixin {
  late ConfirmationMediasPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationMediasPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x5F000000),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x69393939),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      72.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.name,
                                      'isim',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Color(0xFF11FF00),
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            indicatorColor: Color(0xFF05FF79),
                            tabs: [
                              Tab(
                                text: 'Medya',
                              ),
                              Tab(
                                text: 'PDF \'ler',
                              ),
                              Tab(
                                text: 'Belgeler',
                              ),
                              Tab(
                                text: 'Konumlar',
                              ),
                              Tab(
                                text: 'Kişiler',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {},
                                () async {},
                                () async {},
                                () async {},
                                () async {}
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: FutureBuilder<List<GetImagesRow>>(
                                  future: SQLiteManager.instance.getImages(
                                    conversationId: widget.conversationId!,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final gridViewGetImagesRowList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewGetImagesRowList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewGetImagesRow =
                                            gridViewGetImagesRowList[
                                                gridViewIndex];
                                        return Container(
                                          width: 100.0,
                                          height: 100.0,
                                          child:
                                              custom_widgets.MessageImageViewer(
                                            width: 100.0,
                                            height: 100.0,
                                            imagePath:
                                                gridViewGetImagesRow.imagePath,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: FutureBuilder<List<GetPdfsRow>>(
                                  future: SQLiteManager.instance.getPdfs(
                                    conversationId: widget.conversationId!,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final gridViewGetPdfsRowList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: gridViewGetPdfsRowList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewGetPdfsRow =
                                            gridViewGetPdfsRowList[
                                                gridViewIndex];
                                        return Container(
                                          width: 100.0,
                                          height: 100.0,
                                          child: custom_widgets.CustomPdfViewer(
                                            width: 100.0,
                                            height: 100.0,
                                            pdfUrl: gridViewGetPdfsRow.pdfUrl,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              FutureBuilder<List<GetFilesRow>>(
                                future: SQLiteManager.instance.getFiles(
                                  conversationId: widget.conversationId!,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewGetFilesRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewGetFilesRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGetFilesRow =
                                          listViewGetFilesRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            child: custom_widgets.FileMessage(
                                              width: double.infinity,
                                              height: 100.0,
                                              pdfUrl:
                                                  listViewGetFilesRow.fileUrl!,
                                              pdfName:
                                                  listViewGetFilesRow.fileName!,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              FutureBuilder<List<GetMessageMapsRow>>(
                                future: SQLiteManager.instance.getMessageMaps(
                                  conversationId: widget.conversationId!,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewGetMessageMapsRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewGetMessageMapsRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGetMessageMapsRow =
                                          listViewGetMessageMapsRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 200.0,
                                                child: custom_widgets
                                                    .LocationMessage(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  latitude:
                                                      listViewGetMessageMapsRow
                                                          .latitude!,
                                                  longitude:
                                                      listViewGetMessageMapsRow
                                                          .longitude!,
                                                  locationName:
                                                      listViewGetMessageMapsRow
                                                          .mapName!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              FutureBuilder<List<GetMessagePhonesRow>>(
                                future: SQLiteManager.instance.getMessagePhones(
                                  conversationId: widget.conversationId!,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewGetMessagePhonesRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewGetMessagePhonesRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGetMessagePhonesRow =
                                          listViewGetMessagePhonesRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            child:
                                                custom_widgets.ContactMessage(
                                              width: double.infinity,
                                              height: 100.0,
                                              phoneName:
                                                  listViewGetMessagePhonesRow
                                                      .personName!,
                                              phoneNumber:
                                                  listViewGetMessagePhonesRow
                                                      .personNumber!,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
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
      ),
    );
  }
}
