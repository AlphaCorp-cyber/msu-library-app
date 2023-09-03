import 'package:dashboard/borrowing/sizeconfig.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final String menu;
  final String imagePath;
  const CustomMenu({Key? key, required this.menu, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal! * 24,
      height: SizeConfig.blockSizeVertical! * 15,
      decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.blockSizeHorizontal! * 24,
            height: SizeConfig.blockSizeVertical! * 11.1,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 6.4))),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/$imagePath',
                  width: SizeConfig.blockSizeHorizontal! * 9.1,
                  height: SizeConfig.blockSizeVertical! * 3.5,
                ),
                
              ),
              Expanded(
                child: Text(
            menu,
            style: TextStyle(
                  color: const Color.fromRGBO(5, 89, 109, 1),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
          ),
              )
            ]),
          ),
          
        ],
      ),
    );
  }
}
