// ignore_for_file: file_names

import 'package:flutter/foundation.dart' show ChangeNotifier, kDebugMode;
import 'package:kon_app/data/service/service.dart';

class GetAllProductViewModel extends ChangeNotifier {
  GetAllProductViewModel() {
    getAllProduct();
  }

  ApiService apiService = ApiService();
  var progress = false;
  List products = [];

  getAllProduct() async {
    progress = true;
    products = await apiService.fetchAllProducts();
    if (kDebugMode) {
      print("===================================================================$products");
    }
    progress = false;
  }
}
