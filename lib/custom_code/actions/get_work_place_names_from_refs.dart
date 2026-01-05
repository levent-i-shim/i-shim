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

Future<List<String>?> getWorkPlaceNamesFromRefs(
  List<DocumentReference>? listOfWorkPlaceRefsFromCustomAction,
) async {
  // Null / boş kontrolü
  if (listOfWorkPlaceRefsFromCustomAction == null ||
      listOfWorkPlaceRefsFromCustomAction.isEmpty) {
    return null; // istersen []
  }

  // (İsteğe bağlı) Tekrarlı ref'leri kaldırmadan, gelen sıra korunur.
  // Eğer dedup istiyorsan ama sıranın bozulmaması gerekiyorsa,
  // ilk görüleni alıp sonraki kopyaları SKIP edelim:
  final seen = <String>{};
  final refsInOrder = <DocumentReference>[];
  for (final r in listOfWorkPlaceRefsFromCustomAction) {
    if (r == null) continue;
    final key = r.path;
    if (seen.add(key)) {
      refsInOrder.add(r);
    }
    // eğer tamamen aynı sırayı eksiksiz korumak istiyorsan yukarıdaki dedup'u kaldır.
  }

  // Dokümanları sırayla çek → isimleri aynı sırada topla
  final names = <String>[];
  for (final r in refsInOrder) {
    try {
      final s = await r.get();
      if (!s.exists) {
        names.add('');
        continue;
      }
      final data = s.data() as Map<String, dynamic>?;
      final name = (data?['name'] ?? '').toString().trim();
      names.add(name);
    } catch (_) {
      names.add('');
    }
  }

  // Tamamen boşsa null dönebilirsin
  final allEmpty = names.every((e) => e.isEmpty);
  if (allEmpty) return null; // veya []

  // ÖNEMLİ: Sıralama YOK -> index eşleşmesi KORUNUR
  return names;
}
