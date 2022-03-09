import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/pages/productAddPage.dart';
import 'package:shop_app/providers/productManager.dart';

class ProductManagerListTile extends StatelessWidget {
  Product product;

  ProductManagerListTile(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductManager productManager = Provider.of<ProductManager>(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {Navigator.of(context).pushNamed(ProductAddPage.route, arguments: product);},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              productManager.removeProduct(product);
            },
          ),
        ],
      ),
    );
  }
}
