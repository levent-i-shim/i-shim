// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Firestore types
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot, FirebaseFirestore;

/// Return Value (Settings):
///   Type: DocumentReference | Is List | Nullable | Document Type: companies
/// Argument 1:
///   userDocRef : DocumentReference (Document Type: users)
Future<List<DocumentReference>?> loadWorkPlacesForDropdown(
  DocumentReference userDocRef,
) async {
  // Kullanıcı dokümanını al
  final snap = await userDocRef.get();
  final data = (snap.data() as Map<String, dynamic>?) ?? {};

  // Güvenli cast -> List<DocumentReference>
  List<DocumentReference> _asRefs(dynamic v) {
    if (v is Iterable) return v.whereType<DocumentReference>().toList();
    return <DocumentReference>[];
  }

  // Alan adları (sabit)
  const fieldCreator = 'workPlacesIAmCreator';
  const fieldPartner = 'workPlacesIAmPartner';
  const fieldAuthorized = 'workPlacesIAmAuthorizedForWorkers';

  final a = _asRefs(data[fieldCreator]);
  final b = _asRefs(data[fieldPartner]);
  final c = _asRefs(data[fieldAuthorized]);

  // Birleştir + tekrarı kaldır (path bazlı)
  final seen = <String>{};
  final merged = <DocumentReference>[];
  void addAll(List<DocumentReference> src) {
    for (final r in src) {
      final key = r.path;
      if (seen.add(key)) merged.add(r);
    }
  }

  addAll(a);
  addAll(b);
  addAll(c);

  // Boşsa NULL döndür (Nullable açık)
  if (merged.isEmpty) return null;

  // (İstersen burada alfabetik isim sıralaması eklenebilir; gerek yoksa direkt dön)
  return merged;
}
