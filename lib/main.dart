import 'package:flutter/material.dart';
import 'package:morseth_week7/Views/editItemPage.dart';

import 'Models/globalItems.dart';
import 'Models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Morseth Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Item item = Item(1, "Doge", "Dogecoin");
  Item item2 = Item(2, "Sunny", "Cat");

  void _handleButtonPress() {
    setState(() {
      if (!GlobalItems().items.contains(item)) {
        GlobalItems().items.add(item);
      }
      if (!GlobalItems().items.contains(item2)) {
        GlobalItems().items.add(item2);
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditItemPage(
                    item: item,
                    item2: item2,
                  ))).then(((value) => {
            {},
          }));
    });
  }

  void _handleDeleteButtonPress() {
    setState(() {
      if (GlobalItems().items.contains(item)) {
        GlobalItems().items.remove(item);
      }
      if (GlobalItems().items.contains(item2)) {
        GlobalItems().items.remove(item2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Item Information",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Item ID: ${item.Id}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Item Name: ${item.Name}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Item Description ${item.Description}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Item ID: ${item2.Id}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Item Name: ${item2.Name}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Item Description ${item2.Description}",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: _handleButtonPress,
                child: Text("Edit Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
