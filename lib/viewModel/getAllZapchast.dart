// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kon_app/data/service/service.dart';
import 'package:kon_app/views/store_page/store_page.dart';

class GetAllZapchastViewModel extends ChangeNotifier {
  GetAllZapchastViewModel() {
    getAllZapchast();
  }

  ApiService apiService = ApiService();
  var progress = false;
  List productZapchast = [];

  getAllZapchast() async {
    progress = true;
    notifyListeners();
    productZapchast = await apiService.fetchAllZapchast();
    if (kDebugMode) {
      print(
          "===================================================================$productZapchast");
    }
    progress = false;
    notifyListeners();
  }

  addZapchast(
    String name,
    String birlik,
    int type_id,
    String size,
    int number,
  ) async {
    var data = await apiService.addStoreZapchast(name, birlik, type_id, size, number);

    if (data.isNotEmpty) {
      Get.offAll(const StorePage());
    }
  }
}
