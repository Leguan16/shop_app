import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _products = [
    Product("Mouse", 20.0,
        "https://media.discordapp.net/attachments/946476628492570624/946476760457965628/unknown.png?width=1214&height=683"),

  ];

  addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> getProducts() {
    return [..._products];
  }

  removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  setProductAsFavorite(Product product, {bool favorite = true}) {
    if (_products.contains(product)) {
      _products[_products.indexOf(product)].setFavorite(favorite);
    }
  }
}
