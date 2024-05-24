// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  static const routeName = "/Contact";

  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
} 

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 1,
        centerTitle: false,
        title: Center(
          child: const Text(
            'Contact',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
            iconTheme: IconThemeData(
          color: Colors.white, // This changes the drawer icon to white
        ),
      ),
      
      body: SingleChildScrollView(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          const SizedBox(
            height: 10,
          ),
          _profileName("myLibrary"),
          const SizedBox(
            height: 14,
          ),
          _heading(""),
          const SizedBox(
            height: 6,
          ),
          _detailsCard(),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),

                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/fitness_app/logomsu.png'))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style:
            const TextStyle(fontSize: 16, color:Colors.white),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "The Library\nMidlands State University\nP Bag 9055\nPhone: +263 54 226 0417 - 9 Ext 2466"),textColor: Colors.white,
            ),
            ListTile(
              
              title: Text("WhatsApp: +263 78 675 5935"),textColor: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.fax),iconColor: Colors.white,
              title: Text("Fax: +263 54 260 445"),textColor: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.email),iconColor: Colors.white,
              title: Text("research@library.msu.ac.zw"),textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
