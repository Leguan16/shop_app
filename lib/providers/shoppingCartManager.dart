import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/domain/shoppingCartItem.dart';

class ShoppingCartManager with ChangeNotifier {
  final List<ShoppingCartItem> _items = [];

  void addToCart(Product product, {int? count}) {
    var index = _items.indexWhere((element) => element.product == product);

    if (index == -1) {
      _items.add(ShoppingCartItem(product, 1));
    } else {
      var item = _items.removeAt(index);
      _items.add(ShoppingCartItem(product, item.count + 1));
    }
    notifyListeners();
  }

  ShoppingCartItem? removeAllFromCart(Product product) {

    int index = _items.indexWhere((element) => element.product == product);
    ShoppingCartItem? item;

    if (index != -1) {
      item = _items.removeAt(index);
    }
    notifyListeners();

    return item;
  }

  void removeOneFromCart(Product product) {
    var index = _items.indexWhere((element) => element.product == product);

    if (index != -1) {
      var item = _items.removeAt(index);
      _items.add(ShoppingCartItem(product, item.count - 1));
    }
    notifyListeners();
  }

  double getTotalPrice() {
    if (_items.isNotEmpty) {
      return _items
          .map((e) => e.product.price * e.count)
          .reduce((value, element) => value += element);
    }
    return 0.0;
  }

  List<ShoppingCartItem> getItems() {
    return [..._items];
  }
}
