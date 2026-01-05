import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/companies_record.dart';
import 'schema/work_history_record.dart';
import 'schema/work_places_record.dart';
import 'schema/acquisitions_record.dart';
import 'schema/heavy_machinery_record.dart';
import 'schema/notifications_record.dart';
import 'schema/invitations_record.dart';
import 'schema/reports_record.dart';
import 'schema/company_payments2025_record.dart';
import 'schema/company_incomes2025_record.dart';
import 'schema/work_place_payments2025_record.dart';
import 'schema/work_place_incomes2025_record.dart';
import 'schema/company_partners_record.dart';
import 'schema/work_place_partners_record.dart';
import 'schema/work_place_worker_record.dart';
import 'schema/virtual_positions_company_record.dart';
import 'schema/virtual_positions_work_place_record.dart';
import 'schema/reports_created_by_user_record.dart';
import 'schema/duties_for_company_record.dart';
import 'schema/duty_steps_for_company_record.dart';
import 'schema/company_departments_record.dart';
import 'schema/company_units_record.dart';
import 'schema/company_roles_record.dart';
import 'schema/company_workers_record.dart';
import 'schema/company_reports_record.dart';
import 'schema/company_tasks_record.dart';
import 'schema/company_projects_record.dart';
import 'schema/company_process_duties_record.dart';
import 'schema/company_task_duties_record.dart';
import 'schema/work_place_units_record.dart';
import 'schema/company_task_fields_record.dart';
import 'schema/forms_record.dart';
import 'schema/form_fields_record.dart';
import 'schema/form_responses_record.dart';
import 'schema/instructions_record.dart';
import 'schema/sent_money_for_allowence_record.dart';
import 'schema/spent_money_for_allowence_record.dart';
import 'schema/company_transactions_record.dart';
import 'schema/confirmations_record.dart';
import 'schema/stocks_record.dart';
import 'schema/stock_movement_record.dart';
import 'schema/confirmation_messages_record.dart';
import 'schema/current_account_record.dart';
import 'schema/current_account_bill_record.dart';
import 'schema/current_account_activity_record.dart';
import 'schema/company_confirmations_record.dart';
import 'schema/company_confirmation_messages_record.dart';
import 'schema/my_worked_work_place_record.dart';
import 'schema/all_confirmations_record.dart';
import 'schema/workplace_confirmations_record.dart';
import 'schema/workplace_confirmation_message_record.dart';
import 'schema/friend_request_record.dart';
import 'schema/company_notifications_record.dart';
import 'schema/user_payment_record.dart';
import 'schema/user_income_record.dart';
import 'schema/partnerships_record.dart';
import 'schema/company_vehicles_record.dart';
import 'schema/company_vehicle_payments_record.dart';
import 'schema/personal_confirmations_record.dart';
import 'schema/personal_confirmations_messages_record.dart';
import 'schema/work_place_partnership_record.dart';
import 'schema/work_place_department_record.dart';
import 'schema/work_place_roles_record.dart';
import 'schema/work_place_tasks_record.dart';
import 'schema/work_place_reports_record.dart';
import 'schema/work_place_transaction_record.dart';
import 'schema/work_place_vehicle_record.dart';
import 'schema/work_place_vehicle_payments_record.dart';
import 'schema/duties_for_work_place_record.dart';
import 'schema/work_place_stocks_record.dart';
import 'schema/work_place_stock_movement_record.dart';
import 'schema/work_place_task_duties_record.dart';
import 'schema/spent_monet_for_allowence_work_place_record.dart';
import 'schema/sent_money_for_allowence_work_place_record.dart';
import 'schema/work_place_notifications_record.dart';
import 'schema/support_messages_record.dart';
import 'schema/phones_record.dart';
import 'schema/phone_confirmations_record.dart';
import 'schema/phone_confirmation_messages_record.dart';
import 'schema/ajanda_record.dart';
import 'schema/ai_chats_record.dart';
import 'schema/ai_messages_record.dart';
import 'schema/notes_record.dart';
import 'schema/products_record.dart';
import 'schema/calculations_record.dart';
import 'schema/product_fields_record.dart';
import 'schema/phone_index_record.dart';
import 'schema/parent_products_record.dart';
import 'schema/partnership_invitation_record.dart';
import 'schema/friends_record.dart';
import 'schema/important_notes_record.dart';
import 'schema/goal_notes_record.dart';
import 'schema/personal_diary_record.dart';
import 'schema/financial_monitoring_notes_record.dart';
import 'schema/deletion_request_record.dart';
import 'schema/worker_shifts_record.dart';
import 'schema/worker_payment_details_record.dart';
import 'schema/worker_payment_details_work_place_record.dart';
import 'schema/company_salary_record.dart';
import 'schema/work_place_salary_record.dart';
import 'schema/company_notes_record.dart';
import 'schema/work_place_notes_record.dart';
import 'schema/message_record.dart';
import 'schema/work_place_messages_record.dart';
import 'schema/company_messages_record.dart';
import 'schema/phone_messages_record.dart';
import 'schema/social_messages_record.dart';
import 'schema/new_messages_record.dart';
import 'schema/countries_record.dart';
import 'schema/cities_record.dart';
import 'schema/blocked_conversations_record.dart';
import 'schema/conversation_reports_record.dart';
import 'schema/social_notification_record.dart';
import 'schema/message_update_record.dart';
import 'schema/financial_note_company_record.dart';
import 'schema/financial_note_work_place_record.dart';
import 'schema/company_bill_record.dart';
import 'schema/work_place_bill_record.dart';
import 'schema/urgent_notes_record.dart';
import 'schema/companies_currents_record.dart';
import 'schema/financial_note_company_check_record.dart';
import 'schema/financial_plans_record.dart';
import 'schema/financial_plans_items_record.dart';
import 'schema/income_plans_record.dart';
import 'schema/income_plan_items_record.dart';
import 'schema/investment_plans_record.dart';
import 'schema/investment_plan_items_record.dart';
import 'schema/artificial_current_users_record.dart';
import 'schema/x_current_accounts_record.dart';
import 'schema/x_current_activities_record.dart';
import 'schema/metrics_record.dart';
import 'schema/work_place_payments_record.dart';
import 'schema/work_place_incomes_record.dart';
import 'schema/invested_monies_to_work_place_record.dart';
import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/companies_record.dart';
export 'schema/work_history_record.dart';
export 'schema/work_places_record.dart';
export 'schema/acquisitions_record.dart';
export 'schema/heavy_machinery_record.dart';
export 'schema/notifications_record.dart';
export 'schema/invitations_record.dart';
export 'schema/reports_record.dart';
export 'schema/company_payments2025_record.dart';
export 'schema/company_incomes2025_record.dart';
export 'schema/work_place_payments2025_record.dart';
export 'schema/work_place_incomes2025_record.dart';
export 'schema/company_partners_record.dart';
export 'schema/work_place_partners_record.dart';
export 'schema/work_place_worker_record.dart';
export 'schema/virtual_positions_company_record.dart';
export 'schema/virtual_positions_work_place_record.dart';
export 'schema/reports_created_by_user_record.dart';
export 'schema/duties_for_company_record.dart';
export 'schema/duty_steps_for_company_record.dart';
export 'schema/company_departments_record.dart';
export 'schema/company_units_record.dart';
export 'schema/company_roles_record.dart';
export 'schema/company_workers_record.dart';
export 'schema/company_reports_record.dart';
export 'schema/company_tasks_record.dart';
export 'schema/company_projects_record.dart';
export 'schema/company_process_duties_record.dart';
export 'schema/company_task_duties_record.dart';
export 'schema/work_place_units_record.dart';
export 'schema/company_task_fields_record.dart';
export 'schema/forms_record.dart';
export 'schema/form_fields_record.dart';
export 'schema/form_responses_record.dart';
export 'schema/instructions_record.dart';
export 'schema/sent_money_for_allowence_record.dart';
export 'schema/spent_money_for_allowence_record.dart';
export 'schema/company_transactions_record.dart';
export 'schema/confirmations_record.dart';
export 'schema/stocks_record.dart';
export 'schema/stock_movement_record.dart';
export 'schema/confirmation_messages_record.dart';
export 'schema/current_account_record.dart';
export 'schema/current_account_bill_record.dart';
export 'schema/current_account_activity_record.dart';
export 'schema/company_confirmations_record.dart';
export 'schema/company_confirmation_messages_record.dart';
export 'schema/my_worked_work_place_record.dart';
export 'schema/all_confirmations_record.dart';
export 'schema/workplace_confirmations_record.dart';
export 'schema/workplace_confirmation_message_record.dart';
export 'schema/friend_request_record.dart';
export 'schema/company_notifications_record.dart';
export 'schema/user_payment_record.dart';
export 'schema/user_income_record.dart';
export 'schema/partnerships_record.dart';
export 'schema/company_vehicles_record.dart';
export 'schema/company_vehicle_payments_record.dart';
export 'schema/personal_confirmations_record.dart';
export 'schema/personal_confirmations_messages_record.dart';
export 'schema/work_place_partnership_record.dart';
export 'schema/work_place_department_record.dart';
export 'schema/work_place_roles_record.dart';
export 'schema/work_place_tasks_record.dart';
export 'schema/work_place_reports_record.dart';
export 'schema/work_place_transaction_record.dart';
export 'schema/work_place_vehicle_record.dart';
export 'schema/work_place_vehicle_payments_record.dart';
export 'schema/duties_for_work_place_record.dart';
export 'schema/work_place_stocks_record.dart';
export 'schema/work_place_stock_movement_record.dart';
export 'schema/work_place_task_duties_record.dart';
export 'schema/spent_monet_for_allowence_work_place_record.dart';
export 'schema/sent_money_for_allowence_work_place_record.dart';
export 'schema/work_place_notifications_record.dart';
export 'schema/support_messages_record.dart';
export 'schema/phones_record.dart';
export 'schema/phone_confirmations_record.dart';
export 'schema/phone_confirmation_messages_record.dart';
export 'schema/ajanda_record.dart';
export 'schema/ai_chats_record.dart';
export 'schema/ai_messages_record.dart';
export 'schema/notes_record.dart';
export 'schema/products_record.dart';
export 'schema/calculations_record.dart';
export 'schema/product_fields_record.dart';
export 'schema/phone_index_record.dart';
export 'schema/parent_products_record.dart';
export 'schema/partnership_invitation_record.dart';
export 'schema/friends_record.dart';
export 'schema/important_notes_record.dart';
export 'schema/goal_notes_record.dart';
export 'schema/personal_diary_record.dart';
export 'schema/financial_monitoring_notes_record.dart';
export 'schema/deletion_request_record.dart';
export 'schema/worker_shifts_record.dart';
export 'schema/worker_payment_details_record.dart';
export 'schema/worker_payment_details_work_place_record.dart';
export 'schema/company_salary_record.dart';
export 'schema/work_place_salary_record.dart';
export 'schema/company_notes_record.dart';
export 'schema/work_place_notes_record.dart';
export 'schema/message_record.dart';
export 'schema/work_place_messages_record.dart';
export 'schema/company_messages_record.dart';
export 'schema/phone_messages_record.dart';
export 'schema/social_messages_record.dart';
export 'schema/new_messages_record.dart';
export 'schema/countries_record.dart';
export 'schema/cities_record.dart';
export 'schema/blocked_conversations_record.dart';
export 'schema/conversation_reports_record.dart';
export 'schema/social_notification_record.dart';
export 'schema/message_update_record.dart';
export 'schema/financial_note_company_record.dart';
export 'schema/financial_note_work_place_record.dart';
export 'schema/company_bill_record.dart';
export 'schema/work_place_bill_record.dart';
export 'schema/urgent_notes_record.dart';
export 'schema/companies_currents_record.dart';
export 'schema/financial_note_company_check_record.dart';
export 'schema/financial_plans_record.dart';
export 'schema/financial_plans_items_record.dart';
export 'schema/income_plans_record.dart';
export 'schema/income_plan_items_record.dart';
export 'schema/investment_plans_record.dart';
export 'schema/investment_plan_items_record.dart';
export 'schema/artificial_current_users_record.dart';
export 'schema/x_current_accounts_record.dart';
export 'schema/x_current_activities_record.dart';
export 'schema/metrics_record.dart';
export 'schema/work_place_payments_record.dart';
export 'schema/work_place_incomes_record.dart';
export 'schema/invested_monies_to_work_place_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UsersRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompaniesRecords (as a Stream and as a Future).
Future<int> queryCompaniesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompaniesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompaniesRecord>> queryCompaniesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompaniesRecord.collection,
      CompaniesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompaniesRecord>> queryCompaniesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompaniesRecord.collection,
      CompaniesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompaniesRecord>> queryCompaniesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompaniesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompaniesRecord.collection,
      CompaniesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompaniesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkHistoryRecords (as a Stream and as a Future).
Future<int> queryWorkHistoryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkHistoryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkHistoryRecord>> queryWorkHistoryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkHistoryRecord.collection(parent),
      WorkHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkHistoryRecord>> queryWorkHistoryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkHistoryRecord.collection(parent),
      WorkHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkHistoryRecord>> queryWorkHistoryRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkHistoryRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkHistoryRecord.collection(parent),
      WorkHistoryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkHistoryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlacesRecords (as a Stream and as a Future).
Future<int> queryWorkPlacesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlacesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlacesRecord>> queryWorkPlacesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlacesRecord.collection,
      WorkPlacesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlacesRecord>> queryWorkPlacesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlacesRecord.collection,
      WorkPlacesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlacesRecord>> queryWorkPlacesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlacesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlacesRecord.collection,
      WorkPlacesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlacesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query AcquisitionsRecords (as a Stream and as a Future).
Future<int> queryAcquisitionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AcquisitionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AcquisitionsRecord>> queryAcquisitionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AcquisitionsRecord.collection(parent),
      AcquisitionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AcquisitionsRecord>> queryAcquisitionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AcquisitionsRecord.collection(parent),
      AcquisitionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AcquisitionsRecord>> queryAcquisitionsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AcquisitionsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      AcquisitionsRecord.collection(parent),
      AcquisitionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<AcquisitionsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query HeavyMachineryRecords (as a Stream and as a Future).
Future<int> queryHeavyMachineryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      HeavyMachineryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<HeavyMachineryRecord>> queryHeavyMachineryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HeavyMachineryRecord.collection(parent),
      HeavyMachineryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HeavyMachineryRecord>> queryHeavyMachineryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HeavyMachineryRecord.collection(parent),
      HeavyMachineryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<HeavyMachineryRecord>> queryHeavyMachineryRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, HeavyMachineryRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      HeavyMachineryRecord.collection(parent),
      HeavyMachineryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<HeavyMachineryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query NotificationsRecords (as a Stream and as a Future).
Future<int> queryNotificationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotificationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotificationsRecord>> queryNotificationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotificationsRecord>> queryNotificationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<NotificationsRecord>> queryNotificationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, NotificationsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<NotificationsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query InvitationsRecords (as a Stream and as a Future).
Future<int> queryInvitationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InvitationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InvitationsRecord>> queryInvitationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InvitationsRecord.collection(parent),
      InvitationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InvitationsRecord>> queryInvitationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InvitationsRecord.collection(parent),
      InvitationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<InvitationsRecord>> queryInvitationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, InvitationsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      InvitationsRecord.collection(parent),
      InvitationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<InvitationsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ReportsRecords (as a Stream and as a Future).
Future<int> queryReportsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ReportsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ReportsRecord>> queryReportsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ReportsRecord.collection(parent),
      ReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ReportsRecord>> queryReportsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ReportsRecord.collection(parent),
      ReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ReportsRecord>> queryReportsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ReportsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ReportsRecord.collection(parent),
      ReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ReportsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyPayments2025Records (as a Stream and as a Future).
Future<int> queryCompanyPayments2025RecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyPayments2025Record.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyPayments2025Record>> queryCompanyPayments2025Record({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyPayments2025Record.collection(parent),
      CompanyPayments2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyPayments2025Record>> queryCompanyPayments2025RecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyPayments2025Record.collection(parent),
      CompanyPayments2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyPayments2025Record>>
    queryCompanyPayments2025RecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyPayments2025Record>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyPayments2025Record.collection(parent),
          CompanyPayments2025Record.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyPayments2025Record> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyIncomes2025Records (as a Stream and as a Future).
Future<int> queryCompanyIncomes2025RecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyIncomes2025Record.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyIncomes2025Record>> queryCompanyIncomes2025Record({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyIncomes2025Record.collection(parent),
      CompanyIncomes2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyIncomes2025Record>> queryCompanyIncomes2025RecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyIncomes2025Record.collection(parent),
      CompanyIncomes2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyIncomes2025Record>>
    queryCompanyIncomes2025RecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyIncomes2025Record>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyIncomes2025Record.collection(parent),
          CompanyIncomes2025Record.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyIncomes2025Record> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlacePayments2025Records (as a Stream and as a Future).
Future<int> queryWorkPlacePayments2025RecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlacePayments2025Record.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlacePayments2025Record>> queryWorkPlacePayments2025Record({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlacePayments2025Record.collection(parent),
      WorkPlacePayments2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlacePayments2025Record>> queryWorkPlacePayments2025RecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlacePayments2025Record.collection(parent),
      WorkPlacePayments2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlacePayments2025Record>>
    queryWorkPlacePayments2025RecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlacePayments2025Record>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlacePayments2025Record.collection(parent),
          WorkPlacePayments2025Record.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlacePayments2025Record> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceIncomes2025Records (as a Stream and as a Future).
Future<int> queryWorkPlaceIncomes2025RecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceIncomes2025Record.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceIncomes2025Record>> queryWorkPlaceIncomes2025Record({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceIncomes2025Record.collection(parent),
      WorkPlaceIncomes2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceIncomes2025Record>> queryWorkPlaceIncomes2025RecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceIncomes2025Record.collection(parent),
      WorkPlaceIncomes2025Record.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceIncomes2025Record>>
    queryWorkPlaceIncomes2025RecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceIncomes2025Record>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceIncomes2025Record.collection(parent),
          WorkPlaceIncomes2025Record.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceIncomes2025Record> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyPartnersRecords (as a Stream and as a Future).
Future<int> queryCompanyPartnersRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyPartnersRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyPartnersRecord>> queryCompanyPartnersRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyPartnersRecord.collection(parent),
      CompanyPartnersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyPartnersRecord>> queryCompanyPartnersRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyPartnersRecord.collection(parent),
      CompanyPartnersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyPartnersRecord>> queryCompanyPartnersRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyPartnersRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyPartnersRecord.collection(parent),
      CompanyPartnersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyPartnersRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlacePartnersRecords (as a Stream and as a Future).
Future<int> queryWorkPlacePartnersRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlacePartnersRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlacePartnersRecord>> queryWorkPlacePartnersRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlacePartnersRecord.collection(parent),
      WorkPlacePartnersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlacePartnersRecord>> queryWorkPlacePartnersRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlacePartnersRecord.collection(parent),
      WorkPlacePartnersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlacePartnersRecord>>
    queryWorkPlacePartnersRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlacePartnersRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlacePartnersRecord.collection(parent),
          WorkPlacePartnersRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlacePartnersRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceWorkerRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceWorkerRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceWorkerRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceWorkerRecord>> queryWorkPlaceWorkerRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceWorkerRecord.collection(parent),
      WorkPlaceWorkerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceWorkerRecord>> queryWorkPlaceWorkerRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceWorkerRecord.collection(parent),
      WorkPlaceWorkerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceWorkerRecord>> queryWorkPlaceWorkerRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceWorkerRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceWorkerRecord.collection(parent),
      WorkPlaceWorkerRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceWorkerRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query VirtualPositionsCompanyRecords (as a Stream and as a Future).
Future<int> queryVirtualPositionsCompanyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      VirtualPositionsCompanyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<VirtualPositionsCompanyRecord>> queryVirtualPositionsCompanyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      VirtualPositionsCompanyRecord.collection(parent),
      VirtualPositionsCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<VirtualPositionsCompanyRecord>>
    queryVirtualPositionsCompanyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          VirtualPositionsCompanyRecord.collection(parent),
          VirtualPositionsCompanyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<VirtualPositionsCompanyRecord>>
    queryVirtualPositionsCompanyRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, VirtualPositionsCompanyRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          VirtualPositionsCompanyRecord.collection(parent),
          VirtualPositionsCompanyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<VirtualPositionsCompanyRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query VirtualPositionsWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryVirtualPositionsWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      VirtualPositionsWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<VirtualPositionsWorkPlaceRecord>>
    queryVirtualPositionsWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          VirtualPositionsWorkPlaceRecord.collection(parent),
          VirtualPositionsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<VirtualPositionsWorkPlaceRecord>>
    queryVirtualPositionsWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          VirtualPositionsWorkPlaceRecord.collection(parent),
          VirtualPositionsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<VirtualPositionsWorkPlaceRecord>>
    queryVirtualPositionsWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, VirtualPositionsWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          VirtualPositionsWorkPlaceRecord.collection(parent),
          VirtualPositionsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<VirtualPositionsWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query ReportsCreatedByUserRecords (as a Stream and as a Future).
Future<int> queryReportsCreatedByUserRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ReportsCreatedByUserRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ReportsCreatedByUserRecord>> queryReportsCreatedByUserRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ReportsCreatedByUserRecord.collection(parent),
      ReportsCreatedByUserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ReportsCreatedByUserRecord>> queryReportsCreatedByUserRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ReportsCreatedByUserRecord.collection(parent),
      ReportsCreatedByUserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ReportsCreatedByUserRecord>>
    queryReportsCreatedByUserRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ReportsCreatedByUserRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          ReportsCreatedByUserRecord.collection(parent),
          ReportsCreatedByUserRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<ReportsCreatedByUserRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query DutiesForCompanyRecords (as a Stream and as a Future).
Future<int> queryDutiesForCompanyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DutiesForCompanyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DutiesForCompanyRecord>> queryDutiesForCompanyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DutiesForCompanyRecord.collection(parent),
      DutiesForCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DutiesForCompanyRecord>> queryDutiesForCompanyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DutiesForCompanyRecord.collection(parent),
      DutiesForCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<DutiesForCompanyRecord>>
    queryDutiesForCompanyRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, DutiesForCompanyRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          DutiesForCompanyRecord.collection(parent),
          DutiesForCompanyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<DutiesForCompanyRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query DutyStepsForCompanyRecords (as a Stream and as a Future).
Future<int> queryDutyStepsForCompanyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DutyStepsForCompanyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DutyStepsForCompanyRecord>> queryDutyStepsForCompanyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DutyStepsForCompanyRecord.collection(parent),
      DutyStepsForCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DutyStepsForCompanyRecord>> queryDutyStepsForCompanyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DutyStepsForCompanyRecord.collection(parent),
      DutyStepsForCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<DutyStepsForCompanyRecord>>
    queryDutyStepsForCompanyRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, DutyStepsForCompanyRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          DutyStepsForCompanyRecord.collection(parent),
          DutyStepsForCompanyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<DutyStepsForCompanyRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyDepartmentsRecords (as a Stream and as a Future).
Future<int> queryCompanyDepartmentsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyDepartmentsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyDepartmentsRecord>> queryCompanyDepartmentsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyDepartmentsRecord.collection(parent),
      CompanyDepartmentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyDepartmentsRecord>> queryCompanyDepartmentsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyDepartmentsRecord.collection(parent),
      CompanyDepartmentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyDepartmentsRecord>>
    queryCompanyDepartmentsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyDepartmentsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyDepartmentsRecord.collection(parent),
          CompanyDepartmentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyDepartmentsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyUnitsRecords (as a Stream and as a Future).
Future<int> queryCompanyUnitsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyUnitsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyUnitsRecord>> queryCompanyUnitsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyUnitsRecord.collection(parent),
      CompanyUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyUnitsRecord>> queryCompanyUnitsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyUnitsRecord.collection(parent),
      CompanyUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyUnitsRecord>> queryCompanyUnitsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyUnitsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyUnitsRecord.collection(parent),
      CompanyUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyUnitsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyRolesRecords (as a Stream and as a Future).
Future<int> queryCompanyRolesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyRolesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyRolesRecord>> queryCompanyRolesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyRolesRecord.collection(parent),
      CompanyRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyRolesRecord>> queryCompanyRolesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyRolesRecord.collection(parent),
      CompanyRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyRolesRecord>> queryCompanyRolesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyRolesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyRolesRecord.collection(parent),
      CompanyRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyRolesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyWorkersRecords (as a Stream and as a Future).
Future<int> queryCompanyWorkersRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyWorkersRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyWorkersRecord>> queryCompanyWorkersRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyWorkersRecord.collection(parent),
      CompanyWorkersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyWorkersRecord>> queryCompanyWorkersRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyWorkersRecord.collection(parent),
      CompanyWorkersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyWorkersRecord>> queryCompanyWorkersRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyWorkersRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyWorkersRecord.collection(parent),
      CompanyWorkersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyWorkersRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyReportsRecords (as a Stream and as a Future).
Future<int> queryCompanyReportsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyReportsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyReportsRecord>> queryCompanyReportsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyReportsRecord.collection(parent),
      CompanyReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyReportsRecord>> queryCompanyReportsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyReportsRecord.collection(parent),
      CompanyReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyReportsRecord>> queryCompanyReportsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyReportsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyReportsRecord.collection(parent),
      CompanyReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyReportsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyTasksRecords (as a Stream and as a Future).
Future<int> queryCompanyTasksRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyTasksRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyTasksRecord>> queryCompanyTasksRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyTasksRecord.collection(parent),
      CompanyTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyTasksRecord>> queryCompanyTasksRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyTasksRecord.collection(parent),
      CompanyTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyTasksRecord>> queryCompanyTasksRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyTasksRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyTasksRecord.collection(parent),
      CompanyTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyTasksRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyProjectsRecords (as a Stream and as a Future).
Future<int> queryCompanyProjectsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyProjectsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyProjectsRecord>> queryCompanyProjectsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyProjectsRecord.collection(parent),
      CompanyProjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyProjectsRecord>> queryCompanyProjectsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyProjectsRecord.collection(parent),
      CompanyProjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyProjectsRecord>> queryCompanyProjectsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyProjectsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyProjectsRecord.collection(parent),
      CompanyProjectsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyProjectsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyProcessDutiesRecords (as a Stream and as a Future).
Future<int> queryCompanyProcessDutiesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyProcessDutiesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyProcessDutiesRecord>> queryCompanyProcessDutiesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyProcessDutiesRecord.collection(parent),
      CompanyProcessDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyProcessDutiesRecord>> queryCompanyProcessDutiesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyProcessDutiesRecord.collection(parent),
      CompanyProcessDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyProcessDutiesRecord>>
    queryCompanyProcessDutiesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyProcessDutiesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyProcessDutiesRecord.collection(parent),
          CompanyProcessDutiesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyProcessDutiesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyTaskDutiesRecords (as a Stream and as a Future).
Future<int> queryCompanyTaskDutiesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyTaskDutiesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyTaskDutiesRecord>> queryCompanyTaskDutiesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyTaskDutiesRecord.collection(parent),
      CompanyTaskDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyTaskDutiesRecord>> queryCompanyTaskDutiesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyTaskDutiesRecord.collection(parent),
      CompanyTaskDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyTaskDutiesRecord>>
    queryCompanyTaskDutiesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyTaskDutiesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyTaskDutiesRecord.collection(parent),
          CompanyTaskDutiesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<CompanyTaskDutiesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceUnitsRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceUnitsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceUnitsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceUnitsRecord>> queryWorkPlaceUnitsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceUnitsRecord.collection(parent),
      WorkPlaceUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceUnitsRecord>> queryWorkPlaceUnitsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceUnitsRecord.collection(parent),
      WorkPlaceUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceUnitsRecord>> queryWorkPlaceUnitsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceUnitsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceUnitsRecord.collection(parent),
      WorkPlaceUnitsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceUnitsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyTaskFieldsRecords (as a Stream and as a Future).
Future<int> queryCompanyTaskFieldsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyTaskFieldsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyTaskFieldsRecord>> queryCompanyTaskFieldsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyTaskFieldsRecord.collection(parent),
      CompanyTaskFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyTaskFieldsRecord>> queryCompanyTaskFieldsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyTaskFieldsRecord.collection(parent),
      CompanyTaskFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyTaskFieldsRecord>>
    queryCompanyTaskFieldsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyTaskFieldsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyTaskFieldsRecord.collection(parent),
          CompanyTaskFieldsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<CompanyTaskFieldsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FormsRecords (as a Stream and as a Future).
Future<int> queryFormsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FormsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FormsRecord>> queryFormsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FormsRecord.collection,
      FormsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FormsRecord>> queryFormsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FormsRecord.collection,
      FormsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FormsRecord>> queryFormsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FormsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FormsRecord.collection,
      FormsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FormsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FormFieldsRecords (as a Stream and as a Future).
Future<int> queryFormFieldsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FormFieldsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FormFieldsRecord>> queryFormFieldsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FormFieldsRecord.collection(parent),
      FormFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FormFieldsRecord>> queryFormFieldsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FormFieldsRecord.collection(parent),
      FormFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FormFieldsRecord>> queryFormFieldsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FormFieldsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FormFieldsRecord.collection(parent),
      FormFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FormFieldsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FormResponsesRecords (as a Stream and as a Future).
Future<int> queryFormResponsesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FormResponsesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FormResponsesRecord>> queryFormResponsesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FormResponsesRecord.collection(parent),
      FormResponsesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FormResponsesRecord>> queryFormResponsesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FormResponsesRecord.collection(parent),
      FormResponsesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FormResponsesRecord>> queryFormResponsesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FormResponsesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FormResponsesRecord.collection(parent),
      FormResponsesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FormResponsesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query InstructionsRecords (as a Stream and as a Future).
Future<int> queryInstructionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InstructionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InstructionsRecord>> queryInstructionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InstructionsRecord.collection(parent),
      InstructionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InstructionsRecord>> queryInstructionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InstructionsRecord.collection(parent),
      InstructionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<InstructionsRecord>> queryInstructionsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, InstructionsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      InstructionsRecord.collection(parent),
      InstructionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<InstructionsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query SentMoneyForAllowenceRecords (as a Stream and as a Future).
Future<int> querySentMoneyForAllowenceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SentMoneyForAllowenceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SentMoneyForAllowenceRecord>> querySentMoneyForAllowenceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SentMoneyForAllowenceRecord.collection(parent),
      SentMoneyForAllowenceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SentMoneyForAllowenceRecord>> querySentMoneyForAllowenceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SentMoneyForAllowenceRecord.collection(parent),
      SentMoneyForAllowenceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<SentMoneyForAllowenceRecord>>
    querySentMoneyForAllowenceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SentMoneyForAllowenceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          SentMoneyForAllowenceRecord.collection(parent),
          SentMoneyForAllowenceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<SentMoneyForAllowenceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query SpentMoneyForAllowenceRecords (as a Stream and as a Future).
Future<int> querySpentMoneyForAllowenceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SpentMoneyForAllowenceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SpentMoneyForAllowenceRecord>> querySpentMoneyForAllowenceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SpentMoneyForAllowenceRecord.collection(parent),
      SpentMoneyForAllowenceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SpentMoneyForAllowenceRecord>>
    querySpentMoneyForAllowenceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SpentMoneyForAllowenceRecord.collection(parent),
          SpentMoneyForAllowenceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<SpentMoneyForAllowenceRecord>>
    querySpentMoneyForAllowenceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SpentMoneyForAllowenceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          SpentMoneyForAllowenceRecord.collection(parent),
          SpentMoneyForAllowenceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<SpentMoneyForAllowenceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyTransactionsRecords (as a Stream and as a Future).
Future<int> queryCompanyTransactionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyTransactionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyTransactionsRecord>> queryCompanyTransactionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyTransactionsRecord.collection(parent),
      CompanyTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyTransactionsRecord>> queryCompanyTransactionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyTransactionsRecord.collection(parent),
      CompanyTransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyTransactionsRecord>>
    queryCompanyTransactionsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyTransactionsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyTransactionsRecord.collection(parent),
          CompanyTransactionsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyTransactionsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query ConfirmationsRecords (as a Stream and as a Future).
Future<int> queryConfirmationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConfirmationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConfirmationsRecord>> queryConfirmationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConfirmationsRecord.collection,
      ConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConfirmationsRecord>> queryConfirmationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConfirmationsRecord.collection,
      ConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ConfirmationsRecord>> queryConfirmationsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ConfirmationsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ConfirmationsRecord.collection,
      ConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ConfirmationsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query StocksRecords (as a Stream and as a Future).
Future<int> queryStocksRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      StocksRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<StocksRecord>> queryStocksRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      StocksRecord.collection(parent),
      StocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<StocksRecord>> queryStocksRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      StocksRecord.collection(parent),
      StocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<StocksRecord>> queryStocksRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, StocksRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      StocksRecord.collection(parent),
      StocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<StocksRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query StockMovementRecords (as a Stream and as a Future).
Future<int> queryStockMovementRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      StockMovementRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<StockMovementRecord>> queryStockMovementRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      StockMovementRecord.collection(parent),
      StockMovementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<StockMovementRecord>> queryStockMovementRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      StockMovementRecord.collection(parent),
      StockMovementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<StockMovementRecord>> queryStockMovementRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, StockMovementRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      StockMovementRecord.collection(parent),
      StockMovementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<StockMovementRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ConfirmationMessagesRecords (as a Stream and as a Future).
Future<int> queryConfirmationMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConfirmationMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConfirmationMessagesRecord>> queryConfirmationMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConfirmationMessagesRecord.collection(parent),
      ConfirmationMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConfirmationMessagesRecord>> queryConfirmationMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConfirmationMessagesRecord.collection(parent),
      ConfirmationMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ConfirmationMessagesRecord>>
    queryConfirmationMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ConfirmationMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          ConfirmationMessagesRecord.collection(parent),
          ConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<ConfirmationMessagesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CurrentAccountRecords (as a Stream and as a Future).
Future<int> queryCurrentAccountRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CurrentAccountRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CurrentAccountRecord>> queryCurrentAccountRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CurrentAccountRecord.collection,
      CurrentAccountRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CurrentAccountRecord>> queryCurrentAccountRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CurrentAccountRecord.collection,
      CurrentAccountRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CurrentAccountRecord>> queryCurrentAccountRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CurrentAccountRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CurrentAccountRecord.collection,
      CurrentAccountRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CurrentAccountRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CurrentAccountBillRecords (as a Stream and as a Future).
Future<int> queryCurrentAccountBillRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CurrentAccountBillRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CurrentAccountBillRecord>> queryCurrentAccountBillRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CurrentAccountBillRecord.collection(parent),
      CurrentAccountBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CurrentAccountBillRecord>> queryCurrentAccountBillRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CurrentAccountBillRecord.collection(parent),
      CurrentAccountBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CurrentAccountBillRecord>>
    queryCurrentAccountBillRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CurrentAccountBillRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CurrentAccountBillRecord.collection(parent),
          CurrentAccountBillRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CurrentAccountBillRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CurrentAccountActivityRecords (as a Stream and as a Future).
Future<int> queryCurrentAccountActivityRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CurrentAccountActivityRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CurrentAccountActivityRecord>> queryCurrentAccountActivityRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CurrentAccountActivityRecord.collection(parent),
      CurrentAccountActivityRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CurrentAccountActivityRecord>>
    queryCurrentAccountActivityRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CurrentAccountActivityRecord.collection(parent),
          CurrentAccountActivityRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<CurrentAccountActivityRecord>>
    queryCurrentAccountActivityRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CurrentAccountActivityRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CurrentAccountActivityRecord.collection(parent),
          CurrentAccountActivityRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CurrentAccountActivityRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyConfirmationsRecords (as a Stream and as a Future).
Future<int> queryCompanyConfirmationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyConfirmationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyConfirmationsRecord>> queryCompanyConfirmationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyConfirmationsRecord.collection,
      CompanyConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyConfirmationsRecord>> queryCompanyConfirmationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyConfirmationsRecord.collection,
      CompanyConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyConfirmationsRecord>>
    queryCompanyConfirmationsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyConfirmationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyConfirmationsRecord.collection,
          CompanyConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyConfirmationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyConfirmationMessagesRecords (as a Stream and as a Future).
Future<int> queryCompanyConfirmationMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyConfirmationMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyConfirmationMessagesRecord>>
    queryCompanyConfirmationMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          CompanyConfirmationMessagesRecord.collection(parent),
          CompanyConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<CompanyConfirmationMessagesRecord>>
    queryCompanyConfirmationMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CompanyConfirmationMessagesRecord.collection(parent),
          CompanyConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<CompanyConfirmationMessagesRecord>>
    queryCompanyConfirmationMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          CompanyConfirmationMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyConfirmationMessagesRecord.collection(parent),
          CompanyConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyConfirmationMessagesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query MyWorkedWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryMyWorkedWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MyWorkedWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MyWorkedWorkPlaceRecord>> queryMyWorkedWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MyWorkedWorkPlaceRecord.collection(parent),
      MyWorkedWorkPlaceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MyWorkedWorkPlaceRecord>> queryMyWorkedWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MyWorkedWorkPlaceRecord.collection(parent),
      MyWorkedWorkPlaceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<MyWorkedWorkPlaceRecord>>
    queryMyWorkedWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, MyWorkedWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          MyWorkedWorkPlaceRecord.collection(parent),
          MyWorkedWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<MyWorkedWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query AllConfirmationsRecords (as a Stream and as a Future).
Future<int> queryAllConfirmationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AllConfirmationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AllConfirmationsRecord>> queryAllConfirmationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AllConfirmationsRecord.collection(parent),
      AllConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AllConfirmationsRecord>> queryAllConfirmationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AllConfirmationsRecord.collection(parent),
      AllConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AllConfirmationsRecord>>
    queryAllConfirmationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AllConfirmationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          AllConfirmationsRecord.collection(parent),
          AllConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<AllConfirmationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkplaceConfirmationsRecords (as a Stream and as a Future).
Future<int> queryWorkplaceConfirmationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkplaceConfirmationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkplaceConfirmationsRecord>> queryWorkplaceConfirmationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkplaceConfirmationsRecord.collection,
      WorkplaceConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkplaceConfirmationsRecord>>
    queryWorkplaceConfirmationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkplaceConfirmationsRecord.collection,
          WorkplaceConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkplaceConfirmationsRecord>>
    queryWorkplaceConfirmationsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkplaceConfirmationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkplaceConfirmationsRecord.collection,
          WorkplaceConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkplaceConfirmationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkplaceConfirmationMessageRecords (as a Stream and as a Future).
Future<int> queryWorkplaceConfirmationMessageRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkplaceConfirmationMessageRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkplaceConfirmationMessageRecord>>
    queryWorkplaceConfirmationMessageRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          WorkplaceConfirmationMessageRecord.collection(parent),
          WorkplaceConfirmationMessageRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<WorkplaceConfirmationMessageRecord>>
    queryWorkplaceConfirmationMessageRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkplaceConfirmationMessageRecord.collection(parent),
          WorkplaceConfirmationMessageRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkplaceConfirmationMessageRecord>>
    queryWorkplaceConfirmationMessageRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          WorkplaceConfirmationMessageRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkplaceConfirmationMessageRecord.collection(parent),
          WorkplaceConfirmationMessageRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkplaceConfirmationMessageRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FriendRequestRecords (as a Stream and as a Future).
Future<int> queryFriendRequestRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FriendRequestRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FriendRequestRecord>> queryFriendRequestRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FriendRequestRecord.collection(parent),
      FriendRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FriendRequestRecord>> queryFriendRequestRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FriendRequestRecord.collection(parent),
      FriendRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FriendRequestRecord>> queryFriendRequestRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FriendRequestRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FriendRequestRecord.collection(parent),
      FriendRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FriendRequestRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyNotificationsRecords (as a Stream and as a Future).
Future<int> queryCompanyNotificationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyNotificationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyNotificationsRecord>> queryCompanyNotificationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyNotificationsRecord.collection(parent),
      CompanyNotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyNotificationsRecord>> queryCompanyNotificationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyNotificationsRecord.collection(parent),
      CompanyNotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyNotificationsRecord>>
    queryCompanyNotificationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyNotificationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyNotificationsRecord.collection(parent),
          CompanyNotificationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyNotificationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query UserPaymentRecords (as a Stream and as a Future).
Future<int> queryUserPaymentRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserPaymentRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserPaymentRecord>> queryUserPaymentRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserPaymentRecord.collection(parent),
      UserPaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserPaymentRecord>> queryUserPaymentRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserPaymentRecord.collection(parent),
      UserPaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UserPaymentRecord>> queryUserPaymentRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UserPaymentRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UserPaymentRecord.collection(parent),
      UserPaymentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UserPaymentRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UserIncomeRecords (as a Stream and as a Future).
Future<int> queryUserIncomeRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserIncomeRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserIncomeRecord>> queryUserIncomeRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserIncomeRecord.collection(parent),
      UserIncomeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserIncomeRecord>> queryUserIncomeRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserIncomeRecord.collection(parent),
      UserIncomeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UserIncomeRecord>> queryUserIncomeRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UserIncomeRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UserIncomeRecord.collection(parent),
      UserIncomeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UserIncomeRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PartnershipsRecords (as a Stream and as a Future).
Future<int> queryPartnershipsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PartnershipsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PartnershipsRecord>> queryPartnershipsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PartnershipsRecord.collection(parent),
      PartnershipsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PartnershipsRecord>> queryPartnershipsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PartnershipsRecord.collection(parent),
      PartnershipsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PartnershipsRecord>> queryPartnershipsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PartnershipsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PartnershipsRecord.collection(parent),
      PartnershipsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PartnershipsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyVehiclesRecords (as a Stream and as a Future).
Future<int> queryCompanyVehiclesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyVehiclesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyVehiclesRecord>> queryCompanyVehiclesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyVehiclesRecord.collection(parent),
      CompanyVehiclesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyVehiclesRecord>> queryCompanyVehiclesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyVehiclesRecord.collection(parent),
      CompanyVehiclesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyVehiclesRecord>> queryCompanyVehiclesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyVehiclesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyVehiclesRecord.collection(parent),
      CompanyVehiclesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyVehiclesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyVehiclePaymentsRecords (as a Stream and as a Future).
Future<int> queryCompanyVehiclePaymentsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyVehiclePaymentsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyVehiclePaymentsRecord>> queryCompanyVehiclePaymentsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyVehiclePaymentsRecord.collection(parent),
      CompanyVehiclePaymentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyVehiclePaymentsRecord>>
    queryCompanyVehiclePaymentsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CompanyVehiclePaymentsRecord.collection(parent),
          CompanyVehiclePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<CompanyVehiclePaymentsRecord>>
    queryCompanyVehiclePaymentsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyVehiclePaymentsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompanyVehiclePaymentsRecord.collection(parent),
          CompanyVehiclePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<CompanyVehiclePaymentsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query PersonalConfirmationsRecords (as a Stream and as a Future).
Future<int> queryPersonalConfirmationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PersonalConfirmationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PersonalConfirmationsRecord>> queryPersonalConfirmationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PersonalConfirmationsRecord.collection,
      PersonalConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PersonalConfirmationsRecord>> queryPersonalConfirmationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PersonalConfirmationsRecord.collection,
      PersonalConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PersonalConfirmationsRecord>>
    queryPersonalConfirmationsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PersonalConfirmationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          PersonalConfirmationsRecord.collection,
          PersonalConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<PersonalConfirmationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query PersonalConfirmationsMessagesRecords (as a Stream and as a Future).
Future<int> queryPersonalConfirmationsMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PersonalConfirmationsMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PersonalConfirmationsMessagesRecord>>
    queryPersonalConfirmationsMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          PersonalConfirmationsMessagesRecord.collection(parent),
          PersonalConfirmationsMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<PersonalConfirmationsMessagesRecord>>
    queryPersonalConfirmationsMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          PersonalConfirmationsMessagesRecord.collection(parent),
          PersonalConfirmationsMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<PersonalConfirmationsMessagesRecord>>
    queryPersonalConfirmationsMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          PersonalConfirmationsMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          PersonalConfirmationsMessagesRecord.collection(parent),
          PersonalConfirmationsMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<PersonalConfirmationsMessagesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlacePartnershipRecords (as a Stream and as a Future).
Future<int> queryWorkPlacePartnershipRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlacePartnershipRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlacePartnershipRecord>> queryWorkPlacePartnershipRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlacePartnershipRecord.collection(parent),
      WorkPlacePartnershipRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlacePartnershipRecord>> queryWorkPlacePartnershipRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlacePartnershipRecord.collection(parent),
      WorkPlacePartnershipRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlacePartnershipRecord>>
    queryWorkPlacePartnershipRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlacePartnershipRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlacePartnershipRecord.collection(parent),
          WorkPlacePartnershipRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlacePartnershipRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceDepartmentRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceDepartmentRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceDepartmentRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceDepartmentRecord>> queryWorkPlaceDepartmentRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceDepartmentRecord.collection(parent),
      WorkPlaceDepartmentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceDepartmentRecord>> queryWorkPlaceDepartmentRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceDepartmentRecord.collection(parent),
      WorkPlaceDepartmentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceDepartmentRecord>>
    queryWorkPlaceDepartmentRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceDepartmentRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceDepartmentRecord.collection(parent),
          WorkPlaceDepartmentRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceDepartmentRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceRolesRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceRolesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceRolesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceRolesRecord>> queryWorkPlaceRolesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceRolesRecord.collection(parent),
      WorkPlaceRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceRolesRecord>> queryWorkPlaceRolesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceRolesRecord.collection(parent),
      WorkPlaceRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceRolesRecord>> queryWorkPlaceRolesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceRolesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceRolesRecord.collection(parent),
      WorkPlaceRolesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceRolesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceTasksRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceTasksRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceTasksRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceTasksRecord>> queryWorkPlaceTasksRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceTasksRecord.collection(parent),
      WorkPlaceTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceTasksRecord>> queryWorkPlaceTasksRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceTasksRecord.collection(parent),
      WorkPlaceTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceTasksRecord>> queryWorkPlaceTasksRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceTasksRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceTasksRecord.collection(parent),
      WorkPlaceTasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceTasksRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceReportsRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceReportsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceReportsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceReportsRecord>> queryWorkPlaceReportsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceReportsRecord.collection(parent),
      WorkPlaceReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceReportsRecord>> queryWorkPlaceReportsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceReportsRecord.collection(parent),
      WorkPlaceReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceReportsRecord>>
    queryWorkPlaceReportsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceReportsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceReportsRecord.collection(parent),
          WorkPlaceReportsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlaceReportsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceTransactionRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceTransactionRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceTransactionRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceTransactionRecord>> queryWorkPlaceTransactionRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceTransactionRecord.collection(parent),
      WorkPlaceTransactionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceTransactionRecord>> queryWorkPlaceTransactionRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceTransactionRecord.collection(parent),
      WorkPlaceTransactionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceTransactionRecord>>
    queryWorkPlaceTransactionRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceTransactionRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceTransactionRecord.collection(parent),
          WorkPlaceTransactionRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceTransactionRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceVehicleRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceVehicleRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceVehicleRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceVehicleRecord>> queryWorkPlaceVehicleRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceVehicleRecord.collection(parent),
      WorkPlaceVehicleRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceVehicleRecord>> queryWorkPlaceVehicleRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceVehicleRecord.collection(parent),
      WorkPlaceVehicleRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceVehicleRecord>>
    queryWorkPlaceVehicleRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceVehicleRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceVehicleRecord.collection(parent),
          WorkPlaceVehicleRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlaceVehicleRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceVehiclePaymentsRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceVehiclePaymentsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceVehiclePaymentsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceVehiclePaymentsRecord>>
    queryWorkPlaceVehiclePaymentsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          WorkPlaceVehiclePaymentsRecord.collection(parent),
          WorkPlaceVehiclePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<WorkPlaceVehiclePaymentsRecord>>
    queryWorkPlaceVehiclePaymentsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkPlaceVehiclePaymentsRecord.collection(parent),
          WorkPlaceVehiclePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkPlaceVehiclePaymentsRecord>>
    queryWorkPlaceVehiclePaymentsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceVehiclePaymentsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceVehiclePaymentsRecord.collection(parent),
          WorkPlaceVehiclePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceVehiclePaymentsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query DutiesForWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryDutiesForWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DutiesForWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DutiesForWorkPlaceRecord>> queryDutiesForWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DutiesForWorkPlaceRecord.collection(parent),
      DutiesForWorkPlaceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DutiesForWorkPlaceRecord>> queryDutiesForWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DutiesForWorkPlaceRecord.collection(parent),
      DutiesForWorkPlaceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<DutiesForWorkPlaceRecord>>
    queryDutiesForWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, DutiesForWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          DutiesForWorkPlaceRecord.collection(parent),
          DutiesForWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<DutiesForWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceStocksRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceStocksRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceStocksRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceStocksRecord>> queryWorkPlaceStocksRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceStocksRecord.collection(parent),
      WorkPlaceStocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceStocksRecord>> queryWorkPlaceStocksRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceStocksRecord.collection(parent),
      WorkPlaceStocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceStocksRecord>> queryWorkPlaceStocksRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceStocksRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceStocksRecord.collection(parent),
      WorkPlaceStocksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceStocksRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceStockMovementRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceStockMovementRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceStockMovementRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceStockMovementRecord>> queryWorkPlaceStockMovementRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceStockMovementRecord.collection(parent),
      WorkPlaceStockMovementRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceStockMovementRecord>>
    queryWorkPlaceStockMovementRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkPlaceStockMovementRecord.collection(parent),
          WorkPlaceStockMovementRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkPlaceStockMovementRecord>>
    queryWorkPlaceStockMovementRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceStockMovementRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceStockMovementRecord.collection(parent),
          WorkPlaceStockMovementRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceStockMovementRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceTaskDutiesRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceTaskDutiesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceTaskDutiesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceTaskDutiesRecord>> queryWorkPlaceTaskDutiesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceTaskDutiesRecord.collection(parent),
      WorkPlaceTaskDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceTaskDutiesRecord>> queryWorkPlaceTaskDutiesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceTaskDutiesRecord.collection(parent),
      WorkPlaceTaskDutiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceTaskDutiesRecord>>
    queryWorkPlaceTaskDutiesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceTaskDutiesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceTaskDutiesRecord.collection(parent),
          WorkPlaceTaskDutiesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceTaskDutiesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query SpentMonetForAllowenceWorkPlaceRecords (as a Stream and as a Future).
Future<int> querySpentMonetForAllowenceWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SpentMonetForAllowenceWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SpentMonetForAllowenceWorkPlaceRecord>>
    querySpentMonetForAllowenceWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          SpentMonetForAllowenceWorkPlaceRecord.collection(parent),
          SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<SpentMonetForAllowenceWorkPlaceRecord>>
    querySpentMonetForAllowenceWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SpentMonetForAllowenceWorkPlaceRecord.collection(parent),
          SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<SpentMonetForAllowenceWorkPlaceRecord>>
    querySpentMonetForAllowenceWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          SpentMonetForAllowenceWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          SpentMonetForAllowenceWorkPlaceRecord.collection(parent),
          SpentMonetForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<SpentMonetForAllowenceWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query SentMoneyForAllowenceWorkPlaceRecords (as a Stream and as a Future).
Future<int> querySentMoneyForAllowenceWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SentMoneyForAllowenceWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SentMoneyForAllowenceWorkPlaceRecord>>
    querySentMoneyForAllowenceWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          SentMoneyForAllowenceWorkPlaceRecord.collection(parent),
          SentMoneyForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<SentMoneyForAllowenceWorkPlaceRecord>>
    querySentMoneyForAllowenceWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SentMoneyForAllowenceWorkPlaceRecord.collection(parent),
          SentMoneyForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<SentMoneyForAllowenceWorkPlaceRecord>>
    querySentMoneyForAllowenceWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          SentMoneyForAllowenceWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          SentMoneyForAllowenceWorkPlaceRecord.collection(parent),
          SentMoneyForAllowenceWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<SentMoneyForAllowenceWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceNotificationsRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceNotificationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceNotificationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceNotificationsRecord>> queryWorkPlaceNotificationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceNotificationsRecord.collection(parent),
      WorkPlaceNotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceNotificationsRecord>>
    queryWorkPlaceNotificationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkPlaceNotificationsRecord.collection(parent),
          WorkPlaceNotificationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkPlaceNotificationsRecord>>
    queryWorkPlaceNotificationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceNotificationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceNotificationsRecord.collection(parent),
          WorkPlaceNotificationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkPlaceNotificationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query SupportMessagesRecords (as a Stream and as a Future).
Future<int> querySupportMessagesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SupportMessagesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SupportMessagesRecord>> querySupportMessagesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SupportMessagesRecord.collection,
      SupportMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SupportMessagesRecord>> querySupportMessagesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SupportMessagesRecord.collection,
      SupportMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<SupportMessagesRecord>> querySupportMessagesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SupportMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      SupportMessagesRecord.collection,
      SupportMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<SupportMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PhonesRecords (as a Stream and as a Future).
Future<int> queryPhonesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhonesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhonesRecord>> queryPhonesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PhonesRecord.collection(parent),
      PhonesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PhonesRecord>> queryPhonesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PhonesRecord.collection(parent),
      PhonesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PhonesRecord>> queryPhonesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PhonesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PhonesRecord.collection(parent),
      PhonesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PhonesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PhoneConfirmationsRecords (as a Stream and as a Future).
Future<int> queryPhoneConfirmationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhoneConfirmationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhoneConfirmationsRecord>> queryPhoneConfirmationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PhoneConfirmationsRecord.collection,
      PhoneConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PhoneConfirmationsRecord>> queryPhoneConfirmationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PhoneConfirmationsRecord.collection,
      PhoneConfirmationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PhoneConfirmationsRecord>>
    queryPhoneConfirmationsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PhoneConfirmationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          PhoneConfirmationsRecord.collection,
          PhoneConfirmationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<PhoneConfirmationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query PhoneConfirmationMessagesRecords (as a Stream and as a Future).
Future<int> queryPhoneConfirmationMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhoneConfirmationMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhoneConfirmationMessagesRecord>>
    queryPhoneConfirmationMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          PhoneConfirmationMessagesRecord.collection(parent),
          PhoneConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<PhoneConfirmationMessagesRecord>>
    queryPhoneConfirmationMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          PhoneConfirmationMessagesRecord.collection(parent),
          PhoneConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<PhoneConfirmationMessagesRecord>>
    queryPhoneConfirmationMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PhoneConfirmationMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          PhoneConfirmationMessagesRecord.collection(parent),
          PhoneConfirmationMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<PhoneConfirmationMessagesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query AjandaRecords (as a Stream and as a Future).
Future<int> queryAjandaRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AjandaRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AjandaRecord>> queryAjandaRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AjandaRecord.collection(parent),
      AjandaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AjandaRecord>> queryAjandaRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AjandaRecord.collection(parent),
      AjandaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AjandaRecord>> queryAjandaRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AjandaRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      AjandaRecord.collection(parent),
      AjandaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<AjandaRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query AiChatsRecords (as a Stream and as a Future).
Future<int> queryAiChatsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AiChatsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AiChatsRecord>> queryAiChatsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AiChatsRecord.collection,
      AiChatsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AiChatsRecord>> queryAiChatsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AiChatsRecord.collection,
      AiChatsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AiChatsRecord>> queryAiChatsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AiChatsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      AiChatsRecord.collection,
      AiChatsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<AiChatsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query AiMessagesRecords (as a Stream and as a Future).
Future<int> queryAiMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AiMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AiMessagesRecord>> queryAiMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AiMessagesRecord.collection(parent),
      AiMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AiMessagesRecord>> queryAiMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AiMessagesRecord.collection(parent),
      AiMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AiMessagesRecord>> queryAiMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AiMessagesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      AiMessagesRecord.collection(parent),
      AiMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<AiMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query NotesRecords (as a Stream and as a Future).
Future<int> queryNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotesRecord>> queryNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotesRecord.collection(parent),
      NotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotesRecord>> queryNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotesRecord.collection(parent),
      NotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<NotesRecord>> queryNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, NotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      NotesRecord.collection(parent),
      NotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<NotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ProductsRecords (as a Stream and as a Future).
Future<int> queryProductsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ProductsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ProductsRecord>> queryProductsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ProductsRecord.collection,
      ProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ProductsRecord>> queryProductsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ProductsRecord.collection,
      ProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ProductsRecord>> queryProductsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ProductsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ProductsRecord.collection,
      ProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ProductsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CalculationsRecords (as a Stream and as a Future).
Future<int> queryCalculationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CalculationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CalculationsRecord>> queryCalculationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CalculationsRecord.collection(parent),
      CalculationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CalculationsRecord>> queryCalculationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CalculationsRecord.collection(parent),
      CalculationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CalculationsRecord>> queryCalculationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CalculationsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CalculationsRecord.collection(parent),
      CalculationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CalculationsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ProductFieldsRecords (as a Stream and as a Future).
Future<int> queryProductFieldsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ProductFieldsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ProductFieldsRecord>> queryProductFieldsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ProductFieldsRecord.collection(parent),
      ProductFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ProductFieldsRecord>> queryProductFieldsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ProductFieldsRecord.collection(parent),
      ProductFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ProductFieldsRecord>> queryProductFieldsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ProductFieldsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ProductFieldsRecord.collection(parent),
      ProductFieldsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ProductFieldsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PhoneIndexRecords (as a Stream and as a Future).
Future<int> queryPhoneIndexRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhoneIndexRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhoneIndexRecord>> queryPhoneIndexRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PhoneIndexRecord.collection,
      PhoneIndexRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PhoneIndexRecord>> queryPhoneIndexRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PhoneIndexRecord.collection,
      PhoneIndexRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PhoneIndexRecord>> queryPhoneIndexRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PhoneIndexRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PhoneIndexRecord.collection,
      PhoneIndexRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PhoneIndexRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ParentProductsRecords (as a Stream and as a Future).
Future<int> queryParentProductsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ParentProductsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ParentProductsRecord>> queryParentProductsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ParentProductsRecord.collection(parent),
      ParentProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ParentProductsRecord>> queryParentProductsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ParentProductsRecord.collection(parent),
      ParentProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ParentProductsRecord>> queryParentProductsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ParentProductsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ParentProductsRecord.collection(parent),
      ParentProductsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ParentProductsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PartnershipInvitationRecords (as a Stream and as a Future).
Future<int> queryPartnershipInvitationRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PartnershipInvitationRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PartnershipInvitationRecord>> queryPartnershipInvitationRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PartnershipInvitationRecord.collection(parent),
      PartnershipInvitationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PartnershipInvitationRecord>> queryPartnershipInvitationRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PartnershipInvitationRecord.collection(parent),
      PartnershipInvitationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PartnershipInvitationRecord>>
    queryPartnershipInvitationRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PartnershipInvitationRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          PartnershipInvitationRecord.collection(parent),
          PartnershipInvitationRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<PartnershipInvitationRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FriendsRecords (as a Stream and as a Future).
Future<int> queryFriendsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FriendsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FriendsRecord>> queryFriendsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FriendsRecord.collection(parent),
      FriendsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FriendsRecord>> queryFriendsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FriendsRecord.collection(parent),
      FriendsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FriendsRecord>> queryFriendsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FriendsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FriendsRecord.collection(parent),
      FriendsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FriendsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ImportantNotesRecords (as a Stream and as a Future).
Future<int> queryImportantNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ImportantNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ImportantNotesRecord>> queryImportantNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ImportantNotesRecord.collection(parent),
      ImportantNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ImportantNotesRecord>> queryImportantNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ImportantNotesRecord.collection(parent),
      ImportantNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ImportantNotesRecord>> queryImportantNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ImportantNotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ImportantNotesRecord.collection(parent),
      ImportantNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ImportantNotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query GoalNotesRecords (as a Stream and as a Future).
Future<int> queryGoalNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GoalNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GoalNotesRecord>> queryGoalNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GoalNotesRecord.collection(parent),
      GoalNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GoalNotesRecord>> queryGoalNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GoalNotesRecord.collection(parent),
      GoalNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GoalNotesRecord>> queryGoalNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GoalNotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      GoalNotesRecord.collection(parent),
      GoalNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<GoalNotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PersonalDiaryRecords (as a Stream and as a Future).
Future<int> queryPersonalDiaryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PersonalDiaryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PersonalDiaryRecord>> queryPersonalDiaryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PersonalDiaryRecord.collection(parent),
      PersonalDiaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PersonalDiaryRecord>> queryPersonalDiaryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PersonalDiaryRecord.collection(parent),
      PersonalDiaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PersonalDiaryRecord>> queryPersonalDiaryRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PersonalDiaryRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PersonalDiaryRecord.collection(parent),
      PersonalDiaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PersonalDiaryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FinancialMonitoringNotesRecords (as a Stream and as a Future).
Future<int> queryFinancialMonitoringNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialMonitoringNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialMonitoringNotesRecord>>
    queryFinancialMonitoringNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          FinancialMonitoringNotesRecord.collection(parent),
          FinancialMonitoringNotesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<FinancialMonitoringNotesRecord>>
    queryFinancialMonitoringNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          FinancialMonitoringNotesRecord.collection(parent),
          FinancialMonitoringNotesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<FinancialMonitoringNotesRecord>>
    queryFinancialMonitoringNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialMonitoringNotesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          FinancialMonitoringNotesRecord.collection(parent),
          FinancialMonitoringNotesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<FinancialMonitoringNotesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query DeletionRequestRecords (as a Stream and as a Future).
Future<int> queryDeletionRequestRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DeletionRequestRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DeletionRequestRecord>> queryDeletionRequestRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DeletionRequestRecord.collection(parent),
      DeletionRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DeletionRequestRecord>> queryDeletionRequestRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DeletionRequestRecord.collection(parent),
      DeletionRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<DeletionRequestRecord>> queryDeletionRequestRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, DeletionRequestRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      DeletionRequestRecord.collection(parent),
      DeletionRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<DeletionRequestRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkerShiftsRecords (as a Stream and as a Future).
Future<int> queryWorkerShiftsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkerShiftsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkerShiftsRecord>> queryWorkerShiftsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkerShiftsRecord.collection(parent),
      WorkerShiftsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkerShiftsRecord>> queryWorkerShiftsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkerShiftsRecord.collection(parent),
      WorkerShiftsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkerShiftsRecord>> queryWorkerShiftsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkerShiftsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkerShiftsRecord.collection(parent),
      WorkerShiftsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkerShiftsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkerPaymentDetailsRecords (as a Stream and as a Future).
Future<int> queryWorkerPaymentDetailsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkerPaymentDetailsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkerPaymentDetailsRecord>> queryWorkerPaymentDetailsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkerPaymentDetailsRecord.collection(parent),
      WorkerPaymentDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkerPaymentDetailsRecord>> queryWorkerPaymentDetailsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkerPaymentDetailsRecord.collection(parent),
      WorkerPaymentDetailsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkerPaymentDetailsRecord>>
    queryWorkerPaymentDetailsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkerPaymentDetailsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkerPaymentDetailsRecord.collection(parent),
          WorkerPaymentDetailsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkerPaymentDetailsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkerPaymentDetailsWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryWorkerPaymentDetailsWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkerPaymentDetailsWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkerPaymentDetailsWorkPlaceRecord>>
    queryWorkerPaymentDetailsWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          WorkerPaymentDetailsWorkPlaceRecord.collection(parent),
          WorkerPaymentDetailsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<WorkerPaymentDetailsWorkPlaceRecord>>
    queryWorkerPaymentDetailsWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          WorkerPaymentDetailsWorkPlaceRecord.collection(parent),
          WorkerPaymentDetailsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<WorkerPaymentDetailsWorkPlaceRecord>>
    queryWorkerPaymentDetailsWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?,
          WorkerPaymentDetailsWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkerPaymentDetailsWorkPlaceRecord.collection(parent),
          WorkerPaymentDetailsWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<WorkerPaymentDetailsWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanySalaryRecords (as a Stream and as a Future).
Future<int> queryCompanySalaryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanySalaryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanySalaryRecord>> queryCompanySalaryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanySalaryRecord.collection(parent),
      CompanySalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanySalaryRecord>> queryCompanySalaryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanySalaryRecord.collection(parent),
      CompanySalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanySalaryRecord>> queryCompanySalaryRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanySalaryRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanySalaryRecord.collection(parent),
      CompanySalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanySalaryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceSalaryRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceSalaryRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceSalaryRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceSalaryRecord>> queryWorkPlaceSalaryRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceSalaryRecord.collection(parent),
      WorkPlaceSalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceSalaryRecord>> queryWorkPlaceSalaryRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceSalaryRecord.collection(parent),
      WorkPlaceSalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceSalaryRecord>> queryWorkPlaceSalaryRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceSalaryRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceSalaryRecord.collection(parent),
      WorkPlaceSalaryRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceSalaryRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompanyNotesRecords (as a Stream and as a Future).
Future<int> queryCompanyNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyNotesRecord>> queryCompanyNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyNotesRecord.collection(parent),
      CompanyNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyNotesRecord>> queryCompanyNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyNotesRecord.collection(parent),
      CompanyNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyNotesRecord>> queryCompanyNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyNotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyNotesRecord.collection(parent),
      CompanyNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyNotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceNotesRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceNotesRecord>> queryWorkPlaceNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceNotesRecord.collection(parent),
      WorkPlaceNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceNotesRecord>> queryWorkPlaceNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceNotesRecord.collection(parent),
      WorkPlaceNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceNotesRecord>> queryWorkPlaceNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceNotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceNotesRecord.collection(parent),
      WorkPlaceNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceNotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query MessageRecords (as a Stream and as a Future).
Future<int> queryMessageRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MessageRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MessageRecord>> queryMessageRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MessageRecord.collection,
      MessageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MessageRecord>> queryMessageRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MessageRecord.collection,
      MessageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<MessageRecord>> queryMessageRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, MessageRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      MessageRecord.collection,
      MessageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<MessageRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceMessagesRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceMessagesRecord>> queryWorkPlaceMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceMessagesRecord.collection(parent),
      WorkPlaceMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceMessagesRecord>> queryWorkPlaceMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceMessagesRecord.collection(parent),
      WorkPlaceMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceMessagesRecord>>
    queryWorkPlaceMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceMessagesRecord.collection(parent),
          WorkPlaceMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlaceMessagesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyMessagesRecords (as a Stream and as a Future).
Future<int> queryCompanyMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyMessagesRecord>> queryCompanyMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyMessagesRecord.collection(parent),
      CompanyMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyMessagesRecord>> queryCompanyMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyMessagesRecord.collection(parent),
      CompanyMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyMessagesRecord>> queryCompanyMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyMessagesRecord.collection(parent),
      CompanyMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query PhoneMessagesRecords (as a Stream and as a Future).
Future<int> queryPhoneMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhoneMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhoneMessagesRecord>> queryPhoneMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PhoneMessagesRecord.collection(parent),
      PhoneMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PhoneMessagesRecord>> queryPhoneMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PhoneMessagesRecord.collection(parent),
      PhoneMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<PhoneMessagesRecord>> queryPhoneMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, PhoneMessagesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      PhoneMessagesRecord.collection(parent),
      PhoneMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<PhoneMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query SocialMessagesRecords (as a Stream and as a Future).
Future<int> querySocialMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SocialMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SocialMessagesRecord>> querySocialMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SocialMessagesRecord.collection(parent),
      SocialMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SocialMessagesRecord>> querySocialMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SocialMessagesRecord.collection(parent),
      SocialMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<SocialMessagesRecord>> querySocialMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SocialMessagesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      SocialMessagesRecord.collection(parent),
      SocialMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<SocialMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query NewMessagesRecords (as a Stream and as a Future).
Future<int> queryNewMessagesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NewMessagesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NewMessagesRecord>> queryNewMessagesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NewMessagesRecord.collection(parent),
      NewMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NewMessagesRecord>> queryNewMessagesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NewMessagesRecord.collection(parent),
      NewMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<NewMessagesRecord>> queryNewMessagesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, NewMessagesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      NewMessagesRecord.collection(parent),
      NewMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<NewMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CountriesRecords (as a Stream and as a Future).
Future<int> queryCountriesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountriesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountriesRecord>> queryCountriesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountriesRecord.collection,
      CountriesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountriesRecord>> queryCountriesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountriesRecord.collection,
      CountriesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CountriesRecord>> queryCountriesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CountriesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CountriesRecord.collection,
      CountriesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CountriesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CitiesRecords (as a Stream and as a Future).
Future<int> queryCitiesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CitiesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CitiesRecord>> queryCitiesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CitiesRecord.collection,
      CitiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CitiesRecord>> queryCitiesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CitiesRecord.collection,
      CitiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CitiesRecord>> queryCitiesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CitiesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CitiesRecord.collection,
      CitiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CitiesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query BlockedConversationsRecords (as a Stream and as a Future).
Future<int> queryBlockedConversationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BlockedConversationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BlockedConversationsRecord>> queryBlockedConversationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BlockedConversationsRecord.collection(parent),
      BlockedConversationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BlockedConversationsRecord>> queryBlockedConversationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BlockedConversationsRecord.collection(parent),
      BlockedConversationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<BlockedConversationsRecord>>
    queryBlockedConversationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, BlockedConversationsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          BlockedConversationsRecord.collection(parent),
          BlockedConversationsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<BlockedConversationsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query ConversationReportsRecords (as a Stream and as a Future).
Future<int> queryConversationReportsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConversationReportsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConversationReportsRecord>> queryConversationReportsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConversationReportsRecord.collection,
      ConversationReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConversationReportsRecord>> queryConversationReportsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConversationReportsRecord.collection,
      ConversationReportsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ConversationReportsRecord>>
    queryConversationReportsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ConversationReportsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          ConversationReportsRecord.collection,
          ConversationReportsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<ConversationReportsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query SocialNotificationRecords (as a Stream and as a Future).
Future<int> querySocialNotificationRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SocialNotificationRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SocialNotificationRecord>> querySocialNotificationRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SocialNotificationRecord.collection(parent),
      SocialNotificationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SocialNotificationRecord>> querySocialNotificationRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SocialNotificationRecord.collection(parent),
      SocialNotificationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<SocialNotificationRecord>>
    querySocialNotificationRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, SocialNotificationRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          SocialNotificationRecord.collection(parent),
          SocialNotificationRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<SocialNotificationRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query MessageUpdateRecords (as a Stream and as a Future).
Future<int> queryMessageUpdateRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MessageUpdateRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MessageUpdateRecord>> queryMessageUpdateRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MessageUpdateRecord.collection(parent),
      MessageUpdateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MessageUpdateRecord>> queryMessageUpdateRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MessageUpdateRecord.collection(parent),
      MessageUpdateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<MessageUpdateRecord>> queryMessageUpdateRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, MessageUpdateRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      MessageUpdateRecord.collection(parent),
      MessageUpdateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<MessageUpdateRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FinancialNoteCompanyRecords (as a Stream and as a Future).
Future<int> queryFinancialNoteCompanyRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialNoteCompanyRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialNoteCompanyRecord>> queryFinancialNoteCompanyRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FinancialNoteCompanyRecord.collection(parent),
      FinancialNoteCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FinancialNoteCompanyRecord>> queryFinancialNoteCompanyRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FinancialNoteCompanyRecord.collection(parent),
      FinancialNoteCompanyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FinancialNoteCompanyRecord>>
    queryFinancialNoteCompanyRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialNoteCompanyRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          FinancialNoteCompanyRecord.collection(parent),
          FinancialNoteCompanyRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<FinancialNoteCompanyRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FinancialNoteWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryFinancialNoteWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialNoteWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialNoteWorkPlaceRecord>> queryFinancialNoteWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FinancialNoteWorkPlaceRecord.collection(parent),
      FinancialNoteWorkPlaceRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FinancialNoteWorkPlaceRecord>>
    queryFinancialNoteWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          FinancialNoteWorkPlaceRecord.collection(parent),
          FinancialNoteWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<FinancialNoteWorkPlaceRecord>>
    queryFinancialNoteWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialNoteWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          FinancialNoteWorkPlaceRecord.collection(parent),
          FinancialNoteWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<FinancialNoteWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query CompanyBillRecords (as a Stream and as a Future).
Future<int> queryCompanyBillRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompanyBillRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompanyBillRecord>> queryCompanyBillRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompanyBillRecord.collection(parent),
      CompanyBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompanyBillRecord>> queryCompanyBillRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompanyBillRecord.collection(parent),
      CompanyBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompanyBillRecord>> queryCompanyBillRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompanyBillRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CompanyBillRecord.collection(parent),
      CompanyBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CompanyBillRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlaceBillRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceBillRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceBillRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceBillRecord>> queryWorkPlaceBillRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceBillRecord.collection(parent),
      WorkPlaceBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceBillRecord>> queryWorkPlaceBillRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceBillRecord.collection(parent),
      WorkPlaceBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceBillRecord>> queryWorkPlaceBillRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceBillRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      WorkPlaceBillRecord.collection(parent),
      WorkPlaceBillRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<WorkPlaceBillRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UrgentNotesRecords (as a Stream and as a Future).
Future<int> queryUrgentNotesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UrgentNotesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UrgentNotesRecord>> queryUrgentNotesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UrgentNotesRecord.collection(parent),
      UrgentNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UrgentNotesRecord>> queryUrgentNotesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UrgentNotesRecord.collection(parent),
      UrgentNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UrgentNotesRecord>> queryUrgentNotesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UrgentNotesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UrgentNotesRecord.collection(parent),
      UrgentNotesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UrgentNotesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CompaniesCurrentsRecords (as a Stream and as a Future).
Future<int> queryCompaniesCurrentsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CompaniesCurrentsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CompaniesCurrentsRecord>> queryCompaniesCurrentsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CompaniesCurrentsRecord.collection(parent),
      CompaniesCurrentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CompaniesCurrentsRecord>> queryCompaniesCurrentsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CompaniesCurrentsRecord.collection(parent),
      CompaniesCurrentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CompaniesCurrentsRecord>>
    queryCompaniesCurrentsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CompaniesCurrentsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          CompaniesCurrentsRecord.collection(parent),
          CompaniesCurrentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<CompaniesCurrentsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FinancialNoteCompanyCheckRecords (as a Stream and as a Future).
Future<int> queryFinancialNoteCompanyCheckRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialNoteCompanyCheckRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialNoteCompanyCheckRecord>>
    queryFinancialNoteCompanyCheckRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          FinancialNoteCompanyCheckRecord.collection(parent),
          FinancialNoteCompanyCheckRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<FinancialNoteCompanyCheckRecord>>
    queryFinancialNoteCompanyCheckRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          FinancialNoteCompanyCheckRecord.collection(parent),
          FinancialNoteCompanyCheckRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<FinancialNoteCompanyCheckRecord>>
    queryFinancialNoteCompanyCheckRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialNoteCompanyCheckRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          FinancialNoteCompanyCheckRecord.collection(parent),
          FinancialNoteCompanyCheckRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<FinancialNoteCompanyCheckRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query FinancialPlansRecords (as a Stream and as a Future).
Future<int> queryFinancialPlansRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialPlansRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialPlansRecord>> queryFinancialPlansRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FinancialPlansRecord.collection,
      FinancialPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FinancialPlansRecord>> queryFinancialPlansRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FinancialPlansRecord.collection,
      FinancialPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FinancialPlansRecord>> queryFinancialPlansRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialPlansRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FinancialPlansRecord.collection,
      FinancialPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FinancialPlansRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FinancialPlansItemsRecords (as a Stream and as a Future).
Future<int> queryFinancialPlansItemsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FinancialPlansItemsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FinancialPlansItemsRecord>> queryFinancialPlansItemsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FinancialPlansItemsRecord.collection(parent),
      FinancialPlansItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FinancialPlansItemsRecord>> queryFinancialPlansItemsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FinancialPlansItemsRecord.collection(parent),
      FinancialPlansItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FinancialPlansItemsRecord>>
    queryFinancialPlansItemsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FinancialPlansItemsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          FinancialPlansItemsRecord.collection(parent),
          FinancialPlansItemsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<FinancialPlansItemsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query IncomePlansRecords (as a Stream and as a Future).
Future<int> queryIncomePlansRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      IncomePlansRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<IncomePlansRecord>> queryIncomePlansRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      IncomePlansRecord.collection,
      IncomePlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<IncomePlansRecord>> queryIncomePlansRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      IncomePlansRecord.collection,
      IncomePlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<IncomePlansRecord>> queryIncomePlansRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, IncomePlansRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      IncomePlansRecord.collection,
      IncomePlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<IncomePlansRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query IncomePlanItemsRecords (as a Stream and as a Future).
Future<int> queryIncomePlanItemsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      IncomePlanItemsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<IncomePlanItemsRecord>> queryIncomePlanItemsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      IncomePlanItemsRecord.collection(parent),
      IncomePlanItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<IncomePlanItemsRecord>> queryIncomePlanItemsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      IncomePlanItemsRecord.collection(parent),
      IncomePlanItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<IncomePlanItemsRecord>> queryIncomePlanItemsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, IncomePlanItemsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      IncomePlanItemsRecord.collection(parent),
      IncomePlanItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<IncomePlanItemsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query InvestmentPlansRecords (as a Stream and as a Future).
Future<int> queryInvestmentPlansRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InvestmentPlansRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InvestmentPlansRecord>> queryInvestmentPlansRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InvestmentPlansRecord.collection,
      InvestmentPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InvestmentPlansRecord>> queryInvestmentPlansRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InvestmentPlansRecord.collection,
      InvestmentPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<InvestmentPlansRecord>> queryInvestmentPlansRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, InvestmentPlansRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      InvestmentPlansRecord.collection,
      InvestmentPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<InvestmentPlansRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query InvestmentPlanItemsRecords (as a Stream and as a Future).
Future<int> queryInvestmentPlanItemsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InvestmentPlanItemsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InvestmentPlanItemsRecord>> queryInvestmentPlanItemsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InvestmentPlanItemsRecord.collection(parent),
      InvestmentPlanItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InvestmentPlanItemsRecord>> queryInvestmentPlanItemsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InvestmentPlanItemsRecord.collection(parent),
      InvestmentPlanItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<InvestmentPlanItemsRecord>>
    queryInvestmentPlanItemsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, InvestmentPlanItemsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          InvestmentPlanItemsRecord.collection(parent),
          InvestmentPlanItemsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<InvestmentPlanItemsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query ArtificialCurrentUsersRecords (as a Stream and as a Future).
Future<int> queryArtificialCurrentUsersRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ArtificialCurrentUsersRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ArtificialCurrentUsersRecord>> queryArtificialCurrentUsersRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ArtificialCurrentUsersRecord.collection(parent),
      ArtificialCurrentUsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ArtificialCurrentUsersRecord>>
    queryArtificialCurrentUsersRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          ArtificialCurrentUsersRecord.collection(parent),
          ArtificialCurrentUsersRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<ArtificialCurrentUsersRecord>>
    queryArtificialCurrentUsersRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ArtificialCurrentUsersRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          ArtificialCurrentUsersRecord.collection(parent),
          ArtificialCurrentUsersRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<ArtificialCurrentUsersRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query XCurrentAccountsRecords (as a Stream and as a Future).
Future<int> queryXCurrentAccountsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      XCurrentAccountsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<XCurrentAccountsRecord>> queryXCurrentAccountsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      XCurrentAccountsRecord.collection,
      XCurrentAccountsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<XCurrentAccountsRecord>> queryXCurrentAccountsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      XCurrentAccountsRecord.collection,
      XCurrentAccountsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<XCurrentAccountsRecord>>
    queryXCurrentAccountsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, XCurrentAccountsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          XCurrentAccountsRecord.collection,
          XCurrentAccountsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<XCurrentAccountsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query XCurrentActivitiesRecords (as a Stream and as a Future).
Future<int> queryXCurrentActivitiesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      XCurrentActivitiesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<XCurrentActivitiesRecord>> queryXCurrentActivitiesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      XCurrentActivitiesRecord.collection(parent),
      XCurrentActivitiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<XCurrentActivitiesRecord>> queryXCurrentActivitiesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      XCurrentActivitiesRecord.collection(parent),
      XCurrentActivitiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<XCurrentActivitiesRecord>>
    queryXCurrentActivitiesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, XCurrentActivitiesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          XCurrentActivitiesRecord.collection(parent),
          XCurrentActivitiesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<XCurrentActivitiesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query MetricsRecords (as a Stream and as a Future).
Future<int> queryMetricsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MetricsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MetricsRecord>> queryMetricsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MetricsRecord.collection,
      MetricsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MetricsRecord>> queryMetricsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MetricsRecord.collection,
      MetricsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<MetricsRecord>> queryMetricsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, MetricsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      MetricsRecord.collection,
      MetricsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<MetricsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query WorkPlacePaymentsRecords (as a Stream and as a Future).
Future<int> queryWorkPlacePaymentsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlacePaymentsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlacePaymentsRecord>> queryWorkPlacePaymentsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlacePaymentsRecord.collection(parent),
      WorkPlacePaymentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlacePaymentsRecord>> queryWorkPlacePaymentsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlacePaymentsRecord.collection(parent),
      WorkPlacePaymentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlacePaymentsRecord>>
    queryWorkPlacePaymentsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlacePaymentsRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlacePaymentsRecord.collection(parent),
          WorkPlacePaymentsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlacePaymentsRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query WorkPlaceIncomesRecords (as a Stream and as a Future).
Future<int> queryWorkPlaceIncomesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WorkPlaceIncomesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WorkPlaceIncomesRecord>> queryWorkPlaceIncomesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WorkPlaceIncomesRecord.collection(parent),
      WorkPlaceIncomesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WorkPlaceIncomesRecord>> queryWorkPlaceIncomesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WorkPlaceIncomesRecord.collection(parent),
      WorkPlaceIncomesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<WorkPlaceIncomesRecord>>
    queryWorkPlaceIncomesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, WorkPlaceIncomesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          WorkPlaceIncomesRecord.collection(parent),
          WorkPlaceIncomesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<WorkPlaceIncomesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query InvestedMoniesToWorkPlaceRecords (as a Stream and as a Future).
Future<int> queryInvestedMoniesToWorkPlaceRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InvestedMoniesToWorkPlaceRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InvestedMoniesToWorkPlaceRecord>>
    queryInvestedMoniesToWorkPlaceRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          InvestedMoniesToWorkPlaceRecord.collection(parent),
          InvestedMoniesToWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<InvestedMoniesToWorkPlaceRecord>>
    queryInvestedMoniesToWorkPlaceRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          InvestedMoniesToWorkPlaceRecord.collection(parent),
          InvestedMoniesToWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );
Future<FFFirestorePage<InvestedMoniesToWorkPlaceRecord>>
    queryInvestedMoniesToWorkPlaceRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, InvestedMoniesToWorkPlaceRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          InvestedMoniesToWorkPlaceRecord.collection(parent),
          InvestedMoniesToWorkPlaceRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<InvestedMoniesToWorkPlaceRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
