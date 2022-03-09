import 'package:flutter/material.dart';
import 'package:shop_app/pages/orderPage.dart';
import 'package:shop_app/pages/productManagerPage.dart';

class ShopDrawer extends StatelessWidget {
  ShopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> drawerContent = [
      ListTile(
        leading: const Icon(Icons.shop),
        title: const Text("Shop"),
        onTap: () => Navigator.of(context).pushReplacementNamed("/"),
      ),
      ListTile(
        leading: const Icon(Icons.credit_card),
        title: const Text('Orders'),
        onTap: () => Navigator.of(context).pushReplacementNamed(OrderPage.route),
      ),
      ListTile(
        leading: const Icon(Icons.edit),
        title: const Text('Manage Producs'),
        onTap: () => Navigator.of(context).pushReplacementNamed(ProductManagerPage.route),
      )
    ];

    return Drawer(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return drawerContent[index];
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
          itemCount: drawerContent.length),
    );
  }
}
