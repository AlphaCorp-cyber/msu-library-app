// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Mail extends StatefulWidget {
  const Mail({super.key});

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Compose"),
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.attachment,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),

          TextFormField(
            cursorColor: const Color.fromRGBO(5, 89, 109, 1),
            decoration: const InputDecoration(
                labelText: "From:",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromRGBO(5, 89, 109, 1)),
                )),
          ),

          TextFormField(
            cursorColor: const Color.fromRGBO(5, 89, 109, 1),
            decoration: const InputDecoration(
                labelText: "To:",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromRGBO(5, 89, 109, 1)),
                )),
          ),

          TextFormField(
            cursorColor: const Color.fromRGBO(5, 89, 109, 1),
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.subject,
                color: Color.fromRGBO(5, 89, 109, 1),
                size: 26,
              ),

              // helperText: "Search your topic",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Subject",
              labelStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(5, 89, 109, 1)),
              ),
              isDense: true,
            ),
          ),

          
            
                const SizedBox(
                  
                  child: TextField(
                     

                    keyboardType: TextInputType.multiline,
                    cursorColor: Color.fromRGBO(5, 89, 109, 1),
                    decoration: InputDecoration(

            suffixIcon: Icon(
              Icons.textsms_rounded,
              color: Color.fromRGBO(5, 89, 109, 1),
              size: 26,
            ),

            // helperText: "Search your topic",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: "Compose Email",
            labelStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
             border: InputBorder.none,

          ),
                  ),
                ),
        ]),
      ),
    );
  }
}
