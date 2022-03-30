// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> items = ['January', 'February', 'March'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Learning..')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                leading: Text(
                  'the items',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  debugPrint('tapped-$index');
                  //////////////////////////////// call another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDetails(items[index]),
                    ),
                    //////////////////////////////// end call another page
                  );
                }),
          );
        },
      ),
    );
  }
}

///
/// below is another page
///
class MyDetails extends StatelessWidget {
  final String? month;
  const MyDetails(
    String this.month, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Details Page';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Text('you selected $month'),
    );
  }
}

/*
snackBar showing located below onTap()
              {
                final snackBar = SnackBar(content: Text('you tap-$index'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
*/
