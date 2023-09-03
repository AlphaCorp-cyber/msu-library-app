// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lottie/lottie.dart';

import '../const.dart';


class Borrowed extends StatefulWidget {
  const Borrowed({super.key});

  @override
  _BorrowedState createState() => _BorrowedState();
}

class _BorrowedState extends State<Borrowed> {
  List users = [];
  bool isLoading = false;
  var reg = box.read('username');
  @override
  void initState() {
   
    super.initState();
    this.fetchUser();
  }
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    
    var response = await http.get(Uri.parse("https://app.library.msu.ac.zw/api/borrowers/all/$reg"));
    // print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = []; 
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        title: const Center(child: Text("Borrowed Books")),
      ),
      body: getBody(),
      
    );
  }
  Widget getBody(){
    // ignore: prefer_is_empty
    if(users.contains(null) || users.length < 0 || isLoading){
      return Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFF05596D),
                ),
              );
    }if(users.length == 0 ){
      return Center(
              child: Lottie.asset('assets/null.json'
              ,
              width: 200),
              
              );
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
      return getCard(users[index]);
    });
  }
  Widget getCard(item){
    //var fullName = item['name']['title']+" "+item['name']['first']+" "+item['name']['last'];
    var author = item['author'];
    var result = item['title'];
    String name = result.replaceAll(RegExp('[^A-Za-z0-9]'), '');
   // var profileUrl = item['picture']['large'];
    return Flexible(
      child: Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width-140,
                      child: Text(name,style: const TextStyle(fontSize: 17,color: Color.fromRGBO(5, 89, 109, 1)),)),
                    const SizedBox(height: 10,),
                    Text(author.toString(),style: const TextStyle(color: Colors.grey),)
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