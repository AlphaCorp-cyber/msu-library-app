// ignore_for_file: unnecessary_null_comparison, unused_local_variable, deprecated_member_use

import 'package:dashboard/Main/ui_view/mediterranean_diet_view.dart';
import 'package:dashboard/borrowing/OverDue.dart';
import 'package:dashboard/borrowing/borrowed.dart';
import 'package:dashboard/borrowing/dueTomorrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:lottie/lottie.dart';

import '../const.dart';

class Notifica extends StatefulWidget {
  @override
  _NotificaState createState() => _NotificaState();
}

class _NotificaState extends State<Notifica> {
  List<dynamic>? total = [];
  List<dynamic>? DueT = [];
  List<dynamic>? OverD = [];
  bool isLoading = false;
  var reg_num = box.read('username');
 
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  void initState() {
    super.initState();
    fetchAll();
    fetchDueTomorrow();
    fetchOverDue();
  }

  fetchAll() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.parse("https://app.library.msu.ac.zw/api/borrowers/all/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        total = items;
        isLoading = false;
      });
    } else {
      total = [];
      isLoading = false;
    }
  }

  fetchOverDue() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "https://app.library.msu.ac.zw/api/borrowers/overdue/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        OverD = items;
        isLoading = false;
      });
    } else {
      OverD = [];
      isLoading = false;
    }
  }

  fetchDueTomorrow() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "https://app.library.msu.ac.zw/api/borrowers/due-tomorrow/$reg_num"));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        DueT = items;
        isLoading = false;
      });
    } else {
      DueT = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          title: const Center(child: Text("Borrowing")),
        ),
        body: getBody(),
        floatingActionButtonLocation: selectedfABLocation,
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
                  return ElevatedButton(
                    onPressed: toggleChildren,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 18),
                    ),
                    child: const Text(
                      "Custom Dial Root",
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                }
              : null,
          buttonSize:
              buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend
              ? const Text("Open")
              : null, // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.timelapse_outlined) : null,
              backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
              foregroundColor: Colors.red,
              label: 'Overdue',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const OverDue())));
              },
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.data_usage_sharp) : null,
              backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
              foregroundColor: Colors.white,
              label: 'Due Tomorrow',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const DueTomorrow())));
              },
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.book_sharp) : null,
              backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
              foregroundColor: Colors.white,
              label: 'Borrowed',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const Borrowed())));
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: selectedfABLocation ==
                    FloatingActionButtonLocation.startDocked
                ? MainAxisAlignment.end
                : selectedfABLocation == FloatingActionButtonLocation.endDocked
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    // ignore: prefer_is_empty
    if (total!.contains(null) || isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: const Color.fromRGBO(5, 89, 109, 1),
        ),
      );
    }
    return total == null || total!.isEmpty 
    ? Container(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          
          child: Lottie.asset(
            'assets/null.json',
            width: 200,
          
          ),
        ),
        SizedBox(height: 16),
        Text(
          'You havent borrowed any books!',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  ),
)
    : ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          var due = OverD![index];
          return getCard();
        },
      );
  }

  Widget getCard() {
    //var fullName = item['name']['title']+" "+item['name']['first']+" "+item['name']['last'];

  var length = total?.length.toString() ?? 'Loading';
  var lengthD = DueT?.length.toString() ?? 'Loading';
  var lengthO = OverD?.length.toString() ?? 'Loading';
  var dueDate = due;

    int daysBetween(DateTime from, DateTime to) {
        if (from == null || to == null) {
      return 0;
    }
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    final DateTime now = DateTime.now();

    final difference = daysBetween(dueDate, now);
    print(difference);

    var penalty = (difference * 0.25).toString();

    
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Summary',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: Color.fromRGBO(5, 89, 109, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          //child: Image.asset('fitness_app/alpha.png'),
                        ),
                        length == null
                            ? const Text('Loading')
                            : Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "Borrowed Books                   : " +
                                    length,
                                style: const TextStyle(
                                    color: Color.fromRGBO(5, 89, 109, 1),
                                    fontSize: 14),
                              ),
                        const SizedBox(
                          height: 5,
                          //child: Image.asset('fitness_app/alpha.png'),
                        ),
                        lengthD == null
                            ? const Text('Loading')
                            : Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "Books Due Tomorrow              : " +
                                    lengthD,
                                style: const TextStyle(
                                    color: Color.fromRGBO(5, 89, 109, 1),
                                    fontSize: 14),
                              ),
                        const SizedBox(
                          height: 5,
                          //child: Image.asset('fitness_app/alpha.png'),
                        ),
                        lengthO == null
                            ? const Text('Loading')
                            : Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "Books OverDue                       : " +
                                    lengthO,
                                style: const TextStyle(
                                    color: Color.fromRGBO(5, 89, 109, 1),
                                    fontSize: 14),
                              ),
                        const SizedBox(
                          height: 5,
                          //child: Image.asset('fitness_app/alpha.png'),
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          "Amount Overdue                          : \$" +
                              penalty,
                          style: const TextStyle(
                              color: Color.fromRGBO(5, 89, 109, 1),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                  height: 60,
                  //child: Image.asset('fitness_app/alpha.png'),
                )
              ],
            ),
          ),
        ));
  }
}

extension EnumExt on FloatingActionButtonLocation {
  /// Get Value of The SpeedDialDirection Enum like Up, Down, etc. in String format
  String get value => toString().split(".")[1];
}
