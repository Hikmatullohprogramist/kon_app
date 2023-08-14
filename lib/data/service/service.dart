// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart' as DIO;
import 'package:dio/dio.dart';
import 'package:kon_app/data/model/login_response.dart';
import 'package:get/get.dart';
import 'package:kon_app/data/model/store_model.dart';
import 'package:kon_app/utils/constantas.dart';

class ApiService {
  late final DIO.Dio dio;

  ApiService() {
    dio = DIO.Dio();
    dio.options.baseUrl = BASE_URL;
  }

  var headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ3d3ciLCJleHAiOjIyMDc5OTU2ODB9.GW27gafBab-LOHtZrqVnGi3ejV-CIoZrxOKJiBAkSTM'
  };

  //Ombor
  // Future<List<StoreModel>> getStoreItems() async {
  //   return [];
  // }
//zapchast
//savdo
//haridorlar
//kassa
//  user auth
  Future<List<StoreModel>> fetchAllProducts() async {
    try {
      final response = await dio.request(
        "storage/?status=true&id=0&zapchast_id=0&start_date=0001-01-01&end_date=9999-12-31&page=1&limit=25",
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        return responseData.map((json) => StoreModel.fromJson(json)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<LoginResponse?> login(String username, String password) async {
    try {
      var data = DIO.FormData.fromMap({
        'username': username,
        'password': password,
      });

      final response = await dio.post("auth/token", data: data);
      print(response.data);
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        Get.snackbar("ERROR", response.statusMessage.toString());
        print(
            "BIZDAA ERROR ==========================================${response.statusMessage}");
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
      print(
          "BIZDAA ERROR ==========================================${e.toString()}");
    }
    return null;
  }

  // Future<List<StoreModel>> getAllProducts() async {
  //   try {} catch (e) {
  //     print(e);
  //   }
  //
  //   return [];
  // }

//user
//phone
//orders
//storage
//file section
//type section
}
