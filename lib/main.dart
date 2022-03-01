import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/orderPage.dart';
import 'package:shop_app/pages/productAddPage.dart';
import 'package:shop_app/pages/productManagerPage.dart';
import 'package:shop_app/pages/shopPage.dart';
import 'package:shop_app/providers/productManager.dart';

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
          '/': (context) => ShopPage(),
          OrderPage.route: (context) => OrderPage(),
          ProductManagerPage.route: (context) => ProductManagerPage(),
          ProductAddPage.route: (context) => ProductAddPage(),
        },
      ),
    );

  }
}
