import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyPartnersRecord extends FirestoreRecord {
  CompanyPartnersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "referenceCompanyID" field.
  String? _referenceCompanyID;
  String get referenceCompanyID => _referenceCompanyID ?? '';
  bool hasReferenceCompanyID() => _referenceCompanyID != null;

  // "referenceCompanyName" field.
  String? _referenceCompanyName;
  String get referenceCompanyName => _referenceCompanyName ?? '';
  bool hasReferenceCompanyName() => _referenceCompanyName != null;

  // "partnerUserID" field.
  String? _partnerUserID;
  String get partnerUserID => _partnerUserID ?? '';
  bool hasPartnerUserID() => _partnerUserID != null;

  // "parnerDisplayName" field.
  String? _parnerDisplayName;
  String get parnerDisplayName => _parnerDisplayName ?? '';
  bool hasParnerDisplayName() => _parnerDisplayName != null;

  // "percentage" field.
  double? _percentage;
  double get percentage => _percentage ?? 0.0;
  bool hasPercentage() => _percentage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _referenceCompanyID = snapshotData['referenceCompanyID'] as String?;
    _referenceCompanyName = snapshotData['referenceCompanyName'] as String?;
    _partnerUserID = snapshotData['partnerUserID'] as String?;
    _parnerDisplayName = snapshotData['parnerDisplayName'] as String?;
    _percentage = castToType<double>(snapshotData['percentage']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('companyPartners')
          : FirebaseFirestore.instance.collectionGroup('companyPartners');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('companyPartners').doc(id);

  static Stream<CompanyPartnersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyPartnersRecord.fromSnapshot(s));

  static Future<CompanyPartnersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyPartnersRecord.fromSnapshot(s));

  static CompanyPartnersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyPartnersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyPartnersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyPartnersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyPartnersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyPartnersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyPartnersRecordData({
  String? referenceCompanyID,
  String? referenceCompanyName,
  String? partnerUserID,
  String? parnerDisplayName,
  double? percentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'referenceCompanyID': referenceCompanyID,
      'referenceCompanyName': referenceCompanyName,
      'partnerUserID': partnerUserID,
      'parnerDisplayName': parnerDisplayName,
      'percentage': percentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyPartnersRecordDocumentEquality
    implements Equality<CompanyPartnersRecord> {
  const CompanyPartnersRecordDocumentEquality();

  @override
  bool equals(CompanyPartnersRecord? e1, CompanyPartnersRecord? e2) {
    return e1?.referenceCompanyID == e2?.referenceCompanyID &&
        e1?.referenceCompanyName == e2?.referenceCompanyName &&
        e1?.partnerUserID == e2?.partnerUserID &&
        e1?.parnerDisplayName == e2?.parnerDisplayName &&
        e1?.percentage == e2?.percentage;
  }

  @override
  int hash(CompanyPartnersRecord? e) => const ListEquality().hash([
        e?.referenceCompanyID,
        e?.referenceCompanyName,
        e?.partnerUserID,
        e?.parnerDisplayName,
        e?.percentage
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyPartnersRecord;
}
