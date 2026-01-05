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

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class _ColorSnapshot {
  final int bg, b1, b1t, b2, b2t;
  const _ColorSnapshot(this.bg, this.b1, this.b1t, this.b2, this.b2t);
}

class ColorSettingsWidget extends StatefulWidget {
  final DocumentReference message;
  final bool amIuser1;
  final double width;
  final double height;

  const ColorSettingsWidget({
    Key? key,
    required this.amIuser1,
    required this.message,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<ColorSettingsWidget> createState() => _ColorSettingsWidgetState();
}

class _ColorSettingsWidgetState extends State<ColorSettingsWidget> {
  // Varsayılan renkler (opak)
  static const int _kDefaultBackground = 0xFF090620;
  static const int _kDefaultBalloon1 = 0xFFFFFFFF;
  static const int _kDefaultBalloon1Text = 0xFF000000;
  static const int _kDefaultBalloon2 = 0xFF00499C;
  static const int _kDefaultBalloon2Text = 0xFFFFFFFF;

  // Başlık boyutları
  static const double _kTitleSize = 12;
  static const double _kTitleSizeSmall = 12; // “Size Gelen …” için
  static const double _kButtonFontSize = 12;

  // SARi BORDER sabitleri (EKLENDi)
  static const Color _kBorderColor = Color(0xFFFFD400); // sarı
  static const double _kBorderWidth = 1.2; // ince

  // Anlık (UI) renkler
  Color backgroundColor = const Color(_kDefaultBackground);
  Color balloon1Color = const Color(_kDefaultBalloon1);
  Color balloon1TextColor = const Color(_kDefaultBalloon1Text);
  Color balloon2Color = const Color(_kDefaultBalloon2);
  Color balloon2TextColor = const Color(_kDefaultBalloon2Text);

  // Saptanan snapshot (yalnızca ilk yüklemede yakalanır)
  _ColorSnapshot? _detected;

  @override
  void initState() {
    super.initState();
    _loadColorsFromFirebase(
      captureDetected: true,
    ); // ilk açılışta saptananı yakala
  }

  void _captureDetectedFromCurrentIfNull() {
    if (_detected != null) return;
    _detected = _ColorSnapshot(
      backgroundColor.value,
      balloon1Color.value,
      balloon1TextColor.value,
      balloon2Color.value,
      balloon2TextColor.value,
    );
  }

  // Esnek renk parse: decimal / 0xAARRGGBB / #RRGGBB / #AARRGGBB / "Color(0x...)"
  Color _parseColor(String? colorString, int fallbackInt) {
    if (colorString == null || colorString.trim().isEmpty) {
      return Color(fallbackInt);
    }
    final s = colorString.trim();

    // 1) Düz decimal mi?
    if (RegExp(r'^\d+$').hasMatch(s)) {
      try {
        return Color(int.parse(s));
      } catch (_) {}
    }

    // 2) İçinden 0x........ yakala (Color(0xFF112233) dahil)
    final match0x = RegExp(r'0x[0-9a-fA-F]{6,8}').firstMatch(s);
    if (match0x != null) {
      final hex = match0x.group(0)!.substring(2); // '0x' çıkar
      try {
        return Color(int.parse(hex, radix: 16));
      } catch (_) {}
    }

    // 3) #RGB/#RRGGBB/#AARRGGBB
    String hex = s.toUpperCase().replaceAll('#', '');
    if (hex.startsWith('0X')) hex = hex.substring(2);
    if (RegExp(r'^[0-9A-F]{6}$').hasMatch(hex)) {
      hex = 'FF$hex'; // alpha yoksa FF ekle
    }
    if (RegExp(r'^[0-9A-F]{8}$').hasMatch(hex)) {
      try {
        return Color(int.parse(hex, radix: 16));
      } catch (_) {}
    }

    return Color(fallbackInt);
  }

  void _setDefaultColors() {
    backgroundColor = const Color(_kDefaultBackground);
    balloon1Color = const Color(_kDefaultBalloon1);
    balloon1TextColor = const Color(_kDefaultBalloon1Text);
    balloon2Color = const Color(_kDefaultBalloon2);
    balloon2TextColor = const Color(_kDefaultBalloon2Text);
  }

  Future<void> _loadColorsFromFirebase({bool captureDetected = false}) async {
    try {
      final doc = await widget.message.get();

      if (!mounted) return;

      if (!doc.exists) {
        setState(() {
          _setDefaultColors();
          if (captureDetected) _captureDetectedFromCurrentIfNull();
        });
        return;
      }

      final data = (doc.data() ?? {}) as Map<String, dynamic>;

      setState(() {
        try {
          if (widget.amIuser1) {
            backgroundColor = _parseColor(
              data['backgroundUser1']?.toString(),
              _kDefaultBackground,
            );
            balloon1Color = _parseColor(
              data['balloon1User1']?.toString(),
              _kDefaultBalloon1,
            );
            balloon2Color = _parseColor(
              data['balloon2User1']?.toString(),
              _kDefaultBalloon2,
            );
            balloon1TextColor = _parseColor(
              data['balloon1TextColorUser1']?.toString(),
              _kDefaultBalloon1Text,
            );
            balloon2TextColor = _parseColor(
              data['balloon2TextColorUser1']?.toString(),
              _kDefaultBalloon2Text,
            );
          } else {
            backgroundColor = _parseColor(
              data['backgroundUser2']?.toString(),
              _kDefaultBackground,
            );
            balloon1Color = _parseColor(
              data['balloon1User2']?.toString(),
              _kDefaultBalloon1,
            );
            balloon2Color = _parseColor(
              data['balloon2User2']?.toString(),
              _kDefaultBalloon2,
            );
            balloon1TextColor = _parseColor(
              data['balloon1TextColorUser2']?.toString(),
              _kDefaultBalloon1Text,
            );
            balloon2TextColor = _parseColor(
              data['balloon2TextColorUser2']?.toString(),
              _kDefaultBalloon2Text,
            );
          }
        } catch (_) {
          _setDefaultColors();
        }
        if (captureDetected) _captureDetectedFromCurrentIfNull();
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _setDefaultColors();
        if (captureDetected) _captureDetectedFromCurrentIfNull();
      });
      _showSnack('Renkler yüklenemedi: $e');
    }
  }

  Future<void> _refreshFromCloud() async {
    // Saptanan snapshot'ı DEĞİŞTİRMEDEN buluttan oku
    await _loadColorsFromFirebase(captureDetected: false);
    _showSnack('Buluttan ayarlar yenilendi.');
  }

  Future<void> _saveColorsToFirebase() async {
    try {
      final payloadUser1 = {
        'backgroundUser1': backgroundColor.value.toString(),
        'balloon1User1': balloon1Color.value.toString(),
        'balloon2User1': balloon2Color.value.toString(),
        'balloon1TextColorUser1': balloon1TextColor.value.toString(),
        'balloon2TextColorUser1': balloon2TextColor.value.toString(),
      };

      final payloadUser2 = {
        'backgroundUser2': backgroundColor.value.toString(),
        'balloon1User2': balloon1Color.value.toString(),
        'balloon2User2': balloon2Color.value.toString(),
        'balloon1TextColorUser2': balloon1TextColor.value.toString(),
        'balloon2TextColorUser2': balloon2TextColor.value.toString(),
      };

      await widget.message.update(
        widget.amIuser1 ? payloadUser1 : payloadUser2,
      );

      if (!mounted) return;
      Navigator.pop(context); // Bu sayfayı kapat
      Navigator.pop(context); // Gerekmiyorsa bu satırı kaldırın.
    } catch (e) {
      _showSnack('Kaydederken hata: $e');
    }
  }

  void _resetToDetected() {
    final s = _detected;
    if (s == null) {
      _showSnack('Saptanan ayarlar henüz hazır değil.');
      return;
    }
    setState(() {
      backgroundColor = Color(s.bg);
      balloon1Color = Color(s.b1);
      balloon1TextColor = Color(s.b1t);
      balloon2Color = Color(s.b2);
      balloon2TextColor = Color(s.b2t);
    });
    _showSnack('Saptanan ayarlara dönüldü.');
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // Otomatik kontrast
  Color _onColor(Color bg) =>
      bg.computeLuminance() < 0.5 ? Colors.white : Colors.black;

  // Şeffaf seçimi engelleyen renk seçici
  Future<void> _pickColor(Color initial, ValueChanged<Color> onConfirm) async {
    Color temp = initial;

    final result = await showDialog<Color>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Renk Seç',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: temp,
            onColorChanged: (c) {
              temp = c; // diyaloğun kendi state’i
            },
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            child: const Text('İptal'),
            onPressed: () => Navigator.of(context).pop(null),
          ),
          TextButton(
            child: const Text(
              'Tamam',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (temp.alpha == 0) {
                _showSnack(
                  'Şeffaf renk seçilemez! Lütfen başka bir renk seçin.',
                );
                return;
              }
              Navigator.of(context).pop(temp);
            },
          ),
        ],
      ),
    );

    if (result != null && mounted) {
      setState(() {
        onConfirm(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ayar sayfası arka planı -> #090620
      backgroundColor: const Color(0xFF090620),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Konuşma Sayfası Arka Planı'),
              const SizedBox(height: 15),
              _colorButtonBG(
                'Konuşma Sayfasının Arka Plan Rengini Seçin',
                backgroundColor,
                (c) => backgroundColor = c,
              ),

              const SizedBox(height: 20),
              _sectionTitle('Sizin Gönderdiğiniz Mesajların Balon Rengi'),
              const SizedBox(height: 15),
              _colorBubbleSenderMe(
                'Balon 1\'in Arka Plan Rengini Seçin',
                balloon1Color,
                (c) => balloon1Color = c,
              ),

              const SizedBox(height: 20),
              _sectionTitle('Sizin Gönderdiğiniz Mesajların Metin Rengi'),
              const SizedBox(height: 15),
              _colorTextSenderMe(
                'Balon 1 Metni İçin Renk Seçin',
                balloon1TextColor,
                (c) => balloon1TextColor = c,
              ),

              const SizedBox(height: 20),
              _sectionTitle(
                'Size Gelen Mesajların Balon Rengi',
                fontSize: _kTitleSizeSmall, // bir tık küçük
              ),
              const SizedBox(height: 15),
              _colorBubbleSenderOther(
                'Balon 2\'nin Arka Plan Rengini Seçin',
                balloon2Color,
                (c) => balloon2Color = c,
              ),

              const SizedBox(height: 20),
              _sectionTitle(
                'Size Gelen Mesajların Metin Rengi',
                fontSize: _kTitleSizeSmall, // bir tık küçük
              ),
              const SizedBox(height: 15),
              _colorTextSenderOther(
                'Balon 2 Metni İçin Renk Seçin',
                balloon2TextColor,
                (c) => balloon2TextColor = c,
              ),

              const SizedBox(height: 24),

              // --- Ayrı butonlar: Saptananlara dön & Buluttan tazele ---
              Row(
                children: [
                  Expanded(
                    child: Tooltip(
                      message: 'Saptanan ayarlara dön',
                      child: OutlinedButton(
                        onPressed: _resetToDetected,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: _kBorderColor,
                            width: _kBorderWidth,
                          ), // SARı BORDER
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size((widget.width - 12) / 2, 50),
                        ),
                        child: Text(
                          'Saptanan ayarlara dön',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Tooltip(
                      message: 'Buluttan ayarları yeniden oku',
                      child: OutlinedButton.icon(
                        onPressed: _refreshFromCloud,
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          'Buluttan tazele',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: _kBorderColor,
                            width: _kBorderWidth,
                          ), // SARı BORDER
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size((widget.width - 12) / 2, 50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // --- Kaydet ---
              ElevatedButton(
                onPressed: _saveColorsToFirebase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  side: const BorderSide(
                    color: _kBorderColor,
                    width: _kBorderWidth,
                  ), // SARı BORDER
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(widget.width, 50),
                ),
                child: Text(
                  'Renkleri Kaydet',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: _kButtonFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- UI yardımcıları ----

  Widget _sectionTitle(String text, {double fontSize = 12}) => Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget _colorButtonBG(
    String label,
    Color currentColor,
    ValueChanged<Color> setValue,
  ) {
    return ElevatedButton(
      onPressed: () => _pickColor(currentColor, setValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: currentColor,
        side: const BorderSide(
          color: _kBorderColor,
          width: _kBorderWidth,
        ), // SARı BORDER
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: Size(widget.width, 50),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: TextStyle(
            color: _onColor(currentColor),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _colorBubbleSenderMe(
    String label,
    Color currentColor,
    ValueChanged<Color> setValue,
  ) {
    return ElevatedButton(
      onPressed: () => _pickColor(currentColor, setValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: currentColor, // doğru: parametre
        side: const BorderSide(
          color: _kBorderColor,
          width: _kBorderWidth,
        ), // SARı BORDER
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: Size(widget.width, 50),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: TextStyle(
            color: _onColor(currentColor),
            fontWeight: FontWeight.bold,
            fontSize: _kButtonFontSize,
          ),
        ),
      ),
    );
  }

  Widget _colorTextSenderMe(
    String label,
    Color currentTextColor,
    ValueChanged<Color> setValue,
  ) {
    return ElevatedButton(
      onPressed: () => _pickColor(currentTextColor, setValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: balloon1Color, // metin rengi önizleme zemini
        side: const BorderSide(
          color: _kBorderColor,
          width: _kBorderWidth,
        ), // SARı BORDER
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: Size(widget.width, 50),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: TextStyle(
            color: currentTextColor, // seçilen metin rengi
            fontWeight: FontWeight.bold,
            fontSize: _kButtonFontSize,
          ),
        ),
      ),
    );
  }

  Widget _colorBubbleSenderOther(
    String label,
    Color currentColor,
    ValueChanged<Color> setValue,
  ) {
    return ElevatedButton(
      onPressed: () => _pickColor(currentColor, setValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: currentColor, // doğru: parametre
        side: const BorderSide(
          color: _kBorderColor,
          width: _kBorderWidth,
        ), // SARı BORDER
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: Size(widget.width, 50),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: TextStyle(
            color: _onColor(currentColor),
            fontWeight: FontWeight.bold,
            fontSize: _kButtonFontSize,
          ),
        ),
      ),
    );
  }

  Widget _colorTextSenderOther(
    String label,
    Color currentTextColor,
    ValueChanged<Color> setValue,
  ) {
    return ElevatedButton(
      onPressed: () => _pickColor(currentTextColor, setValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: balloon2Color, // metin rengi önizleme zemini
        side: const BorderSide(
          color: _kBorderColor,
          width: _kBorderWidth,
        ), // SARı BORDER
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: Size(widget.width, 50),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        child: Text(
          label,
          style: TextStyle(
            color: currentTextColor, // seçilen metin rengi
            fontWeight: FontWeight.bold,
            fontSize: _kButtonFontSize,
          ),
        ),
      ),
    );
  }
}
