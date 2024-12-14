import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchController extends GetxController {
  var searchResults = [].obs;

  Future<void> searchMovies(String query) async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      searchResults.value = json.decode(response.body);
    }
  }
}
