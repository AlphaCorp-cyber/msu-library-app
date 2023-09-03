
// ignore_for_file: must_be_immutable, file_names, import_of_legacy_library_into_null_safe



import 'package:flutter/material.dart';

class Searching extends StatelessWidget {

  List<Tab> tabs = [
    const Tab(child: Text("E-Books")),
    const Tab(child: Text("E-Journals")),
    const Tab(child: Text("MSU-IR")),
    const Tab(child: Text("Past Papers")),
    const Tab(child: Text("Court Judgements")),
    
  ];

  List<Widget> tabsContent = [
    SingleChildScrollView(
          child: Column(
        children: [
          
          //for circle avtar image
          getSearchBarUI2(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    SingleChildScrollView(
          child: Column(
        children: [
          
          //for circle avtar image
          getSearchBarUI2(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    SingleChildScrollView(
          child: Column(
        children: [
          
          //for circle avtar image
          getSearchBarUI(),
          const SizedBox(
            height: 10,
          ),

          
          
        ],
      ),
      
      ),
    SingleChildScrollView(
      
          child: Column(
            
        children: [
          
          //for circle avtar image
          getSearchBarUI(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),SingleChildScrollView(
          child: Column(
        children: [
          
          //for circle avtar image
          getSearchBarUI1(),
          const SizedBox(
            height: 10,
          ),
          
        ],
      )),
    
  ];

  Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        
        
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
                   const Tab(child: Text("E-Books")),
    const Tab(child: Text("E-Journals")),
    const Tab(child: Text("MSU-IR")),
    const Tab(child: Text("Past Papers")),
    const Tab(child: Text("Court Judgements")),
                    
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
        // body: Container(
          
        //        decoration: BoxDecoration(
        //           color: Colors.grey[300],
        //           borderRadius: BorderRadius.circular(25.0)
        //         ),
                 
        //   child: TabBarView(
        //     children: tabsContent,
            
        //   ),
        // ),
        
      ),
    );
  }
}



  //FAQ

Widget getAppBarUI() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
       height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color.fromRGBO(224, 224, 224, 1),
            Color.fromRGBO(224, 224, 224, 1),
          ],
        ),
      ),
      
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Summary',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color:  const Color.fromRGBO(5, 89, 109, 1),
                  ),
                ),
                SizedBox(
           
            height: 10,
            //child: Image.asset('fitness_app/alpha.png'),
          ),
          Text(
                "Overal Borrowed Books         : 10",
                style: TextStyle(
                    color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
              ),
              SizedBox(
           
            height: 5,
            //child: Image.asset('fitness_app/alpha.png'),
          ),
              Text(
                "Total Borrowing in Progress   : 2",
                style: TextStyle(
                    color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
              ),
              SizedBox(
           
            height: 5,
            //child: Image.asset('fitness_app/alpha.png'),
          ),
                Text(
                "Amount Overdue                  : \$5.00 ",
                style: TextStyle(
                    color: const Color.fromRGBO(5, 89, 109, 1), fontSize: 14),
              ),
              SizedBox(
           
            height: 40,
            //child: Image.asset('fitness_app/alpha.png'),
          )
              ],
            ),
          ),
          const SizedBox(
            width: 60,
            height: 60,
            //child: Image.asset('fitness_app/alpha.png'),
          )
        ],
      ),
    );
  }



  Widget getSearchBarUI() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 0.0),
       height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(13.0),
          bottomLeft: Radius.circular(13.0),
          topLeft: Radius.circular(13.0),
          topRight: Radius.circular(13.0),
        ),
        
      ),
      
      child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          
                          decoration: InputDecoration(
                            
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 26,
                            ),
                            suffixIcon: const Icon(
                              Icons.mic,
                              color: Color.fromRGBO(5, 89, 109, 1),
                              size: 26,
                            ),
                            labelText: 'Search ',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              
                                borderRadius: BorderRadius.circular(40),
                                ),
                            helperStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color.fromRGBO(5, 89, 109, 1),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

 Widget getSearchBarUI1() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 0.0),
       height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(13.0),
          bottomLeft: Radius.circular(13.0),
          topLeft: Radius.circular(13.0),
          topRight: Radius.circular(13.0),
        ),
        
      ),
      
      child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          
                          decoration: InputDecoration(
                            
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 26,
                            ),
                            suffixIcon: ibtn1(),
                            labelText: 'Search ',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              
                                borderRadius: BorderRadius.circular(40),
                                ),
                            helperStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color.fromRGBO(5, 89, 109, 1),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }






 Widget getSearchBarUI2() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 0.0),
       height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(13.0),
          bottomLeft: Radius.circular(13.0),
          topLeft: Radius.circular(13.0),
          topRight: Radius.circular(13.0),
        ),
        
      ),
      
      child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          
                          decoration: InputDecoration(
                            
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 26,
                            ),
                            suffixIcon: ibtn(),
                            labelText: 'Search ',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              
                                borderRadius: BorderRadius.circular(40),
                                ),
                            helperStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color.fromRGBO(5, 89, 109, 1),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }



Widget ibtn() {
  return Container(
      child: PopupMenuButton(
          icon: Icon(Icons.filter_list,color: Color.fromRGBO(5, 89, 109, 1),),
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                value: "All",
                child: Text("All"),
              ),
              PopupMenuItem<String>(
                value: "Library Catalogue",
                child: Text("Library Catalogue"),
              ),
              PopupMenuItem<String>(
                value: "Title",
                child: Text("Title"),
              ),
              PopupMenuItem<String>(
                value: "Author",
                child: Text("Author"),
              ),PopupMenuItem<String>(
                value: "Subject",
                child: Text("Subject"),
              ),
              PopupMenuItem<String>(
                value: "ISBN",
                child: Text("ISBN"),
              )
            ];
          },
          // onSelected: (value) {
          //   if (value == 0) {
          //     print("My account menu is selected.");
          //   } else if (value == 1) {
          //     print("Settings menu is selected.");
          //   } else if (value == 2) {
          //     print("Logout menu is selected.");
          //   }
          // }
          ));
}

Widget ibtn1() {
  return Container(
      child: PopupMenuButton(
          icon: Icon(Icons.filter_list,color: Color.fromRGBO(5, 89, 109, 1),),
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                value: "All",
                child: Text("All"),
              ),
              PopupMenuItem<String>(
                value: "Bulawayo High Court",
                child: Text("Bulawayo High Court"),
              ),
              PopupMenuItem<String>(
                value: "Chinhoyi High Court",
                child: Text("Chinhoyi High Court"),
              ),
              PopupMenuItem<String>(
                value: "Constitutional Court of Zimbabwe",
                child: Text("Constitutional Court of Zimbabwe"),
              ),PopupMenuItem<String>(
                value: "Gweru High Court",
                child: Text("Gweru High Court"),
              ),
              PopupMenuItem<String>(
                value: "Harare High Court",
                child: Text("Harare High Court"),
              ),PopupMenuItem<String>(
                value: "Bulawayo High Court",
                child: Text("Bulawayo High Court"),
              ),
              PopupMenuItem<String>(
                value: "Mutare High Court",
                child: Text("Mutare High Court"),
              ),PopupMenuItem<String>(
                value: "Masvingo High Court",
                child: Text("Masvingo High Court"),
              ),PopupMenuItem<String>(
                value: "Labour Court",
                child: Text("Labour Court"),
              ),PopupMenuItem<String>(
                value: "Supreme Court",
                child: Text("Supreme Court"),
              ),
            ];
          },
          // onSelected: (value) {
          //   if (value == 0) {
          //     print("My account menu is selected.");
          //   } else if (value == 1) {
          //     print("Settings menu is selected.");
          //   } else if (value == 2) {
          //     print("Logout menu is selected.");
          //   }
          // }
          ));
}










