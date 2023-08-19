// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:kon_app/data/service/service.dart';

class AddStoreItem extends ChangeNotifier {
  var progress = false;
  ApiService apiService = ApiService();

  add(
    String name,
    String birlik,
    String size,
    int number,
    int zapchast_id,
  ) async {
    await apiService.addStore(name, birlik, size, number, zapchast_id);
  }
}
