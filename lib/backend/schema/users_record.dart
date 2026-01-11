import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "currentCity" field.
  String? _currentCity;
  String get currentCity => _currentCity ?? '';
  bool hasCurrentCity() => _currentCity != null;

  // "birthCity" field.
  String? _birthCity;
  String get birthCity => _birthCity ?? '';
  bool hasBirthCity() => _birthCity != null;

  // "freezedSocial" field.
  bool? _freezedSocial;
  bool get freezedSocial => _freezedSocial ?? false;
  bool hasFreezedSocial() => _freezedSocial != null;

  // "sustainedSocial" field.
  bool? _sustainedSocial;
  bool get sustainedSocial => _sustainedSocial ?? false;
  bool hasSustainedSocial() => _sustainedSocial != null;

  // "freezed" field.
  bool? _freezed;
  bool get freezed => _freezed ?? false;
  bool hasFreezed() => _freezed != null;

  // "sustained" field.
  bool? _sustained;
  bool get sustained => _sustained ?? false;
  bool hasSustained() => _sustained != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "friendsCount" field.
  int? _friendsCount;
  int get friendsCount => _friendsCount ?? 0;
  bool hasFriendsCount() => _friendsCount != null;

  // "totalMoney" field.
  double? _totalMoney;
  double get totalMoney => _totalMoney ?? 0.0;
  bool hasTotalMoney() => _totalMoney != null;

  // "yearlyMoney" field.
  double? _yearlyMoney;
  double get yearlyMoney => _yearlyMoney ?? 0.0;
  bool hasYearlyMoney() => _yearlyMoney != null;

  // "playerId" field.
  String? _playerId;
  String get playerId => _playerId ?? '';
  bool hasPlayerId() => _playerId != null;

  // "notificationCount" field.
  int? _notificationCount;
  int get notificationCount => _notificationCount ?? 0;
  bool hasNotificationCount() => _notificationCount != null;

  // "messageCount" field.
  int? _messageCount;
  int get messageCount => _messageCount ?? 0;
  bool hasMessageCount() => _messageCount != null;

  // "socialCount" field.
  int? _socialCount;
  int get socialCount => _socialCount ?? 0;
  bool hasSocialCount() => _socialCount != null;

  // "setupCount" field.
  int? _setupCount;
  int get setupCount => _setupCount ?? 0;
  bool hasSetupCount() => _setupCount != null;

  // "ishimCount" field.
  int? _ishimCount;
  int get ishimCount => _ishimCount ?? 0;
  bool hasIshimCount() => _ishimCount != null;

  // "city" field.
  DocumentReference? _city;
  DocumentReference? get city => _city;
  bool hasCity() => _city != null;

  // "aboutMe" field.
  String? _aboutMe;
  String get aboutMe => _aboutMe ?? '';
  bool hasAboutMe() => _aboutMe != null;

  // "aboutMeUpdatedAt" field.
  DateTime? _aboutMeUpdatedAt;
  DateTime? get aboutMeUpdatedAt => _aboutMeUpdatedAt;
  bool hasAboutMeUpdatedAt() => _aboutMeUpdatedAt != null;

  // "companiesIAmPartner" field.
  List<DocumentReference>? _companiesIAmPartner;
  List<DocumentReference> get companiesIAmPartner =>
      _companiesIAmPartner ?? const [];
  bool hasCompaniesIAmPartner() => _companiesIAmPartner != null;

  // "workPlacesIAmPartner" field.
  List<DocumentReference>? _workPlacesIAmPartner;
  List<DocumentReference> get workPlacesIAmPartner =>
      _workPlacesIAmPartner ?? const [];
  bool hasWorkPlacesIAmPartner() => _workPlacesIAmPartner != null;

  // "companiesIAmAuthorizedForWorkers" field.
  List<DocumentReference>? _companiesIAmAuthorizedForWorkers;
  List<DocumentReference> get companiesIAmAuthorizedForWorkers =>
      _companiesIAmAuthorizedForWorkers ?? const [];
  bool hasCompaniesIAmAuthorizedForWorkers() =>
      _companiesIAmAuthorizedForWorkers != null;

  // "workPlacesIAmAuthorizedForWorkers" field.
  List<DocumentReference>? _workPlacesIAmAuthorizedForWorkers;
  List<DocumentReference> get workPlacesIAmAuthorizedForWorkers =>
      _workPlacesIAmAuthorizedForWorkers ?? const [];
  bool hasWorkPlacesIAmAuthorizedForWorkers() =>
      _workPlacesIAmAuthorizedForWorkers != null;

  // "companiesIAmCreator" field.
  List<DocumentReference>? _companiesIAmCreator;
  List<DocumentReference> get companiesIAmCreator =>
      _companiesIAmCreator ?? const [];
  bool hasCompaniesIAmCreator() => _companiesIAmCreator != null;

  // "workPlacesIAmCreator" field.
  List<DocumentReference>? _workPlacesIAmCreator;
  List<DocumentReference> get workPlacesIAmCreator =>
      _workPlacesIAmCreator ?? const [];
  bool hasWorkPlacesIAmCreator() => _workPlacesIAmCreator != null;

  // "currentAccountsIAmAuthorizedToMonitor" field.
  List<DocumentReference>? _currentAccountsIAmAuthorizedToMonitor;
  List<DocumentReference> get currentAccountsIAmAuthorizedToMonitor =>
      _currentAccountsIAmAuthorizedToMonitor ?? const [];
  bool hasCurrentAccountsIAmAuthorizedToMonitor() =>
      _currentAccountsIAmAuthorizedToMonitor != null;

  // "currentAccountsIAmAuthorizedToModify" field.
  List<DocumentReference>? _currentAccountsIAmAuthorizedToModify;
  List<DocumentReference> get currentAccountsIAmAuthorizedToModify =>
      _currentAccountsIAmAuthorizedToModify ?? const [];
  bool hasCurrentAccountsIAmAuthorizedToModify() =>
      _currentAccountsIAmAuthorizedToModify != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gender = snapshotData['gender'] as String?;
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _currentCity = snapshotData['currentCity'] as String?;
    _birthCity = snapshotData['birthCity'] as String?;
    _freezedSocial = snapshotData['freezedSocial'] as bool?;
    _sustainedSocial = snapshotData['sustainedSocial'] as bool?;
    _freezed = snapshotData['freezed'] as bool?;
    _sustained = snapshotData['sustained'] as bool?;
    _deleted = snapshotData['deleted'] as bool?;
    _bio = snapshotData['bio'] as String?;
    _friendsCount = castToType<int>(snapshotData['friendsCount']);
    _totalMoney = castToType<double>(snapshotData['totalMoney']);
    _yearlyMoney = castToType<double>(snapshotData['yearlyMoney']);
    _playerId = snapshotData['playerId'] as String?;
    _notificationCount = castToType<int>(snapshotData['notificationCount']);
    _messageCount = castToType<int>(snapshotData['messageCount']);
    _socialCount = castToType<int>(snapshotData['socialCount']);
    _setupCount = castToType<int>(snapshotData['setupCount']);
    _ishimCount = castToType<int>(snapshotData['ishimCount']);
    _city = snapshotData['city'] as DocumentReference?;
    _aboutMe = snapshotData['aboutMe'] as String?;
    _aboutMeUpdatedAt = snapshotData['aboutMeUpdatedAt'] as DateTime?;
    _companiesIAmPartner = getDataList(snapshotData['companiesIAmPartner']);
    _workPlacesIAmPartner = getDataList(snapshotData['workPlacesIAmPartner']);
    _companiesIAmAuthorizedForWorkers =
        getDataList(snapshotData['companiesIAmAuthorizedForWorkers']);
    _workPlacesIAmAuthorizedForWorkers =
        getDataList(snapshotData['workPlacesIAmAuthorizedForWorkers']);
    _companiesIAmCreator = getDataList(snapshotData['companiesIAmCreator']);
    _workPlacesIAmCreator = getDataList(snapshotData['workPlacesIAmCreator']);
    _currentAccountsIAmAuthorizedToMonitor =
        getDataList(snapshotData['currentAccountsIAmAuthorizedToMonitor']);
    _currentAccountsIAmAuthorizedToModify =
        getDataList(snapshotData['currentAccountsIAmAuthorizedToModify']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? gender,
  DateTime? birthDate,
  String? currentCity,
  String? birthCity,
  bool? freezedSocial,
  bool? sustainedSocial,
  bool? freezed,
  bool? sustained,
  bool? deleted,
  String? bio,
  int? friendsCount,
  double? totalMoney,
  double? yearlyMoney,
  String? playerId,
  int? notificationCount,
  int? messageCount,
  int? socialCount,
  int? setupCount,
  int? ishimCount,
  DocumentReference? city,
  String? aboutMe,
  DateTime? aboutMeUpdatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
      'currentCity': currentCity,
      'birthCity': birthCity,
      'freezedSocial': freezedSocial,
      'sustainedSocial': sustainedSocial,
      'freezed': freezed,
      'sustained': sustained,
      'deleted': deleted,
      'bio': bio,
      'friendsCount': friendsCount,
      'totalMoney': totalMoney,
      'yearlyMoney': yearlyMoney,
      'playerId': playerId,
      'notificationCount': notificationCount,
      'messageCount': messageCount,
      'socialCount': socialCount,
      'setupCount': setupCount,
      'ishimCount': ishimCount,
      'city': city,
      'aboutMe': aboutMe,
      'aboutMeUpdatedAt': aboutMeUpdatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.gender == e2?.gender &&
        e1?.birthDate == e2?.birthDate &&
        e1?.currentCity == e2?.currentCity &&
        e1?.birthCity == e2?.birthCity &&
        e1?.freezedSocial == e2?.freezedSocial &&
        e1?.sustainedSocial == e2?.sustainedSocial &&
        e1?.freezed == e2?.freezed &&
        e1?.sustained == e2?.sustained &&
        e1?.deleted == e2?.deleted &&
        e1?.bio == e2?.bio &&
        e1?.friendsCount == e2?.friendsCount &&
        e1?.totalMoney == e2?.totalMoney &&
        e1?.yearlyMoney == e2?.yearlyMoney &&
        e1?.playerId == e2?.playerId &&
        e1?.notificationCount == e2?.notificationCount &&
        e1?.messageCount == e2?.messageCount &&
        e1?.socialCount == e2?.socialCount &&
        e1?.setupCount == e2?.setupCount &&
        e1?.ishimCount == e2?.ishimCount &&
        e1?.city == e2?.city &&
        e1?.aboutMe == e2?.aboutMe &&
        e1?.aboutMeUpdatedAt == e2?.aboutMeUpdatedAt &&
        listEquality.equals(e1?.companiesIAmPartner, e2?.companiesIAmPartner) &&
        listEquality.equals(
            e1?.workPlacesIAmPartner, e2?.workPlacesIAmPartner) &&
        listEquality.equals(e1?.companiesIAmAuthorizedForWorkers,
            e2?.companiesIAmAuthorizedForWorkers) &&
        listEquality.equals(e1?.workPlacesIAmAuthorizedForWorkers,
            e2?.workPlacesIAmAuthorizedForWorkers) &&
        listEquality.equals(e1?.companiesIAmCreator, e2?.companiesIAmCreator) &&
        listEquality.equals(
            e1?.workPlacesIAmCreator, e2?.workPlacesIAmCreator) &&
        listEquality.equals(e1?.currentAccountsIAmAuthorizedToMonitor,
            e2?.currentAccountsIAmAuthorizedToMonitor) &&
        listEquality.equals(e1?.currentAccountsIAmAuthorizedToModify,
            e2?.currentAccountsIAmAuthorizedToModify);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.gender,
        e?.birthDate,
        e?.currentCity,
        e?.birthCity,
        e?.freezedSocial,
        e?.sustainedSocial,
        e?.freezed,
        e?.sustained,
        e?.deleted,
        e?.bio,
        e?.friendsCount,
        e?.totalMoney,
        e?.yearlyMoney,
        e?.playerId,
        e?.notificationCount,
        e?.messageCount,
        e?.socialCount,
        e?.setupCount,
        e?.ishimCount,
        e?.city,
        e?.aboutMe,
        e?.aboutMeUpdatedAt,
        e?.companiesIAmPartner,
        e?.workPlacesIAmPartner,
        e?.companiesIAmAuthorizedForWorkers,
        e?.workPlacesIAmAuthorizedForWorkers,
        e?.companiesIAmCreator,
        e?.workPlacesIAmCreator,
        e?.currentAccountsIAmAuthorizedToMonitor,
        e?.currentAccountsIAmAuthorizedToModify
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
