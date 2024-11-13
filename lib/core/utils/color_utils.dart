import 'dart:ui';

class ColorUtils {
  static const Color primaryColor = Color(0XFF6949FF);

  Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    int? colorValue = int.tryParse('FF$hexColor', radix: 16);
    return Color(colorValue ?? primaryColor.value);
  }
}
