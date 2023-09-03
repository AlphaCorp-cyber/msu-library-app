import 'dart:convert';
import 'dart:core';


import 'package:dashboard/models/constant.dart';

import 'package:http/http.dart' as http;


class Borrowing {
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
  final int len;

  Borrowing({
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
    required this.len,
  });
}
var reg = box.read('username');

class BorrowingService {
  final String apiUrl =
      "https://app.library.msu.ac.zw/api/borrowers/all/$reg";

  index(
      {int page = 1,
      int perPage = 15,
      String sort = 'firstname',
      String direction = 'asc'}) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?page=$page&perPage=$perPage&sort=$sort&direction=$direction'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final length = data.length;
      box.write('length', length);
      List<Borrowing> list = List.from(data['data'])
          .map<Borrowing>((e) => Borrowing(
              userid: e['userid'],
              file_name: e['title'],
              author: e['author'],
              barcode: e['barcode'],
              due_date: e['due_date'],
              email: e['email'],
              firstname: e['firstname'],
              item_number: e['itemcallnumber'],
              location: e['location'],
              surname: e['surname'],
              len: length))
          .toList();

  
     

      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
