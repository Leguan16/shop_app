import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  static const route = "/cart";

  @override
  Widget build(BuildContext context) {
    final ShoppingCartManager shoppingCartManager =
        Provider.of<ShoppingCartManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 12,
            child: Row(
              children: [
                Text("Total"),
                SizedBox(
                  width: 200,
                ),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  badgeContent: Text(
                      shoppingCartManager.getTotalPrice().toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(onPressed: () {}, child: Text("order now"))
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: shoppingCartManager.getItems().length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("HAHA"),
              );
            },
          )
        ],
      ),
    );
  }
}
