import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/shoppingCartPage.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/widgets/shopItem.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

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
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ShopItem.route, arguments: productManager.getProducts()[index]),
          child: GridTile(
            child: Image.network(
              productManager.getProducts()[index].imageUrl,
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
                    ShoppingCart.addToCart(productManager.getProducts()[index]);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
