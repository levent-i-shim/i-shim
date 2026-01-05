import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _localDbLastUpdatedAt = prefs.containsKey('ff_localDbLastUpdatedAt')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_localDbLastUpdatedAt')!)
          : _localDbLastUpdatedAt;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isSend = false;
  bool get isSend => _isSend;
  set isSend(bool value) {
    _isSend = value;
  }

  bool _isSelectedImage = false;
  bool get isSelectedImage => _isSelectedImage;
  set isSelectedImage(bool value) {
    _isSelectedImage = value;
  }

  DateTime? _localDbLastUpdatedAt =
      DateTime.fromMillisecondsSinceEpoch(1760226120000);
  DateTime? get localDbLastUpdatedAt => _localDbLastUpdatedAt;
  set localDbLastUpdatedAt(DateTime? value) {
    _localDbLastUpdatedAt = value;
    value != null
        ? prefs.setInt('ff_localDbLastUpdatedAt', value.millisecondsSinceEpoch)
        : prefs.remove('ff_localDbLastUpdatedAt');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
