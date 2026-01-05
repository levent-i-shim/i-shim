import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'company_confirmation_choose_company_page_model.dart';
export 'company_confirmation_choose_company_page_model.dart';

class CompanyConfirmationChooseCompanyPageWidget extends StatefulWidget {
  const CompanyConfirmationChooseCompanyPageWidget({super.key});

  static String routeName = 'CompanyConfirmationChooseCompanyPage';
  static String routePath = '/companyConfirmationChooseCompanyPage';

  @override
  State<CompanyConfirmationChooseCompanyPageWidget> createState() =>
      _CompanyConfirmationChooseCompanyPageWidgetState();
}

class _CompanyConfirmationChooseCompanyPageWidgetState
    extends State<CompanyConfirmationChooseCompanyPageWidget> {
  late CompanyConfirmationChooseCompanyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CompanyConfirmationChooseCompanyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.owner = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord
            .where(
              'owner',
              isEqualTo: currentUserReference,
            )
            .where(
              'isDelete',
              isEqualTo: false,
            ),
      );
      if (_model.owner != null && (_model.owner)!.isNotEmpty) {
        for (int loop1Index = 0;
            loop1Index < _model.owner!.length;
            loop1Index++) {
          final currentLoop1Item = _model.owner![loop1Index];
          _model.addToCompanies(CompaniesStruct(
            companyId: _model.owner?.elementAtOrNull(loop1Index)?.reference,
            companyName: _model.owner?.elementAtOrNull(loop1Index)?.name,
          ));
          safeSetState(() {});
        }
      }
      _model.myWorked = await queryMyWorkedWorkPlaceRecordOnce(
        parent: currentUserReference,
        queryBuilder: (myWorkedWorkPlaceRecord) => myWorkedWorkPlaceRecord
            .where(
              'isDelete',
              isEqualTo: false,
            )
            .where(
              'isWorking',
              isEqualTo: true,
            ),
      );
      if (_model.myWorked != null && (_model.myWorked)!.isNotEmpty) {
        for (int loop2Index = 0;
            loop2Index < _model.myWorked!.length;
            loop2Index++) {
          final currentLoop2Item = _model.myWorked![loop2Index];
          _model.addToCompanies(CompaniesStruct(
            companyId: currentLoop2Item.company,
            companyName: currentLoop2Item.copmanyName,
          ));
          safeSetState(() {});
        }
      }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'Şirket Seç',
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
          child: Builder(
            builder: (context) {
              final company = _model.companies.toList();

              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: company.length,
                itemBuilder: (context, companyIndex) {
                  final companyItem = company[companyIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 8,
                                child: Text(
                                  valueOrDefault<String>(
                                    companyItem.companyName,
                                    'companyName',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            CompanyConfirmationsPageWidget
                                                .routeName,
                                            queryParameters: {
                                              'company': serializeParam(
                                                companyItem.companyId,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'Seç',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF0200FF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          hoverColor: Color(0xFFFF0003),
                                          hoverTextColor: Colors.white,
                                        ),
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
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
