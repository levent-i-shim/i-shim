import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/backend/sqlite/sqlite_manager.dart';
import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? ProfileWidget() : AuthenticationWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? ProfileWidget()
              : AuthenticationWidget(),
        ),
        FFRoute(
          name: SettingsEditProfileWidget.routeName,
          path: SettingsEditProfileWidget.routePath,
          builder: (context, params) => SettingsEditProfileWidget(),
        ),
        FFRoute(
          name: KurulumWidget.routeName,
          path: KurulumWidget.routePath,
          builder: (context, params) => KurulumWidget(),
        ),
        FFRoute(
          name: InvitationMainWidget.routeName,
          path: InvitationMainWidget.routePath,
          builder: (context, params) => InvitationMainWidget(),
        ),
        FFRoute(
          name: KurWidget.routeName,
          path: KurWidget.routePath,
          builder: (context, params) => KurWidget(),
        ),
        FFRoute(
          name: SirketKurWidget.routeName,
          path: SirketKurWidget.routePath,
          builder: (context, params) => SirketKurWidget(
            invitation: params.getParam(
              'invitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: LimitedSirketKurWidget.routeName,
          path: LimitedSirketKurWidget.routePath,
          builder: (context, params) => LimitedSirketKurWidget(
            companyType: params.getParam(
              'companyType',
              ParamType.String,
            ),
            invitation: params.getParam(
              'invitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: OfisKurWidget.routeName,
          path: OfisKurWidget.routePath,
          builder: (context, params) => OfisKurWidget(
            invtitation: params.getParam(
              'invtitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: IsyerikurWidget.routeName,
          path: IsyerikurWidget.routePath,
          builder: (context, params) => IsyerikurWidget(
            invitation: params.getParam(
              'invitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: FabrikaKurWidget.routeName,
          path: FabrikaKurWidget.routePath,
          builder: (context, params) => FabrikaKurWidget(
            invitation: params.getParam(
              'invitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SantiyeKurWidget.routeName,
          path: SantiyeKurWidget.routePath,
          builder: (context, params) => SantiyeKurWidget(
            invitation: params.getParam(
              'invitation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlacesDetailPageWidget.routeName,
          path: WorkPlacesDetailPageWidget.routePath,
          builder: (context, params) => WorkPlacesDetailPageWidget(
            companyId: params.getParam(
              'companyId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitationOldWidget.routeName,
          path: WorkerInvitationOldWidget.routePath,
          builder: (context, params) => WorkerInvitationOldWidget(),
        ),
        FFRoute(
          name: OrtaklkKurWidget.routeName,
          path: OrtaklkKurWidget.routePath,
          builder: (context, params) => OrtaklkKurWidget(),
        ),
        FFRoute(
          name: CalisanDavetEtPage2Widget.routeName,
          path: CalisanDavetEtPage2Widget.routePath,
          builder: (context, params) => CalisanDavetEtPage2Widget(),
        ),
        FFRoute(
          name: ReceivedInvitationsWidget.routeName,
          path: ReceivedInvitationsWidget.routePath,
          builder: (context, params) => ReceivedInvitationsWidget(),
        ),
        FFRoute(
          name: SentInvitationsWidget.routeName,
          path: SentInvitationsWidget.routePath,
          builder: (context, params) => SentInvitationsWidget(),
        ),
        FFRoute(
          name: DepartmantsPageWidget.routeName,
          path: DepartmantsPageWidget.routePath,
          builder: (context, params) => DepartmantsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canAddDepartmnet: params.getParam(
              'canAddDepartmnet',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddDepartmentWidget.routeName,
          path: AddDepartmentWidget.routePath,
          builder: (context, params) => AddDepartmentWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: DepartmentEmployessWidget.routeName,
          path: DepartmentEmployessWidget.routePath,
          asyncParams: {
            'department': getDoc(['companies', 'companyDepartments'],
                CompanyDepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => DepartmentEmployessWidget(
            department: params.getParam(
              'department',
              ParamType.Document,
            ),
            departmentName: params.getParam(
              'departmentName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RolesPageWidget.routeName,
          path: RolesPageWidget.routePath,
          builder: (context, params) => RolesPageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canAddRole: params.getParam(
              'canAddRole',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddRolePageWidget.routeName,
          path: AddRolePageWidget.routePath,
          builder: (context, params) => AddRolePageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyTasksPageWidget.routeName,
          path: CompanyTasksPageWidget.routePath,
          builder: (context, params) => CompanyTasksPageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTaskAddWidget.routeName,
          path: CompanyTaskAddWidget.routePath,
          builder: (context, params) => CompanyTaskAddWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: InvitationDetailWidget.routeName,
          path: InvitationDetailWidget.routePath,
          asyncParams: {
            'invitations': getDoc(
                ['users', 'invitations'], InvitationsRecord.fromSnapshot),
          },
          builder: (context, params) => InvitationDetailWidget(
            invitations: params.getParam(
              'invitations',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SendInvitationDetailWidget.routeName,
          path: SendInvitationDetailWidget.routePath,
          asyncParams: {
            'invitation': getDoc(
                ['users', 'invitations'], InvitationsRecord.fromSnapshot),
          },
          builder: (context, params) => SendInvitationDetailWidget(
            invitation: params.getParam(
              'invitation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation01UserWidget.routeName,
          path: WorkerInvitation01UserWidget.routePath,
          builder: (context, params) => WorkerInvitation01UserWidget(
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation02CompaniesWidget.routeName,
          path: WorkerInvitation02CompaniesWidget.routePath,
          builder: (context, params) => WorkerInvitation02CompaniesWidget(
            workerID: params.getParam(
              'workerID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerName: params.getParam(
              'workerName',
              ParamType.String,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation03WorkPlaceWidget.routeName,
          path: WorkerInvitation03WorkPlaceWidget.routePath,
          builder: (context, params) => WorkerInvitation03WorkPlaceWidget(
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workerRef: params.getParam(
              'workerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerName: params.getParam(
              'workerName',
              ParamType.String,
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation04UnitWidget.routeName,
          path: WorkerInvitation04UnitWidget.routePath,
          builder: (context, params) => WorkerInvitation04UnitWidget(
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workerRef: params.getParam(
              'workerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerName: params.getParam(
              'workerName',
              ParamType.String,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            workPlaceName: params.getParam(
              'workPlaceName',
              ParamType.String,
            ),
            department: params.getParam(
              'department',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyDepartments'],
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation05DepartmentWidget.routeName,
          path: WorkerInvitation05DepartmentWidget.routePath,
          builder: (context, params) => WorkerInvitation05DepartmentWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            wokerName: params.getParam(
              'wokerName',
              ParamType.String,
            ),
            workerRef: params.getParam(
              'workerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerPlace: params.getParam(
              'workerPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            workPlaceName: params.getParam(
              'workPlaceName',
              ParamType.String,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation06RoleWidget.routeName,
          path: WorkerInvitation06RoleWidget.routePath,
          builder: (context, params) => WorkerInvitation06RoleWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workerName: params.getParam(
              'workerName',
              ParamType.String,
            ),
            workerRef: params.getParam(
              'workerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerPlace: params.getParam(
              'workerPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workerUnit: params.getParam(
              'workerUnit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyUnits'],
            ),
            workerDepartment: params.getParam(
              'workerDepartment',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyDepartments'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            workPlaceName: params.getParam(
              'workPlaceName',
              ParamType.String,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTaskReadReportsPageWidget.routeName,
          path: CompanyTaskReadReportsPageWidget.routePath,
          asyncParams: {
            'task': getDoc(
                ['companies', 'companyTasks'], CompanyTasksRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyTaskReadReportsPageWidget(
            task: params.getParam(
              'task',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTaskDutiesPageWidget.routeName,
          path: CompanyTaskDutiesPageWidget.routePath,
          builder: (context, params) => CompanyTaskDutiesPageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTaskDutiesCreatePageWidget.routeName,
          path: CompanyTaskDutiesCreatePageWidget.routePath,
          builder: (context, params) => CompanyTaskDutiesCreatePageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyTasksForDutyCreatePageWidget.routeName,
          path: CompanyTasksForDutyCreatePageWidget.routePath,
          builder: (context, params) => CompanyTasksForDutyCreatePageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyTasksDutiesShowReportsPageWidget.routeName,
          path: CompanyTasksDutiesShowReportsPageWidget.routePath,
          asyncParams: {
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyTasksDutiesShowReportsPageWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            dutiesForCompanyRef: params.getParam(
              'dutiesForCompanyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyShowAllTaskDutiesPageWidget.routeName,
          path: CompanyShowAllTaskDutiesPageWidget.routePath,
          asyncParams: {
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyShowAllTaskDutiesPageWidget(
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTaskDutiesReadReportPageWidget.routeName,
          path: CompanyTaskDutiesReadReportPageWidget.routePath,
          asyncParams: {
            'companyTaskDuties': getDoc(['companies', 'companyTaskDuties'],
                CompanyTaskDutiesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyTaskDutiesReadReportPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            companyTaskDuties: params.getParam(
              'companyTaskDuties',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateFormWidget.routeName,
          path: CreateFormWidget.routePath,
          builder: (context, params) => CreateFormWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateFormFieldsWidget.routeName,
          path: CreateFormFieldsWidget.routePath,
          asyncParams: {
            'form': getDoc(['forms'], FormsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateFormFieldsWidget(
            form: params.getParam(
              'form',
              ParamType.Document,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ResponseFormForTaskWidget.routeName,
          path: ResponseFormForTaskWidget.routePath,
          asyncParams: {
            'companyTask': getDoc(
                ['companies', 'companyTasks'], CompanyTasksRecord.fromSnapshot),
            'formFields': getDocList(
                ['forms', 'formFields'], FormFieldsRecord.fromSnapshot),
          },
          builder: (context, params) => ResponseFormForTaskWidget(
            companyTask: params.getParam(
              'companyTask',
              ParamType.Document,
            ),
            createdUserRef: params.getParam(
              'createdUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            formFields: params.getParam<FormFieldsRecord>(
              'formFields',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: ResponseFormForDutyWidget.routeName,
          path: ResponseFormForDutyWidget.routePath,
          asyncParams: {
            'companyTaskDuties': getDoc(['companies', 'companyTaskDuties'],
                CompanyTaskDutiesRecord.fromSnapshot),
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => ResponseFormForDutyWidget(
            companyTaskDuties: params.getParam(
              'companyTaskDuties',
              ParamType.Document,
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowAllFormsPageWidget.routeName,
          path: ShowAllFormsPageWidget.routePath,
          builder: (context, params) => ShowAllFormsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ShowFormFieldsPageWidget.routeName,
          path: ShowFormFieldsPageWidget.routePath,
          asyncParams: {
            'form': getDoc(['forms'], FormsRecord.fromSnapshot),
          },
          builder: (context, params) => ShowFormFieldsPageWidget(
            form: params.getParam(
              'form',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyInstructionsCreatePageWidget.routeName,
          path: CompanyInstructionsCreatePageWidget.routePath,
          builder: (context, params) => CompanyInstructionsCreatePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyInstrucionForDepartmentWidget.routeName,
          path: CompanyInstrucionForDepartmentWidget.routePath,
          builder: (context, params) => CompanyInstrucionForDepartmentWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyInstructionsForRoleWidget.routeName,
          path: CompanyInstructionsForRoleWidget.routePath,
          builder: (context, params) => CompanyInstructionsForRoleWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyInstructionForUnitWidget.routeName,
          path: CompanyInstructionForUnitWidget.routePath,
          builder: (context, params) => CompanyInstructionForUnitWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyInstructionForPersonWidget.routeName,
          path: CompanyInstructionForPersonWidget.routePath,
          builder: (context, params) => CompanyInstructionForPersonWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: DailyPageWidget.routeName,
          path: DailyPageWidget.routePath,
          builder: (context, params) => DailyPageWidget(),
        ),
        FFRoute(
          name: CompanyUnitsPageWidget.routeName,
          path: CompanyUnitsPageWidget.routePath,
          builder: (context, params) => CompanyUnitsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canAddUnit: params.getParam(
              'canAddUnit',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyUnitAddPageWidget.routeName,
          path: CompanyUnitAddPageWidget.routePath,
          builder: (context, params) => CompanyUnitAddPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyRoleEmployeesWidget.routeName,
          path: CompanyRoleEmployeesWidget.routePath,
          asyncParams: {
            'companyRole': getDoc(
                ['companies', 'companyRoles'], CompanyRolesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyRoleEmployeesWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            roleName: params.getParam(
              'roleName',
              ParamType.String,
            ),
            companyRole: params.getParam(
              'companyRole',
              ParamType.Document,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyUnitEmployeesWidget.routeName,
          path: CompanyUnitEmployeesWidget.routePath,
          asyncParams: {
            'companyUnit': getDoc(
                ['companies', 'companyUnits'], CompanyUnitsRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyUnitEmployeesWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            unitName: params.getParam(
              'unitName',
              ParamType.String,
            ),
            companyUnit: params.getParam(
              'companyUnit',
              ParamType.Document,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EmployeeDetailPageWidget.routeName,
          path: EmployeeDetailPageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EmployeeDetailPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SentMoneyForAllowencePageWidget.routeName,
          path: SentMoneyForAllowencePageWidget.routePath,
          builder: (context, params) => SentMoneyForAllowencePageWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyWorkers'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            receiver: params.getParam(
              'receiver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: MyVaultPageWidget.routeName,
          path: MyVaultPageWidget.routePath,
          builder: (context, params) => MyVaultPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SpendExpandituryDetailPageWidget.routeName,
          path: SpendExpandituryDetailPageWidget.routePath,
          asyncParams: {
            'spentMoneyForAllowence': getDoc(
                ['companies', 'spentMoneyForAllowence'],
                SpentMoneyForAllowenceRecord.fromSnapshot),
          },
          builder: (context, params) => SpendExpandituryDetailPageWidget(
            spentMoneyForAllowence: params.getParam(
              'spentMoneyForAllowence',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ExpandituriesPageWidget.routeName,
          path: ExpandituriesPageWidget.routePath,
          builder: (context, params) => ExpandituriesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: SentExpandituryDetailPageWidget.routeName,
          path: SentExpandituryDetailPageWidget.routePath,
          asyncParams: {
            'sentMoneyForAllowence': getDoc(
                ['companies', 'sentMoneyForAllowence'],
                SentMoneyForAllowenceRecord.fromSnapshot),
          },
          builder: (context, params) => SentExpandituryDetailPageWidget(
            sentMoneyForAllowence: params.getParam(
              'sentMoneyForAllowence',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyWorkerCompanyPageWidget.routeName,
          path: CompanyWorkerCompanyPageWidget.routePath,
          builder: (context, params) => CompanyWorkerCompanyPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CompanyWorkerTasksPageWidget.routeName,
          path: CompanyWorkerTasksPageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyWorkerTasksPageWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SendTransactionPageWidget.routeName,
          path: SendTransactionPageWidget.routePath,
          asyncParams: {
            'companyReport': getDoc(['companies', 'companyReports'],
                CompanyReportsRecord.fromSnapshot),
          },
          builder: (context, params) => SendTransactionPageWidget(
            companyReport: params.getParam(
              'companyReport',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowMyTransactionsPageWidget.routeName,
          path: ShowMyTransactionsPageWidget.routePath,
          builder: (context, params) => ShowMyTransactionsPageWidget(
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            canManageStock: params.getParam(
              'canManageStock',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TransactionDetailPageWidget.routeName,
          path: TransactionDetailPageWidget.routePath,
          asyncParams: {
            'transaction': getDoc(['companies', 'companyTransactions'],
                CompanyTransactionsRecord.fromSnapshot),
          },
          builder: (context, params) => TransactionDetailPageWidget(
            transaction: params.getParam(
              'transaction',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageTransaction: params.getParam(
              'canManageTransaction',
              ParamType.bool,
            ),
            canManageStock: params.getParam(
              'canManageStock',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ShowAllTransactionPageWidget.routeName,
          path: ShowAllTransactionPageWidget.routePath,
          builder: (context, params) => ShowAllTransactionPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageTransaction: params.getParam(
              'canManageTransaction',
              ParamType.bool,
            ),
            canManageStocks: params.getParam(
              'canManageStocks',
              ParamType.bool,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompaniesBudgetPageWidget.routeName,
          path: CompaniesBudgetPageWidget.routePath,
          asyncParams: {
            'companies':
                getDocList(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => CompaniesBudgetPageWidget(
            companies: params.getParam<CompaniesRecord>(
              'companies',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: ConfirmationsPageWidget.routeName,
          path: ConfirmationsPageWidget.routePath,
          builder: (context, params) => ConfirmationsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CreateNewConfirmationWidget.routeName,
          path: CreateNewConfirmationWidget.routePath,
          builder: (context, params) => CreateNewConfirmationWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: MessagePageWidget.routeName,
          path: MessagePageWidget.routePath,
          asyncParams: {
            'confirmation':
                getDoc(['confirmations'], ConfirmationsRecord.fromSnapshot),
          },
          builder: (context, params) => MessagePageWidget(
            confirmation: params.getParam(
              'confirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: IncomesPageWidget.routeName,
          path: IncomesPageWidget.routePath,
          builder: (context, params) => IncomesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canAddIncome: params.getParam(
              'canAddIncome',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PaymentsPageWidget.routeName,
          path: PaymentsPageWidget.routePath,
          builder: (context, params) => PaymentsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canAddPayment: params.getParam(
              'canAddPayment',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TransactionDetailForDailyPageWidget.routeName,
          path: TransactionDetailForDailyPageWidget.routePath,
          asyncParams: {
            'transaction': getDoc(['companies', 'companyTransactions'],
                CompanyTransactionsRecord.fromSnapshot),
          },
          builder: (context, params) => TransactionDetailForDailyPageWidget(
            transaction: params.getParam(
              'transaction',
              ParamType.Document,
            ),
            isIncome: params.getParam(
              'isIncome',
              ParamType.bool,
            ),
            companyIncomeRef: params.getParam(
              'companyIncomeRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyIncomes2025'],
            ),
            companyPaymentsRed: params.getParam(
              'companyPaymentsRed',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyPayments2025'],
            ),
            showStock: params.getParam(
              'showStock',
              ParamType.bool,
            ),
            stockMovement: params.getParam(
              'stockMovement',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'stockMovement'],
            ),
          ),
        ),
        FFRoute(
          name: StocksPageWidget.routeName,
          path: StocksPageWidget.routePath,
          builder: (context, params) => StocksPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddStockPageWidget.routeName,
          path: AddStockPageWidget.routePath,
          builder: (context, params) => AddStockPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: StockDetailPageWidget.routeName,
          path: StockDetailPageWidget.routePath,
          asyncParams: {
            'stock': getDoc(['companies', 'stocks'], StocksRecord.fromSnapshot),
          },
          builder: (context, params) => StockDetailPageWidget(
            stock: params.getParam(
              'stock',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: StockMovementDetailPageWidget.routeName,
          path: StockMovementDetailPageWidget.routePath,
          asyncParams: {
            'stockMovement': getDoc(['companies', 'stockMovement'],
                StockMovementRecord.fromSnapshot),
          },
          builder: (context, params) => StockMovementDetailPageWidget(
            stockMovement: params.getParam(
              'stockMovement',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkerInvitation07SalaryWidget.routeName,
          path: WorkerInvitation07SalaryWidget.routePath,
          builder: (context, params) => WorkerInvitation07SalaryWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workerName: params.getParam(
              'workerName',
              ParamType.String,
            ),
            workerRef: params.getParam(
              'workerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerPlace: params.getParam(
              'workerPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workerUnit: params.getParam(
              'workerUnit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyUnits'],
            ),
            workerDepartment: params.getParam(
              'workerDepartment',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyDepartments'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            workerRole: params.getParam(
              'workerRole',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyRoles'],
            ),
            workPlaceName: params.getParam(
              'workPlaceName',
              ParamType.String,
            ),
            routeBack: params.getParam(
              'routeBack',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyWorkersPageWidget.routeName,
          path: CompanyWorkersPageWidget.routePath,
          builder: (context, params) => CompanyWorkersPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageWorker: params.getParam(
              'canManageWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canViewWorker: params.getParam(
              'canViewWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountActivityWidget.routeName,
          path: CurrentAccountActivityWidget.routePath,
          builder: (context, params) => CurrentAccountActivityWidget(),
        ),
        FFRoute(
          name: CompanyConfirmationChooseCompanyPageWidget.routeName,
          path: CompanyConfirmationChooseCompanyPageWidget.routePath,
          builder: (context, params) =>
              CompanyConfirmationChooseCompanyPageWidget(),
        ),
        FFRoute(
          name: CompanyConfirmationsPageWidget.routeName,
          path: CompanyConfirmationsPageWidget.routePath,
          builder: (context, params) => CompanyConfirmationsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyConfirmationMessagePageWidget.routeName,
          path: CompanyConfirmationMessagePageWidget.routePath,
          asyncParams: {
            'companyConfirmation': getDoc(['companyConfirmations'],
                CompanyConfirmationsRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyConfirmationMessagePageWidget(
            companyConfirmation: params.getParam(
              'companyConfirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyConfirmationsCreateConfirmationWidget.routeName,
          path: CompanyConfirmationsCreateConfirmationWidget.routePath,
          builder: (context, params) =>
              CompanyConfirmationsCreateConfirmationWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyConfirmationRequestPageWidget.routeName,
          path: CompanyConfirmationRequestPageWidget.routePath,
          builder: (context, params) => CompanyConfirmationRequestPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: WorkplaceConfirmationChooseWorkplacePageWidget.routeName,
          path: WorkplaceConfirmationChooseWorkplacePageWidget.routePath,
          builder: (context, params) =>
              WorkplaceConfirmationChooseWorkplacePageWidget(),
        ),
        FFRoute(
          name: WorkplaceConfirmationMessagePageWidget.routeName,
          path: WorkplaceConfirmationMessagePageWidget.routePath,
          asyncParams: {
            'workplaceConfirmation': getDoc(['workplaceConfirmations'],
                WorkplaceConfirmationsRecord.fromSnapshot),
          },
          builder: (context, params) => WorkplaceConfirmationMessagePageWidget(
            workplaceConfirmation: params.getParam(
              'workplaceConfirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkplaceConfirmationRequestPageWidget.routeName,
          path: WorkplaceConfirmationRequestPageWidget.routePath,
          builder: (context, params) => WorkplaceConfirmationRequestPageWidget(
            workplace: params.getParam(
              'workplace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkplaceConfirmationCreateConfirmationPageWidget.routeName,
          path: WorkplaceConfirmationCreateConfirmationPageWidget.routePath,
          builder: (context, params) =>
              WorkplaceConfirmationCreateConfirmationPageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkplaceConfirmationsPageWidget.routeName,
          path: WorkplaceConfirmationsPageWidget.routePath,
          builder: (context, params) => WorkplaceConfirmationsPageWidget(
            workplace: params.getParam(
              'workplace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: SocialSendRequestWidget.routeName,
          path: SocialSendRequestWidget.routePath,
          builder: (context, params) => SocialSendRequestWidget(),
        ),
        FFRoute(
          name: SocialReceivedRequestWidget.routeName,
          path: SocialReceivedRequestWidget.routePath,
          builder: (context, params) => SocialReceivedRequestWidget(),
        ),
        FFRoute(
          name: CurrentAccountCreatePageWidget.routeName,
          path: CurrentAccountCreatePageWidget.routePath,
          builder: (context, params) => CurrentAccountCreatePageWidget(),
        ),
        FFRoute(
          name: CurrentAccountBillsPageWidget.routeName,
          path: CurrentAccountBillsPageWidget.routePath,
          builder: (context, params) => CurrentAccountBillsPageWidget(
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountCreateBillPageWidget.routeName,
          path: CurrentAccountCreateBillPageWidget.routePath,
          builder: (context, params) => CurrentAccountCreateBillPageWidget(
            currentAccountId: params.getParam(
              'currentAccountId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['currentAccount'],
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountBillsDetailPageWidget.routeName,
          path: CurrentAccountBillsDetailPageWidget.routePath,
          asyncParams: {
            'bill': getDoc(['currentAccount', 'currentAccountBill'],
                CurrentAccountBillRecord.fromSnapshot),
          },
          builder: (context, params) => CurrentAccountBillsDetailPageWidget(
            bill: params.getParam(
              'bill',
              ParamType.Document,
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountActivityCompanyWidget.routeName,
          path: CurrentAccountActivityCompanyWidget.routePath,
          builder: (context, params) => CurrentAccountActivityCompanyWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountBillsDetailForCompanyPageWidget.routeName,
          path: CurrentAccountBillsDetailForCompanyPageWidget.routePath,
          asyncParams: {
            'bill': getDoc(['currentAccount', 'currentAccountBill'],
                CurrentAccountBillRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CurrentAccountBillsDetailForCompanyPageWidget(
            bill: params.getParam(
              'bill',
              ParamType.Document,
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountBillsForCompanyPageWidget.routeName,
          path: CurrentAccountBillsForCompanyPageWidget.routePath,
          builder: (context, params) => CurrentAccountBillsForCompanyPageWidget(
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountCreateBillPForCompanyPageWidget.routeName,
          path: CurrentAccountCreateBillPForCompanyPageWidget.routePath,
          builder: (context, params) =>
              CurrentAccountCreateBillPForCompanyPageWidget(
            currentAccountId: params.getParam(
              'currentAccountId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['currentAccount'],
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountCreateForCompanyPageWidget.routeName,
          path: CurrentAccountCreateForCompanyPageWidget.routePath,
          builder: (context, params) =>
              CurrentAccountCreateForCompanyPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountForCompanyPageRequestWidget.routeName,
          path: CurrentAccountForCompanyPageRequestWidget.routePath,
          builder: (context, params) =>
              CurrentAccountForCompanyPageRequestWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountBillForCompanyPageRequestWidget.routeName,
          path: CurrentAccountBillForCompanyPageRequestWidget.routePath,
          builder: (context, params) =>
              CurrentAccountBillForCompanyPageRequestWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            forPaid: params.getParam(
              'forPaid',
              ParamType.bool,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name:
              CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget.routeName,
          path:
              CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget.routePath,
          asyncParams: {
            'bill': getDoc(['currentAccount', 'currentAccountBill'],
                CurrentAccountBillRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CurrentAccountBillsDetailForCompanyPagePaidAcceptWidget(
            bill: params.getParam(
              'bill',
              ParamType.Document,
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyNotificationsPageWidget.routeName,
          path: CompanyNotificationsPageWidget.routePath,
          builder: (context, params) => CompanyNotificationsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: ExpandedIncomeCompanyBillPageWidget.routeName,
          path: ExpandedIncomeCompanyBillPageWidget.routePath,
          builder: (context, params) => ExpandedIncomeCompanyBillPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ExpandedPaymentCompanyBillPageWidget.routeName,
          path: ExpandedPaymentCompanyBillPageWidget.routePath,
          builder: (context, params) => ExpandedPaymentCompanyBillPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountRequestPageForUserWidget.routeName,
          path: CurrentAccountRequestPageForUserWidget.routePath,
          builder: (context, params) =>
              CurrentAccountRequestPageForUserWidget(),
        ),
        FFRoute(
          name: CurrentAccountBillRequestsPageForUserWidget.routeName,
          path: CurrentAccountBillRequestsPageForUserWidget.routePath,
          builder: (context, params) =>
              CurrentAccountBillRequestsPageForUserWidget(
            forPaid: params.getParam(
              'forPaid',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CurrentAccountBillsDetailForUserPageWidget.routeName,
          path: CurrentAccountBillsDetailForUserPageWidget.routePath,
          asyncParams: {
            'bill': getDoc(['currentAccount', 'currentAccountBill'],
                CurrentAccountBillRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CurrentAccountBillsDetailForUserPageWidget(
            bill: params.getParam(
              'bill',
              ParamType.Document,
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AllCurrentAccountStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ExpectedIncomeUserBillPageWidget.routeName,
          path: ExpectedIncomeUserBillPageWidget.routePath,
          builder: (context, params) => ExpectedIncomeUserBillPageWidget(),
        ),
        FFRoute(
          name: ExpectedPaymentBillUserPageWidget.routeName,
          path: ExpectedPaymentBillUserPageWidget.routePath,
          builder: (context, params) => ExpectedPaymentBillUserPageWidget(),
        ),
        FFRoute(
          name: MatchCurrentAccountPageWidget.routeName,
          path: MatchCurrentAccountPageWidget.routePath,
          builder: (context, params) => MatchCurrentAccountPageWidget(
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['currentAccount'],
            ),
          ),
        ),
        FFRoute(
          name: MatchCurrentAccountRequestesPageWidget.routeName,
          path: MatchCurrentAccountRequestesPageWidget.routePath,
          builder: (context, params) =>
              MatchCurrentAccountRequestesPageWidget(),
        ),
        FFRoute(
          name: MatchCurrentAccountRequestesForCompanyPageWidget.routeName,
          path: MatchCurrentAccountRequestesForCompanyPageWidget.routePath,
          builder: (context, params) =>
              MatchCurrentAccountRequestesForCompanyPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyVehiclesPageWidget.routeName,
          path: CompanyVehiclesPageWidget.routePath,
          builder: (context, params) => CompanyVehiclesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canAddVehicle: params.getParam(
              'canAddVehicle',
              ParamType.bool,
            ),
            canCreateVehiclePayment: params.getParam(
              'canCreateVehiclePayment',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyAddVehicleWidget.routeName,
          path: CompanyAddVehicleWidget.routePath,
          builder: (context, params) => CompanyAddVehicleWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyVehiclePaymentsWidget.routeName,
          path: CompanyVehiclePaymentsWidget.routePath,
          asyncParams: {
            'vehicle': getDoc(['companies', 'companyVehicles'],
                CompanyVehiclesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyVehiclePaymentsWidget(
            vehicle: params.getParam(
              'vehicle',
              ParamType.Document,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CopmanyVehicleAddPaymentWidget.routeName,
          path: CopmanyVehicleAddPaymentWidget.routePath,
          asyncParams: {
            'companyVehicle': getDoc(['companies', 'companyVehicles'],
                CompanyVehiclesRecord.fromSnapshot),
          },
          builder: (context, params) => CopmanyVehicleAddPaymentWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyVehicle: params.getParam(
              'companyVehicle',
              ParamType.Document,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyTransactionForVehiclePaymentPageWidget.routeName,
          path: CompanyTransactionForVehiclePaymentPageWidget.routePath,
          asyncParams: {
            'transaction': getDoc(['companies', 'companyTransactions'],
                CompanyTransactionsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CompanyTransactionForVehiclePaymentPageWidget(
            transaction: params.getParam(
              'transaction',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            canManageStock: params.getParam(
              'canManageStock',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EditEmployeeDetailWidget.routeName,
          path: EditEmployeeDetailWidget.routePath,
          asyncParams: {
            'copmanyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EditEmployeeDetailWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            copmanyWorker: params.getParam(
              'copmanyWorker',
              ParamType.Document,
            ),
            workPlaceIds: params.getParam<DocumentReference>(
              'workPlaceIds',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['workPlaces'],
            ),
            myWorkedWorkPlace: params.getParam(
              'myWorkedWorkPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users', 'myWorkedWorkPlace'],
            ),
            canManageWorker: params.getParam(
              'canManageWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PersonalConfirmationChoosePersonPageWidget.routeName,
          path: PersonalConfirmationChoosePersonPageWidget.routePath,
          builder: (context, params) =>
              PersonalConfirmationChoosePersonPageWidget(),
        ),
        FFRoute(
          name: PersonalConfirmationsPageWidget.routeName,
          path: PersonalConfirmationsPageWidget.routePath,
          builder: (context, params) => PersonalConfirmationsPageWidget(),
        ),
        FFRoute(
          name: PersonalConfirmationMessagePageWidget.routeName,
          path: PersonalConfirmationMessagePageWidget.routePath,
          asyncParams: {
            'personalConfirmation': getDoc(['PersonalConfirmations'],
                PersonalConfirmationsRecord.fromSnapshot),
          },
          builder: (context, params) => PersonalConfirmationMessagePageWidget(
            personalConfirmation: params.getParam(
              'personalConfirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EmailVerifyPageWidget.routeName,
          path: EmailVerifyPageWidget.routePath,
          builder: (context, params) => EmailVerifyPageWidget(),
        ),
        FFRoute(
          name: CompanyControlPageWidget.routeName,
          path: CompanyControlPageWidget.routePath,
          asyncParams: {
            'copmanyDetail':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyControlPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            copmanyDetail: params.getParam(
              'copmanyDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlFinancePageWidget.routeName,
          path: CompanyControlFinancePageWidget.routePath,
          asyncParams: {
            'companyDetail':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyControlFinancePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyDetail: params.getParam(
              'companyDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlOrganizationPageWidget.routeName,
          path: CompanyControlOrganizationPageWidget.routePath,
          builder: (context, params) => CompanyControlOrganizationPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlOperationsPageWidget.routeName,
          path: CompanyControlOperationsPageWidget.routePath,
          builder: (context, params) => CompanyControlOperationsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CopmanyControlCommunicationWidget.routeName,
          path: CopmanyControlCommunicationWidget.routePath,
          builder: (context, params) => CopmanyControlCommunicationWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CopmanyPartnershipsPageWidget.routeName,
          path: CopmanyPartnershipsPageWidget.routePath,
          asyncParams: {
            'companyDetail':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => CopmanyPartnershipsPageWidget(
            companyDetail: params.getParam(
              'companyDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyPartnersManagePageWidget.routeName,
          path: CompanyPartnersManagePageWidget.routePath,
          asyncParams: {
            'partnership': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
            'company': getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyPartnersManagePageWidget(
            partnership: params.getParam(
              'partnership',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddPartnerCompanyPageWidget.routeName,
          path: AddPartnerCompanyPageWidget.routePath,
          asyncParams: {
            'companyDetail':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => AddPartnerCompanyPageWidget(
            companyDetail: params.getParam(
              'companyDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddPartnerCompanyStep2PageWidget.routeName,
          path: AddPartnerCompanyStep2PageWidget.routePath,
          asyncParams: {
            'companyDetail':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => AddPartnerCompanyStep2PageWidget(
            companyDetail: params.getParam(
              'companyDetail',
              ParamType.Document,
            ),
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlForPartnerPageWidget.routeName,
          path: CompanyControlForPartnerPageWidget.routePath,
          asyncParams: {
            'partnership': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyControlForPartnerPageWidget(
            partnership: params.getParam(
              'partnership',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlFinanceForPartnerPageWidget.routeName,
          path: CompanyControlFinanceForPartnerPageWidget.routePath,
          asyncParams: {
            'partnership': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CompanyControlFinanceForPartnerPageWidget(
            partnership: params.getParam(
              'partnership',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlOrganizationForPartnerPageWidget.routeName,
          path: CompanyControlOrganizationForPartnerPageWidget.routePath,
          asyncParams: {
            'partner': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CompanyControlOrganizationForPartnerPageWidget(
            partner: params.getParam(
              'partner',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlOperationsForPartnerPageWidget.routeName,
          path: CompanyControlOperationsForPartnerPageWidget.routePath,
          asyncParams: {
            'partner': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CompanyControlOperationsForPartnerPageWidget(
            partner: params.getParam(
              'partner',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: CompanyControlCommunicationForPartnerPageWidget.routeName,
          path: CompanyControlCommunicationForPartnerPageWidget.routePath,
          asyncParams: {
            'partner': getDoc(
                ['users', 'partnerships'], PartnershipsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              CompanyControlCommunicationForPartnerPageWidget(
            partner: params.getParam(
              'partner',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: AddDepartmentPageWorkPlaceWidget.routeName,
          path: AddDepartmentPageWorkPlaceWidget.routePath,
          builder: (context, params) => AddDepartmentPageWorkPlaceWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DepartmansPageWorkPlaceWidget.routeName,
          path: DepartmansPageWorkPlaceWidget.routePath,
          builder: (context, params) => DepartmansPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageDepartment: params.getParam(
              'canManageDepartment',
              ParamType.bool,
            ),
            canViewEmployee: params.getParam(
              'canViewEmployee',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DepartmentEmployeePageWorkPlaceWidget.routeName,
          path: DepartmentEmployeePageWorkPlaceWidget.routePath,
          asyncParams: {
            'departmentRefs': getDoc(['companies', 'companyDepartments'],
                CompanyDepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => DepartmentEmployeePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            departmentRefs: params.getParam(
              'departmentRefs',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canManageDepartments: params.getParam(
              'canManageDepartments',
              ParamType.bool,
            ),
            workplace: params.getParam(
              'workplace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EmployeeDetailPageWorkPlaceWidget.routeName,
          path: EmployeeDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'worker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EmployeeDetailPageWorkPlaceWidget(
            worker: params.getParam(
              'worker',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageWorker: params.getParam(
              'canManageWorker',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: EditEmployeeDetailPageWorkPlaceWidget.routeName,
          path: EditEmployeeDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EditEmployeeDetailPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UnitsPageWorkPlaceWidget.routeName,
          path: UnitsPageWorkPlaceWidget.routePath,
          builder: (context, params) => UnitsPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canManageUnit: params.getParam(
              'canManageUnit',
              ParamType.bool,
            ),
            canViewEmployee: params.getParam(
              'canViewEmployee',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UnitsEmployeePageWorkPlaceWidget.routeName,
          path: UnitsEmployeePageWorkPlaceWidget.routePath,
          asyncParams: {
            'unitRefs': getDoc(
                ['companies', 'companyUnits'], CompanyUnitsRecord.fromSnapshot),
          },
          builder: (context, params) => UnitsEmployeePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            unitRefs: params.getParam(
              'unitRefs',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddUnitPageWorkPlaceWidget.routeName,
          path: AddUnitPageWorkPlaceWidget.routePath,
          builder: (context, params) => AddUnitPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageUnit: params.getParam(
              'canManageUnit',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RolesPageWorkPlaceWidget.routeName,
          path: RolesPageWorkPlaceWidget.routePath,
          builder: (context, params) => RolesPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageRole: params.getParam(
              'canManageRole',
              ParamType.bool,
            ),
            canViewEmployee: params.getParam(
              'canViewEmployee',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddRolePageWorkPlaceWidget.routeName,
          path: AddRolePageWorkPlaceWidget.routePath,
          builder: (context, params) => AddRolePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RoleEmployeePageWorkPlaceWidget.routeName,
          path: RoleEmployeePageWorkPlaceWidget.routePath,
          asyncParams: {
            'role': getDoc(
                ['companies', 'companyRoles'], CompanyRolesRecord.fromSnapshot),
          },
          builder: (context, params) => RoleEmployeePageWorkPlaceWidget(
            role: params.getParam(
              'role',
              ParamType.Document,
            ),
            copmany: params.getParam(
              'copmany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canManageRole: params.getParam(
              'canManageRole',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: InstructionsCreatePageWorkPlaceWidget.routeName,
          path: InstructionsCreatePageWorkPlaceWidget.routePath,
          builder: (context, params) => InstructionsCreatePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: InstructionWorkPlacePageWorkPlaceWidget.routeName,
          path: InstructionWorkPlacePageWorkPlaceWidget.routePath,
          builder: (context, params) => InstructionWorkPlacePageWorkPlaceWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canCreateInstructions: params.getParam(
              'canCreateInstructions',
              ParamType.bool,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: InstructionsDepartmentPageWorkPlaceWidget.routeName,
          path: InstructionsDepartmentPageWorkPlaceWidget.routePath,
          builder: (context, params) =>
              InstructionsDepartmentPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canSendInstruction: params.getParam(
              'canSendInstruction',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UnitInstructionsPageWorkPlaceWidget.routeName,
          path: UnitInstructionsPageWorkPlaceWidget.routePath,
          builder: (context, params) => UnitInstructionsPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RoleInstructionPageWorkPlaceWidget.routeName,
          path: RoleInstructionPageWorkPlaceWidget.routePath,
          builder: (context, params) => RoleInstructionPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PersonInstructionsPageWorkPlaceWidget.routeName,
          path: PersonInstructionsPageWorkPlaceWidget.routePath,
          builder: (context, params) => PersonInstructionsPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceCreateTaskPageWidget.routeName,
          path: WorkPlaceCreateTaskPageWidget.routePath,
          builder: (context, params) => WorkPlaceCreateTaskPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTasksPageWidget.routeName,
          path: WorkPlaceTasksPageWidget.routePath,
          builder: (context, params) => WorkPlaceTasksPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreateTask: params.getParam(
              'canCreateTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canManageStock: params.getParam(
              'canManageStock',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TransactiondetailPageWorkPlaceWidget.routeName,
          path: TransactiondetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'transaction': getDoc(['workPlaces', 'workPlaceTransaction'],
                WorkPlaceTransactionRecord.fromSnapshot),
          },
          builder: (context, params) => TransactiondetailPageWorkPlaceWidget(
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManageTransaction: params.getParam(
              'canManageTransaction',
              ParamType.bool,
            ),
            canManageStock: params.getParam(
              'canManageStock',
              ParamType.bool,
            ),
            transaction: params.getParam(
              'transaction',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTaskReadReportPageWidget.routeName,
          path: WorkPlaceTaskReadReportPageWidget.routePath,
          asyncParams: {
            'task': getDoc(
                ['companies', 'companyTasks'], CompanyTasksRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceTaskReadReportPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canSendTransaction: params.getParam(
              'canSendTransaction',
              ParamType.bool,
            ),
            task: params.getParam(
              'task',
              ParamType.Document,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SendTransactionPageWorkPlaceWidget.routeName,
          path: SendTransactionPageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyReport': getDoc(['companies', 'companyReports'],
                CompanyReportsRecord.fromSnapshot),
          },
          builder: (context, params) => SendTransactionPageWorkPlaceWidget(
            companyReport: params.getParam(
              'companyReport',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canSendTransaction: params.getParam(
              'canSendTransaction',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTaskDutiesPageWidget.routeName,
          path: WorkPlaceTaskDutiesPageWidget.routePath,
          builder: (context, params) => WorkPlaceTaskDutiesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreateTask: params.getParam(
              'canCreateTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTaskDutiesCreatePageWidget.routeName,
          path: WorkPlaceTaskDutiesCreatePageWidget.routePath,
          builder: (context, params) => WorkPlaceTaskDutiesCreatePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTaskForDutyCreatePageWidget.routeName,
          path: WorkPlaceTaskForDutyCreatePageWidget.routePath,
          builder: (context, params) => WorkPlaceTaskForDutyCreatePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceShowAllTaskDutiesPageWidget.routeName,
          path: WorkPlaceShowAllTaskDutiesPageWidget.routePath,
          asyncParams: {
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceShowAllTaskDutiesPageWidget(
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTaskDutiesReadReportPageWidget.routeName,
          path: WorkPlaceTaskDutiesReadReportPageWidget.routePath,
          asyncParams: {
            'companyTaskDuties': getDoc(['companies', 'companyTaskDuties'],
                CompanyTaskDutiesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceTaskDutiesReadReportPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            companyTaskDuties: params.getParam(
              'companyTaskDuties',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTasksDutiesShowReportsPageWidget.routeName,
          path: WorkPlaceTasksDutiesShowReportsPageWidget.routePath,
          asyncParams: {
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceTasksDutiesShowReportsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceAddVehicleWidget.routeName,
          path: WorkPlaceAddVehicleWidget.routePath,
          builder: (context, params) => WorkPlaceAddVehicleWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canAddVehicle: params.getParam(
              'canAddVehicle',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceVehiclePaymentsWidget.routeName,
          path: WorkPlaceVehiclePaymentsWidget.routePath,
          asyncParams: {
            'vehicle': getDoc(['companies', 'companyVehicles'],
                CompanyVehiclesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceVehiclePaymentsWidget(
            vehicle: params.getParam(
              'vehicle',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreateVehiclePayment: params.getParam(
              'canCreateVehiclePayment',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceVehiclesPageWidget.routeName,
          path: WorkPlaceVehiclesPageWidget.routePath,
          builder: (context, params) => WorkPlaceVehiclesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            canCreateVehicle: params.getParam(
              'canCreateVehicle',
              ParamType.bool,
            ),
            canCreateVehiclePayment: params.getParam(
              'canCreateVehiclePayment',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceAddVehiclePaymentPageWidget.routeName,
          path: WorkPlaceAddVehiclePaymentPageWidget.routePath,
          asyncParams: {
            'vehicle': getDoc(['companies', 'companyVehicles'],
                CompanyVehiclesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceAddVehiclePaymentPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            vehicle: params.getParam(
              'vehicle',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddStockPageWorkPlaceWidget.routeName,
          path: AddStockPageWorkPlaceWidget.routePath,
          builder: (context, params) => AddStockPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: StockDetailPageWorkPlaceWidget.routeName,
          path: StockDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'stock': getDoc(['companies', 'stocks'], StocksRecord.fromSnapshot),
          },
          builder: (context, params) => StockDetailPageWorkPlaceWidget(
            stock: params.getParam(
              'stock',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: StockMovementDetailPageWorkPlaceWidget.routeName,
          path: StockMovementDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'stockMovement': getDoc(['companies', 'stockMovement'],
                StockMovementRecord.fromSnapshot),
          },
          builder: (context, params) => StockMovementDetailPageWorkPlaceWidget(
            stockMovement: params.getParam(
              'stockMovement',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: StocksPageWorkPlaceWidget.routeName,
          path: StocksPageWorkPlaceWidget.routePath,
          builder: (context, params) => StocksPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: MyVaultPageWorkPlaceWidget.routeName,
          path: MyVaultPageWorkPlaceWidget.routePath,
          builder: (context, params) => MyVaultPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SentMoneyForAllowencePageWorkPlaceWidget.routeName,
          path: SentMoneyForAllowencePageWorkPlaceWidget.routePath,
          builder: (context, params) =>
              SentMoneyForAllowencePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            receiver: params.getParam(
              'receiver',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            receiverCompanyWorker: params.getParam(
              'receiverCompanyWorker',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyWorkers'],
            ),
          ),
        ),
        FFRoute(
          name: SendExpandituryDetailPageWorkPlaceWidget.routeName,
          path: SendExpandituryDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'sendMoneyForAllowence': getDoc(
                ['workPlaces', 'sentMoneyForAllowenceWorkPlace'],
                SentMoneyForAllowenceWorkPlaceRecord.fromSnapshot),
          },
          builder: (context, params) =>
              SendExpandituryDetailPageWorkPlaceWidget(
            sendMoneyForAllowence: params.getParam(
              'sendMoneyForAllowence',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SpendExpandituryDetailPageWorkPlaceWidget.routeName,
          path: SpendExpandituryDetailPageWorkPlaceWidget.routePath,
          asyncParams: {
            'spendMoneyForAllowence': getDoc(
                ['workPlaces', 'spentMonetForAllowenceWorkPlace'],
                SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot),
          },
          builder: (context, params) =>
              SpendExpandituryDetailPageWorkPlaceWidget(
            spendMoneyForAllowence: params.getParam(
              'spendMoneyForAllowence',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowMyTransactionPageWorkPlaceWidget.routeName,
          path: ShowMyTransactionPageWorkPlaceWidget.routePath,
          builder: (context, params) => ShowMyTransactionPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ShowAllTransactionPageWorkPlaceWidget.routeName,
          path: ShowAllTransactionPageWorkPlaceWidget.routePath,
          builder: (context, params) => ShowAllTransactionPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTransactionForVehiclePaymentWidget.routeName,
          path: WorkPlaceTransactionForVehiclePaymentWidget.routePath,
          asyncParams: {
            'transaction': getDoc(['workPlaces', 'workPlaceTransaction'],
                WorkPlaceTransactionRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceTransactionForVehiclePaymentWidget(
            transaction: params.getParam(
              'transaction',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlFinancePageWidget.routeName,
          path: WorkPlaceControlFinancePageWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceControlFinancePageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlOperationsPageWidget.routeName,
          path: WorkPlaceControlOperationsPageWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceControlOperationsPageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlCommunicationPageWidget.routeName,
          path: WorkPlaceControlCommunicationPageWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceControlCommunicationPageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ExpandituriesPageWorkPlaceWidget.routeName,
          path: ExpandituriesPageWorkPlaceWidget.routePath,
          builder: (context, params) => ExpandituriesPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceOrganizationPageWidget.routeName,
          path: WorkPlaceOrganizationPageWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceOrganizationPageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceNotificationsPageWidget.routeName,
          path: WorkPlaceNotificationsPageWidget.routePath,
          builder: (context, params) => WorkPlaceNotificationsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlacePartnerManagePageWidget.routeName,
          path: WorkPlacePartnerManagePageWidget.routePath,
          asyncParams: {
            'partnership': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlacePartnerManagePageWidget(
            partnership: params.getParam(
              'partnership',
              ParamType.Document,
            ),
            workPlacePartnerRef: params.getParam(
              'workPlacePartnerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: AddPartnerWorkPlacePageWidget.routeName,
          path: AddPartnerWorkPlacePageWidget.routePath,
          builder: (context, params) => AddPartnerWorkPlacePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            wokrPlace: params.getParam(
              'wokrPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: AddPartnerWorkPlaceStep2PageWidget.routeName,
          path: AddPartnerWorkPlaceStep2PageWidget.routePath,
          asyncParams: {
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => AddPartnerWorkPlaceStep2PageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PartnersWorkPlacePageWidget.routeName,
          path: PartnersWorkPlacePageWidget.routePath,
          asyncParams: {
            'workPlaceRef':
                getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => PartnersWorkPlacePageWidget(
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.Document,
            ),
            workPlacePartnerRef: params.getParam(
              'workPlacePartnerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlOrganizationPageForPartnerWidget.routeName,
          path: WorkPlaceControlOrganizationPageForPartnerWidget.routePath,
          asyncParams: {
            'partnerDetail': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlOrganizationPageForPartnerWidget(
            partnerDetail: params.getParam(
              'partnerDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlOperationsPageForPartnerWidget.routeName,
          path: WorkPlaceControlOperationsPageForPartnerWidget.routePath,
          asyncParams: {
            'partnerDetail': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlOperationsPageForPartnerWidget(
            partnerDetail: params.getParam(
              'partnerDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlFinancePageForPartnerWidget.routeName,
          path: WorkPlaceControlFinancePageForPartnerWidget.routePath,
          asyncParams: {
            'partnerDetail': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlFinancePageForPartnerWidget(
            partnerDetail: params.getParam(
              'partnerDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlCommunicationPageForPartnerWidget.routeName,
          path: WorkPlaceControlCommunicationPageForPartnerWidget.routePath,
          asyncParams: {
            'partnerDetail': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlCommunicationPageForPartnerWidget(
            partnerDetail: params.getParam(
              'partnerDetail',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlForWorkerWidget.routeName,
          path: WorkPlaceControlForWorkerWidget.routePath,
          builder: (context, params) => WorkPlaceControlForWorkerWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlOrganizationForWorkerWidget.routeName,
          path: WorkPlaceControlOrganizationForWorkerWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlOrganizationForWorkerWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlOperationsForWorkerWidget.routeName,
          path: WorkPlaceControlOperationsForWorkerWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlOperationsForWorkerWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlFinanceForWorkerWidget.routeName,
          path: WorkPlaceControlFinanceForWorkerWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceControlFinanceForWorkerWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlCommunicationForWorkerWidget.routeName,
          path: WorkPlaceControlCommunicationForWorkerWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) =>
              WorkPlaceControlCommunicationForWorkerWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceTasksWorkerPageWidget.routeName,
          path: WorkPlaceTasksWorkerPageWidget.routePath,
          builder: (context, params) => WorkPlaceTasksWorkerPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            canSendTransaction: params.getParam(
              'canSendTransaction',
              ParamType.bool,
            ),
            canCreate: params.getParam(
              'canCreate',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkplaceComplexWidget.routeName,
          path: WorkplaceComplexWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkplaceComplexWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyComplexWidget.routeName,
          path: CompanyComplexWidget.routePath,
          builder: (context, params) => CompanyComplexWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: AllConfirmaitonsRequestPageWidget.routeName,
          path: AllConfirmaitonsRequestPageWidget.routePath,
          builder: (context, params) => AllConfirmaitonsRequestPageWidget(),
        ),
        FFRoute(
          name: PhoneConfirmationsCreateConfirmationWidget.routeName,
          path: PhoneConfirmationsCreateConfirmationWidget.routePath,
          builder: (context, params) =>
              PhoneConfirmationsCreateConfirmationWidget(),
        ),
        FFRoute(
          name: PhoneConfirmationMessagePageWidget.routeName,
          path: PhoneConfirmationMessagePageWidget.routePath,
          asyncParams: {
            'confirmation': getDoc(
                ['PhoneConfirmations'], PhoneConfirmationsRecord.fromSnapshot),
          },
          builder: (context, params) => PhoneConfirmationMessagePageWidget(
            confirmation: params.getParam(
              'confirmation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MoneyTransferPageWidget.routeName,
          path: MoneyTransferPageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => MoneyTransferPageWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SpendMoneyPageWidget.routeName,
          path: SpendMoneyPageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => SpendMoneyPageWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MoneyTransferPageWorkPlaceWidget.routeName,
          path: MoneyTransferPageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => MoneyTransferPageWorkPlaceWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SpendMoneyWorkPlacePageWidget.routeName,
          path: SpendMoneyWorkPlacePageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => SpendMoneyWorkPlacePageWidget(
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SharedFileActionsPageWidget.routeName,
          path: SharedFileActionsPageWidget.routePath,
          builder: (context, params) => SharedFileActionsPageWidget(
            path: params.getParam(
              'path',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddManualIncomePageWidget.routeName,
          path: AddManualIncomePageWidget.routePath,
          asyncParams: {
            'companyIncome': getDoc(['companies', 'companyIncomes2025'],
                CompanyIncomes2025Record.fromSnapshot),
          },
          builder: (context, params) => AddManualIncomePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyIncome: params.getParam(
              'companyIncome',
              ParamType.Document,
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddManualPaymentPageWidget.routeName,
          path: AddManualPaymentPageWidget.routePath,
          asyncParams: {
            'companyPayment': getDoc(['companies', 'companyPayments2025'],
                CompanyPayments2025Record.fromSnapshot),
          },
          builder: (context, params) => AddManualPaymentPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            companyPayment: params.getParam(
              'companyPayment',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddManualIncomePageWorkPlaceWidget.routeName,
          path: AddManualIncomePageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyIncome': getDoc(['companies', 'companyIncomes2025'],
                CompanyIncomes2025Record.fromSnapshot),
          },
          builder: (context, params) => AddManualIncomePageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyIncome: params.getParam(
              'companyIncome',
              ParamType.Document,
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: AddManualPaymentPageWorkPlaceWidget.routeName,
          path: AddManualPaymentPageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyPayment': getDoc(['companies', 'companyPayments2025'],
                CompanyPayments2025Record.fromSnapshot),
          },
          builder: (context, params) => AddManualPaymentPageWorkPlaceWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            companyPayment: params.getParam(
              'companyPayment',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: IncomesPageWorkPlaceCopyWidget.routeName,
          path: IncomesPageWorkPlaceCopyWidget.routePath,
          builder: (context, params) => IncomesPageWorkPlaceCopyWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canAddIncome: params.getParam(
              'canAddIncome',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PaymentsPageWorkPlaceCopyWidget.routeName,
          path: PaymentsPageWorkPlaceCopyWidget.routePath,
          builder: (context, params) => PaymentsPageWorkPlaceCopyWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canAddPayment: params.getParam(
              'canAddPayment',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ReportResultAddIncomePageWidget.routeName,
          path: ReportResultAddIncomePageWidget.routePath,
          builder: (context, params) => ReportResultAddIncomePageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            value: params.getParam(
              'value',
              ParamType.double,
            ),
            companyTransaction: params.getParam(
              'companyTransaction',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyTransactions'],
            ),
            workPlaceTransaction: params.getParam(
              'workPlaceTransaction',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces', 'workPlaceTransaction'],
            ),
            transactionName: params.getParam(
              'transactionName',
              ParamType.String,
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReportResultAddPaymentPageWidget.routeName,
          path: ReportResultAddPaymentPageWidget.routePath,
          builder: (context, params) => ReportResultAddPaymentPageWidget(
            value: params.getParam(
              'value',
              ParamType.double,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            companyTransaction: params.getParam(
              'companyTransaction',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companyTransactions'],
            ),
            workPlaceTransaction: params.getParam(
              'workPlaceTransaction',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces', 'workPlaceTransaction'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            transactionName: params.getParam(
              'transactionName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReportResultAddIncomeForOwnerWidget.routeName,
          path: ReportResultAddIncomeForOwnerWidget.routePath,
          builder: (context, params) => ReportResultAddIncomeForOwnerWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: ReportResultPageAddPaymentForOwnerWidget.routeName,
          path: ReportResultPageAddPaymentForOwnerWidget.routePath,
          builder: (context, params) =>
              ReportResultPageAddPaymentForOwnerWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReportResultPageForOwnerWidget.routeName,
          path: ReportResultPageForOwnerWidget.routePath,
          asyncParams: {
            'companyReport': getDoc(['companies', 'companyReports'],
                CompanyReportsRecord.fromSnapshot),
          },
          builder: (context, params) => ReportResultPageForOwnerWidget(
            companyReport: params.getParam(
              'companyReport',
              ParamType.Document,
            ),
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: MyAllNotesWidget.routeName,
          path: MyAllNotesWidget.routePath,
          builder: (context, params) => MyAllNotesWidget(),
        ),
        FFRoute(
          name: NoteDetailPageWidget.routeName,
          path: NoteDetailPageWidget.routePath,
          asyncParams: {
            'note': getDoc(['users', 'Notes'], NotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteDetailPageWidget(
            note: params.getParam(
              'note',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewNotePageWidget.routeName,
          path: AddNewNotePageWidget.routePath,
          asyncParams: {
            'note': getDoc(['users', 'Notes'], NotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewNotePageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            note: params.getParam(
              'note',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowAllReportsPageWidget.routeName,
          path: ShowAllReportsPageWidget.routePath,
          builder: (context, params) => ShowAllReportsPageWidget(),
        ),
        FFRoute(
          name: ReportDetailPageWidget.routeName,
          path: ReportDetailPageWidget.routePath,
          asyncParams: {
            'companyReport': getDoc(['companies', 'companyReports'],
                CompanyReportsRecord.fromSnapshot),
          },
          builder: (context, params) => ReportDetailPageWidget(
            companyReport: params.getParam(
              'companyReport',
              ParamType.Document,
            ),
            creatorName: params.getParam(
              'creatorName',
              ParamType.String,
            ),
            sentToName: params.getParam(
              'sentToName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNotePageWidget.routeName,
          path: UpdateNotePageWidget.routePath,
          asyncParams: {
            'note': getDoc(['users', 'Notes'], NotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNotePageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            note: params.getParam(
              'note',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CVPageWidget.routeName,
          path: CVPageWidget.routePath,
          builder: (context, params) => CVPageWidget(),
        ),
        FFRoute(
          name: AddNewProductPageWidget.routeName,
          path: AddNewProductPageWidget.routePath,
          asyncParams: {
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewProductPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CalculateCostPageWidget.routeName,
          path: CalculateCostPageWidget.routePath,
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
            'productFields': getDocList(['products', 'productFields'],
                ProductFieldsRecord.fromSnapshot),
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => CalculateCostPageWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            productFields: params.getParam<ProductFieldsRecord>(
              'productFields',
              ParamType.Document,
              isList: true,
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CalculateDetailPageWidget.routeName,
          path: CalculateDetailPageWidget.routePath,
          asyncParams: {
            'calculate': getDoc(
                ['products', 'calculations'], CalculationsRecord.fromSnapshot),
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => CalculateDetailPageWidget(
            calculate: params.getParam(
              'calculate',
              ParamType.Document,
            ),
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UpdateProductPageWidget.routeName,
          path: UpdateProductPageWidget.routePath,
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateProductPageWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChatAIWidget.routeName,
          path: ChatAIWidget.routePath,
          builder: (context, params) => ChatAIWidget(),
        ),
        FFRoute(
          name: InstructionPageWidget.routeName,
          path: InstructionPageWidget.routePath,
          builder: (context, params) => InstructionPageWidget(),
        ),
        FFRoute(
          name: FormCreateGraphicPageWidget.routeName,
          path: FormCreateGraphicPageWidget.routePath,
          asyncParams: {
            'formFields': getDocList(
                ['forms', 'formFields'], FormFieldsRecord.fromSnapshot),
          },
          builder: (context, params) => FormCreateGraphicPageWidget(
            formFields: params.getParam<FormFieldsRecord>(
              'formFields',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: StockOperationPageWidget.routeName,
          path: StockOperationPageWidget.routePath,
          asyncParams: {
            'stock': getDoc(['companies', 'stocks'], StocksRecord.fromSnapshot),
          },
          builder: (context, params) => StockOperationPageWidget(
            stock: params.getParam(
              'stock',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddParentProductPageWidget.routeName,
          path: AddParentProductPageWidget.routePath,
          builder: (context, params) => AddParentProductPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EditCalculationsPageWidget.routeName,
          path: EditCalculationsPageWidget.routePath,
          asyncParams: {
            'calculation': getDoc(
                ['products', 'calculations'], CalculationsRecord.fromSnapshot),
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => EditCalculationsPageWidget(
            calculation: params.getParam(
              'calculation',
              ParamType.Document,
            ),
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            parameters: params.getParam<ProductCostDataTypeStruct>(
              'parameters',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ProductCostDataTypeStruct.fromSerializableMap,
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: ReceivedPartnershipInvitationWidget.routeName,
          path: ReceivedPartnershipInvitationWidget.routePath,
          builder: (context, params) => ReceivedPartnershipInvitationWidget(),
        ),
        FFRoute(
          name: SentPartnershipInvitationWidget.routeName,
          path: SentPartnershipInvitationWidget.routePath,
          builder: (context, params) => SentPartnershipInvitationWidget(),
        ),
        FFRoute(
          name: UpdateParentProductPageWidget.routeName,
          path: UpdateParentProductPageWidget.routePath,
          asyncParams: {
            'product': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateParentProductPageWidget(
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SocialFriendPageWidget.routeName,
          path: SocialFriendPageWidget.routePath,
          builder: (context, params) => SocialFriendPageWidget(),
        ),
        FFRoute(
          name: AddNewNoteImportantPageWidget.routeName,
          path: AddNewNoteImportantPageWidget.routePath,
          asyncParams: {
            'noteImportant': getDoc(
                ['users', 'importantNotes'], ImportantNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewNoteImportantPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteImportant: params.getParam(
              'noteImportant',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewNoteGoalPageWidget.routeName,
          path: AddNewNoteGoalPageWidget.routePath,
          asyncParams: {
            'noteGoal':
                getDoc(['users', 'goalNotes'], GoalNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewNoteGoalPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteGoal: params.getParam(
              'noteGoal',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewNoteDiaryPageWidget.routeName,
          path: AddNewNoteDiaryPageWidget.routePath,
          asyncParams: {
            'noteDiary': getDoc(
                ['users', 'personalDiary'], PersonalDiaryRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewNoteDiaryPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteDiary: params.getParam(
              'noteDiary',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteImportantPageWidget.routeName,
          path: UpdateNoteImportantPageWidget.routePath,
          asyncParams: {
            'noteImportant': getDoc(
                ['users', 'importantNotes'], ImportantNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteImportantPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteImportant: params.getParam(
              'noteImportant',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteGoalPageWidget.routeName,
          path: UpdateNoteGoalPageWidget.routePath,
          asyncParams: {
            'noteGoal':
                getDoc(['users', 'goalNotes'], GoalNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteGoalPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteGoal: params.getParam(
              'noteGoal',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteDiaryPageWidget.routeName,
          path: UpdateNoteDiaryPageWidget.routePath,
          asyncParams: {
            'noteDiary': getDoc(
                ['users', 'personalDiary'], PersonalDiaryRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteDiaryPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteDiary: params.getParam(
              'noteDiary',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteImportantDetailPageWidget.routeName,
          path: NoteImportantDetailPageWidget.routePath,
          asyncParams: {
            'noteImportant': getDoc(
                ['users', 'importantNotes'], ImportantNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteImportantDetailPageWidget(
            noteImportant: params.getParam(
              'noteImportant',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteGoalDetailPageWidget.routeName,
          path: NoteGoalDetailPageWidget.routePath,
          asyncParams: {
            'noteGoal':
                getDoc(['users', 'goalNotes'], GoalNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteGoalDetailPageWidget(
            noteGoal: params.getParam(
              'noteGoal',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteDiaryDetailPageWidget.routeName,
          path: NoteDiaryDetailPageWidget.routePath,
          asyncParams: {
            'noteDiary': getDoc(
                ['users', 'personalDiary'], PersonalDiaryRecord.fromSnapshot),
          },
          builder: (context, params) => NoteDiaryDetailPageWidget(
            noteDiary: params.getParam(
              'noteDiary',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: FinancialMonitoringWidget.routeName,
          path: FinancialMonitoringWidget.routePath,
          builder: (context, params) => FinancialMonitoringWidget(
            listContainCompanyName: params.getParam(
              'listContainCompanyName',
              ParamType.String,
            ),
            listContainWorkPlaceName: params.getParam(
              'listContainWorkPlaceName',
              ParamType.String,
            ),
            listContainDate: params.getParam(
              'listContainDate',
              ParamType.String,
            ),
            listContainPaymentOrCollection: params.getParam(
              'listContainPaymentOrCollection',
              ParamType.String,
            ),
            listContainWhichAccount: params.getParam(
              'listContainWhichAccount',
              ParamType.String,
            ),
            listContainValue: params.getParam(
              'listContainValue',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NoteFinanceCompanyDetailPageWidget.routeName,
          path: NoteFinanceCompanyDetailPageWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteFinanceCompanyDetailPageWidget(
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteFinancePersonalDetailPageWidget.routeName,
          path: NoteFinancePersonalDetailPageWidget.routePath,
          asyncParams: {
            'noteFinancePersonal': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteFinancePersonalDetailPageWidget(
            noteFinancePersonal: params.getParam(
              'noteFinancePersonal',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteFinanceFamilyDetailPageWidget.routeName,
          path: NoteFinanceFamilyDetailPageWidget.routePath,
          asyncParams: {
            'noteFinanceFamily': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteFinanceFamilyDetailPageWidget(
            noteFinanceFamily: params.getParam(
              'noteFinanceFamily',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NoteFinanceDetailPageWidget.routeName,
          path: NoteFinanceDetailPageWidget.routePath,
          asyncParams: {
            'noteFinance': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteFinanceDetailPageWidget(
            noteFinance: params.getParam(
              'noteFinance',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteFinanceWorkPlacePageWidget.routeName,
          path: UpdateNoteFinanceWorkPlacePageWidget.routePath,
          asyncParams: {
            'noteFinanceWorkPlace': getDoc(
                ['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteFinanceWorkPlacePageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceWorkPlace: params.getParam(
              'noteFinanceWorkPlace',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteFinanceCompanyPageWidget.routeName,
          path: UpdateNoteFinanceCompanyPageWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteFinanceCompanyPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteFinancePersonalPageWidget.routeName,
          path: UpdateNoteFinancePersonalPageWidget.routePath,
          asyncParams: {
            'noteFinancePersonal': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteFinancePersonalPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinancePersonal: params.getParam(
              'noteFinancePersonal',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteFinanceFamilyPageWidget.routeName,
          path: UpdateNoteFinanceFamilyPageWidget.routePath,
          asyncParams: {
            'noteFinanceFamily': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteFinanceFamilyPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceFamily: params.getParam(
              'noteFinanceFamily',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNoteFinancePageWidget.routeName,
          path: UpdateNoteFinancePageWidget.routePath,
          asyncParams: {
            'noteFinance': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNoteFinancePageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinance: params.getParam(
              'noteFinance',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceControlForPartnerWidget.routeName,
          path: WorkPlaceControlForPartnerWidget.routePath,
          asyncParams: {
            'workPlacePartnership': getDoc(['users', 'workPlacePartnership'],
                WorkPlacePartnershipRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceControlForPartnerWidget(
            workPlacePartnership: params.getParam(
              'workPlacePartnership',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceNotesPageWidget.routeName,
          path: WorkPlaceNotesPageWidget.routePath,
          builder: (context, params) => WorkPlaceNotesPageWidget(
            workPLace: params.getParam(
              'workPLace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CompanyNotesPageWidget.routeName,
          path: CompanyNotesPageWidget.routePath,
          builder: (context, params) => CompanyNotesPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SubContractorPageWidget.routeName,
          path: SubContractorPageWidget.routePath,
          builder: (context, params) => SubContractorPageWidget(),
        ),
        FFRoute(
          name: SolutionPartnerWidget.routeName,
          path: SolutionPartnerWidget.routePath,
          builder: (context, params) => SolutionPartnerWidget(),
        ),
        FFRoute(
          name: CalculateBillsPageWidget.routeName,
          path: CalculateBillsPageWidget.routePath,
          builder: (context, params) => CalculateBillsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            allBills: params.getParam<DocumentReference>(
              'allBills',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['currentAccount', 'currentAccountBill'],
            ),
          ),
        ),
        FFRoute(
          name: BillDetailPageWidget.routeName,
          path: BillDetailPageWidget.routePath,
          asyncParams: {
            'bill': getDoc(['currentAccount', 'currentAccountBill'],
                CurrentAccountBillRecord.fromSnapshot),
            'currentAccount':
                getDoc(['currentAccount'], CurrentAccountRecord.fromSnapshot),
          },
          builder: (context, params) => BillDetailPageWidget(
            bill: params.getParam(
              'bill',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            currentAccount: params.getParam(
              'currentAccount',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DeleteRequestPageWidget.routeName,
          path: DeleteRequestPageWidget.routePath,
          builder: (context, params) => DeleteRequestPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: EmployeeDetailFirstPageWidget.routeName,
          path: EmployeeDetailFirstPageWidget.routePath,
          builder: (context, params) => EmployeeDetailFirstPageWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EmployeePermissionsPageWidget.routeName,
          path: EmployeePermissionsPageWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EmployeePermissionsPageWidget(
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShiftRequestPageWidget.routeName,
          path: ShiftRequestPageWidget.routePath,
          builder: (context, params) => ShiftRequestPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: ShiftRequestersPageWidget.routeName,
          path: ShiftRequestersPageWidget.routePath,
          builder: (context, params) => ShiftRequestersPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: EmployeeDetailFirstPageWorkPlaceWidget.routeName,
          path: EmployeeDetailFirstPageWorkPlaceWidget.routePath,
          builder: (context, params) => EmployeeDetailFirstPageWorkPlaceWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            canViewTask: params.getParam(
              'canViewTask',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: EmployeePermissionsPageWorkPlaceWidget.routeName,
          path: EmployeePermissionsPageWorkPlaceWidget.routePath,
          asyncParams: {
            'companyWorker': getDoc(['companies', 'companyWorkers'],
                CompanyWorkersRecord.fromSnapshot),
          },
          builder: (context, params) => EmployeePermissionsPageWorkPlaceWidget(
            canManageEmployee: params.getParam(
              'canManageEmployee',
              ParamType.bool,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyWorker: params.getParam(
              'companyWorker',
              ParamType.Document,
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: SalaryDetailPageWidget.routeName,
          path: SalaryDetailPageWidget.routePath,
          asyncParams: {
            'companyPayment': getDoc(['companies', 'companySalary'],
                CompanySalaryRecord.fromSnapshot),
          },
          builder: (context, params) => SalaryDetailPageWidget(
            companyPayment: params.getParam(
              'companyPayment',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanySalaryPageWidget.routeName,
          path: CompanySalaryPageWidget.routePath,
          builder: (context, params) => CompanySalaryPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceSalaryPageWidget.routeName,
          path: WorkPlaceSalaryPageWidget.routePath,
          builder: (context, params) => WorkPlaceSalaryPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: PersonalCPAWidget.routeName,
          path: PersonalCPAWidget.routePath,
          builder: (context, params) => PersonalCPAWidget(),
        ),
        FFRoute(
          name: AddNewCompanyNotePageWidget.routeName,
          path: AddNewCompanyNotePageWidget.routePath,
          builder: (context, params) => AddNewCompanyNotePageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            hasCompanyRecord: params.getParam(
              'hasCompanyRecord',
              ParamType.bool,
            ),
            hasMachineFailure: params.getParam(
              'hasMachineFailure',
              ParamType.bool,
            ),
            hasPersonnelNote: params.getParam(
              'hasPersonnelNote',
              ParamType.bool,
            ),
            hasFinancialNote: params.getParam(
              'hasFinancialNote',
              ParamType.bool,
            ),
            hasTaxNote: params.getParam(
              'hasTaxNote',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UpdateCompanyNotePageWidget.routeName,
          path: UpdateCompanyNotePageWidget.routePath,
          asyncParams: {
            'companyNote': getDoc(
                ['companies', 'companyNotes'], CompanyNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateCompanyNotePageWidget(
            companyNote: params.getParam(
              'companyNote',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyNoteDetailPageWidget.routeName,
          path: CompanyNoteDetailPageWidget.routePath,
          asyncParams: {
            'companyNote': getDoc(
                ['companies', 'companyNotes'], CompanyNotesRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyNoteDetailPageWidget(
            companyNote: params.getParam(
              'companyNote',
              ParamType.Document,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddNewWorkPlaceNotePageWidget.routeName,
          path: AddNewWorkPlaceNotePageWidget.routePath,
          builder: (context, params) => AddNewWorkPlaceNotePageWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            hasVehicleFault: params.getParam(
              'hasVehicleFault',
              ParamType.bool,
            ),
            hasMachineFault: params.getParam(
              'hasMachineFault',
              ParamType.bool,
            ),
            hasFinancialNotes: params.getParam(
              'hasFinancialNotes',
              ParamType.bool,
            ),
            hasTaxNotes: params.getParam(
              'hasTaxNotes',
              ParamType.bool,
            ),
            hasPersonnelNotes: params.getParam(
              'hasPersonnelNotes',
              ParamType.bool,
            ),
            hasWorkplaceNotes: params.getParam(
              'hasWorkplaceNotes',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WrokPlaceNoteDetailPageWidget.routeName,
          path: WrokPlaceNoteDetailPageWidget.routePath,
          asyncParams: {
            'workPlaceNote': getDoc(['workPlaces', 'workPlaceNotes'],
                WorkPlaceNotesRecord.fromSnapshot),
          },
          builder: (context, params) => WrokPlaceNoteDetailPageWidget(
            workPlaceNote: params.getParam(
              'workPlaceNote',
              ParamType.Document,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: UpdateWorkPlaceNotePageWidget.routeName,
          path: UpdateWorkPlaceNotePageWidget.routePath,
          asyncParams: {
            'workPlaceNote': getDoc(['workPlaces', 'workPlaceNotes'],
                WorkPlaceNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateWorkPlaceNotePageWidget(
            workPlaceNote: params.getParam(
              'workPlaceNote',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: FormGraphicPageWidget.routeName,
          path: FormGraphicPageWidget.routePath,
          builder: (context, params) => FormGraphicPageWidget(
            graphicPairs: params.getParam<ChartXYPairsStruct>(
              'graphicPairs',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ChartXYPairsStruct.fromSerializableMap,
            ),
            xName: params.getParam(
              'xName',
              ParamType.String,
            ),
            yName: params.getParam(
              'yName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep1Widget.routeName,
          path: CreateTaskStep1Widget.routePath,
          builder: (context, params) => CreateTaskStep1Widget(),
        ),
        FFRoute(
          name: CreateTaskStep6ForSingleTaskWidget.routeName,
          path: CreateTaskStep6ForSingleTaskWidget.routePath,
          asyncParams: {
            'workPlaceWorker': getDoc(['workPlaces', 'workPlaceWorker'],
                WorkPlaceWorkerRecord.fromSnapshot),
          },
          builder: (context, params) => CreateTaskStep6ForSingleTaskWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workPlaceWorker: params.getParam(
              'workPlaceWorker',
              ParamType.Document,
            ),
            form: params.getParam(
              'form',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['forms'],
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep2Widget.routeName,
          path: CreateTaskStep2Widget.routePath,
          builder: (context, params) => CreateTaskStep2Widget(
            isDutyTask: params.getParam(
              'isDutyTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep3Widget.routeName,
          path: CreateTaskStep3Widget.routePath,
          builder: (context, params) => CreateTaskStep3Widget(
            isDutyTask: params.getParam(
              'isDutyTask',
              ParamType.bool,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canCreateWorkPlace: params.getParam(
              'canCreateWorkPlace',
              ParamType.bool,
            ),
            canCreateForm: params.getParam(
              'canCreateForm',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep4Widget.routeName,
          path: CreateTaskStep4Widget.routePath,
          builder: (context, params) => CreateTaskStep4Widget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canCreateForm: params.getParam(
              'canCreateForm',
              ParamType.bool,
            ),
            isDutyTask: params.getParam(
              'isDutyTask',
              ParamType.bool,
            ),
            canAddNewEmployee: params.getParam(
              'canAddNewEmployee',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep5ForSingleTaskWidget.routeName,
          path: CreateTaskStep5ForSingleTaskWidget.routePath,
          asyncParams: {
            'workPlaceWorker': getDoc(['workPlaces', 'workPlaceWorker'],
                WorkPlaceWorkerRecord.fromSnapshot),
          },
          builder: (context, params) => CreateTaskStep5ForSingleTaskWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isDutyTask: params.getParam(
              'isDutyTask',
              ParamType.bool,
            ),
            workPlaceWorker: params.getParam(
              'workPlaceWorker',
              ParamType.Document,
            ),
            canCreateForm: params.getParam(
              'canCreateForm',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep6ForTaskDutiesWidget.routeName,
          path: CreateTaskStep6ForTaskDutiesWidget.routePath,
          builder: (context, params) => CreateTaskStep6ForTaskDutiesWidget(
            companyName: params.getParam(
              'companyName',
              ParamType.String,
            ),
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'dutiesForCompany'],
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            canCreateForm: params.getParam(
              'canCreateForm',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CreateTaskStep5ForTaskDutiesWidget.routeName,
          path: CreateTaskStep5ForTaskDutiesWidget.routePath,
          asyncParams: {
            'workPlaceWorker': getDoc(['workPlaces', 'workPlaceWorker'],
                WorkPlaceWorkerRecord.fromSnapshot),
          },
          builder: (context, params) => CreateTaskStep5ForTaskDutiesWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workPlaceWorker: params.getParam(
              'workPlaceWorker',
              ParamType.Document,
            ),
            canCreateForm: params.getParam(
              'canCreateForm',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SendReportStep1Widget.routeName,
          path: SendReportStep1Widget.routePath,
          builder: (context, params) => SendReportStep1Widget(),
        ),
        FFRoute(
          name: SendReportStep2Widget.routeName,
          path: SendReportStep2Widget.routePath,
          asyncParams: {
            'dutiesForCompany': getDoc(['companies', 'dutiesForCompany'],
                DutiesForCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => SendReportStep2Widget(
            dutiesForCompany: params.getParam(
              'dutiesForCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: MessageNewPageCopyWidget.routeName,
          path: MessageNewPageCopyWidget.routePath,
          asyncParams: {
            'message': getDoc(['Message'], MessageRecord.fromSnapshot),
            'receiverUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => MessageNewPageCopyWidget(
            message: params.getParam(
              'message',
              ParamType.Document,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            receiverUser: params.getParam(
              'receiverUser',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShoppingWidget.routeName,
          path: ShoppingWidget.routePath,
          builder: (context, params) => ShoppingWidget(),
        ),
        FFRoute(
          name: MyCityWidget.routeName,
          path: MyCityWidget.routePath,
          builder: (context, params) => MyCityWidget(),
        ),
        FFRoute(
          name: TransportationWidget.routeName,
          path: TransportationWidget.routePath,
          builder: (context, params) => TransportationWidget(),
        ),
        FFRoute(
          name: ProductionTradeWidget.routeName,
          path: ProductionTradeWidget.routePath,
          builder: (context, params) => ProductionTradeWidget(),
        ),
        FFRoute(
          name: PlacesWidget.routeName,
          path: PlacesWidget.routePath,
          builder: (context, params) => PlacesWidget(),
        ),
        FFRoute(
          name: ResidenceCityWidget.routeName,
          path: ResidenceCityWidget.routePath,
          builder: (context, params) => ResidenceCityWidget(),
        ),
        FFRoute(
          name: FavoritesShoppingWidget.routeName,
          path: FavoritesShoppingWidget.routePath,
          builder: (context, params) => FavoritesShoppingWidget(),
        ),
        FFRoute(
          name: CategoriesShoppingWidget.routeName,
          path: CategoriesShoppingWidget.routePath,
          builder: (context, params) => CategoriesShoppingWidget(),
        ),
        FFRoute(
          name: MyOrdersShoppingWidget.routeName,
          path: MyOrdersShoppingWidget.routePath,
          builder: (context, params) => MyOrdersShoppingWidget(),
        ),
        FFRoute(
          name: ArtCultureWidget.routeName,
          path: ArtCultureWidget.routePath,
          builder: (context, params) => ArtCultureWidget(),
        ),
        FFRoute(
          name: ConfirmationUserDetailPageWidget.routeName,
          path: ConfirmationUserDetailPageWidget.routePath,
          asyncParams: {
            'receiverUser': getDoc(['users'], UsersRecord.fromSnapshot),
            'message': getDoc(['Message'], MessageRecord.fromSnapshot),
          },
          builder: (context, params) => ConfirmationUserDetailPageWidget(
            receiverUser: params.getParam(
              'receiverUser',
              ParamType.Document,
            ),
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            message: params.getParam(
              'message',
              ParamType.Document,
            ),
            conversationType: params.getParam(
              'conversationType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommandationWidget.routeName,
          path: RecommandationWidget.routePath,
          builder: (context, params) => RecommandationWidget(),
        ),
        FFRoute(
          name: WarningWidget.routeName,
          path: WarningWidget.routePath,
          builder: (context, params) => WarningWidget(),
        ),
        FFRoute(
          name: ConfirmationMediasPageWidget.routeName,
          path: ConfirmationMediasPageWidget.routePath,
          builder: (context, params) => ConfirmationMediasPageWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BlockedConversationPageWidget.routeName,
          path: BlockedConversationPageWidget.routePath,
          builder: (context, params) => BlockedConversationPageWidget(),
        ),
        FFRoute(
          name: ConfirmationStarredMessagesPageWidget.routeName,
          path: ConfirmationStarredMessagesPageWidget.routePath,
          asyncParams: {
            'receiverUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ConfirmationStarredMessagesPageWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            receiverUser: params.getParam(
              'receiverUser',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MessageColorSettingsPageWidget.routeName,
          path: MessageColorSettingsPageWidget.routePath,
          asyncParams: {
            'message': getDoc(['Message'], MessageRecord.fromSnapshot),
          },
          builder: (context, params) => MessageColorSettingsPageWidget(
            message: params.getParam(
              'message',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewFinanceNoteFamilyWidget.routeName,
          path: AddNewFinanceNoteFamilyWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewFinanceNoteFamilyWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewFinanceNotePersonalWidget.routeName,
          path: AddNewFinanceNotePersonalWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewFinanceNotePersonalWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CurrentDetailPageWidget.routeName,
          path: CurrentDetailPageWidget.routePath,
          builder: (context, params) => CurrentDetailPageWidget(
            companyCurrentDocumentRef: params.getParam(
              'companyCurrentDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: BillPageWidget.routeName,
          path: BillPageWidget.routePath,
          asyncParams: {
            'currentAccounts':
                getDoc(['currentAccount'], CurrentAccountRecord.fromSnapshot),
          },
          builder: (context, params) => BillPageWidget(
            currentAccounts: params.getParam(
              'currentAccounts',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewNotePageUrgentWidget.routeName,
          path: AddNewNotePageUrgentWidget.routePath,
          asyncParams: {
            'urgentNote': getDoc(
                ['users', 'urgentNotes'], UrgentNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewNotePageUrgentWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            urgentNote: params.getParam(
              'urgentNote',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UrgentNoteDetailPageWidget.routeName,
          path: UrgentNoteDetailPageWidget.routePath,
          asyncParams: {
            'note': getDoc(
                ['users', 'urgentNotes'], UrgentNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UrgentNoteDetailPageWidget(
            note: params.getParam(
              'note',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateNotePageUrgentWidget.routeName,
          path: UpdateNotePageUrgentWidget.routePath,
          asyncParams: {
            'urgentNote': getDoc(
                ['users', 'urgentNotes'], UrgentNotesRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateNotePageUrgentWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            urgentNote: params.getParam(
              'urgentNote',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompletedUrgentNoteWidget.routeName,
          path: CompletedUrgentNoteWidget.routePath,
          asyncParams: {
            'completedUrgentNote': getDoc(
                ['users', 'urgentNotes'], UrgentNotesRecord.fromSnapshot),
          },
          builder: (context, params) => CompletedUrgentNoteWidget(
            completedUrgentNote: params.getParam(
              'completedUrgentNote',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CompanyBillDetailPageWidget.routeName,
          path: CompanyBillDetailPageWidget.routePath,
          asyncParams: {
            'companyBillDocument': getDoc(
                ['companies', 'companyBill'], CompanyBillRecord.fromSnapshot),
          },
          builder: (context, params) => CompanyBillDetailPageWidget(
            companyBillDocument: params.getParam(
              'companyBillDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreateBillPageWidget.routeName,
          path: CreateBillPageWidget.routePath,
          builder: (context, params) => CreateBillPageWidget(
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: UpdateBillPageWidget.routeName,
          path: UpdateBillPageWidget.routePath,
          asyncParams: {
            'whicBill': getDoc(
                ['companies', 'companyBill'], CompanyBillRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateBillPageWidget(
            whicBill: params.getParam(
              'whicBill',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdatePaymentCompanyWidget.routeName,
          path: UpdatePaymentCompanyWidget.routePath,
          asyncParams: {
            'companyPaymentDoc': getDoc(['companies', 'financialNoteCompany'],
                FinancialNoteCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => UpdatePaymentCompanyWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            companyPaymentDoc: params.getParam(
              'companyPaymentDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PaymentOrCollectionDetailWidget.routeName,
          path: PaymentOrCollectionDetailWidget.routePath,
          asyncParams: {
            'paymentDocument': getDoc(['companies', 'financialNoteCompany'],
                FinancialNoteCompanyRecord.fromSnapshot),
          },
          builder: (context, params) => PaymentOrCollectionDetailWidget(
            paymentDocument: params.getParam(
              'paymentDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddCurrentAccountWidget.routeName,
          path: AddCurrentAccountWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddCurrentAccountWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CheckDetailWidget.routeName,
          path: CheckDetailWidget.routePath,
          asyncParams: {
            'paymentDocument': getDoc(
                ['companies', 'financialNoteCompanyCheck'],
                FinancialNoteCompanyCheckRecord.fromSnapshot),
          },
          builder: (context, params) => CheckDetailWidget(
            paymentDocument: params.getParam(
              'paymentDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: UpdateCheckCompanyWidget.routeName,
          path: UpdateCheckCompanyWidget.routePath,
          asyncParams: {
            'companyPaymentDoc': getDoc(
                ['companies', 'financialNoteCompanyCheck'],
                FinancialNoteCompanyCheckRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateCheckCompanyWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            companyPaymentDoc: params.getParam(
              'companyPaymentDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddNewCompanyCheckWidget.routeName,
          path: AddNewCompanyCheckWidget.routePath,
          asyncParams: {
            'checkCompany': getDoc(['companies', 'financialNoteCompanyCheck'],
                FinancialNoteCompanyCheckRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewCompanyCheckWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            checkCompany: params.getParam(
              'checkCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CashPaymentTableWidget.routeName,
          path: CashPaymentTableWidget.routePath,
          builder: (context, params) => CashPaymentTableWidget(
            valuesOnTableTitle: params.getParam(
              'valuesOnTableTitle',
              ParamType.String,
            ),
            valuesOnTableDate: params.getParam(
              'valuesOnTableDate',
              ParamType.String,
            ),
            valuesOnTableBill: params.getParam(
              'valuesOnTableBill',
              ParamType.String,
            ),
            valuesOnTableDoer: params.getParam(
              'valuesOnTableDoer',
              ParamType.String,
            ),
            valuesOnTablePayCollection: params.getParam(
              'valuesOnTablePayCollection',
              ParamType.String,
            ),
            valuesOnTableValue: params.getParam(
              'valuesOnTableValue',
              ParamType.String,
            ),
            whichCompanyId: params.getParam(
              'whichCompanyId',
              ParamType.String,
            ),
            whichCurrentAccountRef: params.getParam(
              'whichCurrentAccountRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: CheckPaymentTableWidget.routeName,
          path: CheckPaymentTableWidget.routePath,
          builder: (context, params) => CheckPaymentTableWidget(
            valuesOnTableTitle: params.getParam(
              'valuesOnTableTitle',
              ParamType.String,
            ),
            valuesOnTableDate: params.getParam(
              'valuesOnTableDate',
              ParamType.String,
            ),
            valuesOnTableBill: params.getParam(
              'valuesOnTableBill',
              ParamType.String,
            ),
            valuesOnTableDoer: params.getParam(
              'valuesOnTableDoer',
              ParamType.String,
            ),
            valuesOnTablePayCollection: params.getParam(
              'valuesOnTablePayCollection',
              ParamType.String,
            ),
            valuesOnTableValue: params.getParam(
              'valuesOnTableValue',
              ParamType.String,
            ),
            whichCompanyId: params.getParam(
              'whichCompanyId',
              ParamType.String,
            ),
            whichCurrentAccountRef: params.getParam(
              'whichCurrentAccountRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: WorkerPaymentTableWidget.routeName,
          path: WorkerPaymentTableWidget.routePath,
          builder: (context, params) => WorkerPaymentTableWidget(
            valuesOnTableTitle: params.getParam(
              'valuesOnTableTitle',
              ParamType.String,
            ),
            valuesOnTableDate: params.getParam(
              'valuesOnTableDate',
              ParamType.String,
            ),
            valuesOnTableBill: params.getParam(
              'valuesOnTableBill',
              ParamType.String,
            ),
            valuesOnTableDoer: params.getParam(
              'valuesOnTableDoer',
              ParamType.String,
            ),
            valuesOnTablePayCollection: params.getParam(
              'valuesOnTablePayCollection',
              ParamType.String,
            ),
            valuesOnTableValue: params.getParam(
              'valuesOnTableValue',
              ParamType.String,
            ),
            whichCompanyId: params.getParam(
              'whichCompanyId',
              ParamType.String,
            ),
            whichCurrentAccountRef: params.getParam(
              'whichCurrentAccountRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: SocialSecurityPaymentTableWidget.routeName,
          path: SocialSecurityPaymentTableWidget.routePath,
          builder: (context, params) => SocialSecurityPaymentTableWidget(
            valuesOnTableTitle: params.getParam(
              'valuesOnTableTitle',
              ParamType.String,
            ),
            valuesOnTableDate: params.getParam(
              'valuesOnTableDate',
              ParamType.String,
            ),
            valuesOnTableBill: params.getParam(
              'valuesOnTableBill',
              ParamType.String,
            ),
            valuesOnTableDoer: params.getParam(
              'valuesOnTableDoer',
              ParamType.String,
            ),
            valuesOnTablePayCollection: params.getParam(
              'valuesOnTablePayCollection',
              ParamType.String,
            ),
            valuesOnTableValue: params.getParam(
              'valuesOnTableValue',
              ParamType.String,
            ),
            whichCompanyId: params.getParam(
              'whichCompanyId',
              ParamType.String,
            ),
            whichCurrentAccountRef: params.getParam(
              'whichCurrentAccountRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: TaxPaymentTableWidget.routeName,
          path: TaxPaymentTableWidget.routePath,
          builder: (context, params) => TaxPaymentTableWidget(
            valuesOnTableTitle: params.getParam(
              'valuesOnTableTitle',
              ParamType.String,
            ),
            valuesOnTableDate: params.getParam(
              'valuesOnTableDate',
              ParamType.String,
            ),
            valuesOnTableBill: params.getParam(
              'valuesOnTableBill',
              ParamType.String,
            ),
            valuesOnTableDoer: params.getParam(
              'valuesOnTableDoer',
              ParamType.String,
            ),
            valuesOnTablePayCollection: params.getParam(
              'valuesOnTablePayCollection',
              ParamType.String,
            ),
            valuesOnTableValue: params.getParam(
              'valuesOnTableValue',
              ParamType.String,
            ),
            whichCompanyId: params.getParam(
              'whichCompanyId',
              ParamType.String,
            ),
            whichCurrentAccountRef: params.getParam(
              'whichCurrentAccountRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies', 'companiesCurrents'],
            ),
          ),
        ),
        FFRoute(
          name: NoteFinanceAllDetailPageWidget.routeName,
          path: NoteFinanceAllDetailPageWidget.routePath,
          asyncParams: {
            'noteFinanceAll': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => NoteFinanceAllDetailPageWidget(
            noteFinanceAll: params.getParam(
              'noteFinanceAll',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PaymentOrCollectionCheckWidget.routeName,
          path: PaymentOrCollectionCheckWidget.routePath,
          builder: (context, params) => PaymentOrCollectionCheckWidget(),
        ),
        FFRoute(
          name: UpdateCompanyCurrentPageWidget.routeName,
          path: UpdateCompanyCurrentPageWidget.routePath,
          asyncParams: {
            'companyCurrentDocumentRef': getDoc(
                ['companies', 'companiesCurrents'],
                CompaniesCurrentsRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateCompanyCurrentPageWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            companyCurrentDocumentRef: params.getParam(
              'companyCurrentDocumentRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PaymentOrCollectionCashTableWidget.routeName,
          path: PaymentOrCollectionCashTableWidget.routePath,
          builder: (context, params) => PaymentOrCollectionCashTableWidget(),
        ),
        FFRoute(
          name: FinancialAsistantWidget.routeName,
          path: FinancialAsistantWidget.routePath,
          builder: (context, params) => FinancialAsistantWidget(),
        ),
        FFRoute(
          name: VaultsWidget.routeName,
          path: VaultsWidget.routePath,
          builder: (context, params) => VaultsWidget(),
        ),
        FFRoute(
          name: CreateFinancialPlanWidget.routeName,
          path: CreateFinancialPlanWidget.routePath,
          builder: (context, params) => CreateFinancialPlanWidget(),
        ),
        FFRoute(
          name: FinancialPlanItemsWidget.routeName,
          path: FinancialPlanItemsWidget.routePath,
          asyncParams: {
            'financialPlanDocument':
                getDoc(['financialPlans'], FinancialPlansRecord.fromSnapshot),
          },
          builder: (context, params) => FinancialPlanItemsWidget(
            financialPlanDocumentRef: params.getParam(
              'financialPlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['financialPlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            planName: params.getParam(
              'planName',
              ParamType.String,
            ),
            financialPlanDocument: params.getParam(
              'financialPlanDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreateFinancialPlanItemWidget.routeName,
          path: CreateFinancialPlanItemWidget.routePath,
          builder: (context, params) => CreateFinancialPlanItemWidget(
            financialPlanDocument: params.getParam(
              'financialPlanDocument',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['financialPlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companRef: params.getParam(
              'companRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: FinancialPlanIAuthorizeSettingsWidget.routeName,
          path: FinancialPlanIAuthorizeSettingsWidget.routePath,
          asyncParams: {
            'financialPlanDocument':
                getDoc(['financialPlans'], FinancialPlansRecord.fromSnapshot),
          },
          builder: (context, params) => FinancialPlanIAuthorizeSettingsWidget(
            financialPlanDocumentRef: params.getParam(
              'financialPlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['financialPlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            planName: params.getParam(
              'planName',
              ParamType.String,
            ),
            financialPlanDocument: params.getParam(
              'financialPlanDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddFinancialPlanAuthorizeToMonitorWidget.routeName,
          path: AddFinancialPlanAuthorizeToMonitorWidget.routePath,
          asyncParams: {
            'financialPlanDocument':
                getDoc(['financialPlans'], FinancialPlansRecord.fromSnapshot),
          },
          builder: (context, params) =>
              AddFinancialPlanAuthorizeToMonitorWidget(
            financialPlanDocument: params.getParam(
              'financialPlanDocument',
              ParamType.Document,
            ),
            financialPlanDocumentRef: params.getParam(
              'financialPlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['financialPlans'],
            ),
          ),
        ),
        FFRoute(
          name: AddFinancialPlanAuthorizeToModifyWidget.routeName,
          path: AddFinancialPlanAuthorizeToModifyWidget.routePath,
          asyncParams: {
            'financialPlanDocument':
                getDoc(['financialPlans'], FinancialPlansRecord.fromSnapshot),
          },
          builder: (context, params) => AddFinancialPlanAuthorizeToModifyWidget(
            financialPlanDocument: params.getParam(
              'financialPlanDocument',
              ParamType.Document,
            ),
            financialPlanDocumentRef: params.getParam(
              'financialPlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['financialPlans'],
            ),
          ),
        ),
        FFRoute(
          name: CreateIncomePlanWidget.routeName,
          path: CreateIncomePlanWidget.routePath,
          builder: (context, params) => CreateIncomePlanWidget(),
        ),
        FFRoute(
          name: CreateInvestmentPlanWidget.routeName,
          path: CreateInvestmentPlanWidget.routePath,
          builder: (context, params) => CreateInvestmentPlanWidget(),
        ),
        FFRoute(
          name: IncomePlanItemsWidget.routeName,
          path: IncomePlanItemsWidget.routePath,
          asyncParams: {
            'incomePlanDocument':
                getDoc(['incomePlans'], IncomePlansRecord.fromSnapshot),
          },
          builder: (context, params) => IncomePlanItemsWidget(
            incomePlanDocumentRef: params.getParam(
              'incomePlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incomePlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            planName: params.getParam(
              'planName',
              ParamType.String,
            ),
            incomePlanDocument: params.getParam(
              'incomePlanDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreateIncomePlanItemWidget.routeName,
          path: CreateIncomePlanItemWidget.routePath,
          builder: (context, params) => CreateIncomePlanItemWidget(
            incomePlanDocument: params.getParam(
              'incomePlanDocument',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incomePlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companRef: params.getParam(
              'companRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
          ),
        ),
        FFRoute(
          name: IncomePlanIAuthorizeSettingsWidget.routeName,
          path: IncomePlanIAuthorizeSettingsWidget.routePath,
          asyncParams: {
            'incomePlanDocument':
                getDoc(['incomePlans'], IncomePlansRecord.fromSnapshot),
          },
          builder: (context, params) => IncomePlanIAuthorizeSettingsWidget(
            incomePlanDocumentRef: params.getParam(
              'incomePlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incomePlans'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            planName: params.getParam(
              'planName',
              ParamType.String,
            ),
            incomePlanDocument: params.getParam(
              'incomePlanDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddIncomePlanAuthorizeToModifyWidget.routeName,
          path: AddIncomePlanAuthorizeToModifyWidget.routePath,
          asyncParams: {
            'incomePlanDocument':
                getDoc(['incomePlans'], IncomePlansRecord.fromSnapshot),
          },
          builder: (context, params) => AddIncomePlanAuthorizeToModifyWidget(
            incomePlanDocument: params.getParam(
              'incomePlanDocument',
              ParamType.Document,
            ),
            incomePlanDocumentRef: params.getParam(
              'incomePlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incomePlans'],
            ),
          ),
        ),
        FFRoute(
          name: AddIncomePlanAuthorizeToMonitorWidget.routeName,
          path: AddIncomePlanAuthorizeToMonitorWidget.routePath,
          asyncParams: {
            'incomePlanDocument':
                getDoc(['incomePlans'], IncomePlansRecord.fromSnapshot),
          },
          builder: (context, params) => AddIncomePlanAuthorizeToMonitorWidget(
            incomePlanDocument: params.getParam(
              'incomePlanDocument',
              ParamType.Document,
            ),
            incomePlanDocumentRef: params.getParam(
              'incomePlanDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incomePlans'],
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountsWidget.routeName,
          path: XCurrentAccountsWidget.routePath,
          asyncParams: {
            'activePageUserDocument':
                getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentAccountsWidget(
            activePageUserRef: params.getParam(
              'activePageUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            activePageUserDocument: params.getParam(
              'activePageUserDocument',
              ParamType.Document,
            ),
            activeUserAuthorizedToMonitorCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToMonitorCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            activeUserAuthorizedToModifyCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToModifyCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: XCurrentItemsWidget.routeName,
          path: XCurrentItemsWidget.routePath,
          asyncParams: {
            'xCurrentAccountDocument': getDoc(
                ['xCurrentAccounts'], XCurrentAccountsRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentItemsWidget(
            xCurrentAccountDocument: params.getParam(
              'xCurrentAccountDocument',
              ParamType.Document,
            ),
            xCurrentAccountDocumentRef: params.getParam(
              'xCurrentAccountDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: CreateXCurrentActivityWidget.routeName,
          path: CreateXCurrentActivityWidget.routePath,
          asyncParams: {
            'xCurrentAccountDocument': getDoc(
                ['xCurrentAccounts'], XCurrentAccountsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateXCurrentActivityWidget(
            xCurrentAccountDocumentRef: params.getParam(
              'xCurrentAccountDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            creatorUserRef: params.getParam(
              'creatorUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            xCurrentAccountDocument: params.getParam(
              'xCurrentAccountDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountAuthorizeSettingsWidget.routeName,
          path: XCurrentAccountAuthorizeSettingsWidget.routePath,
          asyncParams: {
            'xCurrentAccountDocument': getDoc(
                ['xCurrentAccounts'], XCurrentAccountsRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentAccountAuthorizeSettingsWidget(
            xCurrentAccountDocumentRef: params.getParam(
              'xCurrentAccountDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            xCurrentAccountDocument: params.getParam(
              'xCurrentAccountDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddXCurrentAccountAuthorizeToModifyWidget.routeName,
          path: AddXCurrentAccountAuthorizeToModifyWidget.routePath,
          asyncParams: {
            'xCurrentAccountDocument': getDoc(
                ['xCurrentAccounts'], XCurrentAccountsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              AddXCurrentAccountAuthorizeToModifyWidget(
            xCurrentAccountDocument: params.getParam(
              'xCurrentAccountDocument',
              ParamType.Document,
            ),
            xCurrentAccountDocumentRef: params.getParam(
              'xCurrentAccountDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: AddXCurrentAccountAuthorizeToMonitorWidget.routeName,
          path: AddXCurrentAccountAuthorizeToMonitorWidget.routePath,
          asyncParams: {
            'xCurrentAccountDocument': getDoc(
                ['xCurrentAccounts'], XCurrentAccountsRecord.fromSnapshot),
          },
          builder: (context, params) =>
              AddXCurrentAccountAuthorizeToMonitorWidget(
            xCurrentAccountDocument: params.getParam(
              'xCurrentAccountDocument',
              ParamType.Document,
            ),
            xCurrentAccountDocumentRef: params.getParam(
              'xCurrentAccountDocumentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: CreateXCurrentAccountCustomerWidget.routeName,
          path: CreateXCurrentAccountCustomerWidget.routePath,
          builder: (context, params) => CreateXCurrentAccountCustomerWidget(),
        ),
        FFRoute(
          name: CreateXCurrentAccountSupplierWidget.routeName,
          path: CreateXCurrentAccountSupplierWidget.routePath,
          builder: (context, params) => CreateXCurrentAccountSupplierWidget(),
        ),
        FFRoute(
          name: CreateXCurrentAccountMixedWidget.routeName,
          path: CreateXCurrentAccountMixedWidget.routePath,
          builder: (context, params) => CreateXCurrentAccountMixedWidget(),
        ),
        FFRoute(
          name: MetricsWidget.routeName,
          path: MetricsWidget.routePath,
          builder: (context, params) => MetricsWidget(
            metricDocRef: params.getParam(
              'metricDocRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['metrics'],
            ),
          ),
        ),
        FFRoute(
          name: BusinessTrackWidget.routeName,
          path: BusinessTrackWidget.routePath,
          asyncParams: {
            'companyDocument':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
            'workPlaceDocument':
                getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => BusinessTrackWidget(
            currentUserRef: params.getParam(
              'currentUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            companyRef: params.getParam(
              'companyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            companyDocument: params.getParam(
              'companyDocument',
              ParamType.Document,
            ),
            workPlaceRef: params.getParam(
              'workPlaceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workPlaceDocument: params.getParam(
              'workPlaceDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountsIAmOwnerWidget.routeName,
          path: XCurrentAccountsIAmOwnerWidget.routePath,
          asyncParams: {
            'activePageUserDocument':
                getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentAccountsIAmOwnerWidget(
            activePageUserRef: params.getParam(
              'activePageUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            activePageUserDocument: params.getParam(
              'activePageUserDocument',
              ParamType.Document,
            ),
            activeUserAuthorizedToMonitorCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToMonitorCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            activeUserAuthorizedToModifyCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToModifyCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountsIAmPartnerWidget.routeName,
          path: XCurrentAccountsIAmPartnerWidget.routePath,
          asyncParams: {
            'activePageUserDocument':
                getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentAccountsIAmPartnerWidget(
            activePageUserRef: params.getParam(
              'activePageUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            activePageUserDocument: params.getParam(
              'activePageUserDocument',
              ParamType.Document,
            ),
            activeUserAuthorizedToMonitorCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToMonitorCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            activeUserAuthorizedToModifyCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToModifyCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountsIAmAuthorizedWorkerWidget.routeName,
          path: XCurrentAccountsIAmAuthorizedWorkerWidget.routePath,
          asyncParams: {
            'activePageUserDocument':
                getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) =>
              XCurrentAccountsIAmAuthorizedWorkerWidget(
            activePageUserRef: params.getParam(
              'activePageUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            activePageUserDocument: params.getParam(
              'activePageUserDocument',
              ParamType.Document,
            ),
            activeUserAuthorizedToMonitorCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToMonitorCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            activeUserAuthorizedToModifyCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToModifyCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: XCurrentAccountsPersonelWidget.routeName,
          path: XCurrentAccountsPersonelWidget.routePath,
          asyncParams: {
            'activePageUserDocument':
                getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => XCurrentAccountsPersonelWidget(
            activePageUserRef: params.getParam(
              'activePageUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            activePageUserDocument: params.getParam(
              'activePageUserDocument',
              ParamType.Document,
            ),
            activeUserAuthorizedToMonitorCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToMonitorCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
            activeUserAuthorizedToModifyCurrentAccounts:
                params.getParam<DocumentReference>(
              'activeUserAuthorizedToModifyCurrentAccounts',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['xCurrentAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: AuthenticationWidget.routeName,
          path: AuthenticationWidget.routePath,
          builder: (context, params) => AuthenticationWidget(),
        ),
        FFRoute(
          name: WorkPlaceHomePageForOwnerWidget.routeName,
          path: WorkPlaceHomePageForOwnerWidget.routePath,
          asyncParams: {
            'workPlace': getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => WorkPlaceHomePageForOwnerWidget(
            workPlace: params.getParam(
              'workPlace',
              ParamType.Document,
            ),
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: WorkPlaceWorkersPageWidget.routeName,
          path: WorkPlaceWorkersPageWidget.routePath,
          builder: (context, params) => WorkPlaceWorkersPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isPartner: params.getParam(
              'isPartner',
              ParamType.bool,
            ),
            canManage: params.getParam(
              'canManage',
              ParamType.bool,
            ),
            isWorker: params.getParam(
              'isWorker',
              ParamType.bool,
            ),
            canSendMoney: params.getParam(
              'canSendMoney',
              ParamType.bool,
            ),
            canManageTask: params.getParam(
              'canManageTask',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AllProductsPageWidget.routeName,
          path: AllProductsPageWidget.routePath,
          asyncParams: {
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AllProductsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AllCalculateProductsPageWidget.routeName,
          path: AllCalculateProductsPageWidget.routePath,
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AllCalculateProductsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SocialWidget.routeName,
          path: SocialWidget.routePath,
          builder: (context, params) => SocialWidget(),
        ),
        FFRoute(
          name: ParentProductsPageWidget.routeName,
          path: ParentProductsPageWidget.routePath,
          builder: (context, params) => ParentProductsPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            isOwner: params.getParam(
              'isOwner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: AddNewFinanceNoteCompanyWidget.routeName,
          path: AddNewFinanceNoteCompanyWidget.routePath,
          asyncParams: {
            'noteFinanceCompany': getDoc(['users', 'financialMonitoringNotes'],
                FinancialMonitoringNotesRecord.fromSnapshot),
          },
          builder: (context, params) => AddNewFinanceNoteCompanyWidget(
            isEdit: params.getParam(
              'isEdit',
              ParamType.bool,
            ),
            noteFinanceCompany: params.getParam(
              'noteFinanceCompany',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddSoldPageWidget.routeName,
          path: AddSoldPageWidget.routePath,
          asyncParams: {
            'childProduct': getDoc(['products'], ProductsRecord.fromSnapshot),
            'parentProduct': getDoc(['companies', 'parentProducts'],
                ParentProductsRecord.fromSnapshot),
            'calculation': getDoc(
                ['products', 'calculations'], CalculationsRecord.fromSnapshot),
          },
          builder: (context, params) => AddSoldPageWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            childProduct: params.getParam(
              'childProduct',
              ParamType.Document,
            ),
            parentProduct: params.getParam(
              'parentProduct',
              ParamType.Document,
            ),
            workPlace: params.getParam(
              'workPlace',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            calculation: params.getParam(
              'calculation',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) => ChatWidget(),
        ),
        FFRoute(
          name: WorkersWidget.routeName,
          path: WorkersWidget.routePath,
          builder: (context, params) => WorkersWidget(),
        ),
        FFRoute(
          name: WorkersChooseWorkerWidget.routeName,
          path: WorkersChooseWorkerWidget.routePath,
          builder: (context, params) => WorkersChooseWorkerWidget(
            workPlaceDocRef: params.getParam(
              'workPlaceDocRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            companyDocRef: params.getParam(
              'companyDocRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
          ),
        ),
        FFRoute(
          name: WorkersPaymentDetailWidget.routeName,
          path: WorkersPaymentDetailWidget.routePath,
          asyncParams: {
            'workerPlaceWorkerDocument': getDoc(
                ['workPlaces', 'workPlaceWorker'],
                WorkPlaceWorkerRecord.fromSnapshot),
          },
          builder: (context, params) => WorkersPaymentDetailWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaces: params.getParam(
              'workPlaces',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workerUserRef: params.getParam(
              'workerUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workerPlaceWorkerDocument: params.getParam(
              'workerPlaceWorkerDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: BusinessChooseWidget.routeName,
          path: BusinessChooseWidget.routePath,
          builder: (context, params) => BusinessChooseWidget(
            companiesIcanSee: params.getParam<DocumentReference>(
              'companiesIcanSee',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['companies'],
            ),
            companiesICanSeeNames: params.getParam<String>(
              'companiesICanSeeNames',
              ParamType.String,
              isList: true,
            ),
            workPlacesICanSee: params.getParam<DocumentReference>(
              'workPlacesICanSee',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['workPlaces'],
            ),
            workPlacesICanSeeNames: params.getParam<String>(
              'workPlacesICanSeeNames',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: ChooseXCurrentTypePageWidget.routeName,
          path: ChooseXCurrentTypePageWidget.routePath,
          builder: (context, params) => ChooseXCurrentTypePageWidget(),
        ),
        FFRoute(
          name: BusinessChooseMainTitlesWidget.routeName,
          path: BusinessChooseMainTitlesWidget.routePath,
          asyncParams: {
            'companyDocument':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
            'workPlaceDocument':
                getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
          },
          builder: (context, params) => BusinessChooseMainTitlesWidget(
            companyDocument: params.getParam(
              'companyDocument',
              ParamType.Document,
            ),
            workPlaceDocument: params.getParam(
              'workPlaceDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: InvestedMoniestToWorkPlaceWidget.routeName,
          path: InvestedMoniestToWorkPlaceWidget.routePath,
          asyncParams: {
            'workPlaceDocument':
                getDoc(['workPlaces'], WorkPlacesRecord.fromSnapshot),
            'companyDocument':
                getDoc(['companies'], CompaniesRecord.fromSnapshot),
          },
          builder: (context, params) => InvestedMoniestToWorkPlaceWidget(
            workPlaceDocument: params.getParam(
              'workPlaceDocument',
              ParamType.Document,
            ),
            companyDocument: params.getParam(
              'companyDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkersAddPaymentWidget.routeName,
          path: WorkersAddPaymentWidget.routePath,
          asyncParams: {
            'workPlaceWorkerDoc': getDoc(['workPlaces', 'workPlaceWorker'],
                WorkPlaceWorkerRecord.fromSnapshot),
          },
          builder: (context, params) => WorkersAddPaymentWidget(
            company: params.getParam(
              'company',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['companies'],
            ),
            workPlaces: params.getParam(
              'workPlaces',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['workPlaces'],
            ),
            workerUserRef: params.getParam(
              'workerUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            workPlaceWorkerDoc: params.getParam(
              'workPlaceWorkerDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: WorkersChooseCompanyWorkPlaceWidget.routeName,
          path: WorkersChooseCompanyWorkPlaceWidget.routePath,
          builder: (context, params) => WorkersChooseCompanyWorkPlaceWidget(
            companiesIcanSee: params.getParam<DocumentReference>(
              'companiesIcanSee',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['companies'],
            ),
            companiesICanSeeNames: params.getParam<String>(
              'companiesICanSeeNames',
              ParamType.String,
              isList: true,
            ),
            workPlacesICanSee: params.getParam<DocumentReference>(
              'workPlacesICanSee',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['workPlaces'],
            ),
            workPlacesICanSeeNames: params.getParam<String>(
              'workPlacesICanSeeNames',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: PaymentOrCollectionCashWidget.routeName,
          path: PaymentOrCollectionCashWidget.routePath,
          builder: (context, params) => PaymentOrCollectionCashWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authentication';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
