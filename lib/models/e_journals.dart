import 'dart:convert';
import 'package:http/http.dart' as http;

class Ejournal {
  final int id;
  final String title;
  final String url;
  final String description;
  final String letter;

  Ejournal({
    required this.id,
    required this.title,
    required this.url,
    required this.description,
    required this.letter, 
  });
}

class EjournalService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/e-journal";

  Future<List<Ejournal>> index(
      {int page = 1,
      int perPage = 15,
      String sort = 'title',
      String direction = 'asc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Ejournal> list = List.from(data['data'])
          .map<Ejournal>((e) => Ejournal(id: 1, title: e['title'], letter: e['latter'], description: e['description'], url: e['url']))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
