import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dart:math' as math;
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> myWorkedWorkPlaceIds = [];
  void addToMyWorkedWorkPlaceIds(DocumentReference item) =>
      myWorkedWorkPlaceIds.add(item);
  void removeFromMyWorkedWorkPlaceIds(DocumentReference item) =>
      myWorkedWorkPlaceIds.remove(item);
  void removeAtIndexFromMyWorkedWorkPlaceIds(int index) =>
      myWorkedWorkPlaceIds.removeAt(index);
  void insertAtIndexInMyWorkedWorkPlaceIds(int index, DocumentReference item) =>
      myWorkedWorkPlaceIds.insert(index, item);
  void updateMyWorkedWorkPlaceIdsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      myWorkedWorkPlaceIds[index] = updateFn(myWorkedWorkPlaceIds[index]);

  List<MyWorkedWorkPlaceRecord> myWorkedWorkPlace = [];
  void addToMyWorkedWorkPlace(MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.add(item);
  void removeFromMyWorkedWorkPlace(MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.remove(item);
  void removeAtIndexFromMyWorkedWorkPlace(int index) =>
      myWorkedWorkPlace.removeAt(index);
  void insertAtIndexInMyWorkedWorkPlace(
          int index, MyWorkedWorkPlaceRecord item) =>
      myWorkedWorkPlace.insert(index, item);
  void updateMyWorkedWorkPlaceAtIndex(
          int index, Function(MyWorkedWorkPlaceRecord) updateFn) =>
      myWorkedWorkPlace[index] = updateFn(myWorkedWorkPlace[index]);

  double? daily = 0.0;

  List<YesterdayBudgetStruct> yesterdayBudgetListCompany = [];
  void addToYesterdayBudgetListCompany(YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompany.add(item);
  void removeFromYesterdayBudgetListCompany(YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompany.remove(item);
  void removeAtIndexFromYesterdayBudgetListCompany(int index) =>
      yesterdayBudgetListCompany.removeAt(index);
  void insertAtIndexInYesterdayBudgetListCompany(
          int index, YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompany.insert(index, item);
  void updateYesterdayBudgetListCompanyAtIndex(
          int index, Function(YesterdayBudgetStruct) updateFn) =>
      yesterdayBudgetListCompany[index] =
          updateFn(yesterdayBudgetListCompany[index]);

  List<YesterdayBudgetStruct> yesterdayBudgetListWorkplace = [];
  void addToYesterdayBudgetListWorkplace(YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplace.add(item);
  void removeFromYesterdayBudgetListWorkplace(YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplace.remove(item);
  void removeAtIndexFromYesterdayBudgetListWorkplace(int index) =>
      yesterdayBudgetListWorkplace.removeAt(index);
  void insertAtIndexInYesterdayBudgetListWorkplace(
          int index, YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplace.insert(index, item);
  void updateYesterdayBudgetListWorkplaceAtIndex(
          int index, Function(YesterdayBudgetStruct) updateFn) =>
      yesterdayBudgetListWorkplace[index] =
          updateFn(yesterdayBudgetListWorkplace[index]);

  List<YesterdayBudgetStruct> yesterdayBudgetListCompanyPartnership = [];
  void addToYesterdayBudgetListCompanyPartnership(YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompanyPartnership.add(item);
  void removeFromYesterdayBudgetListCompanyPartnership(
          YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompanyPartnership.remove(item);
  void removeAtIndexFromYesterdayBudgetListCompanyPartnership(int index) =>
      yesterdayBudgetListCompanyPartnership.removeAt(index);
  void insertAtIndexInYesterdayBudgetListCompanyPartnership(
          int index, YesterdayBudgetStruct item) =>
      yesterdayBudgetListCompanyPartnership.insert(index, item);
  void updateYesterdayBudgetListCompanyPartnershipAtIndex(
          int index, Function(YesterdayBudgetStruct) updateFn) =>
      yesterdayBudgetListCompanyPartnership[index] =
          updateFn(yesterdayBudgetListCompanyPartnership[index]);

  List<YesterdayBudgetStruct> yesterdayBudgetListWorkplacePartnership = [];
  void addToYesterdayBudgetListWorkplacePartnership(
          YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplacePartnership.add(item);
  void removeFromYesterdayBudgetListWorkplacePartnership(
          YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplacePartnership.remove(item);
  void removeAtIndexFromYesterdayBudgetListWorkplacePartnership(int index) =>
      yesterdayBudgetListWorkplacePartnership.removeAt(index);
  void insertAtIndexInYesterdayBudgetListWorkplacePartnership(
          int index, YesterdayBudgetStruct item) =>
      yesterdayBudgetListWorkplacePartnership.insert(index, item);
  void updateYesterdayBudgetListWorkplacePartnershipAtIndex(
          int index, Function(YesterdayBudgetStruct) updateFn) =>
      yesterdayBudgetListWorkplacePartnership[index] =
          updateFn(yesterdayBudgetListWorkplacePartnership[index]);

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  List<MyWorkedWorkPlaceRecord>? myWorkedWorkPlaceResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  List<CompaniesRecord>? myCompanies;
  // Stores action output result for [Custom Action - getYesterdayCompanyBudget] action in Profile widget.
  BudgetStruct? companyBudget;
  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  List<WorkPlacesRecord>? ownerWorkplaces;
  // Stores action output result for [Custom Action - getYesterdayWorkplaceBudget] action in Profile widget.
  BudgetStruct? workplaceYesterdayBudget;
  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  List<PartnershipsRecord>? ownerPartnerships;
  // Stores action output result for [Custom Action - getYesterdayCompanyBudget] action in Profile widget.
  BudgetStruct? yesterdayCompanyPartnership;
  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  List<WorkPlacePartnershipRecord>? ownerWorkplacePartnerships;
  // Stores action output result for [Custom Action - getYesterdayWorkplaceBudget] action in Profile widget.
  BudgetStruct? yesterdayWorkplacePartnershi;
  // Stores action output result for [Custom Action - isBeforeToday] action in Profile widget.
  bool? canAdded;
  // Stores action output result for [Custom Action - calculateDailySalary] action in Profile widget.
  double? salary;
  // Stores action output result for [Custom Action - getUserCity] action in Profile widget.
  String? userCity;
  // Stores action output result for [Custom Action - cityDocumentName] action in Profile widget.
  String? userCityDocumentId;
  // Stores action output result for [Custom Action - getCityDocRef] action in Profile widget.
  DocumentReference? userCityDocumentRef;
  // Stores action output result for [Custom Action - getMetricDocRef] action in Container widget.
  DocumentReference? metricDocRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<FormFieldsRecord>? formFields;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  NotificationsRecord? notificationTask;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  NotificationsRecord? notifiDuty;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompaniesRecord? companyDetailCopy;
  // Model for newNavBar component.
  late NewNavBarModel newNavBarModel;

  @override
  void initState(BuildContext context) {
    newNavBarModel = createModel(context, () => NewNavBarModel());
  }

  @override
  void dispose() {
    newNavBarModel.dispose();
  }
}
