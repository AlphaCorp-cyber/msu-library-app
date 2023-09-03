
import 'package:dashboard/Main/drawer.dart';
import 'package:dashboard/eresources/constants/size.dart';
import 'package:dashboard/eresources/models/category.dart';

import 'package:dashboard/eresources/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/search_testfield.dart';

class BookDScreen extends StatefulWidget {
  const BookDScreen({Key? key}) : super(key: key);

  @override
  _BookDScreenState createState() => _BookDScreenState();
}

class _BookDScreenState extends State<BookDScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'E-Books',
            textAlign: TextAlign.left,
          ),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: const [
           
            AppTop(),
            Body(),
          ],
        ),
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Collections",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
              
              
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
              
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categoryList[index],
              );
            },
            itemCount: categoryList.length,
          ),
        ],
      ),
    );
  }
}


class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {} ,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}


class AppTop extends StatelessWidget {
  const AppTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color.fromRGBO(5, 89, 109, 1),
            Color.fromRGBO(5, 89, 109, 1),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E-Books",
                style: TextStyle(color: Colors.white),
                
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
