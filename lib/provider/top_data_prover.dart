import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/person.dart';

class ApiProvider with ChangeNotifier {
  Dio _dio = Dio();
  List<TopPerson> _data = [];
  List<TopPerson> get datas => _data;

  Future<void> fetchData() async {
    try {
      final response = await _dio.get(
        'http://127.0.0.1:8000/api/top-persons',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      final List<dynamic> data = response.data;
      _data = data.map((json) => TopPerson.fromJson(json)).toList();
      notifyListeners();
      // if (response.statusCode == 200) {
      //   data = (response.data as List)
      //       .map((json) => TopPerson.fromJson(json))
      //       .toList();
      //   notifyListeners();
      // }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // Future<void> deleteData(int id) async {
  //   try {
  //     // Make a DELETE request using Dio
  //     await _dio.delete('http://127.0.0.1:8000/api/person/$id');

  //     // Notify listeners that the data has been deleted
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle errors, e.g., show an error message
  //     print('Error deleting data: $error');
  //   }
  // }
}
