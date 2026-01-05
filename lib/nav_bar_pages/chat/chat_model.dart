import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/new_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> workPlaces = [];
  void addToWorkPlaces(DocumentReference item) => workPlaces.add(item);
  void removeFromWorkPlaces(DocumentReference item) => workPlaces.remove(item);
  void removeAtIndexFromWorkPlaces(int index) => workPlaces.removeAt(index);
  void insertAtIndexInWorkPlaces(int index, DocumentReference item) =>
      workPlaces.insert(index, item);
  void updateWorkPlacesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      workPlaces[index] = updateFn(workPlaces[index]);

  List<DocumentReference> companies = [];
  void addToCompanies(DocumentReference item) => companies.add(item);
  void removeFromCompanies(DocumentReference item) => companies.remove(item);
  void removeAtIndexFromCompanies(int index) => companies.removeAt(index);
  void insertAtIndexInCompanies(int index, DocumentReference item) =>
      companies.insert(index, item);
  void updateCompaniesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      companies[index] = updateFn(companies[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in chat widget.
  List<MessageRecord>? messageForSync;
  // Stores action output result for [Firestore Query - Query a collection] action in chat widget.
  List<CompaniesRecord>? ownerCompanies;
  // Stores action output result for [Firestore Query - Query a collection] action in chat widget.
  MyWorkedWorkPlaceRecord? myWorkedCompany;
  // Stores action output result for [Backend Call - SQLite (getWorkersWithoutSpeech)] action in chat widget.
  List<GetWorkersWithoutSpeechRow>? workersList;
  // Stores action output result for [Backend Call - SQLite (getPhonesWithoutSpeech)] action in chat widget.
  List<GetPhonesWithoutSpeechRow>? phonesWithoutSpeech;
  // Stores action output result for [Backend Call - SQLite (getNonUserPhones)] action in chat widget.
  List<GetNonUserPhonesRow>? nonUserPhones;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextFieldPhone widget.
  FocusNode? textFieldPhoneFocusNode;
  TextEditingController? textFieldPhoneTextController;
  String? Function(BuildContext, String?)?
      textFieldPhoneTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (searchPhoneNonUserByName)] action in TextFieldPhone widget.
  List<SearchPhoneNonUserByNameRow>? searchResultPhoneNonUser;
  // Stores action output result for [Backend Call - SQLite (searchPhoneByName)] action in TextFieldPhone widget.
  List<SearchPhoneByNameRow>? searchResultPhoneUser;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationNamePhone;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdPhone;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Phone;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Phone;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Container widget.
  MessageRecord? confirmationPhone;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationNamePhoneCopy;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdCopy;
  // Stores action output result for [Custom Action - getUserDocRef] action in Container widget.
  DocumentReference? userPhoneDocumentRef;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? userPhoneDocumentFB;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Container widget.
  MessageRecord? confirmationPhoneCopy;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationNamePhoneCopy2;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdCopy2;
  // Stores action output result for [Custom Action - getUserDocRef] action in Container widget.
  DocumentReference? userPhoneDocumentRef2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? userPhoneDocumentFB2;
  // State field(s) for TextFieldWorkplace widget.
  FocusNode? textFieldWorkplaceFocusNode;
  TextEditingController? textFieldWorkplaceTextController;
  String? Function(BuildContext, String?)?
      textFieldWorkplaceTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (searchCompanyWorkersByName)] action in TextFieldWorkplace widget.
  List<SearchCompanyWorkersByNameRow>? searchResultWorkplace;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationName;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationId;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Workplace;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Workplace;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? receiverUserRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUser;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetail;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationWorkplace;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameWorkplace;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlWorkplace;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationWorkplaceCopy;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameWorkplaceCopy;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlWorkplaceCopy;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? receiverUserRefCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUserCopy;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRefCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetailCopy;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationWorkplaceCopy2;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameWorkplaceCopy2;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlWorkplaceCopy2;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationWorkplaceCopy3;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameWorkplaceCopy3;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlWorkplaceCopy3;
  // State field(s) for TextFieldCompany widget.
  FocusNode? textFieldCompanyFocusNode;
  TextEditingController? textFieldCompanyTextController;
  String? Function(BuildContext, String?)?
      textFieldCompanyTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (searchCompanyWorkersByName)] action in TextFieldCompany widget.
  List<SearchCompanyWorkersByNameRow>? searchResultCompany;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationNameCompany;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdCompany;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Company;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Company;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRefCompany;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRefCompany;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUserCompany;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetailCompany;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationCompany;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameCompanySelect;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlCompany;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationCompanyCopy;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameCompanyCopy;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlCompanyCopy;
  // Stores action output result for [Custom Action - getUserDocRef] action in Button widget.
  DocumentReference? userRefCompanyCopy;
  // Stores action output result for [Custom Action - getCompanyDocRef] action in Button widget.
  DocumentReference? companyRefCompanyCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? receiverUserCompanyCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CompaniesRecord? companyDetailCompanyCopy;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationCompanyCopy2;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameCompanySelectCopy;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlCompanyCopy2;
  // Stores action output result for [Custom Action - getOrCreateMessage] action in Button widget.
  MessageRecord? confirmationCompanyCopy3;
  // Stores action output result for [Custom Action - getConversationName] action in Button widget.
  String? conversationNameCompanyCopy2;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Button widget.
  List<GetConversationWithLastMessageRow>? coversationDetailSqlCompanyCopy3;
  // Stores action output result for [Custom Action - getConversationName] action in Container widget.
  String? conversationNameSocial;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Container widget.
  List<GetConversationWithLastMessageRow>? conversationIdSocial;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user2Social;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? user1Social;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, FriendsRecord>?
      listViewPagingController13;
  Query? listViewPagingQuery13;
  List<StreamSubscription?> listViewStreamSubscriptions13 = [];

  // Stores action output result for [Custom Action - getOrCreateMessage] action in Icon widget.
  MessageRecord? confirmationSocial;
  // Stores action output result for [Custom Action - getConversationName] action in Icon widget.
  String? confirmationNameSocial;
  // Stores action output result for [Backend Call - SQLite (getConversationWithLastMessage)] action in Icon widget.
  List<GetConversationWithLastMessageRow>? conversationIdSocialCopy;
  // Model for newNavBar component.
  late NewNavBarModel newNavBarModel;

  @override
  void initState(BuildContext context) {
    newNavBarModel = createModel(context, () => NewNavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldPhoneFocusNode?.dispose();
    textFieldPhoneTextController?.dispose();

    textFieldWorkplaceFocusNode?.dispose();
    textFieldWorkplaceTextController?.dispose();

    textFieldCompanyFocusNode?.dispose();
    textFieldCompanyTextController?.dispose();

    listViewStreamSubscriptions13.forEach((s) => s?.cancel());
    listViewPagingController13?.dispose();

    newNavBarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, FriendsRecord> setListViewController13(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController13 ??= _createListViewController13(query, parent);
    if (listViewPagingQuery13 != query) {
      listViewPagingQuery13 = query;
      listViewPagingController13?.refresh();
    }
    return listViewPagingController13!;
  }

  PagingController<DocumentSnapshot?, FriendsRecord>
      _createListViewController13(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, FriendsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryFriendsRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions13,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
