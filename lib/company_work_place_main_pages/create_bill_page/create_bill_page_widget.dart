import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_bill_page_model.dart';
export 'create_bill_page_model.dart';

class CreateBillPageWidget extends StatefulWidget {
  const CreateBillPageWidget({
    super.key,
    this.companyRef,
  });

  final DocumentReference? companyRef;

  static String routeName = 'createBillPage';
  static String routePath = '/createBillPage';

  @override
  State<CreateBillPageWidget> createState() => _CreateBillPageWidgetState();
}

class _CreateBillPageWidgetState extends State<CreateBillPageWidget> {
  late CreateBillPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateBillPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.indexTotal = 0;
      _model.totalSpending = 0.0;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF090622),
        appBar: AppBar(
          backgroundColor: Color(0xFF090620),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 66.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 36.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 44.0, 0.0),
                child: Text(
                  'Fatura Oluştur',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 16.0,
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
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 4.0),
                  child: StreamBuilder<List<CompaniesRecord>>(
                    stream: queryCompaniesRecord(
                      queryBuilder: (companiesRecord) =>
                          companiesRecord.where(Filter.or(
                        Filter(
                          'owner',
                          isEqualTo: currentUserReference,
                        ),
                        Filter(
                          'partners',
                          arrayContains: currentUserReference,
                        ),
                      )),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CompaniesRecord>
                          whichCompaniesDropDowCompaniesRecordList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller:
                            _model.whichCompaniesDropDowValueController ??=
                                FormFieldController<String>(
                          _model.whichCompaniesDropDowValue ??= 'Other',
                        ),
                        options: List<String>.from(
                            whichCompaniesDropDowCompaniesRecordList
                                .map((e) => e.reference.id)
                                .toList()),
                        optionLabels: whichCompaniesDropDowCompaniesRecordList
                            .map((e) => e.name)
                            .toList(),
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.whichCompaniesDropDowValue = val);
                          _model.companyRefFromDD =
                              await actions.getCompanyDocRef(
                            _model.whichCompaniesDropDowValue!,
                          );

                          safeSetState(() {});
                        },
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
                        hintText: 'Hangi şirketin ?',
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
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 4.0, 30.0, 4.0),
                  child: StreamBuilder<List<WorkPlacesRecord>>(
                    stream: queryWorkPlacesRecord(
                      queryBuilder: (workPlacesRecord) => workPlacesRecord
                          .where(
                            'owner',
                            isEqualTo: currentUserReference,
                          )
                          .where(
                            'isDelete',
                            isEqualTo: false,
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<WorkPlacesRecord>
                          workPlaceDropDownWorkPlacesRecordList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.workPlaceDropDownValueController ??=
                            FormFieldController<String>(
                          _model.workPlaceDropDownValue ??= 'Other',
                        ),
                        options: List<String>.from(
                            workPlaceDropDownWorkPlacesRecordList
                                .map((e) => e.reference.id)
                                .toList()),
                        optionLabels: workPlaceDropDownWorkPlacesRecordList
                            .map((e) => e.name)
                            .toList(),
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.workPlaceDropDownValue = val);
                          _model.workPlaceRefFromDD =
                              await actions.getWorkPlaceDocRef(
                            _model.workPlaceDropDownValue!,
                          );

                          safeSetState(() {});
                        },
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
                        hintText: 'Hangi işyerin ?',
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
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
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
