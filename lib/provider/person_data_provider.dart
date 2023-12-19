import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/person.dart';

class PersonDataProvider extends ChangeNotifier {
  late Dio _dio;

  PersonDataProvider() {
    _dio = Dio();
  }

  Future<void> submitUserData(Person person) async {
    try {
      final response = await _dio.post(
        'http://127.0.0.1:8000/api/person',
        data: person.toJson(),
      );

      if (response.statusCode == 201) {
        // Handle success
        print('Data submitted successfully');
      } else {
        // Handle error
        print('Failed to submit data');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }
}