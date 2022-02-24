import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductManager _productManager = ProductManager();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _productManager.getProducts().length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridTile(
          child: Image.network(_productManager.getProducts()[index].imageUrl),
          footer: GridTileBar(
            leading: _productManager.getProducts()[index].isFavorite
                ? IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        _productManager.setProductAsFavorite(
                            _productManager.getProducts()[index],
                            favorite: false);
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        _productManager.setProductAsFavorite(
                            _productManager.getProducts()[index]);
                      });
                    },
                  ),
            backgroundColor: Colors.grey,
            title: Text(
              _productManager.getProducts()[index].name,
              style: TextStyle(color: Colors.green),
            ),
            subtitle: Text(
              _productManager.getProducts()[index].price.toString(),
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
      },
    );
  }
}
