import 'dart:convert';
import 'package:http/http.dart' as http;

class Judgement {
  final int id;
  //final int courtid;
  final String title;
  final String introduction;

  Judgement(
      {required this.id,
      //required this.courtid,
      required this.title,
      required this.introduction});
}

class JudgementService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/judgement";

  index(
      {int page = 1,
      int perPage = 15,
      String sort = 'id',
      String direction = 'desc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Judgement> list = List.from(data['data'])
          .map<Judgement>((e) => Judgement(
              id: 1,
              title: e['title'],
              
              introduction: e['introduction']))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
