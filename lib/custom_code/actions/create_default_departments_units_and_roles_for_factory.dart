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

Future<void> createDefaultDepartmentsUnitsAndRolesForFactory(
    DocumentReference company,
    DocumentReference workPlace,
    DocumentReference authUser) async {
  try {
    final Map<String, List<String>> factoryDepartmentsAndUnits = {
      'Üretim': [
        'Hammadde Hazırlık',
        'Üretim Hattı',
        'Paketleme',
        'Vardiya Yönetimi'
      ],
      'Makine ve Ekipman Yönetimi': [
        'Bakım ve Onarım',
        'Satın Alma',
        'Yakıt ve Sarf Malzeme',
        'Otomasyon ve PLC Bakım'
      ],
      'Kalite Kontrol': [
        'Giriş Kalite Kontrol',
        'Proses Kalite Kontrol',
        'Son Ürün Kalite Kontrol',
        'Laboratuvar'
      ],
      'Ar-Ge ve Ürün Geliştirme': [
        'Yeni Ürün Tasarımı',
        'Prototipleme',
        'Test ve Geliştirme'
      ],
      'Üretim Planlama ve Takip': [
        'Malzeme İhtiyaç Planlama (MRP)',
        'İş Emri Takibi',
        'Zaman Etüdü'
      ],
      'Lojistik ve Depo': [
        'Hammadde Deposu',
        'Mamül Deposu',
        'Sevkiyat ve Yükleme'
      ],
      'Çevre ve İş Sağlığı Güvenliği (İSG)': [
        'İşyeri Hekimliği ve Sağlık',
        'İSG Eğitimleri',
        'Çevresel Uyum ve Atık Yönetimi'
      ],
      'Enerji ve Tesis Yönetimi': [
        'Enerji Takibi',
        'Tesis Bakım ve Temizlik',
        'Isıtma-Soğutma Sistemleri'
      ],
      'Kalite ve Dokümantasyon': [
        'ISO Belgeleri',
        'Doküman Yönetimi',
        'İç Denetim'
      ],
    };
    final List<String> factoryRoles = [
      // Üretim
      'Üretim Müdürü',
      'Vardiya Amiri',
      'Hattı Operatörü',
      'Paketleme Elemanı',
      'Hammadde Hazırlık Operatörü',

      // Bakım ve Onarım
      'Bakım Müdürü',
      'Elektrik Teknisyeni',
      'Mekanik Bakımcı',
      'PLC Teknisyeni',
      'Otomasyon Teknikeri',

      // Kalite Kontrol
      'Kalite Müdürü',
      'Kalite Kontrol Uzmanı',
      'Laboratuvar Teknisyeni',
      'Giriş Kalite Elemanı',
      'Proses Kontrol Uzmanı',

      // Ar-Ge
      'Ar-Ge Mühendisi',
      'Ürün Geliştirme Uzmanı',
      'Test ve Ölçüm Uzmanı',

      // Üretim Planlama
      'Üretim Planlama Mühendisi',
      'MRP Uzmanı',
      'İş Etüdü Uzmanı',

      // Lojistik & Depo
      'Lojistik Sorumlusu',
      'Depo Sorumlusu',
      'Forklift Operatörü',
      'Sevkiyat Elemanı',

      // İSG
      'İSG Uzmanı',
      'İşyeri Hekimi',
      'Çevre Mühendisi',
      'İSG Eğitim Sorumlusu',

      // Enerji & Tesis
      'Enerji Yöneticisi',
      'Tesisat Teknisyeni',
      'Tesis Bakım Elemanı',

      // Kalite Sistemleri
      'Kalite Sistem Sorumlusu',
      'ISO Dokümantasyon Uzmanı',
      'İç Denetçi',
    ];

    for (final entry in factoryDepartmentsAndUnits.entries) {
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

    for (final role in factoryRoles) {
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
