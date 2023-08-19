// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'dart:convert';

import 'package:dio/dio.dart' as DIO;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kon_app/data/model/login_response.dart';
import 'package:get/get.dart';
import 'package:kon_app/data/model/store_model.dart';
import 'package:kon_app/data/model/zapchast_model.dart';
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

  //Store
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

  Future<Map<String, dynamic>> addStore(String name, String birlik, String size,
      int number, int zapchast_id) async {
    try {
      var data = json.encode({
        "name": name,
        "birlik": birlik,
        "size": size,
        "number": number,
        "zapchast_id": zapchast_id
      });
      var response = await dio.post("storage/add",
          data: data,
          options: Options(
            headers: headers,
          ));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            response.data; // Assuming the response is a JSON object
        Get.snackbar("SUCCESS", "Store added successfully");
        return responseData;
      }
    } on DioException catch (e) {
      Get.snackbar("ERROR", e.toString());
      // You might want to throw the exception here to handle it higher up in the calling code.
      rethrow;
    }
    return {}; // Return an empty map or null here, depending on your use case.
  }

//zapchast
  Future<List<ZapchastModel>> fetchAllZapchast() async {
    try {
      final response = await dio.request(
        "zapchast/?status=true&id=0&type_id=0&start_date=0001-01-01&end_date=9999-12-31&page=1&limit=25",
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        return responseData
            .map((json) => ZapchastModel.fromJson(json))
            .toList();
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<Map<String, dynamic>> addStoreZapchast(
      String name, String birlik, int type_id, String size, int number) async {
    try {
      var data = json.encode({
        "name": name,
        "birlik": birlik,
        "type_id": type_id,
        "size": size,
        "number": number
      });
      var response = await dio.post("zapchast/add",
          data: data,
          options: Options(
            headers: headers,
          ));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        Get.snackbar("SUCCESS", "zapchast Store added successfully");
        return responseData;
      } else {
        Get.snackbar("ERROR", response.statusMessage.toString());
      }
    } on DioException catch (e) {
      Get.snackbar("ERROR", e.toString());
      rethrow;
    }
    return {};
  }

  //auth
  Future<LoginResponse?> login(String username, String password) async {
    try {
      var data = DIO.FormData.fromMap({
        'username': username,
        'password': password,
      });

      final response = await dio.post("auth/token", data: data);
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        Get.snackbar("ERROR", response.statusMessage.toString());
        if (kDebugMode) {
          print(
              "BIZDAA ERROR ==========================================${response.statusMessage}");
        }
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
      if (kDebugMode) {
        print(
            "BIZDAA ERROR ==========================================${e.toString()}");
      }
    }
    return null;
  }
}
