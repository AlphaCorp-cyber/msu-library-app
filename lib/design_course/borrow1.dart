
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// import '../models/borrowing.dart';

// class BorrowHomeScreen extends StatelessWidget {
//   final Borrowing borrowing;
//   List<Tab> tabs = [
//     const Tab(child: Text("Summary")),
//     const Tab(child: Text("Borrowed")),
//     const Tab(child: Text("Overdue")),
//     const Tab(child: Text("History")),
//   ];

//   List<Widget> tabsContent = [
//     SingleChildScrollView(
//         child: Column(
//       children: [
//         //for circle avtar image
//         getAppBarUI(),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     )),
//     SingleChildScrollView(
//         child: Column(
//       children: [
//         //for circle avtar image

//         const SizedBox(
//           height: 10,
//         ),

//         _heading("Introduction"),
//         const SizedBox(
//           height: 6,
//         ),
//         _detailsCard(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("What are the Library's Service Standards"),
//         const SizedBox(
//           height: 6,
//         ),
//         _vision(),
//         const SizedBox(
//           height: 10,
//         ),

//         _heading("Client Expectations"),
//         const SizedBox(
//           height: 6,
//         ),
//         _mission(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("Library Expectations"),
//         const SizedBox(
//           height: 6,
//         ),
//         _values(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("Access to Library Resources"),
//         const SizedBox(
//           height: 6,
//         ),
//         _goals(),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     )),
//     SingleChildScrollView(
//         child: Column(
//       children: [
//         //for circle avtar image

//         const SizedBox(
//           height: 10,
//         ),

//         _heading("MSU LIBRARY BOOK COLLECTION"),
//         const SizedBox(
//           height: 6,
//         ),
//         _collection(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("MSU Interlibrary Loan"),
//         const SizedBox(
//           height: 6,
//         ),
//         _loan(),
//         const SizedBox(
//           height: 10,
//         ),

//         _heading("e - Book Collections "),
//         const SizedBox(
//           height: 6,
//         ),
//         _books(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("How to access e-Books"),
//         const SizedBox(
//           height: 6,
//         ),
//         _access(),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     )),
//     SingleChildScrollView(
//         child: Column(
//       children: [
//         //for circle avtar image

//         const SizedBox(
//           height: 10,
//         ),

//         _heading("Scholarly journals"),
//         const SizedBox(
//           height: 6,
//         ),
//         _scholar(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("How to access access Print Journals"),
//         const SizedBox(
//           height: 6,
//         ),
//         _acces(),
//         const SizedBox(
//           height: 10,
//         ),

//         _heading("e - Journal Collections "),
//         const SizedBox(
//           height: 6,
//         ),
//         _journals(),
//         const SizedBox(
//           height: 10,
//         ),
//         _heading("How to access e-Journals"),
//         const SizedBox(
//           height: 6,
//         ),
//         _access1(),
//         const SizedBox(
//           height: 10,
//         ),
//       ],
//     )),
//   ];

//   BorrowHomeScreen({Key? key, required this.borrowing}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabs.length,
//       child: Scaffold(
//           appBar: AppBar(
//             title:  Text("Borrowing ${borrowing.len}"),
//             backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
//             centerTitle: false,
//             systemOverlayStyle: SystemUiOverlayStyle.light,
//           ),
          
//           floatingActionButton: SpeedDail(
//             animatedIcon: AnimatedIcons.menu_close,
//             backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
//             children:[
//               SpeedDialChild(
//                 child: Icon(Icons.mail),
//                 label: 'Mail'
//               ),
//                SpeedDialChild(
//                 child: Icon(Icons.copy),
//                 label: 'Copy'
//               ),
//             ]

//           ),
//           body: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(25.0)),
//                   child: TabBar(
//                     indicator: BoxDecoration(
//                         color: const Color.fromRGBO(5, 89, 109, 1),
//                         borderRadius: BorderRadius.circular(25.0)),
//                     labelColor: Colors.white,
//                     unselectedLabelColor: const Color.fromRGBO(5, 89, 109, 1),
//                     tabs: const [
//                       const Tab(child: Text("Summary")),
//                       const Tab(child: Text("Borrowed")),
//                       const Tab(child: Text("Overdue")),
//                       const Tab(child: Text("History")),
//                     ],
//                   ),
//                 ),
//                 Expanded(child: TabBarView(children: tabsContent)),
//               ],
//             ),
//           )
//           // body: Container(

//           //        decoration: BoxDecoration(
//           //           color: Colors.grey[300],
//           //           borderRadius: BorderRadius.circular(25.0)
//           //         ),

//           //   child: TabBarView(
//           //     children: tabsContent,

//           //   ),
//           // ),

//           ),
//     );
//   }
// }

// Widget _heading(String heading) {
//   return SizedBox(
//     //80% of width,
//     child: Center(
//       child: Text(
//         heading,
//         style: const TextStyle(
//             fontSize: 16,
//             color: Color(0xFF05596D),
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }

// //HOME
// Widget _detailsCard() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "Welcome to the Faculty of Science and Technology Library Guide. The guide will assist you in finding information pertaining to your studies that include both hard copy and electronic resources of books, journals, dissertations and research papers. In this guide you will also find information related to your training needs in various research related activities such as referencing and academic integrity.",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _vision() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "The Midlands State University Library is committed to providing high quality services to our users. We treasure customer feedback and strive to improve our performance and ensure that the services provided are responsive to the needs of our clients. In support of this commitment the Library produced a Library Charter. The Charter is a guiding principle that directs the way the Library serves, behaves and holds itself accountable for its actions. It also attempts to demonstrate the Library's total commitment to valuing its customers by providing a memorable experience and ensuring that every customer interaction results in positive experiences.",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _mission() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "Expect from us:\n\nPrompt, and courteous service\nHelpful well-trained staff who will treat you with respect\nFair and equitable access to our collections and services\nCollections which aim to meet your needs and are well maintaned and accessible",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _values() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "Help us to help you by:\n\nTreating other people in the library with respect and courtesy, whether these are other clients or library staff\nTreating library facilities, equipment, collections and property with due care\nAssisting staff understand your needs clearly\nProviding us wth feedback on how we may improve our services, or we can resolve a specific service problem"),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _goals() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "The MSU Library collection is multidisciplinary and it covers the entire gamut of academic programmes offered by the institution. For one to access the library, you need to be an MSU bonafide client, i.e. a registered student or a current employee of the institution. For non-MSU students or staff, clients are required to request for authority to use the library and subsequently pay the fees to be recognised as 'Approved readers'.There are different borrowing privileges depending on the cohort a client belongs to and these are as follows;\n\n1. Teaching staff - Allowed to borrow a maximum of 8 books at a time for a period of 1 month\n2. Non-Teaching staff - Allowed to borrow a maximum of 6 books at a time for a period of 1 month\n3. Postgraduate students - Allowed to borrow a maximum of 3 books at a time for a period of 7 days\n4. Undergraduate students - Allowed to borrow a maximum of 3 books at a time for a period of 7 days\n5. Approved readers - Do not have any borrowing rights. They are only allowed access to library materials within the building."),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// //BOOKS

// Widget _collection() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//         ],
//       ),
//     ),
//   );
// }

// Widget _loan() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "This facility is a cooperative arrangement whereby a patron of the MSU library can borrow books or journals that are owned by another university library for a specific period of time. All active MSU staff and registered students may use this service by completing this form. Should you need additional assistance visit any of our libraries and request to see the Client Service Librarian or email matsae(a)staff.msu.ac.zw or WhatsApp +263 78 675 5935",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _books() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: [
//           //row for each deatails
//         ],
//       ),
//     ),
//   );
// }

// Widget _access() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "\n\n1. Go to www.msu.ac.zw\n\n2. Point your mouse on “Libraries” a dropdown menu will show. Select “e-Books”\n\n3. On the e-Books page, you will see e-Book collections arranged alphabetically with a short description of what each collection contains.\n\n4. Click on the e-Book collection of your choice, you will be taken to a page requiring you to enter your Registration Number and E-Learning password or your Staff portal username and password.\n\n5. Enter the details and click on the login button, you will be directed to the e-Book collection where you will now carry out your research.",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// //journals

// Widget _scholar() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "A journal or periodical is a scholarly publication containing articles written by researchers, academics, practitioners and other experts. Journals usually focus on a specific discipline or field of study such as biology, chemistry or computer science. Journals are published at regular intervals such as monthly, quarterly or yearly and several authors contribute to each issue. Electronic journals are online versions of the printed journals and they are only accessible over the internet (NMSU Library, 2020).",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _acces() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "\n\n1. Go to www.msu.ac.zw and point your mouse to “Libraries”\n\n2. Select “Catalogue”\n\n3. On the Online catalogue page click on “Advanced Search”\n\n4. Enter your keywords in the search form provided\n\n5. Under “Item Type” select “Journal” to limit your results to journals only\n\n6. Click on the “Search” button to get results\n\n7. Click on a journal title of your choice to get the Call number\n\n8. Approach appropriate shelf in the Special Collections section to retrieve the journal."),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _journals() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: [
//           //row for each deatails
//         ],
//       ),
//     ),
//   );
// }

// Widget _access1() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//       elevation: 4,
//       child: Column(
//         children: const [
//           //row for each deatails
//           ListTile(
//             title: Text(
//                 "\n\n1. Go to www.msu.ac.zw\n\n1. Point your mouse on “Libraries” a dropdown menu will show. Select “e-Journals”\n\n1. On the e-Journals page, you will see e-Journalsk collections arranged alphabetically with a short description of what each collection contains.\n\n1. Click on the e-Journals collection of your choice, you will be taken to a page requiring you to enter your Registration Number and E-Learning password or your Staff portal username and password.\n\n1. Enter the details and click on the login button, you will be directed to the e-Journals collection where you will now carry out your research.",
//                 textAlign: TextAlign.justify),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// //FAQ

// Widget getAppBarUI() {
//   return Container(
//     padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
//     height: 150,
//     width: double.infinity,
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//         bottomLeft: Radius.circular(20),
//         bottomRight: Radius.circular(20),
//       ),
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         stops: [0.1, 0.5],
//         colors: [
//           Color.fromRGBO(224, 224, 224, 1),
//           Color.fromRGBO(224, 224, 224, 1),
//         ],
//       ),
//     ),
//     child: Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const <Widget>[
//               Text(
//                 'Summary',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22,
//                   letterSpacing: 0.27,
//                   color: const Color.fromRGBO(5, 89, 109, 1),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//                 //child: Image.asset('fitness_app/alpha.png'),
//               ),
//               Text(
//                 "Overal Borrowed Books         : 10",
//                 style: TextStyle(
//                     color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
//               ),
//               SizedBox(
//                 height: 5,
//                 //child: Image.asset('fitness_app/alpha.png'),
//               ),
//               Text(
//                 "Total Borrowing in Progress   : 2",
//                 style: TextStyle(
//                     color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
//               ),
//               SizedBox(
//                 height: 5,
//                 //child: Image.asset('fitness_app/alpha.png'),
//               ),
//               Text(
//                 "Amount Overdue                  : \$5.00 ",
//                 style: TextStyle(
//                     color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
//               ),
//               SizedBox(
//                 height: 40,
//                 //child: Image.asset('fitness_app/alpha.png'),
//               )
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 60,
//           height: 60,
//           //child: Image.asset('fitness_app/alpha.png'),
//         )
//       ],
//     ),
//   );
// }
