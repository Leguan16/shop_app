import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/domain/shoppingCartItem.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key? key}) : super(key: key);

  static const route = "/cart";

  static final List<ShoppingCartItem> _shoppingCart = [];

  @override
  Widget build(BuildContext context) {
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
                  badgeContent: Text(_getTotalPrice().toString(),
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(onPressed: () {}, child: Text("order now"))
              ],
            ),
          ),
          ListView.builder(
            itemCount: _shoppingCart.length,
            itemBuilder: (context, index) {
              return ListTile();
            },
          )
        ],
      ),
    );
  }

  static addToCart(Product product) {
    var index =
        _shoppingCart.indexWhere((element) => element.product == product);

    if (index == -1) {
      _shoppingCart.add(ShoppingCartItem(product, 1));
    } else {
      var item = _shoppingCart.removeAt(index);
      _shoppingCart.add(ShoppingCartItem(product, item.count + 1));
    }
  }

  static removeFromCart(Product product) {
    var index =
        _shoppingCart.indexWhere((element) => element.product == product);

    if (index != -1) {
      var item = _shoppingCart.removeAt(index);
      _shoppingCart.add(ShoppingCartItem(product, item.count - 1));
    }
  }

  double _getTotalPrice() {
    if (_shoppingCart.isNotEmpty) {
      return _shoppingCart
          .map((e) => e.product.price * e.count)
          .reduce((value, element) => value += element);
    }
    return 0.0;
  }
}
