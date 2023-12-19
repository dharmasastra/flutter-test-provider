import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/top_data_prover.dart';
import 'package:provider/provider.dart';

class TopPersonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ApiProvider(),
        child: FetchTopPerson(),
      ),
    );
  }
}

class FetchTopPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider'),
      ),
      body: FutureBuilder(
        future: apiProvider.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: apiProvider.datas.length,
              itemBuilder: (context, index) {
                final datas = apiProvider.datas[index];
                return Row(
                  children: [
                    Expanded(child: Text('ID: ${datas.id}')),
                    Expanded(child: Text('Name: ${datas.name}')),
                    Expanded(child: Text('City: ${datas.cityName}')),
                    Expanded(child: Text('Point: ${datas.point}')),
                    Expanded(
                        child: IconButton(
                            onPressed: () {
                              // Provider.of<ApiProvider>(context, listen: false)
                              //     .deleteData(datas.id);
                            },
                            icon: Icon(Icons.delete))),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
