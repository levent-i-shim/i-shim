import '/backend/schema/structs/index.dart';

class ProcessDailySalariesCloudFunctionCallResponse {
  ProcessDailySalariesCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
