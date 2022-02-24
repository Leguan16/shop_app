import 'package:flutter/material.dart';
import 'package:shop_app/pages/orders.dart';
import 'package:shop_app/pages/productManager.dart';
import 'package:shop_app/widgets/shopMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ShopMenu(),
        OrderPage.route: (context) => OrderPage(),
        ProductManagerPage.route: (context) => ProductManagerPage(),
      },
    );

  }
}