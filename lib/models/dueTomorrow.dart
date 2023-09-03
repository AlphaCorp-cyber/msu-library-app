import 'dart:convert';
import 'package:http/http.dart' as http;

import '../const.dart';

class DueTomorrow {
  final String firstname;
  final String surname;
  final String userid;
  final String email;
  final String file_name;
  final String author;
  final String item_number;
  final String barcode;
  final String location;
  final String due_date;

  DueTomorrow({
    required this.firstname,
    required this.surname,
    required this.userid,
    required this.email,
    required this.file_name,
    required this.author, 
    required this.item_number,
    required this.barcode,
    required this.location,
    required this.due_date,
  });
}
var reg = box.read('username');

class DueTomorrowService {
  final String apiUrl = "https://app.library.msu.ac.zw/api/borrowers/due-tomorrow/$reg";

  index(
      {int page = 1,
        int perPage = 15,
        String sort = 'firstname',
        String direction = 'asc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<DueTomorrow> list = List.from(data['data'])
          .map<DueTomorrow>((e) => DueTomorrow(
          userid: e['userid'],
          file_name: e['title'],
          author: e['author'],
          barcode: e['barcode'],
          due_date: e['due_date'],
          email: e['email'],
          firstname: e['firstname'],
          item_number: e['itemcallnumber'],
          location: e['location'],
          surname: e['surname']))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
