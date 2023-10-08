import 'package:flutter/material.dart';

import '../Models/globalItems.dart';
import '../Models/item.dart';

class EditItemPage extends StatefulWidget {
  final Item item;
  final Item item2;
  const EditItemPage({
    Key? key,
    required this.item,
    required this.item2,
  }) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState(item, item2);
}

class _EditItemPageState extends State<EditItemPage> {
  _EditItemPageState(item, item2);

  late Item item = widget.item;
  late Item item2 = widget.item2;

  TextEditingController itemNameController = new TextEditingController();
  TextEditingController itemDescriptionController = new TextEditingController();
  TextEditingController itemNameController2 = new TextEditingController();
  TextEditingController itemDescriptionController2 =
      new TextEditingController();

  @override
  void initState() {
    super.initState();

    itemNameController.text = item.Name;
    itemDescriptionController.text = item.Description;
    itemNameController2.text = item2.Name;
    itemDescriptionController2.text = item2.Description;
  }

  void _updateItemPressed() {
    Item currentItem = GlobalItems()
        .items
        .firstWhere((index) => index.Id == item.Id || index.Id == item2.Id);

    if (currentItem.Name != itemNameController.text ||
        currentItem.Description != itemDescriptionController.text) {
      currentItem.Name = itemNameController.text;
      currentItem.Description = itemDescriptionController.text;
    }
    Navigator.pop(context);
  }

  void _removeItemPressed() {
    {
      if (GlobalItems().items.contains(item)) {
        GlobalItems().items.remove(item);
        _EditItemPageState;
      }
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("Edit Item")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: itemNameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: itemDescriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                TextField(
                  controller: itemNameController2,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: itemDescriptionController2,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                ElevatedButton(
                  onPressed: _updateItemPressed,
                  child: const Text("Update Item"),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: _removeItemPressed,
                ),
              ],
            ),
          )),
    );
  }
}
