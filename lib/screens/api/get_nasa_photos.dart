import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String apiUrl =
    'https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=50&api_key=eQnprvXukgfNomTanZiHT1DqLApcABzFjI350dyZ';
// 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=eQnprvXukgfNomTanZiHT1DqLApcABzFjI350dyZ';

Future<Map<String, dynamic>> getNasaPhotos() async {
  Uri uri = Uri.parse(apiUrl);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  }

  throw HttpException("Error: ${response.reasonPhrase}");
}
