import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dashboard/eresources/pastpapers/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  Future<List<FileSystemEntity>> getDownloadedFiles() async {
    final appDocumentsDirectory = await getExternalStorageDirectory();
    
    final downloadsDirectory =
        Directory('${appDocumentsDirectory?.path}/Download');
    if (downloadsDirectory.existsSync()) {
      List<FileSystemEntity> files = downloadsDirectory.listSync();
      return files;
    } else {
      return [];
    }
  }

  void _showSuccessSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }
  
 void _showErrorSnackbar(String message) {
    AnimatedSnackBar.material(
      '$message',
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(5, 89, 109, 1),
        title: Text(
          'Confirmation',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to exit?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'No',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    )) ??
        false;
  }
  
  Future<void> _deleteFile(FileSystemEntity file) async {
    try {
      await file.delete();
      _showSuccessSnackbar('File deleted successfully!');
      
      setState(() {
        // Refresh the downloaded files list after deletion
      });
    } catch (e) {
      _showErrorSnackbar('Failed to delete file: ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: FutureBuilder<List<FileSystemEntity>>(
          future: getDownloadedFiles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitCubeGrid(
                  color: Color.fromRGBO(5, 89, 109, 1),
                  size: 50.0,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/null.json', // Replace with the path to your Lottie animation file
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 16),
                    Text('No Downloads Yet.'),
                  ],
                ),
              );
            } else {
              List<FileSystemEntity> downloadedFiles = snapshot.data ?? [];
              if (downloadedFiles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/null.json', // Replace with the path to your Lottie animation file
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(height: 16),
                      Text('No Downloads Yet.'),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: downloadedFiles.length,
                itemBuilder: (context, index) {
                  FileSystemEntity file = downloadedFiles[index];
                  String fileName = file.path.split(Platform.pathSeparator).last;

                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(top: 10, left: 16),
                        title: Text(
                          fileName.toUpperCase(),
                          style: TextStyle(
                            color: const Color.fromRGBO(5, 89, 109, 1),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PDFViewerPage(path: file.path),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: const Color.fromRGBO(5, 89, 109, 1),
                              ),
                            ),
                            IconButton(
                              onPressed: () => _deleteFile(file),
                              icon: const Icon(
                                Icons.delete,
                                color: const Color.fromRGBO(5, 89,109, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}