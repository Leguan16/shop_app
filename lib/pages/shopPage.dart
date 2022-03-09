import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/shoppingCartPage.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';
import 'package:shop_app/widgets/productView.dart';
import 'package:shop_app/widgets/shopItem.dart';

class ShopPage extends StatelessWidget {
  List<ShopItem> shoppingCart = [];

  ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          Badge(
            position: BadgePosition.topEnd(top: 5, end: 5),
            badgeContent: Text(shoppingCart.length.toString()),
            showBadge: shoppingCart.isNotEmpty,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed(ShoppingCart.route),
            ),
          ),
        ],
      ),
      drawer: ShopDrawer(),
      body: ProductView(),
    );
  }
}
