import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/productManager.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {


  @override
  Widget build(BuildContext context) {
    final ProductManager productManager = Provider.of<ProductManager>(context);
    return GridView.builder(
      itemCount: productManager.getProducts().length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridTile(
          child: GestureDetector(
            child: Image.network(
              productManager.getProducts()[index].imageUrl,
            ),
            //TODO make that working
            //onTap: () {() => Navigator.of(context).pushNamed(_productManager.getProducts()[index].path)},
            onTap: () {},
          ),
          footer: Opacity(
            opacity: 0.75,
            child: GridTileBar(
              leading: productManager.getProducts()[index].isFavorite
                  ? IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        setState(() {
                          productManager.setProductAsFavorite(
                              productManager.getProducts()[index],
                              favorite: false);
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(() {
                          productManager.setProductAsFavorite(
                              productManager.getProducts()[index]);
                        });
                      },
                    ),
              backgroundColor: Colors.black,
              title: Text(
                productManager.getProducts()[index].name,
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  //todo add to shopping cart
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
