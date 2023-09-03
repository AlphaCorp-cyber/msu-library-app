// ignore_for_file: unrelated_type_equality_checks

import 'package:dashboard/IntroductionAnimation/action_button.dart';
import 'package:dashboard/Main/expandable_fab.dart';
import 'package:dashboard/Main/fitness_app_home_screen.dart';
import 'package:dashboard/Screens/home_screen.dart';


import 'package:flutter/material.dart';



class FacPage extends StatefulWidget {
  const FacPage({super.key});

  @override
  State<FacPage> createState() => _FacPageState();
}

class _FacPageState extends State<FacPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Science and Technology',
          textAlign: TextAlign.left,
        ),
      ),
       floatingActionButton: ExpandableFab(
          
          distance: 120,
          
          children: [
            ActionButton(
                icon: const Icon(Icons.home, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const FitnessAppHomeScreen())));
              },
            ),
            ActionButton(
              icon: const Icon(Icons.notifications, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => HomeScreen())));
              },
            ),
            ActionButton(
              icon: const Icon(Icons.rss_feed, color: Colors.white,), 
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>  HomeScreen())));
              },
            ),
          ]),
      body: SizedBox(
        height: 60,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  
                  child: const Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if(Text==""){}
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Books',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Journals',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'MSUIR',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Referencing',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Research Support',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'E-Reserves',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Scholarly Communication',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(5, 89, 109, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Useful Links',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: 
                         const Color.fromRGBO(5, 89, 109, 1),
                         
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "FAQ's",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
