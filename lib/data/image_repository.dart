import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageRepository {
  final String apiUrl = "https://dog.ceo/api/breeds/image/random";

  Future<String> fetchRandomImage() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to load image');
    }
  }
}
