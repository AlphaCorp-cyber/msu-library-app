// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreenEbooks extends StatefulWidget {
  @override
  _HomeScreenEbooksState createState() => _HomeScreenEbooksState();
}

class _HomeScreenEbooksState extends State<HomeScreenEbooks> {
  List<dynamic> searchData = [];
  bool _downloading = false;
  bool isLoading = false;
  double _progress = 0.0;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

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
  Widget _buildProgressIndicatorWidget() {
  return Center(
    child: LinearProgressIndicator(color: const Color.fromRGBO(5, 89, 109, 1),backgroundColor: Colors.white,)
  );
}

  Future<void> fetchAllData() async {
      setState(() {
    isLoading = true;
  });
  
    try {
      final response = await http
          .get(Uri.parse('https://app.library.msu.ac.zw/api/ebook'));
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        final dynamic decodedData = json.decode(responseBody);
        // print(decodedData);

        if (decodedData is List<dynamic>) {
          setState(() {
            searchData = decodedData;
          });
        } else if (decodedData is Map<String, dynamic>) {
          setState(() {
            searchData = [decodedData];
          });
        } else {
          print('Invalid data format');
        }
      } else {
        // Handle error
        _showErrorSnackbar('Error fetching data');
        print('Error fetching data: ${response.statusCode}');
        
        
      }
    } catch (error) {
      // Handle network or API-related errors
      _showErrorSnackbar('Network Error ');
      print('Network Error: $error');
     
    } finally {
    setState(() {
      isLoading = false;
    });
  }
  
  }

  Future<void> fetchData(String query) async {
      setState(() {
    isLoading = true;
  });
    try {
      final response = await http.get(Uri.parse(
          'https://app.library.msu.ac.zw/api/ebook/search/$query'));
      if (response.statusCode == 200) {
        final String responseBody = response.body;
        final dynamic decodedData = json.decode(responseBody);

        if (decodedData is List<dynamic>) {
          setState(() {
            decodedData.sort((a, b) => a
                .toString()
                .toLowerCase()
                .compareTo(b.toString().toLowerCase()));
            searchData = decodedData;
            print(searchData);
          });
        } else if (decodedData is Map<String, dynamic>) {
          setState(() {
            searchData = [decodedData];
            print(searchData);
          });
        } else {
          print('Invalid data format');
        }
      } else {
        _showErrorSnackbar('Error fetching data');
        print('Error fetching data: ${response.statusCode}');
      }
    } catch (error) {
     _showErrorSnackbar('Network Error ');
      print('Error fetching data: $error');
    } finally {
    setState(() {
      isLoading = false;
    });
  }
  }

  String removeTextAfterFirstUnderscore(String input) {
    final underscoreIndex = input.indexOf('_');
    if (underscoreIndex != -1) {
      return input.substring(0, underscoreIndex);
    }
    return input; // Return the input string as is if no underscore is found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 89, 109, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "EBOOKS",
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17),
        ),
            iconTheme: IconThemeData(
          color: Colors.white, // This changes the drawer icon to white
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
                          cursorColor: Colors.black38,
                          textAlign: TextAlign.justify,
                          controller: controller,
                          onChanged: (value) {
                            if (value == '') {
                              fetchAllData();
                            } else { 
                              fetchData(value);
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            hintText: "Search for ebooks",
                            hintStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        
                        icon: Icon(Icons.search,color: const Color.fromRGBO(5, 89, 109, 1),),
                        onPressed: () {
                          fetchData(controller.text);
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
                      "Result",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700,color: const Color.fromRGBO(5, 89, 109, 1)),
                    )),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: ExpandableFab(distance: 120, children: [
      //   ActionButton(
      //     icon: const Icon(
      //       Icons.home,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //           builder: ((context) => const FitnessAppHomeScreen())));
      //     },
      //   ),
      //   ActionButton(
      //     icon: const Icon(
      //       Icons.file_download_sharp,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: ((context) => Downloads())));
      //     },
      //   ),
      //   ActionButton(
      //     icon: const Icon(
      //       Icons.rss_feed,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).push(
      //           MaterialPageRoute(builder: ((context) => HomeScreen())));
      //     },
      //   ),
      // ]),
      body: Column(
        
        children: [
          if (isLoading) _buildProgressIndicatorWidget(
            
          ),
          Expanded(
            child: ListView.builder(
              
              itemCount: searchData.length,
              itemBuilder: (context, index) {
                final item = searchData[index];
                final dataList = item['data'];
                return Column(
                  
                  children: dataList.map<Widget>((data) {
                    // ignore: unused_local_variable
                    final title = data['title'] ?? '';
                    final desc = data['description'] ?? '';
                    final url = data['url'] ?? '';
                    return Column(
                      
                      children: [
                        
                        ListTile(
                           onTap: () async {
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  //mode: LaunchMode.externalNonBrowserApplication
                                );
                              } else {
                                throw 'Could not launch ';
                              }
                            },
                          contentPadding: EdgeInsets.only(top: 10, left: 16),
                          title: Text(
                            title ,maxLines: 2,
  overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color.fromRGBO(5, 89, 109, 1)),
                          ),
                          subtitle: Text(desc,maxLines: 2,
  overflow: TextOverflow.ellipsis,),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _downloading = true;
                                  });
                                  _downloadFile(
                                      'https://www.tutorialspoint.com/cplusplus/cpp_tutorial.pdf',
                                      'cs.pdf');
                                },
                                icon: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    
                                    if (_downloading)
                                      CircularProgressIndicator(
                                        value: _progress / 100,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                const Color.fromRGBO(
                                                    5, 89, 109, 1)),
                                        backgroundColor: Colors.grey,
                                        strokeWidth: 2,
                                      ),
                                      
                                  ],
                                ),
                              )
                              
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
                  }).toList(),
                  
                );
              },
            ),
          ),
        ],
        
      ),
      
    );
  }
}
