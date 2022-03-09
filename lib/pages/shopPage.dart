import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/shoppingCartPage.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';
import 'package:shop_app/widgets/productView.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key? key}) : super(key: key);

  static bool favOnly = false;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {


  @override
  Widget build(BuildContext context) {
    final ShoppingCartManager shoppingCartManager =
        Provider.of<ShoppingCartManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Show Favorites"),
                onTap: () => setState(() {
                  ShopPage.favOnly = true;
                }),
              ),
              PopupMenuItem(
                child: Text("Show All"),
                onTap: () => setState(() {
                  ShopPage.favOnly = false;
                }),
              ),
            ],
          ),
          Badge(
            position: BadgePosition.topEnd(top: 5, end: 5),
            badgeContent:
                Text(shoppingCartManager.getItems().length.toString()),
            showBadge: shoppingCartManager.getItems().isNotEmpty,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(ShoppingCart.route),
            ),
          ),
        ],
      ),
      drawer: ShopDrawer(),
      body: ProductView(),
    );
  }
}
