import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedWorkPlace;

  DocumentReference? selectedCompany;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<NotificationsRecord> simpleSearchResults1 = [];
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitation;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitaitonDocument;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? taskDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? task;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FormFieldsRecord>? formFields;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CompanyWorkersRecord? companyWorker;
  // Stores action output result for [Custom Action - getCompanyTaskDutiesDocRef] action in Container widget.
  DocumentReference? companyTaskDutiesDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTaskDutiesRecord? companyTaskDuties;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? companyTaskDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? companyTask;
  // Stores action output result for [Custom Action - getDutiesForCompanyDocRef] action in Container widget.
  DocumentReference? dutiesForCompanyDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  DutiesForCompanyRecord? notifiDuty;
  // Stores action output result for [Custom Action - getConfirmationDocRef] action in Container widget.
  DocumentReference? confirmationDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ConfirmationsRecord? confirmation;
  // Stores action output result for [Custom Action - getMessageDocRef] action in Container widget.
  DocumentReference? messageRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  MessageRecord? messageDoc;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Container widget.
  MessageRecord? messageDoc2;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationName;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdCompany;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Company;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Company;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<NotificationsRecord>? allSameNotifications;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitationAccept;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitationAcceptDoc;
  // Stores action output result for [Custom Action - getPartnershipInvitationDocRef] action in Container widget.
  DocumentReference? partnershipDocRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  PartnershipInvitationRecord? partnerships;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompaniesRecord? companyDetailPartnership;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  WorkPlacesRecord? workPlaceDetailPartnership;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitationCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitaitonDocumentCpy;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? taskDocRefCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? taskCpy;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FormFieldsRecord>? formFieldsCpy;
  // Stores action output result for [Custom Action - getCompanyTaskDutiesDocRef] action in Container widget.
  DocumentReference? companyTaskDutiesDocRefCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTaskDutiesRecord? companyTaskDutiesCpy;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? companyTaskDocRefCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? companyTaskCpy;
  // Stores action output result for [Custom Action - getDutiesForCompanyDocRef] action in Container widget.
  DocumentReference? dutiesForCompanyDocRefCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  DutiesForCompanyRecord? notifiDutyCpy;
  // Stores action output result for [Custom Action - getConfirmationDocRef] action in Container widget.
  DocumentReference? confirmationDocRefCpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ConfirmationsRecord? confirmationCpy;
  // Stores action output result for [Custom Action - getMessageDocRef] action in Container widget.
  DocumentReference? messageRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  MessageRecord? messageDocCopy;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Container widget.
  MessageRecord? messageDoc2Copy;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationName2;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdCompany2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Company2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Company2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<NotificationsRecord>? allSameNotifications2;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitationAcceptCopy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitationAcceptDocCopy;
  // Stores action output result for [Custom Action - getPartnershipInvitationDocRef] action in Container widget.
  DocumentReference? partnershipDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  PartnershipInvitationRecord? partnerships2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompaniesRecord? companyDetailPartnership2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  WorkPlacesRecord? workPlaceDetailPartnership2;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitation2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitaitonDocument2;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? taskDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? task2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FormFieldsRecord>? formFields2;
  // Stores action output result for [Custom Action - getCompanyTaskDutiesDocRef] action in Container widget.
  DocumentReference? companyTaskDutiesDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTaskDutiesRecord? companyTaskDuties2;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? companyTaskDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? companyTask2;
  // Stores action output result for [Custom Action - getDutiesForCompanyDocRef] action in Container widget.
  DocumentReference? dutiesForCompanyDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  DutiesForCompanyRecord? notifiDuty2;
  // Stores action output result for [Custom Action - getConfirmationDocRef] action in Container widget.
  DocumentReference? confirmationDocRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ConfirmationsRecord? confirmation2;
  // Stores action output result for [Custom Action - getCompanyConfirmaitonDocRef] action in Container widget.
  DocumentReference? confirmationCompany2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyConfirmationsRecord? companyConfirmation2;
  // Stores action output result for [Custom Action - getWorkplaceConfirmaitonDocRef] action in Container widget.
  DocumentReference? confirmationWorkplace2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  WorkplaceConfirmationsRecord? workplaceConfirmation2;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitationAcceptCopy2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitationAcceptDocCopy2;
  // Stores action output result for [Custom Action - getPartnershipDocRef] action in Container widget.
  DocumentReference? partnershipDocRefCopy2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  PartnershipsRecord? partnershipsCopy2;
  // Stores action output result for [Custom Action - getInvitationDocRef] action in Container widget.
  DocumentReference? invitation2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  InvitationsRecord? invitaitonDocument2Cpy;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? taskDocRef2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? task2Cpy;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<FormFieldsRecord>? formFields2Cpy;
  // Stores action output result for [Custom Action - getCompanyTaskDutiesDocRef] action in Container widget.
  DocumentReference? companyTaskDutiesDocRef2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTaskDutiesRecord? companyTaskDuties2Cpy;
  // Stores action output result for [Custom Action - getCompanyTaskDocRef] action in Container widget.
  DocumentReference? companyTaskDocRef2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyTasksRecord? companyTask2Cpy;
  // Stores action output result for [Custom Action - getDutiesForCompanyDocRef] action in Container widget.
  DocumentReference? dutiesForCompanyDocRef2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  DutiesForCompanyRecord? notifiDuty2Cpy;
  // Stores action output result for [Custom Action - getConfirmationDocRef] action in Container widget.
  DocumentReference? confirmationDocRef2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ConfirmationsRecord? confirmation2Cpy;
  // Stores action output result for [Custom Action - getCompanyConfirmaitonDocRef] action in Container widget.
  DocumentReference? confirmationCompany2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyConfirmationsRecord? companyConfirmation2Cpy;
  // Stores action output result for [Custom Action - getWorkplaceConfirmaitonDocRef] action in Container widget.
  DocumentReference? confirmationWorkplace2Cpy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  WorkplaceConfirmationsRecord? workplaceConfirmation2Cpy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<WorkPlaceNotificationsRecord> simpleSearchResults2 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  List<CompanyNotificationsRecord> simpleSearchResults3 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Model for newNavBar component.
  late NewNavBarModel newNavBarModel;

  @override
  void initState(BuildContext context) {
    newNavBarModel = createModel(context, () => NewNavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    newNavBarModel.dispose();
  }
}
