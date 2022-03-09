import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/orderPage.dart';
import 'package:shop_app/pages/productAddPage.dart';
import 'package:shop_app/pages/productManagerPage.dart';
import 'package:shop_app/pages/shopPage.dart';
import 'package:shop_app/pages/shoppingCartPage.dart';
import 'package:shop_app/providers/orderManager.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';
import 'package:shop_app/widgets/shopItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductManager>(create: (_) => ProductManager(),),
        ChangeNotifierProvider<ShoppingCartManager>(create: (_) => ShoppingCartManager(),),
        ChangeNotifierProvider<OrderManager>(create: (_) => OrderManager(),)
      ],
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
