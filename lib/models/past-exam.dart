import 'dart:convert';

import 'package:http/http.dart' as http;

class PastExam {
  final int id;
  final String module_code_id;
  final String code;
  final String name;
  final String month;
  final String year;

  PastExam({
    required this.id,
    required this.module_code_id,
    required this.code,
    required this.month,
    required this.year,
    required this.name,
  });
}

class PastExamService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/past-exam";

  Future<List<PastExam>> index({
    int page = 1,
    int limit = 10,
    String sort = 'id',
    String direction = 'asc',
    String search = "",
  }) async {
    try {
      final response = await http.get(Uri.parse(
          '$apiUrl?page=$page&limit=$limit&sort=$sort&direction=$direction'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data['data'] != null) {
          List<PastExam> list = List.from(data['data'])
              .map<PastExam>((e) => PastExam(
                    id: e['id'] != null ? int.parse(e['id'].toString()) : 0,
                    code: e['code'] ?? '',
                    month: e['month'] ?? '',
                    name: e['file_name'] ?? '',
                    year: e['yr'] ?? '',
                    module_code_id: e['name_of_modue'] ?? '',
                  ))
              .toList();
          return list;
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}