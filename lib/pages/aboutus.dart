// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class About extends StatefulWidget {
  static const routeName = "/about";

  const About({super.key});

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 1,
        centerTitle: false,
        title: const Text(
          'About',
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
          _profileName("myLibrary"),
          const SizedBox(
            height: 14,
          ),
          _heading("WELCOME TO MSU LIBRARY"),
          const SizedBox(
            height: 6,
          ),
          _detailsCard(),
          const SizedBox(
            height: 10,
          ),
          _heading("VISION"),
          const SizedBox(
            height: 6,
          ),
          _vision(),
          const SizedBox(
            height: 10,
          ),

          _heading("MISSION"),
          const SizedBox(
            height: 6,
          ),
          _mission(),
          const SizedBox(
            height: 10,
          ),
          _heading("CORE VALUES"),
          const SizedBox(
            height: 6,
          ),
          _values(),
          const SizedBox(
            height: 10,
          ),
          _heading("GOALS"),
          const SizedBox(
            height: 6,
          ),
          _goals(),
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
      width: MediaQuery.of(context).size.width - 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
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
                  "The Midlands State University Library consists of a network of individual Libraries namely; the Graduate School of Business Leadership, Faculty of Law, Zvishavane Campus, Manicaland College of Applied Sciences Campus, Batanai Campus, Faculty of Medicine, Disability Resources Centre, Main Library and several electronic resource centres. Through this network, MSU Libraries are able to provide resources that fully support the teaching, learning and research needs of the University community. For efficient and effective service delivery, the Library is composed of six sections which are, Collection Development, Research Services, Client Services, Content Management, System Services and Marketing Services. Through these sections the Library aims to provide high quality services that support the core business of research, teaching and learning.",
                  textAlign: TextAlign.justify),
              textColor: Colors.white,
            ),
          ],
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
                  "- To be a technology driven information resource centre with quality services and outstanding collections.",
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
                  "- To provide access to appropriate information resources that support quality research, teaching and learning experiences of the Midlands State University community.",
                  textAlign: TextAlign.justify),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _values() {
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
                  "- Client centred service\n\n- Timely access to information\n\n- Hard work\n\n- Professional ethics and standards\n\n- Customer care\n\n- Teamwork"),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _goals() {
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
                  "-To build and enhance research collections that are responsive to current and future teaching and research needs of the University\n\n-To facilitate increased use, access and management of library resources and collections through efficient and effective utilization of Information Communication Technologies.\n\n- To provide high quality services through active participation in the university's quality assurance and marketing processes.\n\n-To establish and maintain linkages and partnerships for resource sharing."),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
