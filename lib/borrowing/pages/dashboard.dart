import 'package:dashboard/borrowing/constant.dart';
import 'package:dashboard/borrowing/models/model.dart';
import 'package:dashboard/borrowing/sizeconfig.dart';
import 'package:dashboard/borrowing/widgets/custom_card.dart';
import 'package:dashboard/borrowing/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final List<CardModel> data = [];
  final List<MenuModel> menus = [];

  void getPostData() {
    List<dynamic> responseList = cardConstant;
    for (var element in responseList) {
      data.add(CardModel.fromJson(element));
    }
    List<dynamic> responseMap = menuConstant;
    for (var menu in responseMap) {
      menus.add(MenuModel.fromJson(menu));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    getPostData();
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListViewDashboard(data: data),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3.7),
            
            
            GridViewDashboard(menus: menus),
          ],
        ),
       
            );
  }
}

class GridViewDashboard extends StatelessWidget {
  const GridViewDashboard({
    Key? key,
    required this.menus,
  }) : super(key: key);

  final List<MenuModel> menus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal! * 86.9,
        height: SizeConfig.blockSizeVertical! * 35.5,
        child: Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomMenu(
                    menu: menus[index].menu!,
                    imagePath: menus[index].imagePath!);
              }),
        ),
      ),
    );
  }
}

class ListViewDashboard extends StatelessWidget {
  const ListViewDashboard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<CardModel> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 32.5,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeVertical! * 6.4,
              vertical: SizeConfig.blockSizeVertical! * 3.7),
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 5.3,
            );
          },
          itemBuilder: (context, index) {
            return CustomCard(
                color: data[index].color!,
                balance: data[index].balance!,
                cardNumber: data[index].cardNumber!);
          }),
    );
  }
}
