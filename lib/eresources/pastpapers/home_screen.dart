import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard/eresources/pastpapers/downloads.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dashboard/IntroductionAnimation/action_button.dart';
import 'package:dashboard/Main/expandable_fab.dart';
import 'package:dashboard/Screens/home_screen.dart';
import 'package:dashboard/models/past-exam.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:permission_handler/permission_handler.dart';
import 'item.dart';

class HomeScreenPapers extends StatefulWidget {
  const HomeScreenPapers({super.key});

  @override
  State<HomeScreenPapers> createState() => _HomeScreenPapersState();
}

class _HomeScreenPapersState extends State<HomeScreenPapers> {
  List<PastExam> searchList = [];
int _selectedIconIndex = -1;
  int currentPage = 0;
  int lastPage = 1;
  bool isFetchingMore = false;
  String searchText = '';
  bool _downloading = false;
  double _progress = 0.0;
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();

  void _showErrorSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  void _showSuccessSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  



  Future<void> _downloadFile(String url, String file_name) async {
    try {
      Dio dio = Dio();
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print(_progress);
            setState(() {
              _progress = (received / total * 100);
               
            });
          }
        },
      );

      final bytes = response.data;

      // Request storage permission if not granted
      if (!(await Permission.storage.isGranted)) {
        await Permission.storage.request();
      }

      print(response.statusCode);
      print(response.statusMessage);

      final appDocumentsDirectory = await getExternalStorageDirectory();
      final downloadDirectory =
          Directory('${appDocumentsDirectory!.path}/Download');

      if (!downloadDirectory.existsSync()) {
        downloadDirectory.createSync(recursive: true);
      }

      final file = File('${downloadDirectory.path}/$file_name');
      await file.writeAsBytes(bytes);

      _showSuccessSnackbar('File downloaded successfully!');
    } catch (e) {
      _showErrorSnackbar('Failed to download file: $e');
    } finally {
      setState(() {
        _downloading = false;
        _progress = 0.0;
      });
    }
  }
List<PastExam> _filterSearchResults(String query) {
  return searchList.where((exam) {
    final moduleCode = exam.module_code_id.toLowerCase();
    final fileName = exam.code.toLowerCase();
    final searchQuery = query.toLowerCase();
    return moduleCode.contains(searchQuery) || fileName.contains(searchQuery);
  }).toList();
}

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      print(maxScroll);
      print(currentScroll);
      print(delta);
      if (maxScroll - currentScroll <= delta) {
        this._fetchMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "PAST PAPERS",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17),
          ),
          actions: <Widget>[],
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            onChanged: (value) {
  setState(() {
    searchText = value;
    searchList = _filterSearchResults(searchText);
  });
},
                            decoration: const InputDecoration(
                              hintText: "Search for past papers",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
  icon: Icon(Icons.search),
 onPressed: () async {
  try {
    List<PastExam> searchResults = await PastExamService().index(search: searchText);
    setState(() {
      searchList = searchResults;
    });
  } catch (e) {
    print(e);
  }
},
),
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
        floatingActionButton: ExpandableFab(distance: 120, children: [
          ActionButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Downloads())));
            },
          ),
          ActionButton(
            icon: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) =>  Downloads())));
            },
          ),
          ActionButton(
            icon: const Icon(
              Icons.rss_feed,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) =>  HomeScreen())));
            },
          ),
        ]),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          controller: scrollController,
                          itemCount: searchList.length,
                          itemBuilder: (context, index) {
                            PastExam exams = searchList.elementAt(index);
                            return Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 16),
                                  title: Text(
                                      exams.module_code_id +
                                          '\n' +
                                          'Module Code :' +
                                          exams.code,
                                      style: TextStyle(
                                          color: const Color.fromRGBO(
                                              5, 89, 109, 1))),
                                  subtitle: Text('Written in ' +
                                      exams.month +
                                      ' ' +
                                      exams.year),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
  onPressed: () {
    setState(() {
      _downloading = true;
      _selectedIconIndex = index; // Set the selected index
    });
    _downloadFile(
      "https://app.library.msu.ac.zw/api/get-file/${exams.id}",
      '${exams.name}',
    );
  },
  icon: Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        Icons.download,
        color: _selectedIconIndex == index
            ? Colors.red // Change the color for the selected icon
            : const Color.fromRGBO(5, 89, 109, 1),
      ),
      if (_downloading && _selectedIconIndex == index)
        CircularProgressIndicator(
          value: _progress / 100,
          valueColor: AlwaysStoppedAnimation<Color>(
            _selectedIconIndex == index
                ? Colors.red // Change the color for the selected icon
                : const Color.fromRGBO(5, 89, 109, 1),
          ),
          backgroundColor: Colors.grey,
          strokeWidth: 2,
        ),
      
    ],
  ),
),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  height: 5,
                                  color: const Color.fromRGBO(5, 89, 109, 1),
                                )
                              ],
                            );
                          });
                    }
                    return Center(
                      child: SpinKitFadingCircle(
                        color: const Color.fromRGBO(5, 89, 109, 1),
                      ),
                    );
                  }),
            ),
            if (isFetchingMore)
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Loading..."),
                )
              ]),
          ],
        ));
  }

  Future<bool> _fetchData() async {
    searchList = await PastExamService().index();

    // Sort the searchList in alphabetical order
    searchList.sort((a, b) => a.module_code_id.compareTo(b.module_code_id));

    return true;
  }

  _fetchMoreData() async {
    print("Start");

    if (!isFetchingMore) {
      setState(() {
        isFetchingMore = true;
        print("Set State");
      });
      this.currentPage = this.currentPage + 1;
      List<PastExam> _data =
          await PastExamService().index();
      if (_data.isNotEmpty) {
        setState(() {
          searchList.addAll(_data);
          isFetchingMore = false;
        });
      } else {
        // handle range error here
        print('No more data to fetch. Range Error!');
      }
      print("End");
    }
  }
}



