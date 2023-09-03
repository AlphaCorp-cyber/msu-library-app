import 'dart:convert';
import 'package:http/http.dart' as http;

class Court{
    final int id;
    final 
    String court_name;

    Court({
        required this.id,
        required this.court_name,
    });   
}

class CourtService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/court";

  Future<List<dynamic>> index({int page = 1, int perPage = 15, String sort = 'id', String direction = 'desc'}) async {
    final response = await http.get(Uri.parse('$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}