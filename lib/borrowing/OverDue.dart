// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';

import '../const.dart';

class OverDue extends StatefulWidget {
  const OverDue({super.key});

  @override
  _OverDueState createState() => _OverDueState();
}

class _OverDueState extends State<OverDue> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }
var reg = box.read('username');
  fetchUser() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "https://app.library.msu.ac.zw/api/borrowers/overdue/$reg"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        title: const Center(child: Text("Due Tomorrow")),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    // ignore: prefer_is_empty
    if (users.contains(null) || users.length < 0 || isLoading) {
     return Center(
                child: SpinKitFadingCircle(
                  color: const Color.fromRGBO(5, 89, 109, 1),
                ),
              );
    } if(users.length == 0 ){
      return Center(
                child: Lottie.asset('assets/null.json',width: 200)
              );
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    //var fullName = item['name']['title']+" "+item['name']['first']+" "+item['name']['last'];
    var email = item['title'];
    // var profileUrl = item['picture']['large'];
    return Flexible(
      child: Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          email,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(5, 89, 109, 1)),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      email.toString(),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
