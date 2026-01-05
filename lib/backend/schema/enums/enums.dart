import 'package:collection/collection.dart';

enum CompanyType {
  limited,
  sahis,
  anonim,
}

enum NotificationTypes {
  invitation,
  task,
  taskReport,
  dutiesTask,
  instruction,
  confirmation,
  confirmationCompany,
  confirmationWorkPlace,
  confirmationPersonal,
  confirmationCompanyRequest,
  confirmationWorkplaceRequest,
  sendFriendRequest,
  acceptFriendRequest,
  currentAccountRequest,
  currentAccountBillRequest,
  setCurrentAccountBillPaidRequest,
  currentAccountRejected,
  currentAccountAccepted,
  createBillRejected,
  createBillAccepted,
  billApprovalAccepted,
  billApprovalRejected,
  matchCurrentAccount,
  acceptInvitation,
  rejectInvitation,
  createPartnership,
  acceptPartnership,
  rejectPartnership,
  shiftRequest,
  deleteRequest,
}

enum FieldValueType {
  Text,
  Number,
  Boolean,
  DateTime,
  Image,
  DropDown,
}

enum WorkHistoryTypes {
  createAccount,
  startJob,
  startTask,
  startDuty,
  sendReportTask,
  sendReportDuty,
  createTask,
  createDuty,
  createCompany,
  createWorkPlace,
  createDepartment,
  createRole,
  createUnit,
  createTaskForDuty,
  createForm,
  sentExpanditury,
  spentExpanditury,
  sendTransaction,
  incomeEntered,
  expenseEntered,
  transactionRejected,
  createConfirmation,
  answeredConfirmation,
  createStock,
  createStockMovement,
  createCurrentAcountForCompany,
  createCurrentAccountsBillForCompany,
  currentAccountAccept,
  currentAccountReject,
  createBillAccept,
  createBillReject,
  billApprovalAccept,
  billApprovalReject,
  setCurrentAccountBillPaidRequest,
  addVehicle,
  addVehiclePayment,
  createNote,
}

enum AiMessageRole {
  assistant,
  user,
}

enum FinanceNoteType {
  workPlace,
  company,
  personal,
  family,
}

enum IncomeOrExpense {
  gelir,
  gider,
}

enum DeleteionRequestTypes {
  payment,
  income,
  parentProduct,
  childProduct,
  calculation,
}

enum WorkPlaceTypes {
  office,
  site,
  factory,
  restaurant,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (CompanyType):
      return CompanyType.values.deserialize(value) as T?;
    case (NotificationTypes):
      return NotificationTypes.values.deserialize(value) as T?;
    case (FieldValueType):
      return FieldValueType.values.deserialize(value) as T?;
    case (WorkHistoryTypes):
      return WorkHistoryTypes.values.deserialize(value) as T?;
    case (AiMessageRole):
      return AiMessageRole.values.deserialize(value) as T?;
    case (FinanceNoteType):
      return FinanceNoteType.values.deserialize(value) as T?;
    case (IncomeOrExpense):
      return IncomeOrExpense.values.deserialize(value) as T?;
    case (DeleteionRequestTypes):
      return DeleteionRequestTypes.values.deserialize(value) as T?;
    case (WorkPlaceTypes):
      return WorkPlaceTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
