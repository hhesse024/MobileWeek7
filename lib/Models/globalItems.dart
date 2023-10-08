import 'item.dart';

class GlobalItems {
  static final GlobalItems _items = GlobalItems._instance();
  factory GlobalItems() {
    return _items;
  }

  GlobalItems._instance();

  List<Item> items = [];
}
