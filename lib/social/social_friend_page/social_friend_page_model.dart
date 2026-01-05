import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'social_friend_page_widget.dart' show SocialFriendPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SocialFriendPageModel extends FlutterFlowModel<SocialFriendPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for result01 widget.

  PagingController<DocumentSnapshot?, FriendsRecord>? result01PagingController;
  Query? result01PagingQuery;
  List<StreamSubscription?> result01StreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    result01StreamSubscriptions.forEach((s) => s?.cancel());
    result01PagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, FriendsRecord> setResult01Controller(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    result01PagingController ??= _createResult01Controller(query, parent);
    if (result01PagingQuery != query) {
      result01PagingQuery = query;
      result01PagingController?.refresh();
    }
    return result01PagingController!;
  }

  PagingController<DocumentSnapshot?, FriendsRecord> _createResult01Controller(
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
          streamSubscriptions: result01StreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
