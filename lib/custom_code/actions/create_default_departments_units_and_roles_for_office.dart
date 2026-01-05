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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createDefaultDepartmentsUnitsAndRolesForOffice(
  DocumentReference company,
  DocumentReference workPlace,
  DocumentReference authUser,
) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final WriteBatch batch = firestore.batch();

    final Map<String, List<String>> departmentsAndUnits = {
      'Yönetim': ['Üst Yönetim', 'İcra Kurulu'],
      'İnsan Kaynakları': [
        'Personel İşlemleri',
        'Eğitim ve Gelişim',
        'İşe Alım',
        'Performans Yönetimi'
      ],
      'Finans ve Muhasebe': [
        'Finansal Raporlama',
        'Bütçe Planlama',
        'Mali İşlemler',
        'Vergi'
      ],
      'Bilgi Teknolojileri': [
        'Sistem Yönetimi',
        'Yazılım Geliştirme',
        'IT Destek',
        'Siber Güvenlik'
      ],
      'Makine ve Ekipman Yönetimi': [
        'Bakım ve Onarım',
        'Satın Alma',
        'Yakıt ve Sarf Malzeme'
      ],
      'Pazarlama': ['Dijital Pazarlama', 'Marka Yönetimi', 'Sosyal Medya'],
      'Satış': ['Müşteri İlişkileri', 'Satış Temsilciliği', 'Satış Destek'],
      'Operasyon': ['Lojistik', 'Tedarik Zinciri', 'Proje Yönetimi'],
      'Satın Alma': ['Tedarikçi Yönetimi', 'İhale Takibi'],
      'Hukuk': ['Sözleşmeler', 'Uyum', 'Dava Takibi'],
      'İdari İşler': ['Ofis Yönetimi', 'Temizlik ve Bakım', 'Güvenlik'],
    };

    final List<String> officeRoles = [
      'CEO (Genel Müdür)',
      'COO (Operasyon Direktörü)',
      'CFO (Finans Direktörü)',
      'CTO (Teknoloji Direktörü)',
      'Yönetici Asistanı',
      'Yönetim Kurulu Üyesi',
      'İK Müdürü',
      'İşe Alım Uzmanı',
      'Eğitim ve Gelişim Uzmanı',
      'Performans Uzmanı',
      'Bordro ve Özlük İşleri Sorumlusu',
      'Finans Müdürü',
      'Muhasebe Müdürü',
      'Bütçe Uzmanı',
      'Mali Analist',
      'Vergi Uzmanı',
      'IT Direktörü',
      'Yazılım Geliştirici',
      'Sistem Yöneticisi',
      'Ağ Uzmanı',
      'IT Destek Uzmanı',
      'Siber Güvenlik Uzmanı',
      'Pazarlama Müdürü',
      'Dijital Pazarlama Uzmanı',
      'Sosyal Medya Uzmanı',
      'İçerik Üreticisi',
      'Grafik Tasarımcı',
      'Satış Müdürü',
      'Satış Temsilcisi',
      'Müşteri Temsilcisi',
      'Satış Destek Uzmanı',
      'Operasyon Müdürü',
      'Proje Yöneticisi',
      'Lojistik Sorumlusu',
      'Tedarik Zinciri Uzmanı',
      'Satın Alma Müdürü',
      'Satın Alma Uzmanı',
      'Tedarikçi İlişkileri Uzmanı',
      'Hukuk Müşaviri',
      'Şirket Avukatı',
      'Uyum Uzmanı',
      'Ofis Yöneticisi',
      'Sekreter',
      'Resepsiyonist',
      'Temizlik Görevlisi',
      'Güvenlik Görevlisi',
    ];

    final Map<String, DocumentReference> departmentRefs = {};

    // Departman ve birimler için
    for (final entry in departmentsAndUnits.entries) {
      final departmentName = entry.key;
      final units = entry.value;

      final workPlaceDeptRef =
          workPlace.collection('workPlaceDepartment').doc();
      final companyDeptRef = company.collection('companyDepartments').doc();

      // Kaydetmek için referansı sakla
      departmentRefs[departmentName] = companyDeptRef;

      // Departmanlar
      batch.set(workPlaceDeptRef, {
        'name': departmentName,
        'isDelete': false,
        'type': 'Otomatik',
        'createdBy': authUser,
      });

      batch.set(companyDeptRef, {
        'name': departmentName,
        'isDelete': false,
        'type': 'Otomatik',
        'createdBy': authUser,
        'workPlace': workPlace,
        'workPlaceDepartment': workPlaceDeptRef,
      });

      // Birimler
      for (final unitName in units) {
        final workPlaceUnitRef = workPlace.collection('workPlaceUnits').doc();
        final companyUnitRef = company.collection('companyUnits').doc();

        batch.set(workPlaceUnitRef, {
          'name': unitName,
          'isDelete': false,
          'departmentRef': companyDeptRef,
          'createdBy': authUser,
        });

        batch.set(companyUnitRef, {
          'name': unitName,
          'isDelete': false,
          'departmenRef': companyDeptRef,
          'createdBy': authUser,
          'workplaceRef': workPlace,
          'workPlaceUnitRef': workPlaceUnitRef,
        });
      }
    }

    // Roller
    for (final roleName in officeRoles) {
      final workPlaceRoleRef = workPlace.collection('workPlaceRoles').doc();
      final companyRoleRef = company.collection('companyRoles').doc();

      batch.set(workPlaceRoleRef, {
        'name': roleName,
        'isDelete': false,
        'createdBy': authUser,
      });

      batch.set(companyRoleRef, {
        'name': roleName,
        'isDelete': false,
        'createdBy': authUser,
        'workPlaceRef': workPlace,
        'workPlaceRoleRef': workPlaceRoleRef,
      });
    }

    // Bütün işlemleri gönder
    await batch.commit();

    debugPrint('Batch işlemi başarıyla tamamlandı.');
  } catch (e, stackTrace) {
    debugPrint('Batch işleminde hata: $e');
    debugPrint('Stack trace: $stackTrace');
  }
}
