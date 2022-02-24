import 'package:flutter/material.dart';
import 'package:shop_app/pages/productManager.dart';

class ShopDrawer extends StatelessWidget {
  ShopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> drawerContent = [
      ListTile(
        leading: Icon(Icons.shop),
        title: Text("Shop"),
        onTap: () => Navigator.of(context).pushNamed("/"),
      ),
      ListTile(
        leading: Icon(Icons.credit_card),
        title: Text('Orders'),
        onTap: () => Navigator.of(context).pushNamed("/orders"),
      ),
      ListTile(
        leading: Icon(Icons.edit),
        title: Text('Manage Producs'),
        onTap: () =>
            Navigator.of(context).pushNamed(ProductManagerPage.route),
      )
    ];

    return ListView.separated(
        itemBuilder: (context, index) {
          return drawerContent[index];
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: drawerContent.length);
  }
}
