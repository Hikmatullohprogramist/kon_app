// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kon_app/data/service/service.dart';
import 'package:kon_app/views/home_page/home_page.dart';

class AuthModel extends ChangeNotifier {
  ApiService apiService = ApiService();
  var progress = false;

  void login(String phone, String password) async {
    progress = true;
    notifyListeners();
    var data = await apiService.login(phone, password);
    progress = false;
    notifyListeners();
    if (data != null) {
      // getIt.get<PrefUtils>().setToken(data.accessToken);
      Get.offAll(const HomePage());
    }
  }

  // void registration(String fullname, String phone, String password) async {
  //   progress = true;
  //   notifyListeners();
  //   var data = await apiService.registration(fullname, phone, password);
  //   progress = false;
  //   notifyListeners();
  //   if (data != null) {
  //     getIt.get<PrefUtils>().setToken(data.accessToken);
  //     Get.offAll(const HomePage());
  //   }
  // }
}
