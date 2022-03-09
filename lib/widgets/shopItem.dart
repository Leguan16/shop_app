import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  static const route = "/shopItem";

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: Column(
          children: [
            Image.network(product.imageUrl),
            SizedBox(
              height: 10,
            ),
            Text(
              "€" + product.price.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ));
  }
}
