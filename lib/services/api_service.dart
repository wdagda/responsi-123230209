import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getHouses() async {
    try {
      final response = await http.get(
        Uri.parse('https://potterapi-fedeperin.vercel.app/en/houses'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<dynamic>> getSpells() async {
    try {
      final response = await http.get(
        Uri.parse('https://potterapi-fedeperin.vercel.app/en/spells'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
