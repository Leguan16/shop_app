import 'package:flutter/material.dart';
import 'package:shop_app/domain/product.dart';

class ProductManagerListTile extends StatelessWidget {
  Product product;

  ProductManagerListTile(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.imageUrl),
      title: Text(product.name),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          Icon(Icons.edit),
          Icon(Icons.delete),
        ],
      ),
    );
  }
}
