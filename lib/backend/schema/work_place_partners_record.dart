import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkPlacePartnersRecord extends FirestoreRecord {
  WorkPlacePartnersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "referenceWorkPlaceID" field.
  String? _referenceWorkPlaceID;
  String get referenceWorkPlaceID => _referenceWorkPlaceID ?? '';
  bool hasReferenceWorkPlaceID() => _referenceWorkPlaceID != null;

  // "referenceWorkPlaceName" field.
  String? _referenceWorkPlaceName;
  String get referenceWorkPlaceName => _referenceWorkPlaceName ?? '';
  bool hasReferenceWorkPlaceName() => _referenceWorkPlaceName != null;

  // "partnerUserID" field.
  String? _partnerUserID;
  String get partnerUserID => _partnerUserID ?? '';
  bool hasPartnerUserID() => _partnerUserID != null;

  // "partnerUserDisplayName" field.
  String? _partnerUserDisplayName;
  String get partnerUserDisplayName => _partnerUserDisplayName ?? '';
  bool hasPartnerUserDisplayName() => _partnerUserDisplayName != null;

  // "percentage" field.
  double? _percentage;
  double get percentage => _percentage ?? 0.0;
  bool hasPercentage() => _percentage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _referenceWorkPlaceID = snapshotData['referenceWorkPlaceID'] as String?;
    _referenceWorkPlaceName = snapshotData['referenceWorkPlaceName'] as String?;
    _partnerUserID = snapshotData['partnerUserID'] as String?;
    _partnerUserDisplayName = snapshotData['partnerUserDisplayName'] as String?;
    _percentage = castToType<double>(snapshotData['percentage']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workPlacePartners')
          : FirebaseFirestore.instance.collectionGroup('workPlacePartners');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workPlacePartners').doc(id);

  static Stream<WorkPlacePartnersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkPlacePartnersRecord.fromSnapshot(s));

  static Future<WorkPlacePartnersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkPlacePartnersRecord.fromSnapshot(s));

  static WorkPlacePartnersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkPlacePartnersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkPlacePartnersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkPlacePartnersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkPlacePartnersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkPlacePartnersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkPlacePartnersRecordData({
  String? referenceWorkPlaceID,
  String? referenceWorkPlaceName,
  String? partnerUserID,
  String? partnerUserDisplayName,
  double? percentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'referenceWorkPlaceID': referenceWorkPlaceID,
      'referenceWorkPlaceName': referenceWorkPlaceName,
      'partnerUserID': partnerUserID,
      'partnerUserDisplayName': partnerUserDisplayName,
      'percentage': percentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkPlacePartnersRecordDocumentEquality
    implements Equality<WorkPlacePartnersRecord> {
  const WorkPlacePartnersRecordDocumentEquality();

  @override
  bool equals(WorkPlacePartnersRecord? e1, WorkPlacePartnersRecord? e2) {
    return e1?.referenceWorkPlaceID == e2?.referenceWorkPlaceID &&
        e1?.referenceWorkPlaceName == e2?.referenceWorkPlaceName &&
        e1?.partnerUserID == e2?.partnerUserID &&
        e1?.partnerUserDisplayName == e2?.partnerUserDisplayName &&
        e1?.percentage == e2?.percentage;
  }

  @override
  int hash(WorkPlacePartnersRecord? e) => const ListEquality().hash([
        e?.referenceWorkPlaceID,
        e?.referenceWorkPlaceName,
        e?.partnerUserID,
        e?.partnerUserDisplayName,
        e?.percentage
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkPlacePartnersRecord;
}
