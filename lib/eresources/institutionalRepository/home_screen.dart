
import 'package:flutter/material.dart';

import 'item.dart';

class HomeScreenIR extends StatefulWidget {
  const HomeScreenIR({super.key});

  @override
  State<HomeScreenIR> createState() => _HomeScreenIRState();
}

class _HomeScreenIRState extends State<HomeScreenIR> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    List<Item> searchList = ITEM_LIST
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "INSTITUTIONAL REPOSITORY",
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17),
        ),
        actions: <Widget>[
          
        ],
        bottom: PreferredSize(
          preferredSize: const Size(3, 130),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: controller,
                      onFieldSubmitted: (covariant) {
                        setState(() {
                          text = covariant;
                        });
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Search the Institutional Repository",
                          hintStyle: TextStyle(fontSize: 15)),
                    )),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const SizedBox(width: 10),
                      _allItems(""),
                      const SizedBox(width: 10),
                      _singleItem("Publication"),
                      const SizedBox(width: 10),
                      _singleItem("Reseacher Profiles"),
                      const SizedBox(width: 10),
                      _singleItem("Organizations"),
                      const SizedBox(width: 10),
                      _singleItem("Journals"),
                      const SizedBox(width: 10),
                      _singleItem("Fundings"),
                      const SizedBox(width: 10),
                      _singleItem("Events"),
                      const SizedBox(width: 10),
                      
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 3),
                    child: Text(
                      "Search for: $text",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 75,
                      width: 75,
                      child: Image.network(
                        searchList[index].imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            searchList[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                      Icons.adb,
                                      color: const Color.fromRGBO(5, 89, 109, 1),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                      Icons.code,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              searchList[index].favorite == 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            searchList[index].favorite++;
                                          });
                                        },
                                      ),
                                    )
                                  : Row(
                                      children:  <Widget>[
                                        IconButton(
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),

                                          onPressed: () {
                                            setState(() {
                                              searchList[index].favorite--;
                                            });
                                          },
                                        )
                                      ],
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _allItems(String searchText) {
    return ElevatedButton(
       
        
        style: ButtonStyle(backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(5, 89, 109, 1)) ),
        child: const Text(
          "all",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        },
        );
  }

  Widget _singleItem(String searchText) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(5, 89, 109, 1)) ),
        child: Text(
          searchText,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        },
        );
  }
}
