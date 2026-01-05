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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> getUserCity() async {
  // 1. Konum servisi açık mı?
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Konum servisleri kapalı.');
  }

  // 2. İzin kontrolü — permission_handler
  var status = await Permission.location.status;
  if (status.isDenied) {
    status = await Permission.location.request();
    if (status.isDenied) {
      throw Exception('Konum izni reddedildi.');
    }
  }
  if (status.isPermanentlyDenied) {
    throw Exception('Konum izni kalıcı olarak reddedildi, ayarlardan açın.');
  }

  // 3. Konumu al
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low,
  );

  // 4. Şehir ismini bul
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
    //localeIdentifier: "tr", // Türkçe için
  );
  print(placemarks.isNotEmpty ? placemarks.first.administrativeArea : "boş");

  return placemarks.isNotEmpty ? placemarks.first.administrativeArea : null;
}
