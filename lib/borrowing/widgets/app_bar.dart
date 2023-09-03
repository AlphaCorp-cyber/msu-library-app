import 'package:dashboard/borrowing/sizeconfig.dart';
import 'package:flutter/material.dart';


class Notification extends StatefulWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/notification.png',
      width: SizeConfig.blockSizeHorizontal! * 6.4,
      height: SizeConfig.blockSizeVertical! * 3,
    );
  }
}
