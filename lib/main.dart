import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/orderPage.dart';
import 'package:shop_app/pages/productAddPage.dart';
import 'package:shop_app/pages/productManagerPage.dart';
import 'package:shop_app/pages/shopPage.dart';
import 'package:shop_app/pages/shoppingCartPage.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/widgets/shopItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductManager();
      },
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (_) => ShopPage(),
          OrderPage.route: (_) => OrderPage(),
          ProductManagerPage.route: (_) => ProductManagerPage(),
          ProductAddPage.route: (_) => ProductAddPage(),
          ShopItem.route: (_) => ShopItem(),
          ShoppingCart.route: (_) => ShoppingCart(),
        },
      ),
    );

  }
}
