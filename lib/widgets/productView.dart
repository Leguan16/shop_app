import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/pages/shopPage.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';
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

    List<Product> valid = productManager.getProducts();

    final ShoppingCartManager shoppingCartManager =
        Provider.of<ShoppingCartManager>(context);

    if(ShopPage.favOnly) {
      valid = productManager.getProducts().where((element) => element.isFavorite == true).toList();
    }

    return GridView.builder(
      itemCount: valid.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {

        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ShopItem.route,
              arguments: valid[index]),
          child: GridTile(
            child: Image.network(
              valid[index].imageUrl,
            ),
            footer: Opacity(
              opacity: 0.75,
              child: GridTileBar(
                leading: valid[index].isFavorite
                    ? IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          setState(() {
                            productManager.setProductAsFavorite(
                                valid[index],
                                favorite: false);
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            productManager.setProductAsFavorite(
                                valid[index]);
                          });
                        },
                      ),
                backgroundColor: Colors.black,
                title: Text(
                  valid[index].name,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    shoppingCartManager
                        .addToCart(valid[index]);
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
