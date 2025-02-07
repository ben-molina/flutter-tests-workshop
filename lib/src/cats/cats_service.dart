import 'dart:convert';
import 'dart:io';

import 'package:workshop/src/cats/cat_dto.dart';
import 'package:http/http.dart' as http;

class CatsService {
  Future<List<CatDTO>> fetchCats() async {
    try {
      final url = Uri.https('api.thecatapi.com', 'v1/breeds', {'limit': '10'});
      final response = await http.get(
        url,
        headers: {'x-api-key': String.fromEnvironment("api-key")},
      );
      if (response.statusCode == HttpStatus.ok) {
        return CatDTO.fromList(json.decode(response.body));
      }
    } catch (exception) {
      print(exception.toString());
      // TODO
    }

    return [];
  }
}
