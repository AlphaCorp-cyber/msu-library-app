import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/borrowing/sizeconfig.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final int balance;
  final int cardNumber;
  const CustomCard(
      {Key? key,
      required this.color,
      required this.balance,
      required this.cardNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal! * 6.4),
        
        width: SizeConfig.blockSizeHorizontal! * 80,
        height: SizeConfig.blockSizeVertical! * 30.4,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.blockSizeVertical! * 3.7))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3.7,
              ),
              Text('Summary',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontSize: SizeConfig.blockSizeHorizontal! * 6.0,
                      fontWeight: FontWeight.bold)),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1.5),
              Text('Borrowed overal       : $balance ',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.0,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1.2),
              Text(
                'Current Borrowed    : $balance',
                style: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontFamily: 'Poppins',
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1.2),
              Text('Amount Overdue      : \$ $balance',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.0,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
