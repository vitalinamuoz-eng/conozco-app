import 'package:shared_preferences/shared_preferences.dart';

class MiEspacioStorage {
  static const String _keyNotas = 'mi_espacio_notas';

  static Future<void> guardarNota(String nota) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyNotas, nota);
  }

  static Future<String> obtenerNota() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyNotas) ?? '';
  }

  static Future<void> eliminarNota() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyNotas);
  }
}
