import 'package:flutter/material.dart';
import 'package:flutter_provider/models/person.dart';
import 'package:flutter_provider/provider/person_data_provider.dart';
import 'package:flutter_provider/views/fetch_top_person.dart';
import 'package:provider/provider.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _pointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Provider'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City Id'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _pointController,
                decoration: const InputDecoration(labelText: 'Point'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Access the provider and submit data
                  final userDataProvider =
                      Provider.of<PersonDataProvider>(context, listen: false);
      
                  final person = Person(
                    name: _nameController.text,
                    cityId: int.parse(_cityController.text),
                    point: int.parse(_pointController.text),
                  );
      
                  userDataProvider.submitUserData(person);
                },
                child: const Text('Submit'),
              ),

               ElevatedButton(
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopPersonView()));
                },
                child: const Text('Top Person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}