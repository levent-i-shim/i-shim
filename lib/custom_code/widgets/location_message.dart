// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
class LocationMessage extends StatelessWidget {
  final String locationName;
  final double latitude;
  final double longitude;
  final double width;
  final double height;

  const LocationMessage({
    Key? key,
    required this.locationName,
    required this.latitude,
    required this.longitude,
    required this.width,
    required this.height,
  }) : super(key: key);

  String getStaticMapUrl() {
    final label = locationName.isNotEmpty ? locationName[0].toUpperCase() : 'X';
    return 'https://maps.googleapis.com/maps/api/staticmap'
        '?center=$latitude,$longitude'
        '&zoom=15'
        '&size=400x200'
        '&maptype=roadmap'
        '&markers=color:red%7Clabel:$label%7C$latitude,$longitude'
        '&key=AIzaSyDtwTJXkGaFwfXXtnkcfU07XZE7Mm--pUc';
  }

  void _openMaps() async {
    final geoUri = Uri.parse(
        'geo:$latitude,$longitude?q=$latitude,$longitude($locationName)');
    final httpsUri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    try {
      bool launched = false;
      if (Platform.isAndroid && await canLaunchUrl(geoUri)) {
        launched =
            await launchUrl(geoUri, mode: LaunchMode.externalApplication);
      }
      if (!launched && await canLaunchUrl(httpsUri)) {
        await launchUrl(httpsUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Harita açılamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: _openMaps,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
                child: Row(
                  children: [
                    const Icon(Icons.place, size: 16, color: Colors.redAccent),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        locationName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              // Harita önizleme
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Image.network(
                  getStaticMapUrl(),
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 140,
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 140,
                    child: Center(
                        child: Icon(Icons.map, size: 24, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
