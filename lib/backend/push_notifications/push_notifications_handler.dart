import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SettingsEditProfile': ParameterData.none(),
  'Kurulum': ParameterData.none(),
  'invitationMain': ParameterData.none(),
  'Kur': ParameterData.none(),
  'SirketKur': (data) async => ParameterData(
        allParams: {
          'invitation': getParameter<bool>(data, 'invitation'),
        },
      ),
  'LimitedSirketKur': (data) async => ParameterData(
        allParams: {
          'companyType': getParameter<String>(data, 'companyType'),
          'invitation': getParameter<bool>(data, 'invitation'),
        },
      ),
  'OfisKur': (data) async => ParameterData(
        allParams: {
          'invtitation': getParameter<bool>(data, 'invtitation'),
        },
      ),
  'isyerikur': (data) async => ParameterData(
        allParams: {
          'invitation': getParameter<bool>(data, 'invitation'),
        },
      ),
  'FabrikaKur': (data) async => ParameterData(
        allParams: {
          'invitation': getParameter<bool>(data, 'invitation'),
        },
      ),
  'SantiyeKur': (data) async => ParameterData(
        allParams: {
          'invitation': getParameter<bool>(data, 'invitation'),
        },
      ),
  'workPlacesDetailPage': (data) async => ParameterData(
        allParams: {
          'companyId': getParameter<DocumentReference>(data, 'companyId'),
        },
      ),
  'workerInvitationOld': ParameterData.none(),
  'ortaklkKur': ParameterData.none(),
  'calisanDavetEtPage2': ParameterData.none(),
  'receivedInvitations': ParameterData.none(),
  'sentInvitations': ParameterData.none(),
  'DepartmantsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyName': getParameter<String>(data, 'companyName'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canAddDepartmnet': getParameter<bool>(data, 'canAddDepartmnet'),
        },
      ),
  'AddDepartment': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'DepartmentEmployess': (data) async => ParameterData(
        allParams: {
          'department': await getDocumentParameter<CompanyDepartmentsRecord>(
              data, 'department', CompanyDepartmentsRecord.fromSnapshot),
          'departmentName': getParameter<String>(data, 'departmentName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'RolesPage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canAddRole': getParameter<bool>(data, 'canAddRole'),
        },
      ),
  'AddRolePage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyTasksPage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyTaskAdd': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'InvitationDetail': (data) async => ParameterData(
        allParams: {
          'invitations': await getDocumentParameter<InvitationsRecord>(
              data, 'invitations', InvitationsRecord.fromSnapshot),
        },
      ),
  'SendInvitationDetail': (data) async => ParameterData(
        allParams: {
          'invitation': await getDocumentParameter<InvitationsRecord>(
              data, 'invitation', InvitationsRecord.fromSnapshot),
        },
      ),
  'workerInvitation01User': (data) async => ParameterData(
        allParams: {
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'workerInvitation02Companies': (data) async => ParameterData(
        allParams: {
          'workerID': getParameter<DocumentReference>(data, 'workerID'),
          'workerName': getParameter<String>(data, 'workerName'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'workerInvitation03WorkPlace': (data) async => ParameterData(
        allParams: {
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workerRef': getParameter<DocumentReference>(data, 'workerRef'),
          'workerName': getParameter<String>(data, 'workerName'),
          'companyName': getParameter<String>(data, 'companyName'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'workerInvitation04Unit': (data) async => ParameterData(
        allParams: {
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workerRef': getParameter<DocumentReference>(data, 'workerRef'),
          'workerName': getParameter<String>(data, 'workerName'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'companyName': getParameter<String>(data, 'companyName'),
          'workPlaceName': getParameter<String>(data, 'workPlaceName'),
          'department': getParameter<DocumentReference>(data, 'department'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'WorkerInvitation05Department': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'wokerName': getParameter<String>(data, 'wokerName'),
          'workerRef': getParameter<DocumentReference>(data, 'workerRef'),
          'workerPlace': getParameter<DocumentReference>(data, 'workerPlace'),
          'companyName': getParameter<String>(data, 'companyName'),
          'workPlaceName': getParameter<String>(data, 'workPlaceName'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'WorkerInvitation06Role': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workerName': getParameter<String>(data, 'workerName'),
          'workerRef': getParameter<DocumentReference>(data, 'workerRef'),
          'workerPlace': getParameter<DocumentReference>(data, 'workerPlace'),
          'workerUnit': getParameter<DocumentReference>(data, 'workerUnit'),
          'workerDepartment':
              getParameter<DocumentReference>(data, 'workerDepartment'),
          'companyName': getParameter<String>(data, 'companyName'),
          'workPlaceName': getParameter<String>(data, 'workPlaceName'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'CompanyTaskReadReportsPage': (data) async => ParameterData(
        allParams: {
          'task': await getDocumentParameter<CompanyTasksRecord>(
              data, 'task', CompanyTasksRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyTaskDutiesPage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyTaskDutiesCreatePage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyTasksForDutyCreatePage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'dutiesForCompany':
              getParameter<DocumentReference>(data, 'dutiesForCompany'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyTasksDutiesShowReportsPage': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'dutiesForCompanyRef':
              getParameter<DocumentReference>(data, 'dutiesForCompanyRef'),
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyShowAllTaskDutiesPage': (data) async => ParameterData(
        allParams: {
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
        },
      ),
  'CompanyTaskDutiesReadReportPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'dutiesForCompany':
              getParameter<DocumentReference>(data, 'dutiesForCompany'),
          'companyTaskDuties':
              await getDocumentParameter<CompanyTaskDutiesRecord>(data,
                  'companyTaskDuties', CompanyTaskDutiesRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CreateForm': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'CreateFormFields': (data) async => ParameterData(
        allParams: {
          'form': await getDocumentParameter<FormsRecord>(
              data, 'form', FormsRecord.fromSnapshot),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'ResponseFormForTask': (data) async => ParameterData(
        allParams: {
          'companyTask': await getDocumentParameter<CompanyTasksRecord>(
              data, 'companyTask', CompanyTasksRecord.fromSnapshot),
          'createdUserRef':
              getParameter<DocumentReference>(data, 'createdUserRef'),
        },
      ),
  'ResponseFormForDuty': (data) async => ParameterData(
        allParams: {
          'companyTaskDuties':
              await getDocumentParameter<CompanyTaskDutiesRecord>(data,
                  'companyTaskDuties', CompanyTaskDutiesRecord.fromSnapshot),
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
        },
      ),
  'ShowAllFormsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'ShowFormFieldsPage': (data) async => ParameterData(
        allParams: {
          'form': await getDocumentParameter<FormsRecord>(
              data, 'form', FormsRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyInstructionsCreatePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CompanyInstrucionForDepartment': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'companyInstructionsForRole': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CompanyInstructionForUnit': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CompanyInstructionForPerson': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'DailyPage': ParameterData.none(),
  'CompanyUnitsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canAddUnit': getParameter<bool>(data, 'canAddUnit'),
        },
      ),
  'CompanyUnitAddPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyRoleEmployees': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'roleName': getParameter<String>(data, 'roleName'),
          'companyRole': await getDocumentParameter<CompanyRolesRecord>(
              data, 'companyRole', CompanyRolesRecord.fromSnapshot),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
        },
      ),
  'CompanyUnitEmployees': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'unitName': getParameter<String>(data, 'unitName'),
          'companyUnit': await getDocumentParameter<CompanyUnitsRecord>(
              data, 'companyUnit', CompanyUnitsRecord.fromSnapshot),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
        },
      ),
  'EmployeeDetailPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'sentMoneyForAllowencePage': (data) async => ParameterData(
        allParams: {
          'companyWorker':
              getParameter<DocumentReference>(data, 'companyWorker'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'receiver': getParameter<DocumentReference>(data, 'receiver'),
        },
      ),
  'MyVaultPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'SpendExpandituryDetailPage': (data) async => ParameterData(
        allParams: {
          'spentMoneyForAllowence':
              await getDocumentParameter<SpentMoneyForAllowenceRecord>(
                  data,
                  'spentMoneyForAllowence',
                  SpentMoneyForAllowenceRecord.fromSnapshot),
        },
      ),
  'ExpandituriesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'SentExpandituryDetailPage': (data) async => ParameterData(
        allParams: {
          'sentMoneyForAllowence':
              await getDocumentParameter<SentMoneyForAllowenceRecord>(
                  data,
                  'sentMoneyForAllowence',
                  SentMoneyForAllowenceRecord.fromSnapshot),
        },
      ),
  'CompanyWorkerCompanyPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyName': getParameter<String>(data, 'companyName'),
        },
      ),
  'CompanyWorkerTasksPage': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'SendTransactionPage': (data) async => ParameterData(
        allParams: {
          'companyReport': await getDocumentParameter<CompanyReportsRecord>(
              data, 'companyReport', CompanyReportsRecord.fromSnapshot),
        },
      ),
  'ShowMyTransactionsPage': (data) async => ParameterData(
        allParams: {
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'canManageStock': getParameter<bool>(data, 'canManageStock'),
        },
      ),
  'TransactionDetailPage': (data) async => ParameterData(
        allParams: {
          'transaction': await getDocumentParameter<CompanyTransactionsRecord>(
              data, 'transaction', CompanyTransactionsRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageTransaction':
              getParameter<bool>(data, 'canManageTransaction'),
          'canManageStock': getParameter<bool>(data, 'canManageStock'),
        },
      ),
  'ShowAllTransactionPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageTransaction':
              getParameter<bool>(data, 'canManageTransaction'),
          'canManageStocks': getParameter<bool>(data, 'canManageStocks'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
        },
      ),
  'CompaniesBudgetPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'ConfirmationsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'createNewConfirmation': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'MessagePage': (data) async => ParameterData(
        allParams: {
          'confirmation': await getDocumentParameter<ConfirmationsRecord>(
              data, 'confirmation', ConfirmationsRecord.fromSnapshot),
        },
      ),
  'IncomesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canAddIncome': getParameter<bool>(data, 'canAddIncome'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'PaymentsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canAddPayment': getParameter<bool>(data, 'canAddPayment'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'TransactionDetailForDailyPage': (data) async => ParameterData(
        allParams: {
          'transaction': await getDocumentParameter<CompanyTransactionsRecord>(
              data, 'transaction', CompanyTransactionsRecord.fromSnapshot),
          'isIncome': getParameter<bool>(data, 'isIncome'),
          'companyIncomeRef':
              getParameter<DocumentReference>(data, 'companyIncomeRef'),
          'companyPaymentsRed':
              getParameter<DocumentReference>(data, 'companyPaymentsRed'),
          'showStock': getParameter<bool>(data, 'showStock'),
          'stockMovement':
              getParameter<DocumentReference>(data, 'stockMovement'),
        },
      ),
  'StocksPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'AddStockPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'StockDetailPage': (data) async => ParameterData(
        allParams: {
          'stock': await getDocumentParameter<StocksRecord>(
              data, 'stock', StocksRecord.fromSnapshot),
        },
      ),
  'StockMovementDetailPage': (data) async => ParameterData(
        allParams: {
          'stockMovement': await getDocumentParameter<StockMovementRecord>(
              data, 'stockMovement', StockMovementRecord.fromSnapshot),
        },
      ),
  'WorkerInvitation07Salary': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workerName': getParameter<String>(data, 'workerName'),
          'workerRef': getParameter<DocumentReference>(data, 'workerRef'),
          'workerPlace': getParameter<DocumentReference>(data, 'workerPlace'),
          'workerUnit': getParameter<DocumentReference>(data, 'workerUnit'),
          'workerDepartment':
              getParameter<DocumentReference>(data, 'workerDepartment'),
          'companyName': getParameter<String>(data, 'companyName'),
          'workerRole': getParameter<DocumentReference>(data, 'workerRole'),
          'workPlaceName': getParameter<String>(data, 'workPlaceName'),
          'routeBack': getParameter<bool>(data, 'routeBack'),
        },
      ),
  'CompanyWorkersPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageWorker': getParameter<bool>(data, 'canManageWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canViewWorker': getParameter<bool>(data, 'canViewWorker'),
        },
      ),
  'currentAccountActivity': ParameterData.none(),
  'CompanyConfirmationChooseCompanyPage': ParameterData.none(),
  'CompanyConfirmationsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyConfirmationMessagePage': (data) async => ParameterData(
        allParams: {
          'companyConfirmation':
              await getDocumentParameter<CompanyConfirmationsRecord>(
                  data,
                  'companyConfirmation',
                  CompanyConfirmationsRecord.fromSnapshot),
        },
      ),
  'CompanyConfirmationsCreateConfirmation': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyConfirmationRequestPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'WorkplaceConfirmationChooseWorkplacePage': ParameterData.none(),
  'WorkplaceConfirmationMessagePage': (data) async => ParameterData(
        allParams: {
          'workplaceConfirmation':
              await getDocumentParameter<WorkplaceConfirmationsRecord>(
                  data,
                  'workplaceConfirmation',
                  WorkplaceConfirmationsRecord.fromSnapshot),
        },
      ),
  'WorkplaceConfirmationRequestPage': (data) async => ParameterData(
        allParams: {
          'workplace': getParameter<DocumentReference>(data, 'workplace'),
        },
      ),
  'WorkplaceConfirmationCreateConfirmationPage': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkplaceConfirmationsPage': (data) async => ParameterData(
        allParams: {
          'workplace': getParameter<DocumentReference>(data, 'workplace'),
        },
      ),
  'socialSendRequest': ParameterData.none(),
  'SocialReceivedRequest': ParameterData.none(),
  'CurrentAccountCreatePage': ParameterData.none(),
  'CurrentAccountBillsPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'CurrentAccountCreateBillPage': (data) async => ParameterData(
        allParams: {
          'currentAccountId':
              getParameter<DocumentReference>(data, 'currentAccountId'),
        },
      ),
  'CurrentAccountBillsDetailPage': (data) async => ParameterData(
        allParams: {
          'bill': await getDocumentParameter<CurrentAccountBillRecord>(
              data, 'bill', CurrentAccountBillRecord.fromSnapshot),
        },
      ),
  'currentAccountActivityCompany': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CurrentAccountBillsDetailForCompanyPage': (data) async => ParameterData(
        allParams: {
          'bill': await getDocumentParameter<CurrentAccountBillRecord>(
              data, 'bill', CurrentAccountBillRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CurrentAccountBillsForCompanyPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CurrentAccountCreateBillPForCompanyPage': (data) async => ParameterData(
        allParams: {
          'currentAccountId':
              getParameter<DocumentReference>(data, 'currentAccountId'),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CurrentAccountCreateForCompanyPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CurrentAccountForCompanyPageRequest': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CurrentAccountBillForCompanyPageRequest': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'forPaid': getParameter<bool>(data, 'forPaid'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CurrentAccountBillsDetailForCompanyPagePaidAccept': (data) async =>
      ParameterData(
        allParams: {
          'bill': await getDocumentParameter<CurrentAccountBillRecord>(
              data, 'bill', CurrentAccountBillRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CompanyNotificationsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'ExpandedIncomeCompanyBillPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'expandedPaymentCompanyBillPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'CurrentAccountRequestPageForUser': ParameterData.none(),
  'CurrentAccountBillRequestsPageForUser': (data) async => ParameterData(
        allParams: {
          'forPaid': getParameter<bool>(data, 'forPaid'),
        },
      ),
  'CurrentAccountBillsDetailForUserPage': (data) async => ParameterData(
        allParams: {
          'bill': await getDocumentParameter<CurrentAccountBillRecord>(
              data, 'bill', CurrentAccountBillRecord.fromSnapshot),
        },
      ),
  'ExpectedIncomeUserBillPage': ParameterData.none(),
  'ExpectedPaymentBillUserPage': ParameterData.none(),
  'MatchCurrentAccountPage': (data) async => ParameterData(
        allParams: {
          'currentAccount':
              getParameter<DocumentReference>(data, 'currentAccount'),
        },
      ),
  'MatchCurrentAccountRequestesPage': ParameterData.none(),
  'MatchCurrentAccountRequestesForCompanyPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyVehiclesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canAddVehicle': getParameter<bool>(data, 'canAddVehicle'),
          'canCreateVehiclePayment':
              getParameter<bool>(data, 'canCreateVehiclePayment'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'CompanyAddVehicle': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyVehiclePayments': (data) async => ParameterData(
        allParams: {
          'vehicle': await getDocumentParameter<CompanyVehiclesRecord>(
              data, 'vehicle', CompanyVehiclesRecord.fromSnapshot),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'CopmanyVehicleAddPayment': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyVehicle': await getDocumentParameter<CompanyVehiclesRecord>(
              data, 'companyVehicle', CompanyVehiclesRecord.fromSnapshot),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'CompanyTransactionForVehiclePaymentPage': (data) async => ParameterData(
        allParams: {
          'transaction': await getDocumentParameter<CompanyTransactionsRecord>(
              data, 'transaction', CompanyTransactionsRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'canManageStock': getParameter<bool>(data, 'canManageStock'),
        },
      ),
  'EditEmployeeDetail': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'copmanyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'copmanyWorker', CompanyWorkersRecord.fromSnapshot),
          'myWorkedWorkPlace':
              getParameter<DocumentReference>(data, 'myWorkedWorkPlace'),
          'canManageWorker': getParameter<bool>(data, 'canManageWorker'),
        },
      ),
  'PersonalConfirmationChoosePersonPage': ParameterData.none(),
  'PersonalConfirmationsPage': ParameterData.none(),
  'PersonalConfirmationMessagePage': (data) async => ParameterData(
        allParams: {
          'personalConfirmation':
              await getDocumentParameter<PersonalConfirmationsRecord>(
                  data,
                  'personalConfirmation',
                  PersonalConfirmationsRecord.fromSnapshot),
        },
      ),
  'emailVerifyPage': ParameterData.none(),
  'CompanyControlPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'copmanyDetail': await getDocumentParameter<CompaniesRecord>(
              data, 'copmanyDetail', CompaniesRecord.fromSnapshot),
        },
      ),
  'CompanyControlFinancePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyDetail': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDetail', CompaniesRecord.fromSnapshot),
        },
      ),
  'CompanyControlOrganizationPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyControlOperationsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CopmanyControlCommunication': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CopmanyPartnershipsPage': (data) async => ParameterData(
        allParams: {
          'companyDetail': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDetail', CompaniesRecord.fromSnapshot),
        },
      ),
  'CompanyPartnersManagePage': (data) async => ParameterData(
        allParams: {
          'partnership': await getDocumentParameter<PartnershipsRecord>(
              data, 'partnership', PartnershipsRecord.fromSnapshot),
          'company': await getDocumentParameter<CompaniesRecord>(
              data, 'company', CompaniesRecord.fromSnapshot),
        },
      ),
  'AddPartnerCompanyPage': (data) async => ParameterData(
        allParams: {
          'companyDetail': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDetail', CompaniesRecord.fromSnapshot),
        },
      ),
  'AddPartnerCompanyStep2Page': (data) async => ParameterData(
        allParams: {
          'companyDetail': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDetail', CompaniesRecord.fromSnapshot),
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'CompanyControlForPartnerPage': (data) async => ParameterData(
        allParams: {
          'partnership': await getDocumentParameter<PartnershipsRecord>(
              data, 'partnership', PartnershipsRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyControlFinanceForPartnerPage': (data) async => ParameterData(
        allParams: {
          'partnership': await getDocumentParameter<PartnershipsRecord>(
              data, 'partnership', PartnershipsRecord.fromSnapshot),
        },
      ),
  'CompanyControlOrganizationForPartnerPage': (data) async => ParameterData(
        allParams: {
          'partner': await getDocumentParameter<PartnershipsRecord>(
              data, 'partner', PartnershipsRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyControlOperationsForPartnerPage': (data) async => ParameterData(
        allParams: {
          'partner': await getDocumentParameter<PartnershipsRecord>(
              data, 'partner', PartnershipsRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'CompanyControlCommunicationForPartnerPage': (data) async => ParameterData(
        allParams: {
          'partner': await getDocumentParameter<PartnershipsRecord>(
              data, 'partner', PartnershipsRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'AddDepartmentPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'DepartmansPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageDepartment':
              getParameter<bool>(data, 'canManageDepartment'),
          'canViewEmployee': getParameter<bool>(data, 'canViewEmployee'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
        },
      ),
  'DepartmentEmployeePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'departmentRefs':
              await getDocumentParameter<CompanyDepartmentsRecord>(data,
                  'departmentRefs', CompanyDepartmentsRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canManageDepartments':
              getParameter<bool>(data, 'canManageDepartments'),
          'workplace': getParameter<DocumentReference>(data, 'workplace'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
        },
      ),
  'EmployeeDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'worker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'worker', CompanyWorkersRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageWorker': getParameter<bool>(data, 'canManageWorker'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'EditEmployeeDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'UnitsPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canManageUnit': getParameter<bool>(data, 'canManageUnit'),
          'canViewEmployee': getParameter<bool>(data, 'canViewEmployee'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
        },
      ),
  'UnitsEmployeePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'unitRefs': await getDocumentParameter<CompanyUnitsRecord>(
              data, 'unitRefs', CompanyUnitsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
        },
      ),
  'AddUnitPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageUnit': getParameter<bool>(data, 'canManageUnit'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'RolesPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageRole': getParameter<bool>(data, 'canManageRole'),
          'canViewEmployee': getParameter<bool>(data, 'canViewEmployee'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
        },
      ),
  'AddRolePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'RoleEmployeePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'role': await getDocumentParameter<CompanyRolesRecord>(
              data, 'role', CompanyRolesRecord.fromSnapshot),
          'copmany': getParameter<DocumentReference>(data, 'copmany'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canManageRole': getParameter<bool>(data, 'canManageRole'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
        },
      ),
  'InstructionsCreatePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'InstructionWorkPlacePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canCreateInstructions':
              getParameter<bool>(data, 'canCreateInstructions'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'InstructionsDepartmentPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canSendInstruction': getParameter<bool>(data, 'canSendInstruction'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'UnitInstructionsPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'RoleInstructionPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'PersonInstructionsPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceCreateTaskPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTasksPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreateTask': getParameter<bool>(data, 'canCreateTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canManageStock': getParameter<bool>(data, 'canManageStock'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'TransactiondetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManageTransaction':
              getParameter<bool>(data, 'canManageTransaction'),
          'canManageStock': getParameter<bool>(data, 'canManageStock'),
          'transaction': await getDocumentParameter<WorkPlaceTransactionRecord>(
              data, 'transaction', WorkPlaceTransactionRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'workPlaceTaskReadReportPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canSendTransaction': getParameter<bool>(data, 'canSendTransaction'),
          'task': await getDocumentParameter<CompanyTasksRecord>(
              data, 'task', CompanyTasksRecord.fromSnapshot),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'SendTransactionPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'companyReport': await getDocumentParameter<CompanyReportsRecord>(
              data, 'companyReport', CompanyReportsRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canSendTransaction': getParameter<bool>(data, 'canSendTransaction'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTaskDutiesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreateTask': getParameter<bool>(data, 'canCreateTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTaskDutiesCreatePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTaskForDutyCreatePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'dutiesForCompany':
              getParameter<DocumentReference>(data, 'dutiesForCompany'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceShowAllTaskDutiesPage': (data) async => ParameterData(
        allParams: {
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'workPlaceTaskDutiesReadReportPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'dutiesForCompany':
              getParameter<DocumentReference>(data, 'dutiesForCompany'),
          'companyTaskDuties':
              await getDocumentParameter<CompanyTaskDutiesRecord>(data,
                  'companyTaskDuties', CompanyTaskDutiesRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTasksDutiesShowReportsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'WorkPlaceAddVehicle': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canAddVehicle': getParameter<bool>(data, 'canAddVehicle'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceVehiclePayments': (data) async => ParameterData(
        allParams: {
          'vehicle': await getDocumentParameter<CompanyVehiclesRecord>(
              data, 'vehicle', CompanyVehiclesRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreateVehiclePayment':
              getParameter<bool>(data, 'canCreateVehiclePayment'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceVehiclesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'canCreateVehicle': getParameter<bool>(data, 'canCreateVehicle'),
          'canCreateVehiclePayment':
              getParameter<bool>(data, 'canCreateVehiclePayment'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceAddVehiclePaymentPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'vehicle': await getDocumentParameter<CompanyVehiclesRecord>(
              data, 'vehicle', CompanyVehiclesRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'AddStockPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'StockDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'stock': await getDocumentParameter<StocksRecord>(
              data, 'stock', StocksRecord.fromSnapshot),
        },
      ),
  'StockMovementDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'stockMovement': await getDocumentParameter<StockMovementRecord>(
              data, 'stockMovement', StockMovementRecord.fromSnapshot),
        },
      ),
  'StocksPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'MyVaultPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
        },
      ),
  'sentMoneyForAllowencePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'receiver': getParameter<DocumentReference>(data, 'receiver'),
          'receiverCompanyWorker':
              getParameter<DocumentReference>(data, 'receiverCompanyWorker'),
        },
      ),
  'sendExpandituryDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'sendMoneyForAllowence':
              await getDocumentParameter<SentMoneyForAllowenceWorkPlaceRecord>(
                  data,
                  'sendMoneyForAllowence',
                  SentMoneyForAllowenceWorkPlaceRecord.fromSnapshot),
        },
      ),
  'SpendExpandituryDetailPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'spendMoneyForAllowence':
              await getDocumentParameter<SpentMonetForAllowenceWorkPlaceRecord>(
                  data,
                  'spendMoneyForAllowence',
                  SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot),
        },
      ),
  'ShowMyTransactionPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'ShowAllTransactionPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceTransactionForVehiclePayment': (data) async => ParameterData(
        allParams: {
          'transaction': await getDocumentParameter<WorkPlaceTransactionRecord>(
              data, 'transaction', WorkPlaceTransactionRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'WorkPlaceControlFinancePage': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'WorkPlaceControlOperationsPage': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'workPlaceControlCommunicationPage': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'ExpandituriesPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceOrganizationPage': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'WorkPlaceNotificationsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlacePartnerManagePage': (data) async => ParameterData(
        allParams: {
          'partnership': await getDocumentParameter<WorkPlacePartnershipRecord>(
              data, 'partnership', WorkPlacePartnershipRecord.fromSnapshot),
          'workPlacePartnerRef':
              getParameter<DocumentReference>(data, 'workPlacePartnerRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
        },
      ),
  'AddPartnerWorkPlacePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'wokrPlace': getParameter<DocumentReference>(data, 'wokrPlace'),
        },
      ),
  'AddPartnerWorkPlaceStep2Page': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'PartnersWorkPlacePage': (data) async => ParameterData(
        allParams: {
          'workPlaceRef': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlaceRef', WorkPlacesRecord.fromSnapshot),
          'workPlacePartnerRef':
              getParameter<DocumentReference>(data, 'workPlacePartnerRef'),
        },
      ),
  'WorkPlaceControlOrganizationPageForPartner': (data) async => ParameterData(
        allParams: {
          'partnerDetail':
              await getDocumentParameter<WorkPlacePartnershipRecord>(data,
                  'partnerDetail', WorkPlacePartnershipRecord.fromSnapshot),
        },
      ),
  'WorkPlaceControlOperationsPageForPartner': (data) async => ParameterData(
        allParams: {
          'partnerDetail':
              await getDocumentParameter<WorkPlacePartnershipRecord>(data,
                  'partnerDetail', WorkPlacePartnershipRecord.fromSnapshot),
        },
      ),
  'WorkPlaceControlFinancePageForPartner': (data) async => ParameterData(
        allParams: {
          'partnerDetail':
              await getDocumentParameter<WorkPlacePartnershipRecord>(data,
                  'partnerDetail', WorkPlacePartnershipRecord.fromSnapshot),
        },
      ),
  'WorkPlaceControlCommunicationPageForPartner': (data) async => ParameterData(
        allParams: {
          'partnerDetail':
              await getDocumentParameter<WorkPlacePartnershipRecord>(data,
                  'partnerDetail', WorkPlacePartnershipRecord.fromSnapshot),
        },
      ),
  'WorkPlaceControlForWorker': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceControlOrganizationForWorker': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceControlOperationsForWorker': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceControlFinanceForWorker': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceControlCommunicationForWorker': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'WorkPlaceTasksWorkerPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'canSendTransaction': getParameter<bool>(data, 'canSendTransaction'),
          'canCreate': getParameter<bool>(data, 'canCreate'),
        },
      ),
  'WorkplaceComplex': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'CompanyComplex': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'support': ParameterData.none(),
  'notifications': ParameterData.none(),
  'AllConfirmaitonsRequestPage': ParameterData.none(),
  'PhoneConfirmationsCreateConfirmation': ParameterData.none(),
  'PhoneConfirmationMessagePage': (data) async => ParameterData(
        allParams: {
          'confirmation': await getDocumentParameter<PhoneConfirmationsRecord>(
              data, 'confirmation', PhoneConfirmationsRecord.fromSnapshot),
        },
      ),
  'MoneyTransferPage': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'SpendMoneyPage': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'MoneyTransferPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'SpendMoneyWorkPlacePage': (data) async => ParameterData(
        allParams: {
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'SharedFileActionsPage': (data) async => ParameterData(
        allParams: {
          'path': getParameter<String>(data, 'path'),
        },
      ),
  'AddManualIncomePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyIncome': await getDocumentParameter<CompanyIncomes2025Record>(
              data, 'companyIncome', CompanyIncomes2025Record.fromSnapshot),
          'isEdit': getParameter<bool>(data, 'isEdit'),
        },
      ),
  'AddManualPaymentPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'companyPayment':
              await getDocumentParameter<CompanyPayments2025Record>(data,
                  'companyPayment', CompanyPayments2025Record.fromSnapshot),
        },
      ),
  'AddManualIncomePageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyIncome': await getDocumentParameter<CompanyIncomes2025Record>(
              data, 'companyIncome', CompanyIncomes2025Record.fromSnapshot),
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'AddManualPaymentPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'companyPayment':
              await getDocumentParameter<CompanyPayments2025Record>(data,
                  'companyPayment', CompanyPayments2025Record.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'IncomesPageWorkPlaceCopy': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canAddIncome': getParameter<bool>(data, 'canAddIncome'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'PaymentsPageWorkPlaceCopy': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canAddPayment': getParameter<bool>(data, 'canAddPayment'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'ReportResultAddIncomePage': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'value': getParameter<double>(data, 'value'),
          'companyTransaction':
              getParameter<DocumentReference>(data, 'companyTransaction'),
          'workPlaceTransaction':
              getParameter<DocumentReference>(data, 'workPlaceTransaction'),
          'transactionName': getParameter<String>(data, 'transactionName'),
          'companyName': getParameter<String>(data, 'companyName'),
        },
      ),
  'ReportResultAddPaymentPage': (data) async => ParameterData(
        allParams: {
          'value': getParameter<double>(data, 'value'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'companyTransaction':
              getParameter<DocumentReference>(data, 'companyTransaction'),
          'workPlaceTransaction':
              getParameter<DocumentReference>(data, 'workPlaceTransaction'),
          'companyName': getParameter<String>(data, 'companyName'),
          'transactionName': getParameter<String>(data, 'transactionName'),
        },
      ),
  'ReportResultAddIncomeForOwner': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'ReportResultPageAddPaymentForOwner': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'companyName': getParameter<String>(data, 'companyName'),
        },
      ),
  'ReportResultPageForOwner': (data) async => ParameterData(
        allParams: {
          'companyReport': await getDocumentParameter<CompanyReportsRecord>(
              data, 'companyReport', CompanyReportsRecord.fromSnapshot),
          'companyName': getParameter<String>(data, 'companyName'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'MyAllNotes': ParameterData.none(),
  'NoteDetailPage': (data) async => ParameterData(
        allParams: {
          'note': await getDocumentParameter<NotesRecord>(
              data, 'note', NotesRecord.fromSnapshot),
        },
      ),
  'AddNewNotePage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'note': await getDocumentParameter<NotesRecord>(
              data, 'note', NotesRecord.fromSnapshot),
        },
      ),
  'ShowAllReportsPage': ParameterData.none(),
  'ReportDetailPage': (data) async => ParameterData(
        allParams: {
          'companyReport': await getDocumentParameter<CompanyReportsRecord>(
              data, 'companyReport', CompanyReportsRecord.fromSnapshot),
          'creatorName': getParameter<String>(data, 'creatorName'),
          'sentToName': getParameter<String>(data, 'sentToName'),
        },
      ),
  'UpdateNotePage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'note': await getDocumentParameter<NotesRecord>(
              data, 'note', NotesRecord.fromSnapshot),
        },
      ),
  'CVPage': ParameterData.none(),
  'AddNewProductPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CalculateCostPage': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CalculateDetailPage': (data) async => ParameterData(
        allParams: {
          'calculate': await getDocumentParameter<CalculationsRecord>(
              data, 'calculate', CalculationsRecord.fromSnapshot),
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'UpdateProductPage': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
        },
      ),
  'ChatAI': ParameterData.none(),
  'InstructionPage': ParameterData.none(),
  'FormCreateGraphicPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'StockOperationPage': (data) async => ParameterData(
        allParams: {
          'stock': await getDocumentParameter<StocksRecord>(
              data, 'stock', StocksRecord.fromSnapshot),
        },
      ),
  'AddParentProductPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'EditCalculationsPage': (data) async => ParameterData(
        allParams: {
          'calculation': await getDocumentParameter<CalculationsRecord>(
              data, 'calculation', CalculationsRecord.fromSnapshot),
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'receivedPartnershipInvitation': ParameterData.none(),
  'sentPartnershipInvitation': ParameterData.none(),
  'UpdateParentProductPage': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ParentProductsRecord>(
              data, 'product', ParentProductsRecord.fromSnapshot),
        },
      ),
  'SocialFriendPage': ParameterData.none(),
  'AddNewNoteImportantPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteImportant': await getDocumentParameter<ImportantNotesRecord>(
              data, 'noteImportant', ImportantNotesRecord.fromSnapshot),
        },
      ),
  'AddNewNoteGoalPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteGoal': await getDocumentParameter<GoalNotesRecord>(
              data, 'noteGoal', GoalNotesRecord.fromSnapshot),
        },
      ),
  'AddNewNoteDiaryPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteDiary': await getDocumentParameter<PersonalDiaryRecord>(
              data, 'noteDiary', PersonalDiaryRecord.fromSnapshot),
        },
      ),
  'UpdateNoteImportantPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteImportant': await getDocumentParameter<ImportantNotesRecord>(
              data, 'noteImportant', ImportantNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteGoalPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteGoal': await getDocumentParameter<GoalNotesRecord>(
              data, 'noteGoal', GoalNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteDiaryPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteDiary': await getDocumentParameter<PersonalDiaryRecord>(
              data, 'noteDiary', PersonalDiaryRecord.fromSnapshot),
        },
      ),
  'NoteImportantDetailPage': (data) async => ParameterData(
        allParams: {
          'noteImportant': await getDocumentParameter<ImportantNotesRecord>(
              data, 'noteImportant', ImportantNotesRecord.fromSnapshot),
        },
      ),
  'NoteGoalDetailPage': (data) async => ParameterData(
        allParams: {
          'noteGoal': await getDocumentParameter<GoalNotesRecord>(
              data, 'noteGoal', GoalNotesRecord.fromSnapshot),
        },
      ),
  'NoteDiaryDetailPage': (data) async => ParameterData(
        allParams: {
          'noteDiary': await getDocumentParameter<PersonalDiaryRecord>(
              data, 'noteDiary', PersonalDiaryRecord.fromSnapshot),
        },
      ),
  'financialMonitoring': (data) async => ParameterData(
        allParams: {
          'listContainCompanyName':
              getParameter<String>(data, 'listContainCompanyName'),
          'listContainWorkPlaceName':
              getParameter<String>(data, 'listContainWorkPlaceName'),
          'listContainDate': getParameter<String>(data, 'listContainDate'),
          'listContainPaymentOrCollection':
              getParameter<String>(data, 'listContainPaymentOrCollection'),
          'listContainWhichAccount':
              getParameter<String>(data, 'listContainWhichAccount'),
          'listContainValue': getParameter<String>(data, 'listContainValue'),
        },
      ),
  'noteFinanceCompanyDetailPage': (data) async => ParameterData(
        allParams: {
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'noteFinancePersonalDetailPage': (data) async => ParameterData(
        allParams: {
          'noteFinancePersonal':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinancePersonal',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'noteFinanceFamilyDetailPage': (data) async => ParameterData(
        allParams: {
          'noteFinanceFamily':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceFamily',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'noteFinanceDetailPage': (data) async => ParameterData(
        allParams: {
          'noteFinance':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(data,
                  'noteFinance', FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteFinanceWorkPlacePage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceWorkPlace':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceWorkPlace',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteFinanceCompanyPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteFinancePersonalPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinancePersonal':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinancePersonal',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteFinanceFamilyPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceFamily':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceFamily',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNoteFinancePage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinance':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(data,
                  'noteFinance', FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'workPlaceControlForPartner': (data) async => ParameterData(
        allParams: {
          'workPlacePartnership':
              await getDocumentParameter<WorkPlacePartnershipRecord>(
                  data,
                  'workPlacePartnership',
                  WorkPlacePartnershipRecord.fromSnapshot),
        },
      ),
  'workPlaceNotesPage': (data) async => ParameterData(
        allParams: {
          'workPLace': getParameter<DocumentReference>(data, 'workPLace'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'companyNotesPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'subContractorPage': ParameterData.none(),
  'solutionPartner': ParameterData.none(),
  'CalculateBillsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'BillDetailPage': (data) async => ParameterData(
        allParams: {
          'bill': await getDocumentParameter<CurrentAccountBillRecord>(
              data, 'bill', CurrentAccountBillRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
          'currentAccount': await getDocumentParameter<CurrentAccountRecord>(
              data, 'currentAccount', CurrentAccountRecord.fromSnapshot),
        },
      ),
  'DeleteRequestPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'EmployeeDetailFirstPage': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'EmployeePermissionsPage': (data) async => ParameterData(
        allParams: {
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
        },
      ),
  'ShiftRequestPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'ShiftRequestersPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'EmployeeDetailFirstPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'canViewTask': getParameter<bool>(data, 'canViewTask'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
        },
      ),
  'EmployeePermissionsPageWorkPlace': (data) async => ParameterData(
        allParams: {
          'canManageEmployee': getParameter<bool>(data, 'canManageEmployee'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'companyWorker': await getDocumentParameter<CompanyWorkersRecord>(
              data, 'companyWorker', CompanyWorkersRecord.fromSnapshot),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'SalaryDetailPage': (data) async => ParameterData(
        allParams: {
          'companyPayment': await getDocumentParameter<CompanySalaryRecord>(
              data, 'companyPayment', CompanySalaryRecord.fromSnapshot),
        },
      ),
  'CompanySalaryPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'WorkPlaceSalaryPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'personalCPA': ParameterData.none(),
  'AddNewCompanyNotePage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'hasCompanyRecord': getParameter<bool>(data, 'hasCompanyRecord'),
          'hasMachineFailure': getParameter<bool>(data, 'hasMachineFailure'),
          'hasPersonnelNote': getParameter<bool>(data, 'hasPersonnelNote'),
          'hasFinancialNote': getParameter<bool>(data, 'hasFinancialNote'),
          'hasTaxNote': getParameter<bool>(data, 'hasTaxNote'),
        },
      ),
  'UpdateCompanyNotePage': (data) async => ParameterData(
        allParams: {
          'companyNote': await getDocumentParameter<CompanyNotesRecord>(
              data, 'companyNote', CompanyNotesRecord.fromSnapshot),
        },
      ),
  'CompanyNoteDetailPage': (data) async => ParameterData(
        allParams: {
          'companyNote': await getDocumentParameter<CompanyNotesRecord>(
              data, 'companyNote', CompanyNotesRecord.fromSnapshot),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'AddNewWorkPlaceNotePage': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'hasVehicleFault': getParameter<bool>(data, 'hasVehicleFault'),
          'hasMachineFault': getParameter<bool>(data, 'hasMachineFault'),
          'hasFinancialNotes': getParameter<bool>(data, 'hasFinancialNotes'),
          'hasTaxNotes': getParameter<bool>(data, 'hasTaxNotes'),
          'hasPersonnelNotes': getParameter<bool>(data, 'hasPersonnelNotes'),
          'hasWorkplaceNotes': getParameter<bool>(data, 'hasWorkplaceNotes'),
        },
      ),
  'WrokPlaceNoteDetailPage': (data) async => ParameterData(
        allParams: {
          'workPlaceNote': await getDocumentParameter<WorkPlaceNotesRecord>(
              data, 'workPlaceNote', WorkPlaceNotesRecord.fromSnapshot),
          'canManage': getParameter<bool>(data, 'canManage'),
        },
      ),
  'UpdateWorkPlaceNotePage': (data) async => ParameterData(
        allParams: {
          'workPlaceNote': await getDocumentParameter<WorkPlaceNotesRecord>(
              data, 'workPlaceNote', WorkPlaceNotesRecord.fromSnapshot),
        },
      ),
  'FormGraphicPage': (data) async => ParameterData(
        allParams: {
          'xName': getParameter<String>(data, 'xName'),
          'yName': getParameter<String>(data, 'yName'),
        },
      ),
  'CreateTaskStep1': ParameterData.none(),
  'CreateTaskStep6ForSingleTask': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'workPlaceWorker': await getDocumentParameter<WorkPlaceWorkerRecord>(
              data, 'workPlaceWorker', WorkPlaceWorkerRecord.fromSnapshot),
          'form': getParameter<DocumentReference>(data, 'form'),
        },
      ),
  'CreateTaskStep2': (data) async => ParameterData(
        allParams: {
          'isDutyTask': getParameter<bool>(data, 'isDutyTask'),
        },
      ),
  'CreateTaskStep3': (data) async => ParameterData(
        allParams: {
          'isDutyTask': getParameter<bool>(data, 'isDutyTask'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canCreateWorkPlace': getParameter<bool>(data, 'canCreateWorkPlace'),
          'canCreateForm': getParameter<bool>(data, 'canCreateForm'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
        },
      ),
  'CreateTaskStep4': (data) async => ParameterData(
        allParams: {
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canCreateForm': getParameter<bool>(data, 'canCreateForm'),
          'isDutyTask': getParameter<bool>(data, 'isDutyTask'),
          'canAddNewEmployee': getParameter<bool>(data, 'canAddNewEmployee'),
        },
      ),
  'CreateTaskStep5ForSingleTask': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isDutyTask': getParameter<bool>(data, 'isDutyTask'),
          'workPlaceWorker': await getDocumentParameter<WorkPlaceWorkerRecord>(
              data, 'workPlaceWorker', WorkPlaceWorkerRecord.fromSnapshot),
          'canCreateForm': getParameter<bool>(data, 'canCreateForm'),
        },
      ),
  'CreateTaskStep6ForTaskDuties': (data) async => ParameterData(
        allParams: {
          'companyName': getParameter<String>(data, 'companyName'),
          'dutiesForCompany':
              getParameter<DocumentReference>(data, 'dutiesForCompany'),
          'company': getParameter<DocumentReference>(data, 'company'),
          'canCreateForm': getParameter<bool>(data, 'canCreateForm'),
        },
      ),
  'CreateTaskStep5ForTaskDuties': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'workPlaceWorker': await getDocumentParameter<WorkPlaceWorkerRecord>(
              data, 'workPlaceWorker', WorkPlaceWorkerRecord.fromSnapshot),
          'canCreateForm': getParameter<bool>(data, 'canCreateForm'),
        },
      ),
  'SendReportStep1': ParameterData.none(),
  'SendReportStep2': (data) async => ParameterData(
        allParams: {
          'dutiesForCompany':
              await getDocumentParameter<DutiesForCompanyRecord>(data,
                  'dutiesForCompany', DutiesForCompanyRecord.fromSnapshot),
        },
      ),
  'profilePage': ParameterData.none(),
  'MessageNewPageCopy': (data) async => ParameterData(
        allParams: {
          'message': await getDocumentParameter<MessageRecord>(
              data, 'message', MessageRecord.fromSnapshot),
          'type': getParameter<String>(data, 'type'),
          'conversationId': getParameter<int>(data, 'conversationId'),
          'receiverUser': await getDocumentParameter<UsersRecord>(
              data, 'receiverUser', UsersRecord.fromSnapshot),
        },
      ),
  'shopping': ParameterData.none(),
  'myCity': ParameterData.none(),
  'transportation': ParameterData.none(),
  'productionTrade': ParameterData.none(),
  'places': ParameterData.none(),
  'residenceCity': ParameterData.none(),
  'favoritesShopping': ParameterData.none(),
  'categoriesShopping': ParameterData.none(),
  'myOrdersShopping': ParameterData.none(),
  'artCulture': ParameterData.none(),
  'confirmationUserDetailPage': (data) async => ParameterData(
        allParams: {
          'receiverUser': await getDocumentParameter<UsersRecord>(
              data, 'receiverUser', UsersRecord.fromSnapshot),
          'conversationId': getParameter<int>(data, 'conversationId'),
          'message': await getDocumentParameter<MessageRecord>(
              data, 'message', MessageRecord.fromSnapshot),
          'conversationType': getParameter<String>(data, 'conversationType'),
        },
      ),
  'recommandation': ParameterData.none(),
  'warning': ParameterData.none(),
  'confirmationMediasPage': (data) async => ParameterData(
        allParams: {
          'conversationId': getParameter<int>(data, 'conversationId'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'blockedConversationPage': ParameterData.none(),
  'ConfirmationStarredMessagesPage': (data) async => ParameterData(
        allParams: {
          'conversationId': getParameter<int>(data, 'conversationId'),
          'receiverUser': await getDocumentParameter<UsersRecord>(
              data, 'receiverUser', UsersRecord.fromSnapshot),
        },
      ),
  'MessageColorSettingsPage': (data) async => ParameterData(
        allParams: {
          'message': await getDocumentParameter<MessageRecord>(
              data, 'message', MessageRecord.fromSnapshot),
        },
      ),
  'addNewFinanceNoteFamily': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'AddNewFinanceNotePersonal': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'currentDetailPage': (data) async => ParameterData(
        allParams: {
          'companyCurrentDocumentRef': getParameter<DocumentReference>(
              data, 'companyCurrentDocumentRef'),
        },
      ),
  'billPage': (data) async => ParameterData(
        allParams: {
          'currentAccounts': await getDocumentParameter<CurrentAccountRecord>(
              data, 'currentAccounts', CurrentAccountRecord.fromSnapshot),
        },
      ),
  'AddNewNotePageUrgent': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'urgentNote': await getDocumentParameter<UrgentNotesRecord>(
              data, 'urgentNote', UrgentNotesRecord.fromSnapshot),
        },
      ),
  'urgentNoteDetailPage': (data) async => ParameterData(
        allParams: {
          'note': await getDocumentParameter<UrgentNotesRecord>(
              data, 'note', UrgentNotesRecord.fromSnapshot),
        },
      ),
  'UpdateNotePageUrgent': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'urgentNote': await getDocumentParameter<UrgentNotesRecord>(
              data, 'urgentNote', UrgentNotesRecord.fromSnapshot),
        },
      ),
  'completedUrgentNote': (data) async => ParameterData(
        allParams: {
          'completedUrgentNote': await getDocumentParameter<UrgentNotesRecord>(
              data, 'completedUrgentNote', UrgentNotesRecord.fromSnapshot),
        },
      ),
  'companyBillDetailPage': (data) async => ParameterData(
        allParams: {
          'companyBillDocument': await getDocumentParameter<CompanyBillRecord>(
              data, 'companyBillDocument', CompanyBillRecord.fromSnapshot),
        },
      ),
  'createBillPage': (data) async => ParameterData(
        allParams: {
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
        },
      ),
  'updateBillPage': (data) async => ParameterData(
        allParams: {
          'whicBill': await getDocumentParameter<CompanyBillRecord>(
              data, 'whicBill', CompanyBillRecord.fromSnapshot),
        },
      ),
  'updatePaymentCompany': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'companyPaymentDoc':
              await getDocumentParameter<FinancialNoteCompanyRecord>(data,
                  'companyPaymentDoc', FinancialNoteCompanyRecord.fromSnapshot),
        },
      ),
  'PaymentOrCollectionDetail': (data) async => ParameterData(
        allParams: {
          'paymentDocument':
              await getDocumentParameter<FinancialNoteCompanyRecord>(data,
                  'paymentDocument', FinancialNoteCompanyRecord.fromSnapshot),
        },
      ),
  'addCurrentAccount': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'checkDetail': (data) async => ParameterData(
        allParams: {
          'paymentDocument':
              await getDocumentParameter<FinancialNoteCompanyCheckRecord>(
                  data,
                  'paymentDocument',
                  FinancialNoteCompanyCheckRecord.fromSnapshot),
        },
      ),
  'updateCheckCompany': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'companyPaymentDoc':
              await getDocumentParameter<FinancialNoteCompanyCheckRecord>(
                  data,
                  'companyPaymentDoc',
                  FinancialNoteCompanyCheckRecord.fromSnapshot),
        },
      ),
  'addNewCompanyCheck': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'checkCompany':
              await getDocumentParameter<FinancialNoteCompanyCheckRecord>(data,
                  'checkCompany', FinancialNoteCompanyCheckRecord.fromSnapshot),
        },
      ),
  'cashPaymentTable': (data) async => ParameterData(
        allParams: {
          'valuesOnTableTitle':
              getParameter<String>(data, 'valuesOnTableTitle'),
          'valuesOnTableDate': getParameter<String>(data, 'valuesOnTableDate'),
          'valuesOnTableBill': getParameter<String>(data, 'valuesOnTableBill'),
          'valuesOnTableDoer': getParameter<String>(data, 'valuesOnTableDoer'),
          'valuesOnTablePayCollection':
              getParameter<String>(data, 'valuesOnTablePayCollection'),
          'valuesOnTableValue':
              getParameter<String>(data, 'valuesOnTableValue'),
          'whichCompanyId': getParameter<String>(data, 'whichCompanyId'),
          'whichCurrentAccountRef':
              getParameter<DocumentReference>(data, 'whichCurrentAccountRef'),
        },
      ),
  'checkPaymentTable': (data) async => ParameterData(
        allParams: {
          'valuesOnTableTitle':
              getParameter<String>(data, 'valuesOnTableTitle'),
          'valuesOnTableDate': getParameter<String>(data, 'valuesOnTableDate'),
          'valuesOnTableBill': getParameter<String>(data, 'valuesOnTableBill'),
          'valuesOnTableDoer': getParameter<String>(data, 'valuesOnTableDoer'),
          'valuesOnTablePayCollection':
              getParameter<String>(data, 'valuesOnTablePayCollection'),
          'valuesOnTableValue':
              getParameter<String>(data, 'valuesOnTableValue'),
          'whichCompanyId': getParameter<String>(data, 'whichCompanyId'),
          'whichCurrentAccountRef':
              getParameter<DocumentReference>(data, 'whichCurrentAccountRef'),
        },
      ),
  'workerPaymentTable': (data) async => ParameterData(
        allParams: {
          'valuesOnTableTitle':
              getParameter<String>(data, 'valuesOnTableTitle'),
          'valuesOnTableDate': getParameter<String>(data, 'valuesOnTableDate'),
          'valuesOnTableBill': getParameter<String>(data, 'valuesOnTableBill'),
          'valuesOnTableDoer': getParameter<String>(data, 'valuesOnTableDoer'),
          'valuesOnTablePayCollection':
              getParameter<String>(data, 'valuesOnTablePayCollection'),
          'valuesOnTableValue':
              getParameter<String>(data, 'valuesOnTableValue'),
          'whichCompanyId': getParameter<String>(data, 'whichCompanyId'),
          'whichCurrentAccountRef':
              getParameter<DocumentReference>(data, 'whichCurrentAccountRef'),
        },
      ),
  'socialSecurityPaymentTable': (data) async => ParameterData(
        allParams: {
          'valuesOnTableTitle':
              getParameter<String>(data, 'valuesOnTableTitle'),
          'valuesOnTableDate': getParameter<String>(data, 'valuesOnTableDate'),
          'valuesOnTableBill': getParameter<String>(data, 'valuesOnTableBill'),
          'valuesOnTableDoer': getParameter<String>(data, 'valuesOnTableDoer'),
          'valuesOnTablePayCollection':
              getParameter<String>(data, 'valuesOnTablePayCollection'),
          'valuesOnTableValue':
              getParameter<String>(data, 'valuesOnTableValue'),
          'whichCompanyId': getParameter<String>(data, 'whichCompanyId'),
          'whichCurrentAccountRef':
              getParameter<DocumentReference>(data, 'whichCurrentAccountRef'),
        },
      ),
  'taxPaymentTable': (data) async => ParameterData(
        allParams: {
          'valuesOnTableTitle':
              getParameter<String>(data, 'valuesOnTableTitle'),
          'valuesOnTableDate': getParameter<String>(data, 'valuesOnTableDate'),
          'valuesOnTableBill': getParameter<String>(data, 'valuesOnTableBill'),
          'valuesOnTableDoer': getParameter<String>(data, 'valuesOnTableDoer'),
          'valuesOnTablePayCollection':
              getParameter<String>(data, 'valuesOnTablePayCollection'),
          'valuesOnTableValue':
              getParameter<String>(data, 'valuesOnTableValue'),
          'whichCompanyId': getParameter<String>(data, 'whichCompanyId'),
          'whichCurrentAccountRef':
              getParameter<DocumentReference>(data, 'whichCurrentAccountRef'),
        },
      ),
  'noteFinanceAllDetailPage': (data) async => ParameterData(
        allParams: {
          'noteFinanceAll':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceAll',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'paymentOrCollectionCheck': ParameterData.none(),
  'updateCompanyCurrentPage': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'companyCurrentDocumentRef':
              await getDocumentParameter<CompaniesCurrentsRecord>(
                  data,
                  'companyCurrentDocumentRef',
                  CompaniesCurrentsRecord.fromSnapshot),
        },
      ),
  'paymentOrCollectionCashTable': ParameterData.none(),
  'financialAsistant': ParameterData.none(),
  'vaults': ParameterData.none(),
  'createFinancialPlan': ParameterData.none(),
  'financialPlanItems': (data) async => ParameterData(
        allParams: {
          'financialPlanDocumentRef':
              getParameter<DocumentReference>(data, 'financialPlanDocumentRef'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
          'planName': getParameter<String>(data, 'planName'),
          'financialPlanDocument':
              await getDocumentParameter<FinancialPlansRecord>(data,
                  'financialPlanDocument', FinancialPlansRecord.fromSnapshot),
        },
      ),
  'createFinancialPlanItem': (data) async => ParameterData(
        allParams: {
          'financialPlanDocument':
              getParameter<DocumentReference>(data, 'financialPlanDocument'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companRef': getParameter<DocumentReference>(data, 'companRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
        },
      ),
  'financialPlanIAuthorizeSettings': (data) async => ParameterData(
        allParams: {
          'financialPlanDocumentRef':
              getParameter<DocumentReference>(data, 'financialPlanDocumentRef'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
          'planName': getParameter<String>(data, 'planName'),
          'financialPlanDocument':
              await getDocumentParameter<FinancialPlansRecord>(data,
                  'financialPlanDocument', FinancialPlansRecord.fromSnapshot),
        },
      ),
  'addFinancialPlanAuthorizeToMonitor': (data) async => ParameterData(
        allParams: {
          'financialPlanDocument':
              await getDocumentParameter<FinancialPlansRecord>(data,
                  'financialPlanDocument', FinancialPlansRecord.fromSnapshot),
          'financialPlanDocumentRef':
              getParameter<DocumentReference>(data, 'financialPlanDocumentRef'),
        },
      ),
  'addFinancialPlanAuthorizeToModify': (data) async => ParameterData(
        allParams: {
          'financialPlanDocument':
              await getDocumentParameter<FinancialPlansRecord>(data,
                  'financialPlanDocument', FinancialPlansRecord.fromSnapshot),
          'financialPlanDocumentRef':
              getParameter<DocumentReference>(data, 'financialPlanDocumentRef'),
        },
      ),
  'createIncomePlan': ParameterData.none(),
  'createInvestmentPlan': ParameterData.none(),
  'IncomePlanItems': (data) async => ParameterData(
        allParams: {
          'incomePlanDocumentRef':
              getParameter<DocumentReference>(data, 'incomePlanDocumentRef'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
          'planName': getParameter<String>(data, 'planName'),
          'incomePlanDocument': await getDocumentParameter<IncomePlansRecord>(
              data, 'incomePlanDocument', IncomePlansRecord.fromSnapshot),
        },
      ),
  'createIncomePlanItem': (data) async => ParameterData(
        allParams: {
          'incomePlanDocument':
              getParameter<DocumentReference>(data, 'incomePlanDocument'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companRef': getParameter<DocumentReference>(data, 'companRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
        },
      ),
  'incomePlanIAuthorizeSettings': (data) async => ParameterData(
        allParams: {
          'incomePlanDocumentRef':
              getParameter<DocumentReference>(data, 'incomePlanDocumentRef'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
          'planName': getParameter<String>(data, 'planName'),
          'incomePlanDocument': await getDocumentParameter<IncomePlansRecord>(
              data, 'incomePlanDocument', IncomePlansRecord.fromSnapshot),
        },
      ),
  'addIncomePlanAuthorizeToModify': (data) async => ParameterData(
        allParams: {
          'incomePlanDocument': await getDocumentParameter<IncomePlansRecord>(
              data, 'incomePlanDocument', IncomePlansRecord.fromSnapshot),
          'incomePlanDocumentRef':
              getParameter<DocumentReference>(data, 'incomePlanDocumentRef'),
        },
      ),
  'addIncomePlanAuthorizeToMonitor': (data) async => ParameterData(
        allParams: {
          'incomePlanDocument': await getDocumentParameter<IncomePlansRecord>(
              data, 'incomePlanDocument', IncomePlansRecord.fromSnapshot),
          'incomePlanDocumentRef':
              getParameter<DocumentReference>(data, 'incomePlanDocumentRef'),
        },
      ),
  'xCurrentAccounts': (data) async => ParameterData(
        allParams: {
          'activePageUserRef':
              getParameter<DocumentReference>(data, 'activePageUserRef'),
          'activePageUserDocument': await getDocumentParameter<UsersRecord>(
              data, 'activePageUserDocument', UsersRecord.fromSnapshot),
        },
      ),
  'xCurrentItems': (data) async => ParameterData(
        allParams: {
          'xCurrentAccountDocument':
              await getDocumentParameter<XCurrentAccountsRecord>(
                  data,
                  'xCurrentAccountDocument',
                  XCurrentAccountsRecord.fromSnapshot),
          'xCurrentAccountDocumentRef': getParameter<DocumentReference>(
              data, 'xCurrentAccountDocumentRef'),
        },
      ),
  'createXCurrentActivity': (data) async => ParameterData(
        allParams: {
          'xCurrentAccountDocumentRef': getParameter<DocumentReference>(
              data, 'xCurrentAccountDocumentRef'),
          'creatorUserRef':
              getParameter<DocumentReference>(data, 'creatorUserRef'),
          'xCurrentAccountDocument':
              await getDocumentParameter<XCurrentAccountsRecord>(
                  data,
                  'xCurrentAccountDocument',
                  XCurrentAccountsRecord.fromSnapshot),
        },
      ),
  'xCurrentAccountAuthorizeSettings': (data) async => ParameterData(
        allParams: {
          'xCurrentAccountDocumentRef': getParameter<DocumentReference>(
              data, 'xCurrentAccountDocumentRef'),
          'xCurrentAccountDocument':
              await getDocumentParameter<XCurrentAccountsRecord>(
                  data,
                  'xCurrentAccountDocument',
                  XCurrentAccountsRecord.fromSnapshot),
        },
      ),
  'addXCurrentAccountAuthorizeToModify': (data) async => ParameterData(
        allParams: {
          'xCurrentAccountDocument':
              await getDocumentParameter<XCurrentAccountsRecord>(
                  data,
                  'xCurrentAccountDocument',
                  XCurrentAccountsRecord.fromSnapshot),
          'xCurrentAccountDocumentRef': getParameter<DocumentReference>(
              data, 'xCurrentAccountDocumentRef'),
        },
      ),
  'addXCurrentAccountAuthorizeToMonitor': (data) async => ParameterData(
        allParams: {
          'xCurrentAccountDocument':
              await getDocumentParameter<XCurrentAccountsRecord>(
                  data,
                  'xCurrentAccountDocument',
                  XCurrentAccountsRecord.fromSnapshot),
          'xCurrentAccountDocumentRef': getParameter<DocumentReference>(
              data, 'xCurrentAccountDocumentRef'),
        },
      ),
  'createXCurrentAccountCustomer': ParameterData.none(),
  'createXCurrentAccountSupplier': ParameterData.none(),
  'createXCurrentAccountMixed': ParameterData.none(),
  'metrics': (data) async => ParameterData(
        allParams: {
          'metricDocRef': getParameter<DocumentReference>(data, 'metricDocRef'),
        },
      ),
  'businessTrack': (data) async => ParameterData(
        allParams: {
          'currentUserRef':
              getParameter<DocumentReference>(data, 'currentUserRef'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'companyDocument': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDocument', CompaniesRecord.fromSnapshot),
          'workPlaceRef': getParameter<DocumentReference>(data, 'workPlaceRef'),
          'workPlaceDocument': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlaceDocument', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'xCurrentAccountsIAmOwner': (data) async => ParameterData(
        allParams: {
          'activePageUserRef':
              getParameter<DocumentReference>(data, 'activePageUserRef'),
          'activePageUserDocument': await getDocumentParameter<UsersRecord>(
              data, 'activePageUserDocument', UsersRecord.fromSnapshot),
        },
      ),
  'xCurrentAccountsIAmPartner': (data) async => ParameterData(
        allParams: {
          'activePageUserRef':
              getParameter<DocumentReference>(data, 'activePageUserRef'),
          'activePageUserDocument': await getDocumentParameter<UsersRecord>(
              data, 'activePageUserDocument', UsersRecord.fromSnapshot),
        },
      ),
  'xCurrentAccountsIAmAuthorizedWorker': (data) async => ParameterData(
        allParams: {
          'activePageUserRef':
              getParameter<DocumentReference>(data, 'activePageUserRef'),
          'activePageUserDocument': await getDocumentParameter<UsersRecord>(
              data, 'activePageUserDocument', UsersRecord.fromSnapshot),
        },
      ),
  'xCurrentAccountsPersonel': (data) async => ParameterData(
        allParams: {
          'activePageUserRef':
              getParameter<DocumentReference>(data, 'activePageUserRef'),
          'activePageUserDocument': await getDocumentParameter<UsersRecord>(
              data, 'activePageUserDocument', UsersRecord.fromSnapshot),
        },
      ),
  'Authentication': ParameterData.none(),
  'WorkPlaceHomePageForOwner': (data) async => ParameterData(
        allParams: {
          'workPlace': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlace', WorkPlacesRecord.fromSnapshot),
          'company': getParameter<DocumentReference>(data, 'company'),
        },
      ),
  'WorkPlaceWorkersPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isPartner': getParameter<bool>(data, 'isPartner'),
          'canManage': getParameter<bool>(data, 'canManage'),
          'isWorker': getParameter<bool>(data, 'isWorker'),
          'canSendMoney': getParameter<bool>(data, 'canSendMoney'),
          'canManageTask': getParameter<bool>(data, 'canManageTask'),
        },
      ),
  'AllProductsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'AllCalculateProductsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'product': await getDocumentParameter<ProductsRecord>(
              data, 'product', ProductsRecord.fromSnapshot),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'social': ParameterData.none(),
  'ParentProductsPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'isOwner': getParameter<bool>(data, 'isOwner'),
        },
      ),
  'AddNewFinanceNoteCompany': (data) async => ParameterData(
        allParams: {
          'isEdit': getParameter<bool>(data, 'isEdit'),
          'noteFinanceCompany':
              await getDocumentParameter<FinancialMonitoringNotesRecord>(
                  data,
                  'noteFinanceCompany',
                  FinancialMonitoringNotesRecord.fromSnapshot),
        },
      ),
  'AddSoldPage': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'childProduct': await getDocumentParameter<ProductsRecord>(
              data, 'childProduct', ProductsRecord.fromSnapshot),
          'parentProduct': await getDocumentParameter<ParentProductsRecord>(
              data, 'parentProduct', ParentProductsRecord.fromSnapshot),
          'workPlace': getParameter<DocumentReference>(data, 'workPlace'),
          'calculation': await getDocumentParameter<CalculationsRecord>(
              data, 'calculation', CalculationsRecord.fromSnapshot),
        },
      ),
  'chat': ParameterData.none(),
  'workers': ParameterData.none(),
  'workersChooseWorker': (data) async => ParameterData(
        allParams: {
          'workPlaceDocRef':
              getParameter<DocumentReference>(data, 'workPlaceDocRef'),
          'companyDocRef':
              getParameter<DocumentReference>(data, 'companyDocRef'),
        },
      ),
  'workersPaymentDetail': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlaces': getParameter<DocumentReference>(data, 'workPlaces'),
          'workerUserRef':
              getParameter<DocumentReference>(data, 'workerUserRef'),
          'workerPlaceWorkerDocument':
              await getDocumentParameter<WorkPlaceWorkerRecord>(
                  data,
                  'workerPlaceWorkerDocument',
                  WorkPlaceWorkerRecord.fromSnapshot),
        },
      ),
  'businessChoose': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'chooseXCurrentTypePage': ParameterData.none(),
  'businessChooseMainTitles': (data) async => ParameterData(
        allParams: {
          'companyDocument': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDocument', CompaniesRecord.fromSnapshot),
          'workPlaceDocument': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlaceDocument', WorkPlacesRecord.fromSnapshot),
        },
      ),
  'investedMoniestToWorkPlace': (data) async => ParameterData(
        allParams: {
          'workPlaceDocument': await getDocumentParameter<WorkPlacesRecord>(
              data, 'workPlaceDocument', WorkPlacesRecord.fromSnapshot),
          'companyDocument': await getDocumentParameter<CompaniesRecord>(
              data, 'companyDocument', CompaniesRecord.fromSnapshot),
        },
      ),
  'workersAddPayment': (data) async => ParameterData(
        allParams: {
          'company': getParameter<DocumentReference>(data, 'company'),
          'workPlaces': getParameter<DocumentReference>(data, 'workPlaces'),
          'workerUserRef':
              getParameter<DocumentReference>(data, 'workerUserRef'),
          'workPlaceWorkerDoc':
              await getDocumentParameter<WorkPlaceWorkerRecord>(data,
                  'workPlaceWorkerDoc', WorkPlaceWorkerRecord.fromSnapshot),
        },
      ),
  'workersChooseCompanyWorkPlace': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'Profile': ParameterData.none(),
  'paymentOrCollectionCash': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
