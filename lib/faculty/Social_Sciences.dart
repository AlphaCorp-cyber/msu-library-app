
// ignore_for_file: must_be_immutable, file_names, import_of_legacy_library_into_null_safe, deprecated_member_use


import 'package:dashboard/IntroductionAnimation/action_button.dart';
import 'package:dashboard/Main/expandable_fab.dart';
import 'package:dashboard/Main/fitness_app_home_screen.dart';
import 'package:dashboard/Screens/home_screen.dart';
import 'package:dashboard/pages/compose.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSciences extends StatelessWidget {

  List<Tab> tabs = [
    const Tab(child: Text("Home",style: TextStyle(color: Colors.white,fontSize: 16))), 
    const Tab(child: Text("Books",style: TextStyle(color: Colors.white,fontSize: 16))),
    const Tab(child: Text("Journals",style: TextStyle(color: Colors.white,fontSize: 16))),
    const Tab(child: Text("Msu-ir",style: TextStyle(color: Colors.white,fontSize: 16))),
    const Tab(child: Text("Referencing",style: TextStyle(color: Colors.white,fontSize: 16))),
    const Tab(child: Text("Research Support",style: TextStyle(color: Colors.white,fontSize: 16))),
    const Tab(child: Text("Scholarly Communication",style: TextStyle(color: Colors.white,fontSize: 16))), 
    const Tab(child: Text("FAQ's",style: TextStyle(color: Colors.white,fontSize: 16)))
  ];

  List<Widget> tabsContent = [
    SingleChildScrollView(
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
          _heading("Introduction"),
          const SizedBox(
            height: 6,
          ),
          _detailsCard(),
          const SizedBox(
            height: 10,
          ),
          _heading("What are the Library's Service Standards"),
          const SizedBox(
            height: 6,
          ),
          _vision(),
          const SizedBox(
            height: 10,
          ),

          _heading("Client Expectations"),
          const SizedBox(
            height: 6,
          ),
          _mission(),
          const SizedBox(
            height: 10,
          ),
          _heading("Library Expectations"),
          const SizedBox(
            height: 6,
          ),
          _values(),
          const SizedBox(
            height: 10,
          ),
          _heading("Access to Library Resources"),
          const SizedBox(
            height: 6,
          ),
          _goals(),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    SingleChildScrollView(
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
          _heading("MSU LIBRARY BOOK COLLECTION"),
          const SizedBox(
            height: 6,
          ),
          _collection(),
          const SizedBox(
            height: 10,
          ),
          _heading("MSU Interlibrary Loan"),
          const SizedBox(
            height: 6,
          ),
          _loan(),
          const SizedBox(
            height: 10,
          ),

          _heading("e - Book Collections "),
          const SizedBox(
            height: 6,
          ),
          _books(),
          const SizedBox(
            height: 10,
          ),
          _heading("How to access e-Books"),
          const SizedBox(
            height: 6,
          ),
          _access(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    SingleChildScrollView(
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
          _heading("Scholarly journals"),
          const SizedBox(
            height: 6,
          ),
          _scholar(),
          const SizedBox(
            height: 10,
          ),
          _heading("How to access access Print Journals"),
          const SizedBox(
            height: 6,
          ),
          _acces(),
          const SizedBox(
            height: 10,
          ),

          _heading("e - Journal Collections "),
          const SizedBox(
            height: 6,
          ),
          _journals(),
          const SizedBox(
            height: 10,
          ),
          _heading("How to access e-Journals"),
          const SizedBox(
            height: 6,
          ),
          _access1(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    SingleChildScrollView(
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
          _heading("The MSU Institutional Repository (MSUIR)"),
          const SizedBox(
            height: 6,
          ),
          _ir1(),
          const SizedBox(
            height: 10,
          ),
          _heading("How to access MSUIR"),
          const SizedBox(
            height: 6,
          ),
          _ir2(),
          const SizedBox(
            height: 10,
          ),

          _heading("Thesis Databases"),
          const SizedBox(
            height: 6,
          ),
          _ir3(),
          const SizedBox(
            height: 10,
          ),
         
          
        ],
      )),

      //ist
    SingleChildScrollView(
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
          _heading("REFERENCING"),
          const SizedBox(
            height: 6,
          ),
          _r1(),
          const SizedBox(
            height: 10,
          ),
          _heading("REFERENCING TOOLS"),
          const SizedBox(
            height: 6,
          ),
          _r2(),
          const SizedBox(
            height: 10,
          ),

          _heading("Turnitin Ant- Plagiarism Software"),
          const SizedBox(
            height: 6,
          ),
          _r3(),
          const SizedBox(
            height: 10,
          ),
          _heading("Turnitin Guides for Students and Staff"),
          const SizedBox(
            height: 6,
          ),
          _r4(),
          const SizedBox(
            height: 10,
          ),
          _heading("Video Tutorial on How to use Turnitin Anti-Plagiarism"),
          const SizedBox(
            height: 6,
          ),
          _r5(),
          const SizedBox(
            height: 10,
          ),
          
          
        ],
      )),
      //2nd
    SingleChildScrollView(
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
          _heading("Steps in the research process"),
          const SizedBox(
            height: 6,
          ),
          _steps(),
          const SizedBox(
            height: 10,
          ),
          _heading("Research Methods Books"),
          const SizedBox(
            height: 6,
          ),
          _rbooks(),
          const SizedBox(
            height: 10,
          ),
         
        ],
      )),
   
    SingleChildScrollView(
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
          _heading("Choosing where to publish"),
          const SizedBox(
            height: 6,
          ),
          _publish(),
          const SizedBox(
            height: 10,
          ),
          _heading("Where is the Journal Indexed?"),
          const SizedBox(
            height: 6,
          ),
          _index(),
          const SizedBox(
            height: 10,
          ),

          _heading("Journal Finders"),
          const SizedBox(
            height: 6,
          ),
          _finders(),
          const SizedBox(
            height: 10,
          ),
          _heading("RESEARCH IMPACT AND METRICS"),
          const SizedBox(
            height: 6,
          ),
          _metrics(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    
    SingleChildScrollView(
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
          _heading("Question 1"),
          const SizedBox(
            height: 6,
          ),
          _Q1(),
          const SizedBox(
            height: 10,
          ),
          _heading("Question 2"),
          const SizedBox(
            height: 6,
          ),
          _Q2(),
          const SizedBox(
            height: 10,
          ),

          _heading("Question 3"),
          const SizedBox(
            height: 6,
          ),
          _Q3(),
          const SizedBox(
            height: 10,
          ),
          _heading("Question 4"),
          const SizedBox(
            height: 6,
          ),
          _Q4(),
          const SizedBox(
            height: 10,
          ),
          _heading("Question 5"),
          const SizedBox(
            height: 6,
          ),
          _Q5(),
          const SizedBox(
            height: 10,
          ),
          _heading("Question 6"),
          const SizedBox(
            height: 6,
          ),
          _Q6(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
  ];

  SocialSciences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Social Sciences"),
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          centerTitle: false,
           systemOverlayStyle: SystemUiOverlayStyle.light,
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
              icon: const Icon(Icons.edit_note, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const Mail())));
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
         body: Padding(

          padding: EdgeInsets.all(8.0),
          
          child: Column(
            children: <Widget> [
              
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child:  TabBar(
                  indicator: BoxDecoration(
                    color: const Color.fromRGBO(5, 89, 109, 1),
                    borderRadius:  BorderRadius.circular(25.0),
                    
                  ) ,
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color.fromRGBO(5, 89, 109, 1),
                  tabs: const  [
                    const Tab(child: Text("Home",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Books",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Journals",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Msu-ir",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Referencing",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Research Support",style: TextStyle(fontSize: 16))),
    const Tab(child: Text("Scholarly Communication",style: TextStyle(fontSize: 16))), 
    const Tab(child: Text("FAQ's",style: TextStyle(fontSize: 16)))
                    
                  ],
                  
                ),
                
              ),
               Expanded(
                  child: TabBarView(
                    children:  tabsContent
                  )
              ),
            ],
          ),
          
        )
      ),
    );
  }
}

Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRect(
  child: Align(
    alignment: Alignment.topCenter,
    heightFactor: 0.5,
    widthFactor: 0.5,
    child: Image.asset('assets/fitness_app/ss1.jpg'),
  ),
),
      
      ],
    );
  }


  Widget _profileName(String name) {
    return SizedBox(
      //80% of width,
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
       //80% of width,
      child: Center(
        child: Text(
          heading,
          style: const TextStyle(fontSize: 16, color: Color(0xFF05596D),fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


//HOME
  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Welcome to the Faculty of Social Sciences guide. This is your gateway to both hardcopy and electronic resources. The guide proffers a myriad of resources as well as services that are germane to support the information needs for all students in the Faculty. The guide directs you to resources such as; e-journals, e-books, dissertations/theses, research papers, conference papers, public lectures, speeches and seminar presentations.",
                  textAlign: TextAlign.justify),
              
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
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              
              title: Text(
                  "The Midlands State University Library is committed to providing high quality services to our users. We treasure customer feedback and strive to improve our performance and ensure that the services provided are responsive to the needs of our clients. In support of this commitment the Library produced a Library Charter. The Charter is a guiding principle that directs the way the Library serves, behaves and holds itself accountable for its actions. It also attempts to demonstrate the Library's total commitment to valuing its customers by providing a memorable experience and ensuring that every customer interaction results in positive experiences.",
                  textAlign: TextAlign.justify),
              
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
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Expect from us:\n\nPrompt, and courteous service\nHelpful well-trained staff who will treat you with respect\nFair and equitable access to our collections and services\nCollections which aim to meet your needs and are well maintaned and accessible",
                  textAlign: TextAlign.justify),
              
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
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Help us to help you by:\n\nTreating other people in the library with respect and courtesy, whether these are other clients or library staff\nTreating library facilities, equipment, collections and property with due care\nAssisting staff understand your needs clearly\nProviding us wth feedback on how we may improve our services, or we can resolve a specific service problem"),
              
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
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "The MSU Library collection is multidisciplinary and it covers the entire gamut of academic programmes offered by the institution. For one to access the library, you need to be an MSU bonafide client, i.e. a registered student or a current employee of the institution. For non-MSU students or staff, clients are required to request for authority to use the library and subsequently pay the fees to be recognised as 'Approved readers'.There are different borrowing privileges depending on the cohort a client belongs to and these are as follows;\n\n1. Teaching staff - Allowed to borrow a maximum of 8 books at a time for a period of 1 month\n2. Non-Teaching staff - Allowed to borrow a maximum of 6 books at a time for a period of 1 month\n3. Postgraduate students - Allowed to borrow a maximum of 3 books at a time for a period of 7 days\n4. Undergraduate students - Allowed to borrow a maximum of 3 books at a time for a period of 7 days\n5. Approved readers - Do not have any borrowing rights. They are only allowed access to library materials within the building."),
              
            ),
          ],
        ),
      ),
    );
  }


//BOOKS


  Widget _collection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Midlands State University Library has a robust collection of print and electronic books. Patrons may borrow items from the print collection using their valid student or staff identification cards.  Electronic books can be accessed by clicking on the 'Electronic Resources' tab on the library website.\n\n",
                  textAlign: TextAlign.justify),
                  
                  
              
            ),
            ListTile(
              title: Text(
                  "CATEGORIES OF THE BOOK COLLECTION",textAlign: TextAlign.justify),
              
            ),ListTile(
              title: Text(
                  "Long term"),
                  subtitle: Text("These books are generally located in the Open Shelf area and can be borrowed for a maximum period of seven (7) days for students and 30 days for Staff members.",textAlign: TextAlign.justify),
              
            ),ListTile(
              title: Text(
                  "Core collection Books"),
                  subtitle: Text("The core textbook collection is comprised of core books that have been highly recommended by lecturers from all the academic departments at MSU. Books from the core collection are borrowed for a maximum period of three days only.",textAlign: TextAlign.justify),
              
            ),ListTile(
              title: Text(
                  "Reference collection"),
                  subtitle: Text("Discipline specific dictionaries, encyclopedias and other reference works are also available in our libraries. This category of materials can only be used within the library.",textAlign: TextAlign.justify),
              
            ),
            ListTile(
              title: Text(
                  "eBooks"),
                  subtitle: Text("To compliment the hard copy collection of books, the Library offers access to a vibrant collection of e-books which can be accessed even if one is off campus.",textAlign: TextAlign.justify),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _loan() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "This facility is a cooperative arrangement whereby a patron of the MSU library can borrow books or journals that are owned by another university library for a specific period of time. All active MSU staff and registered students may use this service by completing this form. Should you need additional assistance visit any of our libraries and request to see the Client Service Librarian or email matsae(a)staff.msu.ac.zw or WhatsApp +263 78 675 5935"),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _books() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
             
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nDawsonera",style: TextStyle(color: Colors.blue)),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nEbook Library",style: TextStyle(color: Colors.blue)),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nEmerald Social Science Collection",style: TextStyle(color: Colors.blue)),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nProquest e-Book Central",style: TextStyle(color: Colors.blue)),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nProquest Central",style: TextStyle(color: Colors.blue),),
                onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _access() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "\n\n1. Go to www.msu.ac.zw\n\n2. Point your mouse on “Libraries” a dropdown menu will show. Select “e-Books”\n\n3. On the e-Books page, you will see e-Book collections arranged alphabetically with a short description of what each collection contains.\n\n4. Click on the e-Book collection of your choice, you will be taken to a page requiring you to enter your Registration Number and E-Learning password or your Staff portal username and password.\n\n5. Enter the details and click on the login button, you will be directed to the e-Book collection where you will now carry out your research.",
                  textAlign: TextAlign.justify),
              
            ),
          ],
        ),
      ),
    );
  }

//journals

Widget _scholar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "A journal or periodical is a scholarly publication containing articles written by researchers, academics, practitioners and other experts. Journals usually focus on a specific discipline or field of study such as biology, chemistry or computer science. Journals are published at regular intervals such as monthly, quarterly or yearly and several authors contribute to each issue. Electronic journals are online versions of the printed journals and they are only accessible over the internet (NMSU Library, 2020).",
                  textAlign: TextAlign.justify),
                  
                  
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _acces() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "\n\n1. Go to www.msu.ac.zw and point your mouse to “Libraries”\n\n2. Select “Catalogue”\n\n3. On the Online catalogue page click on “Advanced Search”\n\n4. Enter your keywords in the search form provided\n\n5. Under “Item Type” select “Journal” to limit your results to journals only\n\n6. Click on the “Search” button to get results\n\n7. Click on a journal title of your choice to get the Call number\n\n8. Approach appropriate shelf in the Special Collections section to retrieve the journal."),
              
            ),
          ],
        ),
      ),
    );
  }

 Widget _journals() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
            InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nAnnual Reviews",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nDirectory of Open Access Journal - DOAJ",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nEmerald Insight",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nJstor Journal Storage",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nMary Ann Liebert",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nOxford Journals",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _access1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "\n\n1. Go to www.msu.ac.zw\n\n1. Point your mouse on “Libraries” a dropdown menu will show. Select “e-Journals”\n\n1. On the e-Journals page, you will see e-Journalsk collections arranged alphabetically with a short description of what each collection contains.\n\n1. Click on the e-Journals collection of your choice, you will be taken to a page requiring you to enter your Registration Number and E-Learning password or your Staff portal username and password.\n\n1. Enter the details and click on the login button, you will be directed to the e-Journals collection where you will now carry out your research.",
                  textAlign: TextAlign.justify),
              
            ),
          ],
        ),
      ),
    );
  }

//FAQ


Widget _Q1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question : Can you return a book borrowed from the Main Library to any Branch Library?",
                  textAlign: TextAlign.justify),
                  subtitle: Text("\nAnswer : You can only return a book to the library where you borrowed it. This is done in order for the home library to be accountability for each and every material in its collection. In the OPAC, all library materials are identified by location and returning a book to the library where it was borrowed helps other users quickly locate the book."),
                  
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _Q2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question : Can a student borrow a book during vacation?"),
              subtitle: Text("\nAnswer : During vacation, the library will be open and serving clients. Students will only be allowed access to the library and not allowed to borrow books for outside the library use. Students are allowed to borrow books during semester break and are encouraged to observe the due date stamped on the library books."),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Q3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question : Is the library open during Public Holidays?"),
              subtitle: Text("\nAnswer : The Library is closed during Public Holidays. To view the Library opening and Closing times click here"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _Q4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question : How do I access e-resources?",
                  textAlign: TextAlign.justify),
              subtitle: Text("\nAnswer : For steps on how to access e-journals, e-books, Institutional Repository, OPAC, Past Examination papers click here"),
            ),
          ],
        ),
      ),
    );
  }

 Widget _Q5() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question : What happens if I have a an overdue book?",
                  textAlign: TextAlign.justify),
              subtitle: Text("\nAnswer : An overdue book attracts a fine which is automatically recorded in the KOHA System. The fine that accrues in a client’s account is determined by the type of material borrowed. For more information on fines click here"),
            ),
          ],
        ),
      ),
    );
  }

 Widget _Q6() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Question:What documents do one need to be allowed to gain entry into the library?",
                  textAlign: TextAlign.justify),
                  subtitle: Text("\nAnswer : A client is required to produce a valid student/staff ID at the Library entrance. For students, one needs to be registered for that semester."),
              
            ),
          ],
        ),
      ),
    );
  }

//scholar

Widget _publish() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "It is important to find the most relevant journal to publish with so that your research output gets the attention that it deserves. You should always be able to check for certain important factors when looking for a journal to publish with. Some factors to look out for include:\n\nScope of the journal\n\nPeer review process\n\nJournal Metrics\n\nOpen Access options\n\nHow to spot a predatory Journal",
                  textAlign: TextAlign.justify),
                  
                  
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _index() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "It is important that you check whether the journal is indexed in major indexes such as Scopus and Web of Science. These indexes assess a journal’s quality before indexing them and it is most likely that your work becomes more discoverable if you publish with journals indexed in them."),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _finders() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Elsevier Journal Finder\n\nSpringer Link Journal Suggester\n\nWiley Journal Finder\n\nSage Journal Selector\n\nEmerald Journal Finder\n\nThink. Check. Submit\n\nWeb of Science Master List\n\nScopus Journal Analyzer"),
              
            ),
          ],
        ),
      ),
    );
  }
  Widget _metrics() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Metrics are a measurement of the importance or impact of a journal or author. There are several metrics that can be used to indicate the importance of a journal. Author level metrics can also be used to show impact that an author makes on the scientific community or field of the study. Click here to download a detailed document",
                  textAlign: TextAlign.justify),
              
            ),
          ],
        ),
      ),
    );
  }

//MSUIR


Widget _ir1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "The MSUIR is an online digital collection of the university's research output. The collection contains documents such as research papers, conference papers, books, book chapters, speeches, public lectures and seminar series presentations.",
                  textAlign: TextAlign.justify),
                  
                  
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _ir2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "1. Go to www.msu.ac.zw\n\n2. Click on the libraries link\n\n3. On the library homepage click on Electronic Resources and select “ Institutional Repository”\n\n4. In the resultant screen you will see recent submissions and you can also browse Collections represented by Faculties.\n\n5. You may also discover articles by author, Subject or Date on the right hand side.\n\n6. To search the whole MSU IR, enter your search terms inside the search box at the top of the page and click on the “Search” button.\n\n7. Scroll down the page to view your results under “Item hits”\n\n8. Click on a result of your choice and scroll down the page to view abstract and other document information.\n\n9. To open document, click on the “View/Open” button.\n\n10. According to your browser settings, the document may open in browser or prompt you to download."),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _ir3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "African Digital Repository\nThe African Digital Repository consists of records harvested from the institutional repositories of a number of South African and African institutions. Links to the full text within the repositories are included.\n\nNetworked Digital Library of Theses and Dissertations\nThe Networked Digital Library of Theses and Dissertations (NDLTD) is an international organization dedicated to promoting the adoption, creation, use, dissemination, and preservation of electronic theses and dissertations (ETDs).\n\nDatabase of African Theses and Dissertations\nDatabase of citations and abstracts of dissertations from African universities.\n\nProquest Central\nContains dissertations and theses from many Universities from around the world.\n\nEBSCO Open Dissertations\nOpenDissertations.org is a collaboration between EBSCO and BiblioLabs that brings an innovative approach to increasing traffic and discoverability of ETD research.\n\nOpen Access and Dissertations\nA collection of dissertations from Universities from around the world.\n\nOpen Thesis\nOpenThesis is a free repository of theses, dissertations, and other academic documents, coupled with powerful search, organization, and collaboration tools.\n\nPQDT\nPQDT Open provides the full text of open access dissertations and theses free of charge. You can quickly and easily locate dissertations and theses relevant to your discipline, and view the complete text in PDF format.\n\nRegistry of Open Access Repositories\nThe Registry of Open Access Repositories (ROAR) is a searchable international database indexing the creation, location and growth of open access institutional repositories and their contents"),
              
            ),
          ],
        ),
      ),
    );
  }
 
 //steps

  Widget _steps() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
             ListTile(
               title: const Text(
                   "\n\nStep 1: Identifying the Problem",style: TextStyle(color: Colors.blue)),
                subtitle: Text("The first step in the process is to identify a problem or develop a research question. You need to identify a topic that is of interest to you to make it easy along the way."),
             ),
             
             ListTile(
               title: const Text(
                   "\n\nStep 2: Review the Literature",style: TextStyle(color: Colors.blue)),
                subtitle: Text("Once the problem has been identified, it is time to gather information related to the problem or topic. Gathering literature about the topic will give you more insights into what has already been published by other researchers, how they researched the problem and the results or conclusions they got. You will need to use the library’s resources to get this information. These include the library catalogue, electronic books, electronic journals and indexes."),
             ), ListTile(
               title: const Text(
                   "\n\nStep 3: Research Purpose/Design",style: TextStyle(color: Colors.blue)),
                subtitle: Text("This is a practical framework for answering the research questions. This involves making decisions about the type of data that you are going to collect, how you are going to collect it (methods), time scale and the location of your research."),
             ), ListTile(
               title: const Text(
                   "\n\nStep 4: Collect Data",style: TextStyle(color: Colors.blue)),
                subtitle: Text("This step involves collecting data about your research problem from the participants in your research. Data can be collected in the form of interviews, questionnaires, observation etc."),
             ),ListTile(
               title: const Text(
                   "\n\nStep 5: Analyse and Interpret Data",style: TextStyle(color: Colors.blue),),
               subtitle: Text("All the activities that were carried out in the above steps now culminate into this step. Here you will analyse data so that the research questions can finally be answered."),
             ),ListTile(
               title: const Text(
                   "\n\nStep 6: Report and Evaluate",style: TextStyle(color: Colors.blue)),
                subtitle: Text("In this stage, you are now writing about the results that you got from the research. What were the conclusions about the problem you were researching on? What are your recommendations? What can be done to improve things or avoid negative things?(Blankenship, Diane Applied Research and Evaluation Methods in Recreation, Human Kinetics 2010)"),
             ),
             SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

   Widget _rbooks() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nBecoming a Researcher",style: TextStyle(color: Colors.blue)),
                    subtitle: Text("\nAuthor : Mairead Dunne, John Pryor, and Paul Yates\nYear of Publication : 2005"),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nBusiness Research Methodology",style: TextStyle(color: Colors.blue)),
                    subtitle: Text("\nAuthor : J.K. Sachdeva\nYear of Publication : 2008"),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nQuantitative and Statistical Research Methods : From Hypothesis to Results",style: TextStyle(color: Colors.blue)),
                    subtitle: Text("\nAuthor : Martin, William\nYear of Publication : 2012"),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nQuantitative Data Analysis : Doing Social Research to Test Ideas",style: TextStyle(color: Colors.blue)),
                    subtitle: Text("\nAuthor : Treiman, Donald J\nYear of Publication : 2009"),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nResearch Methodology - Contemporary Practices : Guidelines for Academic Researchers",style: TextStyle(color: Colors.blue)),
                    subtitle: Text("\nAuthor : Habib, Md. Mamun\nYear of Publication : 2014"),
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
          ],
        ),
      ),
    );
  }


  //referencing
 Widget _r1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
            ListTile(
              title: Text(
                  "Referencing is giving the acknowledgement to the sources of information you have consulted in your academic work (Queens University, 3 September 2020). As you write assignments, research papers or any academic work, you must always cite your sources."),
              
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nImportance of referencing",style: TextStyle(color: Colors.blue)),
                   
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
            ListTile(
              title: Text(
                  "Copyright Notice",
                  ),
                  subtitle: Text("Patrons using copier or printing services are responsible for any infringements of the Zimbabwe copyright Laws."),
              
            ),
          ],
        ),
      ),
    );
  }

 Widget _r2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              title: Text(
                  "Mendeley"),
                  subtitle: Text("Mendeley is a free reference manager and academic social network that can help you organize your research, collaborate with others online, and discover the latest research:\n\nAutomatically generate bibliographies\n\nCollaborate easily with other researchers online\n\nEasily import papers from other research software\n\nFind relevant papers based on what you're reading\n\nAccess your papers from anywhere online"),
              
            ),ListTile(
              title: Text(
                  "Zotero"),
                  subtitle: Text("Zotero is a free, open-source referencing and research tool that helps you collect, organize, and analyse research and share it in a variety of ways. Zotero has the ability to store author, title, and publication fields and export that information as formatted references. It supports all the referencing styles such as Harvard, MLA and APA. Zotero interacts seamlessly with online resources: when it senses you are viewing a book, article, or other object on the web, it can automatically extract and save complete bibliographic references. Zotero effortlessly transmits information to and from other web services and applications, and it runs both as a web service and offline on your personal devices.\n\nWith Zotero you can:\n\nSave citations from databases, web sites, and library catalogs\n\nManage, categorize into collections, and organize\n\nCite sources \"in-text\" as you write and create reference lists in most styles (e.g., APA, MLA, Chicago, Vancouver, etc.)\n\nAttach PDF's, images, web page snapshots, reading notes, and more to citations in your collection"),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _r3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
            ListTile(
              title: Text(
                  "Turnitin is an originality checking and plagiarism prevention service that checks your writing for citation mistakes or inappropriate copying. When you submit your paper, Turnitin compares it to text in its massive database of student work, websites, books, articles, etc (APUS, 2020)."),
              
            ),
            InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nDownload Zotero",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nZotero User Guide",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _r4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nHow to create a Turnitin student account",style: TextStyle(color: Colors.blue)),
                   
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nHow to upload research article into Turnitin",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nInterpreting Turnitin Similarity Report",style: TextStyle(color: Colors.blue)),
                   
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nSupervisor quick start guide",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _r5() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        
        elevation: 4,
        child: Column(
          children:  [
            //row for each deatails
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nHow to create a Turnitin student account",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nHow to upload research article into Turnitin",style: TextStyle(color: Colors.blue)),
                   
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ),
             InkWell(
              child: ListTile(
                title: const Text(
                    "\n\nInterpreting Turnitin Similarity Report",style: TextStyle(color: Colors.blue)),
                    
                 onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ), 
          ],
        ),
      ),
    );
  }
