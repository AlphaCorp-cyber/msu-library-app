import 'dart:convert';
import 'package:http/http.dart' as http;

class Faculty{
    final int id;
    final String? facult;

    Faculty({
        required this.id,
        required this.facult      
    });   
}


class FacultyService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/faculties";

  index(
      {int page = 1,
      int perPage = 15,
      String sort = 'id',
      String direction = 'desc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
