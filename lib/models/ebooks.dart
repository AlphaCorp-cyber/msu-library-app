import 'dart:convert';
import 'package:http/http.dart' as http;

class Ebook{
    final int id;
    final String title;
    final String url;
    final String description;
    final String letter;

    Ebook({
        required this.id,
        required this.title,
        required this.url,
        required this.letter,
         required this.description, 
    });   
}


class EbookService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/ebook";

  index(
      {int page = 1,
      int perPage = 15,
      String sort = 'title',
      String direction = 'asc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Ebook> list = List.from(data['data'])
          .map<Ebook>((e) => Ebook(
              id: 1, title: e['title'], letter: e['latter'], description: e['description'], url: e['url']))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
