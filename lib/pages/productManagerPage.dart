import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/productAddPage.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';
import 'package:shop_app/widgets/productManagerListTile.dart';

class ProductManagerPage extends StatelessWidget {
  const ProductManagerPage({Key? key}) : super(key: key);

  static const String route = '/product_manager';

  @override
  Widget build(BuildContext context) {
    ProductManager productManager = Provider.of<ProductManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProductAddPage.route/*, arguments: Product("", 0, "", "")*/);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: ShopDrawer(),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: productManager.getProducts().length,
        itemBuilder: (context, index) {
          return ProductManagerListTile(productManager.getProducts()[index]);
        },
      ),
    );
  }
}
