import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _products = [
    Product(
        "Mouse 1",
        20.0,
        "https://media.discordapp.net/attachments/946476628492570624/946476760457965628/unknown.png?width=1214&height=683",
        "Mouse description"),
    Product(
      "Mouse 2",
      30.0,
      "https://media.discordapp.net/attachments/548926343421886464/946483857153204224/IMG_20220224_191108.jpg?width=871&height=683",
      "You can make good note block covers with it!"
    ),
    Product(
      //beabsichtigt
      "House",
      23,
      "https://media.discordapp.net/attachments/548926343421886464/951253588603191306/IMG_8349.jpg?width=512&height=683",
      "i don't know yet"
    )
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
      _products[_products.indexOf(product)].isFavorite = favorite;
    }
  }
}
