// ignore_for_file: library_private_types_in_public_api, unused_import


import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  static const routeName = "/Trial";

  const Trial({super.key});

  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
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
          _heading("Databases on Trial"),
          const SizedBox(
            height: 6,
          ),
         
          const SizedBox(
            height: 10,
          ),
          _heading("Oxford Handbooks Online"),
          const SizedBox(
            height: 6,
          ),
          _vision(),
          const SizedBox(
            height: 10,
          ),

          _heading("Oxford Research Encyclopedias"),
          const SizedBox(
            height: 6,
          ),
          _mission(),
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
                  "Oxford Handbooks Online is an outstanding collection of the best Handbooks areas across many different subject areas. One of the most prestigious and successful strands of Oxford’s scholarly publishing, the Handbook series contains in-depth, high-level articles by scholars at the top of their field. Subjects featured include Archaeology, Business and Management, Classical Studies, Criminology and Criminal Justice, Economics and Finance, History, Law, Linguistics, Literature, Music, Neuroscience, Physical Sciences,Political Science, Psychology, Religion and Sociology.",
                  textAlign: TextAlign.justify),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _mission() {
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
                  "With today’s overabundance of information, and misinformation, students and researchers alike can be overwhelmed in identifying what’s trustworthy, what’s up-to-date, and what’s accurate. Oxford University Press has invested in the Oxford Research Encyclopedias to meet this challenge. Working with international communities of scholars across all fields of study, we are developing new comprehensive collections of in-depth, peer-reviewed summaries on an ever-growing range of topics. That include African History, American History, Anthropology, Business Management, Environmental and Climate Science, Economics and Finance, Business and Management, Linguistics and Literature, Physical sciences, Psychology and many more.",
                  textAlign: TextAlign.justify),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }


}
