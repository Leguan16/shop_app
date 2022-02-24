import 'package:flutter/material.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';

class ProductManagerPage extends StatelessWidget {
  const ProductManagerPage({Key? key}) : super(key: key);

  static const String route = '/product_manager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: ShopDrawer(),
    );
  }
}
