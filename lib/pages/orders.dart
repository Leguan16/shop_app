import 'package:flutter/material.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const route = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: ShopDrawer(),
    );
  }
}
