import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtificialCurrentUsersRecord extends FirestoreRecord {
  ArtificialCurrentUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "realUserRef" field.
  DocumentReference? _realUserRef;
  DocumentReference? get realUserRef => _realUserRef;
  bool hasRealUserRef() => _realUserRef != null;

  // "realUserName" field.
  String? _realUserName;
  String get realUserName => _realUserName ?? '';
  bool hasRealUserName() => _realUserName != null;

  // "realUserId" field.
  String? _realUserId;
  String get realUserId => _realUserId ?? '';
  bool hasRealUserId() => _realUserId != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "creatorUserRef" field.
  DocumentReference? _creatorUserRef;
  DocumentReference? get creatorUserRef => _creatorUserRef;
  bool hasCreatorUserRef() => _creatorUserRef != null;

  // "creatorUserName" field.
  String? _creatorUserName;
  String get creatorUserName => _creatorUserName ?? '';
  bool hasCreatorUserName() => _creatorUserName != null;

  // "creatorUserId" field.
  String? _creatorUserId;
  String get creatorUserId => _creatorUserId ?? '';
  bool hasCreatorUserId() => _creatorUserId != null;

  // "artificialUserName" field.
  String? _artificialUserName;
  String get artificialUserName => _artificialUserName ?? '';
  bool hasArtificialUserName() => _artificialUserName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _realUserRef = snapshotData['realUserRef'] as DocumentReference?;
    _realUserName = snapshotData['realUserName'] as String?;
    _realUserId = snapshotData['realUserId'] as String?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _creatorUserRef = snapshotData['creatorUserRef'] as DocumentReference?;
    _creatorUserName = snapshotData['creatorUserName'] as String?;
    _creatorUserId = snapshotData['creatorUserId'] as String?;
    _artificialUserName = snapshotData['artificialUserName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('artificialCurrentUsers')
          : FirebaseFirestore.instance
              .collectionGroup('artificialCurrentUsers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('artificialCurrentUsers').doc(id);

  static Stream<ArtificialCurrentUsersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ArtificialCurrentUsersRecord.fromSnapshot(s));

  static Future<ArtificialCurrentUsersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArtificialCurrentUsersRecord.fromSnapshot(s));

  static ArtificialCurrentUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtificialCurrentUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtificialCurrentUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtificialCurrentUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtificialCurrentUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtificialCurrentUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtificialCurrentUsersRecordData({
  DocumentReference? realUserRef,
  String? realUserName,
  String? realUserId,
  DateTime? creationTime,
  DocumentReference? creatorUserRef,
  String? creatorUserName,
  String? creatorUserId,
  String? artificialUserName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'realUserRef': realUserRef,
      'realUserName': realUserName,
      'realUserId': realUserId,
      'creationTime': creationTime,
      'creatorUserRef': creatorUserRef,
      'creatorUserName': creatorUserName,
      'creatorUserId': creatorUserId,
      'artificialUserName': artificialUserName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtificialCurrentUsersRecordDocumentEquality
    implements Equality<ArtificialCurrentUsersRecord> {
  const ArtificialCurrentUsersRecordDocumentEquality();

  @override
  bool equals(
      ArtificialCurrentUsersRecord? e1, ArtificialCurrentUsersRecord? e2) {
    return e1?.realUserRef == e2?.realUserRef &&
        e1?.realUserName == e2?.realUserName &&
        e1?.realUserId == e2?.realUserId &&
        e1?.creationTime == e2?.creationTime &&
        e1?.creatorUserRef == e2?.creatorUserRef &&
        e1?.creatorUserName == e2?.creatorUserName &&
        e1?.creatorUserId == e2?.creatorUserId &&
        e1?.artificialUserName == e2?.artificialUserName;
  }

  @override
  int hash(ArtificialCurrentUsersRecord? e) => const ListEquality().hash([
        e?.realUserRef,
        e?.realUserName,
        e?.realUserId,
        e?.creationTime,
        e?.creatorUserRef,
        e?.creatorUserName,
        e?.creatorUserId,
        e?.artificialUserName
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtificialCurrentUsersRecord;
}
