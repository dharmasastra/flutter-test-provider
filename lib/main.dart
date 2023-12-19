import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/person_data_provider.dart';
import 'package:flutter_provider/views/form.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonDataProvider(),
      child: MaterialApp(
        title: 'Flutter Provider',
        home: MyForm(),
      ),
    );
  }
}