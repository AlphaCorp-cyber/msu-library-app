


import 'package:flutter/material.dart';

import 'package:get/get.dart';


enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  final url = ''.obs;

  final imageList = <String>[].obs;
  
}
