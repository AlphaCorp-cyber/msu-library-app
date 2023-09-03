import 'dart:convert';
import 'package:http/http.dart' as http;

class Department{
    final int id;
    final String name;
    final int facultyid;

    Department({
        required this.id,
        required this.name,
        required this.facultyid,
    });   
}


class DepartmentService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/departments";

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
