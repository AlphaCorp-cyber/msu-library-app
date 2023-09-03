import 'package:dashboard/Main/fitness_app_home_screen.dart';
import 'package:dashboard/Main/my_drawer_header.dart';
import 'package:dashboard/Screens/location.dart';
import 'package:dashboard/eresources/courtJudgements/home_screen.dart';
import 'package:dashboard/eresources/ebooks/home_screen.dart';
import 'package:dashboard/eresources/ejournals/home_screen.dart';

import 'package:dashboard/pages/aboutus.dart';
import 'package:dashboard/pages/contactus.dart';
import 'package:flutter/material.dart';

import '../credits/main.dart';
import '../eresources/pastpapers/papers.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading:
                  const Icon(Icons.home, color: Color.fromRGBO(5, 89, 109, 1)),
              title: const Text(
                'Home',
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const FitnessAppHomeScreen())));
              },
            ),
            ExpansionTile(
              iconColor:  Color.fromRGBO(5, 89, 109, 1),
                leading: const Icon(Icons.library_books,color: Color.fromRGBO(5, 89, 109, 1),),
                title: const Text('Electronic Resources',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 89, 109, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                children: <Widget>[
                  ListTile(
                    title: TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>  HomeScreenJ()))); },
                      child: Row(
                    children: [
                      
                      SizedBox(width: 16),
                      Text("E-Journals",
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right,color: Color.fromRGBO(5, 89, 109, 1),),
                          ],
                        ),
                      )
                    ],
                  ),
                      
                    ),
                    
                   
                  ),
                  ListTile(
                    title: TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>  HomeScreenEbooks()))); },
                      child: Row(
                    children: [
                      
                      SizedBox(width: 16),
                      Text("E-Books",
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right,color: Color.fromRGBO(5, 89, 109, 1)),
                          ],
                        ),
                      )
                    ],
                  ),
                      
                    ),
                    
                   
                  ),
                  ListTile(
                    title: TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>  HomeScreenCourt()))); },
                      child: Row(
                    children: [
                      
                      SizedBox(width: 16),
                      Text("Court Judgements",
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right,color: Color.fromRGBO(5, 89, 109, 1)),
                          ],
                        ),
                      )
                    ],
                  ),
                      
                    ),
                    
                   
                  ),
                  ListTile(
                    
                    title: TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>  SearchPage()))); },
                      child: Row(
                    children: [
                      
                      SizedBox(width: 16),
                      Text("Past Exam Papers",
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right,color: Color.fromRGBO(5, 89, 109, 1)),
                          ],
                        ),
                      )
                    ],
                  ),
                      
                    ),
                    
                   
                   
                  ),
                //   ListTile(
                //    title: TextButton(
                //       onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                //           builder: ((context) =>  HomeScreenIR()))); },
                //       child: Row(
                //     children: [
                      
                //       SizedBox(width: 16),
                //       Text("Institutional Repository",
                // style: TextStyle(
                //     color: Color.fromRGBO(5, 89, 109, 1),
                //     fontSize: 13,
                //     fontWeight: FontWeight.w600),),
                //       Expanded(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Icon(Icons.chevron_right,color: Color.fromRGBO(5, 89, 109, 1)),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                      
                //     ),
                    
                   
                //   ),
                ]),
            ListTile(
              leading: const Icon(Icons.location_on,
                  color: Color.fromRGBO(5, 89, 109, 1)),
              title: const Text(
                'locations',
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const Location())));
              },
            ),
            
            ListTile(
              leading:
                  const Icon(Icons.info, color: Color.fromRGBO(5, 89, 109, 1)),
              title: const Text(
                'About',
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const About())));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_alt_outlined,
                  color: Color.fromRGBO(5, 89, 109, 1)),
              title: const Text(
                'Contact',
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const Contact())));
              },
            ),
             ListTile(
              leading: const Icon(Icons.people_alt_outlined,
                  color: Color.fromRGBO(5, 89, 109, 1)),
              title: const Text(
                'Credits',
                style: TextStyle(
                    color: Color.fromRGBO(5, 89, 109, 1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const Credits())));
              },
            ),
            
             Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Column(
                children: [
                  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'powered by ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 5), // Adjust the spacing between the text and image
         Opacity(
  opacity: 0.5, // Set the opacity level (0.0 to 1.0)
  child: Image.asset(
    'assets/nerd.png', // Replace with the actual image path
    width: 80,
    height: 80,
  ),
)
        ],
      ),
                ],
              ),
            ),
            
            
          ],

        ),
        
      ),
    );
  }
}
