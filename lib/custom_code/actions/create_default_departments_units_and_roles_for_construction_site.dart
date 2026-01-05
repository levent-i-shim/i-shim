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

import 'package:firebase_storage/firebase_storage.dart';

Future<void> createDefaultDepartmentsUnitsAndRolesForConstructionSite(
    DocumentReference company,
    DocumentReference workPlace,
    DocumentReference authUser) async {
  try {
    final Map<String, List<String>> siteDepartmentsAndUnits = {
      'Şantiye Yönetimi': [
        'Şantiye Genel Yönetimi',
        'Saha Koordinasyonu',
        'Alt Yüklenici Yönetimi'
      ],
      'Makine ve Ekipman Yönetimi': [
        'Bakım ve Onarım',
        'Satın Alma',
        'Yakıt ve Sarf Malzeme'
      ],
      'İnşaat Uygulama': [
        'Kaba İnşaat',
        'İnce İşler',
        'Zemin ve Beton Uygulamaları'
      ],
      'Elektrik ve Mekanik Tesisat': [
        'Elektrik Uygulama',
        'Zayıf Akım Sistemleri',
        'Mekanik Tesisat',
        'Yangın Tesisatı'
      ],
      'Planlama ve Hakediş': [
        'Metraj ve Keşif',
        'Hakediş Hazırlama',
        'Termin Programı Takibi'
      ],
      'Kalite ve Kontrol': [
        'Malzeme Kabul Kontrolü',
        'Uygulama Kontrolü',
        'Test ve Devreye Alma'
      ],
      'İş Sağlığı ve Güvenliği (İSG)': [
        'Saha Denetimi',
        'Risk Değerlendirme',
        'İSG Eğitimleri'
      ],
      'Lojistik ve Malzeme Yönetimi': [
        'Malzeme Tedarik',
        'Saha Lojistik',
        'Depolama ve Dağıtım'
      ],
      'Çevre ve Sosyal Etki': [
        'Atık Yönetimi',
        'Çevresel Denetim',
        'Komşu Alan Uyum Yönetimi'
      ],
      'Şantiye İdari İşler': [
        'Konteyner ve Ofis Düzeni',
        'Yemekhane ve Servis Hizmetleri',
        'Temizlik ve Güvenlik'
      ],
    };
    final List<String> siteRoles = [
      // Şantiye Yönetimi
      'Şantiye Şefi',
      'Proje Müdürü',
      'Saha Mühendisi',
      'Alt Yüklenici Koordinatörü',

      // İnşaat Uygulama
      'Kalıp Ustası',
      'Demir Ustası',
      'Beton Ustası',
      'Duvar Ustası',
      'Boyacı',
      'Şantiye Formeni',

      // Elektrik ve Mekanik
      'Elektrik Ustası',
      'Zayıf Akım Teknisyeni',
      'Mekanik Tesisat Ustası',
      'Yangın Tesisatı Ustası',
      'Mekanik Formeni',

      // Planlama ve Hakediş
      'Planlama Mühendisi',
      'Metraj ve Hakediş Uzmanı',
      'Teklif ve Keşif Uzmanı',

      // Kalite Kontrol
      'Kalite Kontrol Mühendisi',
      'Malzeme Kontrol Sorumlusu',
      'Test ve Devreye Alma Teknikeri',

      // İş Sağlığı ve Güvenliği
      'İSG Uzmanı',
      'Saha Güvenlik Denetmeni',
      'İşyeri Hekimi',

      // Lojistik ve Malzeme
      'Lojistik Sorumlusu',
      'Depo Sorumlusu',
      'Malzeme Sevkiyat Elemanı',

      // Çevre ve Sosyal Etki
      'Çevre Mühendisi',
      'Atık Yönetimi Uzmanı',

      // İdari İşler
      'Şantiye İdari Sorumlusu',
      'Temizlik Görevlisi',
      'Güvenlik Görevlisi',
      'Aşçı / Yemekhane Personeli',
      'Şoför / Servis Sürücüsü',
    ];

    for (final entry in siteDepartmentsAndUnits.entries) {
      final String department = entry.key;
      final List<String> units = entry.value;

      final addedDepartmentWorkPlace =
          await workPlace.collection('workPlaceDepartment').add({
        'name': department,
        'isDelete': false,
        'type': "Otomatik",
        'createdBy': authUser,
      });
      final addedDepartmentCompany =
          await company.collection('companyDepartments').add({
        'name': department,
        'isDelete': false,
        'type': "Otomatik",
        'createdBy': authUser,
        'workPlace': workPlace,
        'workPlaceDepartment': addedDepartmentWorkPlace
      });

      for (final unit in units) {
        final addedUnitWorkPlace =
            await workPlace.collection('workPlaceUnits').add({
          'name': unit,
          'isDelete': false,
          'departmentRef': addedDepartmentCompany,
          'createdBy': authUser,
        });
        final addedUnitCompany = await company.collection('companyUnits').add({
          'name': unit,
          'isDelete': false,
          'departmenRef': addedDepartmentCompany,
          'createdBy': authUser,
          'workplaceRef': workPlace,
          'workPlaceUnitRef': addedUnitWorkPlace
        });
      }
    }

    for (final role in siteRoles) {
      final addedRoleWorkPlace =
          await workPlace.collection('workPlaceRoles').add({
        'name': role,
        'isDelete': false,
        'createdBy': authUser,
      });
      final addedRoleCompany = await company.collection('companyRoles').add({
        'name': role,
        'isDelete': false,
        'createdBy': authUser,
        'workPlaceRef': workPlace,
        'WorkPlaceRoleRef': addedRoleWorkPlace
      });
    }

    print('Departman ve birimler başarıyla eklendi.');
  } catch (e) {
    print('Hata oluştu: $e');
  }
}
