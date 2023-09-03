// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Week extends StatefulWidget {
  static const routeName = "/Week";

  const Week({super.key});

  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 1,
        centerTitle: false,
        title: const Text(
          'myLibrary',
          textAlign: TextAlign.left,
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
         
          const SizedBox(
            height: 14,
          ),
          _heading("Database of the Week"),
          const SizedBox(
            height: 6,
          ),
         
          const SizedBox(
            height: 10,
          ),
          _heading("PROQUEST CENTRAL"),
          const SizedBox(
            height: 6,
          ),
          _vision(),
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


  Widget _heading(String heading) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 0.80, //80% of width,
      child: Center(
        child: Text(
          heading,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }


  Widget _vision() {
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
                  "This database serves as the central resource for researchers at all levels. Covering more than 160 subject areas, ProQuest Central is the largest aggregated database of periodical and book content. This online resource features a highly respected, diversified mix of content including scholarly journals, trade publications, magazines, books, newspapers, reports and videos. Subjects covered in this resource include Business and economics, Health and medical, News and world affairs, Science, Education, Technology, Humanities, Social Sciences, Psychology, Literature, Law and Women's studies.",
                  textAlign: TextAlign.justify),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }



}
