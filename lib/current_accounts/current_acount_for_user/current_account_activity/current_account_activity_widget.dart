import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_account_activity_model.dart';
export 'current_account_activity_model.dart';

class CurrentAccountActivityWidget extends StatefulWidget {
  const CurrentAccountActivityWidget({super.key});

  static String routeName = 'currentAccountActivity';
  static String routePath = '/currentAccountActivity';

  @override
  State<CurrentAccountActivityWidget> createState() =>
      _CurrentAccountActivityWidgetState();
}

class _CurrentAccountActivityWidgetState
    extends State<CurrentAccountActivityWidget> with TickerProviderStateMixin {
  late CurrentAccountActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentAccountActivityModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.myCompanies = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
      );
      _model.currentAccountCount = await queryNotificationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where(
              'type',
              isEqualTo: NotificationTypes.currentAccountRequest.name,
            )
            .where(
              'isAccept',
              isEqualTo: false,
            ),
      );
      _model.currentAccountBillCount = await queryNotificationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where(
              'type',
              isEqualTo: NotificationTypes.currentAccountBillRequest.name,
            )
            .where(
              'isAccept',
              isEqualTo: false,
            ),
      );
      _model.currentAccountPaidCount = await queryNotificationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where(
              'type',
              isEqualTo:
                  NotificationTypes.setCurrentAccountBillPaidRequest.name,
            )
            .where(
              'isAccept',
              isEqualTo: false,
            ),
      );
      _model.currentAccountMatchCount = await queryNotificationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where(
              'type',
              isEqualTo: NotificationTypes.matchCurrentAccount.name,
            )
            .where(
              'isAccept',
              isEqualTo: false,
            ),
      );
      _model.requestForSetPaid = _model.currentAccountPaidCount;
      _model.requestForCurrentAccountCount = _model.currentAccountCount;
      _model.requestForCurrentAccountBillCount = _model.currentAccountBillCount;
      _model.requestForMatchCurrentAccount = _model.currentAccountMatchCount!;
      safeSetState(() {});
      if (_model.myCompanies != null && (_model.myCompanies)!.isNotEmpty) {
        _model.myCompaniesCurrentAccounts = await queryCurrentAccountRecordOnce(
          queryBuilder: (currentAccountRecord) =>
              currentAccountRecord.where(Filter.or(
            filterIn('sideOneID',
                _model.myCompanies?.map((e) => e.reference.id).toList()),
            filterIn('sideTwoID',
                _model.myCompanies?.map((e) => e.reference.id).toList()),
          )),
        );
        if (_model.myCompaniesCurrentAccounts != null &&
            (_model.myCompaniesCurrentAccounts)!.isNotEmpty) {
          for (int loop1Index = 0;
              loop1Index <
                  _model.myCompaniesCurrentAccounts!
                      .where((e) => e.isAccepted == true)
                      .toList()
                      .length;
              loop1Index++) {
            final currentLoop1Item = _model.myCompaniesCurrentAccounts!
                .where((e) => e.isAccepted == true)
                .toList()[loop1Index];
            _model.amISideOne = await actions.currentAccountAmISideOne(
              currentLoop1Item.sideOneID,
              _model.myCompanies!.map((e) => e.reference.id).toList().toList(),
            );
            if (_model.amISideOne!) {
              _model.totalMoney =
                  _model.totalMoney! + currentLoop1Item.totalValueForSideOne;
              _model.counterPartyType = currentLoop1Item.sideTwoType;
              safeSetState(() {});
              if (_model.counterPartyType == 'Şirket') {
                _model.company = await actions.getCompanyDocRef(
                  currentLoop1Item.sideTwoID,
                );
                _model.companyDetail =
                    await CompaniesRecord.getDocumentOnce(_model.company!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop1Item.sideOneType,
                  sideOneId: currentLoop1Item.sideOneID,
                  sideTwoType: currentLoop1Item.sideTwoType,
                  sideTwoId: currentLoop1Item.sideTwoID,
                  creationTime: currentLoop1Item.creationTime,
                  status: currentLoop1Item.status,
                  totalValueForSideOne: currentLoop1Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop1Item.totalValueForSideTwo,
                  currentAccountId: currentLoop1Item.reference,
                  totalBillCount: currentLoop1Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop1Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOne,
                  counterPartyName: _model.companyDetail?.name,
                ));
                _model.myCompaniesCurrentAccountsCount =
                    _model.myCompaniesCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop1Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop1Item.totalUnPaidBillCount;
                safeSetState(() {});
              } else {
                _model.user = await actions.getUserDocRef(
                  currentLoop1Item.sideTwoID,
                );
                _model.userDetail =
                    await UsersRecord.getDocumentOnce(_model.user!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop1Item.sideOneType,
                  sideOneId: currentLoop1Item.sideOneID,
                  sideTwoType: currentLoop1Item.sideTwoType,
                  sideTwoId: currentLoop1Item.sideTwoID,
                  creationTime: currentLoop1Item.creationTime,
                  status: currentLoop1Item.status,
                  totalValueForSideOne: currentLoop1Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop1Item.totalValueForSideTwo,
                  currentAccountId: currentLoop1Item.reference,
                  totalBillCount: currentLoop1Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop1Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOne,
                  counterPartyName: _model.userDetail?.displayName,
                ));
                _model.myCompaniesCurrentAccountsCount =
                    _model.myCompaniesCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop1Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop1Item.totalUnPaidBillCount;
                safeSetState(() {});
              }
            } else {
              _model.totalMoney =
                  _model.totalMoney! + currentLoop1Item.totalValueForSideTwo;
              _model.counterPartyType = currentLoop1Item.sideTwoType;
              safeSetState(() {});
              if (_model.counterPartyType == 'Şirket') {
                _model.company2 = await actions.getCompanyDocRef(
                  currentLoop1Item.sideOneID,
                );
                _model.companyDetail2 =
                    await CompaniesRecord.getDocumentOnce(_model.company2!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop1Item.sideOneType,
                  sideOneId: currentLoop1Item.sideOneID,
                  sideTwoType: currentLoop1Item.sideTwoType,
                  sideTwoId: currentLoop1Item.sideTwoID,
                  creationTime: currentLoop1Item.creationTime,
                  status: currentLoop1Item.status,
                  totalValueForSideOne: currentLoop1Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop1Item.totalValueForSideTwo,
                  currentAccountId: currentLoop1Item.reference,
                  totalBillCount: currentLoop1Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop1Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOne,
                  counterPartyName: _model.companyDetail2?.name,
                ));
                _model.myCompaniesCurrentAccountsCount =
                    _model.myCompaniesCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop1Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop1Item.totalUnPaidBillCount;
                safeSetState(() {});
              } else {
                _model.user2 = await actions.getUserDocRef(
                  currentLoop1Item.sideOneID,
                );
                _model.userDetail2 =
                    await UsersRecord.getDocumentOnce(_model.user2!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop1Item.sideOneType,
                  sideOneId: currentLoop1Item.sideOneID,
                  sideTwoType: currentLoop1Item.sideTwoType,
                  sideTwoId: currentLoop1Item.sideTwoID,
                  creationTime: currentLoop1Item.creationTime,
                  status: currentLoop1Item.status,
                  totalValueForSideOne: currentLoop1Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop1Item.totalValueForSideTwo,
                  currentAccountId: currentLoop1Item.reference,
                  totalBillCount: currentLoop1Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop1Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOne,
                  counterPartyName: _model.userDetail2?.displayName,
                ));
                _model.myCompaniesCurrentAccountsCount =
                    _model.myCompaniesCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop1Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop1Item.totalUnPaidBillCount;
                safeSetState(() {});
              }
            }
          }
        }
      }
      _model.partnerCompanies = await queryCompaniesRecordOnce(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'partners',
          arrayContains: currentUserReference,
        ),
      );
      if (_model.partnerCompanies != null &&
          (_model.partnerCompanies)!.isNotEmpty) {
        _model.partnersCurrentAccounts = await queryCurrentAccountRecordOnce(
          queryBuilder: (currentAccountRecord) =>
              currentAccountRecord.where(Filter.or(
            filterIn('sideOneID',
                _model.myCompanies?.map((e) => e.reference.id).toList()),
            filterIn('sideTwoID',
                _model.partnerCompanies?.map((e) => e.reference.id).toList()),
          )),
        );
        if (_model.partnersCurrentAccounts != null &&
            (_model.partnersCurrentAccounts)!.isNotEmpty) {
          for (int loop2Index = 0;
              loop2Index <
                  _model.partnersCurrentAccounts!
                      .where((e) => e.isAccepted)
                      .toList()
                      .length;
              loop2Index++) {
            final currentLoop2Item = _model.partnersCurrentAccounts!
                .where((e) => e.isAccepted)
                .toList()[loop2Index];
            _model.amISideOnePartner = await actions.currentAccountAmISideOne(
              currentLoop2Item.sideOneID,
              _model.partnerCompanies!
                  .map((e) => e.reference.id)
                  .toList()
                  .toList(),
            );
            if (_model.amISideOnePartner!) {
              _model.totalMoney =
                  _model.totalMoney! + currentLoop2Item.totalValueForSideOne;
              _model.counterPartyType = currentLoop2Item.sideTwoType;
              safeSetState(() {});
              if (_model.counterPartyType == 'Şirket') {
                _model.company3 = await actions.getCompanyDocRef(
                  currentLoop2Item.sideTwoID,
                );
                _model.companyDetail3 =
                    await CompaniesRecord.getDocumentOnce(_model.company3!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop2Item.sideOneType,
                  sideOneId: currentLoop2Item.sideOneID,
                  sideTwoType: currentLoop2Item.sideTwoType,
                  sideTwoId: currentLoop2Item.sideTwoID,
                  creationTime: currentLoop2Item.creationTime,
                  status: currentLoop2Item.status,
                  totalValueForSideOne: currentLoop2Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop2Item.totalValueForSideTwo,
                  currentAccountId: currentLoop2Item.reference,
                  totalBillCount: currentLoop2Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop2Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOnePartner,
                  counterPartyName: _model.companyDetail3?.name,
                ));
                _model.partnerCompanyCurrentAccountsCount =
                    _model.partnerCompanyCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop2Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop2Item.totalUnPaidBillCount;
                safeSetState(() {});
              } else {
                _model.user3 = await actions.getUserDocRef(
                  currentLoop2Item.sideTwoID,
                );
                _model.userDetail3 =
                    await UsersRecord.getDocumentOnce(_model.user3!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop2Item.sideOneType,
                  sideOneId: currentLoop2Item.sideOneID,
                  sideTwoType: currentLoop2Item.sideTwoType,
                  sideTwoId: currentLoop2Item.sideTwoID,
                  creationTime: currentLoop2Item.creationTime,
                  status: currentLoop2Item.status,
                  totalValueForSideOne: currentLoop2Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop2Item.totalValueForSideTwo,
                  currentAccountId: currentLoop2Item.reference,
                  totalBillCount: currentLoop2Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop2Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOnePartner,
                  counterPartyName: _model.userDetail3?.displayName,
                ));
                _model.partnerCompanyCurrentAccountsCount =
                    _model.partnerCompanyCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop2Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop2Item.totalUnPaidBillCount;
                safeSetState(() {});
              }
            } else {
              _model.totalMoney =
                  _model.totalMoney! + currentLoop2Item.totalValueForSideTwo;
              _model.counterPartyType = currentLoop2Item.sideOneType;
              safeSetState(() {});
              if (_model.counterPartyType == 'Şirket') {
                _model.company4 = await actions.getCompanyDocRef(
                  currentLoop2Item.sideOneID,
                );
                _model.companyDetail4 =
                    await CompaniesRecord.getDocumentOnce(_model.company4!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop2Item.sideOneType,
                  sideOneId: currentLoop2Item.sideOneID,
                  sideTwoType: currentLoop2Item.sideTwoType,
                  sideTwoId: currentLoop2Item.sideTwoID,
                  creationTime: currentLoop2Item.creationTime,
                  status: currentLoop2Item.status,
                  totalValueForSideOne: currentLoop2Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop2Item.totalValueForSideTwo,
                  currentAccountId: currentLoop2Item.reference,
                  totalBillCount: currentLoop2Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop2Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOnePartner,
                  counterPartyName: _model.companyDetail4?.name,
                ));
                _model.partnerCompanyCurrentAccountsCount =
                    _model.partnerCompanyCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop2Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop2Item.totalUnPaidBillCount;
                safeSetState(() {});
              } else {
                _model.user4 = await actions.getUserDocRef(
                  currentLoop2Item.sideOneID,
                );
                _model.userDetail4 =
                    await UsersRecord.getDocumentOnce(_model.user4!);
                _model.addToCurrentAccounts(AllCurrentAccountStruct(
                  sideOneType: currentLoop2Item.sideOneType,
                  sideOneId: currentLoop2Item.sideOneID,
                  sideTwoType: currentLoop2Item.sideTwoType,
                  sideTwoId: currentLoop2Item.sideTwoID,
                  creationTime: currentLoop2Item.creationTime,
                  status: currentLoop2Item.status,
                  totalValueForSideOne: currentLoop2Item.totalValueForSideOne,
                  totalValueForSideTwo: currentLoop2Item.totalValueForSideTwo,
                  currentAccountId: currentLoop2Item.reference,
                  totalBillCount: currentLoop2Item.totalBillCount,
                  totalUnPaidBillCount: currentLoop2Item.totalUnPaidBillCount,
                  amISideOne: _model.amISideOnePartner,
                  counterPartyName: _model.userDetail4?.displayName,
                ));
                _model.partnerCompanyCurrentAccountsCount =
                    _model.partnerCompanyCurrentAccountsCount + 1;
                _model.totalBillCount =
                    _model.totalBillCount + currentLoop2Item.totalBillCount;
                _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                    currentLoop2Item.totalUnPaidBillCount;
                safeSetState(() {});
              }
            }
          }
        }
      }
      _model.personalCurrentAccounts = await queryCurrentAccountRecordOnce(
        queryBuilder: (currentAccountRecord) =>
            currentAccountRecord.where(Filter.or(
          Filter(
            'sideOneID',
            isEqualTo: currentUserReference?.id,
          ),
          Filter(
            'sideTwoID',
            isEqualTo: currentUserReference?.id,
          ),
        )),
      );
      if (_model.personalCurrentAccounts != null &&
          (_model.personalCurrentAccounts)!.isNotEmpty) {
        for (int loop3Index = 0;
            loop3Index <
                _model.personalCurrentAccounts!
                    .where((e) => e.isAccepted)
                    .toList()
                    .length;
            loop3Index++) {
          final currentLoop3Item = _model.personalCurrentAccounts!
              .where((e) => e.isAccepted)
              .toList()[loop3Index];
          _model.amISideOnePersonal = await actions.isEqualRef(
            currentLoop3Item.sideOneID,
            currentUserReference!,
          );
          if (_model.amISideOnePersonal!) {
            _model.totalMoney =
                _model.totalMoney! + currentLoop3Item.totalValueForSideOne;
            _model.counterPartyType = currentLoop3Item.sideTwoType;
            safeSetState(() {});
            if (_model.counterPartyType == 'Şirket') {
              _model.company5 = await actions.getCompanyDocRef(
                currentLoop3Item.sideTwoID,
              );
              _model.companyDetail5 =
                  await CompaniesRecord.getDocumentOnce(_model.company5!);
              _model.addToCurrentAccounts(AllCurrentAccountStruct(
                sideOneType: currentLoop3Item.sideOneType,
                sideOneId: currentLoop3Item.sideOneID,
                sideTwoType: currentLoop3Item.sideTwoType,
                sideTwoId: currentLoop3Item.sideTwoID,
                creationTime: currentLoop3Item.creationTime,
                status: currentLoop3Item.status,
                totalValueForSideOne: currentLoop3Item.totalValueForSideOne,
                totalValueForSideTwo: currentLoop3Item.totalValueForSideTwo,
                currentAccountId: currentLoop3Item.reference,
                totalBillCount: currentLoop3Item.totalBillCount,
                totalUnPaidBillCount: currentLoop3Item.totalUnPaidBillCount,
                amISideOne: _model.amISideOnePersonal,
                counterPartyName: _model.companyDetail5?.name,
              ));
              _model.totalBillCount =
                  _model.totalBillCount + currentLoop3Item.totalBillCount;
              _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                  currentLoop3Item.totalUnPaidBillCount;
              _model.personalCurrentAccountsCount =
                  _model.personalCurrentAccountsCount + 1;
              safeSetState(() {});
            } else {
              _model.user5 = await actions.getUserDocRef(
                currentLoop3Item.sideTwoID,
              );
              _model.userDetail5 =
                  await UsersRecord.getDocumentOnce(_model.user5!);
              _model.addToCurrentAccounts(AllCurrentAccountStruct(
                sideOneType: currentLoop3Item.sideOneType,
                sideOneId: currentLoop3Item.sideOneID,
                sideTwoType: currentLoop3Item.sideTwoType,
                sideTwoId: currentLoop3Item.sideTwoID,
                creationTime: currentLoop3Item.creationTime,
                status: currentLoop3Item.status,
                totalValueForSideOne: currentLoop3Item.totalValueForSideOne,
                totalValueForSideTwo: currentLoop3Item.totalValueForSideTwo,
                currentAccountId: currentLoop3Item.reference,
                totalBillCount: currentLoop3Item.totalBillCount,
                totalUnPaidBillCount: currentLoop3Item.totalUnPaidBillCount,
                amISideOne: _model.amISideOnePersonal,
                counterPartyName: _model.userDetail5?.displayName,
              ));
              _model.totalBillCount =
                  _model.totalBillCount + currentLoop3Item.totalBillCount;
              _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                  currentLoop3Item.totalUnPaidBillCount;
              _model.personalCurrentAccountsCount =
                  _model.personalCurrentAccountsCount + 1;
              safeSetState(() {});
            }
          } else {
            _model.totalMoney =
                _model.totalMoney! + currentLoop3Item.totalValueForSideTwo;
            _model.counterPartyType = currentLoop3Item.sideOneType;
            safeSetState(() {});
            if (_model.counterPartyType == 'Şirket') {
              _model.company6 = await actions.getCompanyDocRef(
                currentLoop3Item.sideOneID,
              );
              _model.companyDetail6 =
                  await CompaniesRecord.getDocumentOnce(_model.company6!);
              _model.addToCurrentAccounts(AllCurrentAccountStruct(
                sideOneType: currentLoop3Item.sideOneType,
                sideOneId: currentLoop3Item.sideOneID,
                sideTwoType: currentLoop3Item.sideTwoType,
                sideTwoId: currentLoop3Item.sideTwoID,
                creationTime: currentLoop3Item.creationTime,
                status: currentLoop3Item.status,
                totalValueForSideOne: currentLoop3Item.totalValueForSideOne,
                totalValueForSideTwo: currentLoop3Item.totalValueForSideTwo,
                currentAccountId: currentLoop3Item.reference,
                totalBillCount: currentLoop3Item.totalBillCount,
                totalUnPaidBillCount: currentLoop3Item.totalUnPaidBillCount,
                amISideOne: _model.amISideOnePersonal,
                counterPartyName: _model.companyDetail6?.name,
              ));
              _model.totalBillCount =
                  _model.totalBillCount + currentLoop3Item.totalBillCount;
              _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                  currentLoop3Item.totalUnPaidBillCount;
              _model.personalCurrentAccountsCount =
                  _model.personalCurrentAccountsCount + 1;
              safeSetState(() {});
            } else {
              _model.user6 = await actions.getUserDocRef(
                currentLoop3Item.sideOneID,
              );
              _model.userDetail6 =
                  await UsersRecord.getDocumentOnce(_model.user6!);
              _model.addToCurrentAccounts(AllCurrentAccountStruct(
                sideOneType: currentLoop3Item.sideOneType,
                sideOneId: currentLoop3Item.sideOneID,
                sideTwoType: currentLoop3Item.sideTwoType,
                sideTwoId: currentLoop3Item.sideTwoID,
                creationTime: currentLoop3Item.creationTime,
                status: currentLoop3Item.status,
                totalValueForSideOne: currentLoop3Item.totalValueForSideOne,
                totalValueForSideTwo: currentLoop3Item.totalValueForSideTwo,
                currentAccountId: currentLoop3Item.reference,
                totalBillCount: currentLoop3Item.totalBillCount,
                totalUnPaidBillCount: currentLoop3Item.totalUnPaidBillCount,
                amISideOne: _model.amISideOnePersonal,
                counterPartyName: _model.userDetail6?.displayName,
              ));
              _model.totalBillCount =
                  _model.totalBillCount + currentLoop3Item.totalBillCount;
              _model.totalUnpaidBillCount = _model.totalUnpaidBillCount +
                  currentLoop3Item.totalUnPaidBillCount;
              _model.personalCurrentAccountsCount =
                  _model.personalCurrentAccountsCount + 1;
              safeSetState(() {});
            }
          }
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(CurrentAccountCreatePageWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Cari Hesaplarım',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 140.0,
                  constraints: BoxConstraints(
                    maxHeight: 140.0,
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
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 8.0, 8.0),
                                    child: Container(
                                      width: 150.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model
                                                    .personalCurrentAccountsCount
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Kişisel Cari Hesaplarınız',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 8.0),
                                    child: Container(
                                      width: 150.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model
                                                    .myCompaniesCurrentAccountsCount
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Sahibi Olduğunuz Şirketlerin Cari Hesapları',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 8.0),
                                    child: Container(
                                      width: 150.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model
                                                    .partnerCompanyCurrentAccountsCount
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Ortağı Olduğunuz Şirketlerin Cari Hesapları',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 8.0, 8.0),
                            child: Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model.requestForCurrentAccountCount
                                                ?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                CurrentAccountRequestPageForUserWidget
                                                    .routeName);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Bekleyen Cari Hesap Davetiyeleri',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model
                                                .requestForCurrentAccountBillCount
                                                ?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              CurrentAccountBillRequestsPageForUserWidget
                                                  .routeName,
                                              queryParameters: {
                                                'forPaid': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Bekleyen Fatura Onayları',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model.requestForSetPaid
                                                ?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              CurrentAccountBillRequestsPageForUserWidget
                                                  .routeName,
                                              queryParameters: {
                                                'forPaid': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Bekleyen Fatura Ödendi Onaylamaları',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 8.0, 8.0),
                            child: Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model.requestForMatchCurrentAccount
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                MatchCurrentAccountRequestesPageWidget
                                                    .routeName);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Bekleyen Cari Hesap Eşleştirmeleri',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation4']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 8.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Beklenen Gelirler',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ExpectedIncomeUserBillPageWidget
                                                    .routeName);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 16.0, 8.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Beklenen Giderler',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ExpectedPaymentBillUserPageWidget
                                                    .routeName);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation9']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Faturaların Durumu',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          _model.totalUnpaidBillCount
                                              .toString(),
                                          '0',
                                        )}/${valueOrDefault<String>(
                                          _model.totalBillCount.toString(),
                                          '0',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'ödenmemiş/Tüm Faturalar',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          _model.totalMoney?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Toplam Cari Hesap Tutarı',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation12']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 12.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tüm Cari Hesaplar',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Tüm Cari Hesaplarınız',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Builder(
                            builder: (context) {
                              final currentAccount =
                                  _model.currentAccounts.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: currentAccount.length,
                                itemBuilder: (context, currentAccountIndex) {
                                  final currentAccountItem =
                                      currentAccount[currentAccountIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: Color(0xFFE0E3E7),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              height: 100.0,
                                              child: VerticalDivider(
                                                width: 24.0,
                                                thickness: 4.0,
                                                indent: 12.0,
                                                endIndent: 12.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 12.0, 16.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Siz: ${currentAccountItem.amISideOne ? currentAccountItem.sideOneType : currentAccountItem.sideTwoType}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              CurrentAccountBillsPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentAccount':
                                                                    serializeParam(
                                                                  currentAccountItem,
                                                                  ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        currentAccountItem
                                                            .counterPartyName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Oluşturma Tarihi',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  "d/M/y",
                                                                  currentAccountItem
                                                                      .creationTime!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation13']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
