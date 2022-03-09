import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/order.dart';
import 'package:shop_app/providers/orderManager.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  static const route = "/cart";

  @override
  Widget build(BuildContext context) {
    final ShoppingCartManager shoppingCartManager =
        Provider.of<ShoppingCartManager>(context);

    final OrderManager orderManager = Provider.of<OrderManager>(context);

    final shoppingCart = shoppingCartManager.getItems();

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
                Text("Total", style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 150,
                ),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  badgeContent: Text( "€" +
                      shoppingCartManager.getTotalPrice().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
                TextButton(
                    onPressed: () {
                      if (shoppingCart.isNotEmpty) {
                        orderManager
                            .addOrder(Order(DateTime.now(), shoppingCart));
                        shoppingCartManager.clear();
                      }
                    },
                    child: Text("ORDER NOW", style: TextStyle(fontSize: 15)))
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: shoppingCartManager.getItems().length,
            itemBuilder: (context, index) {
              return Dismissible(
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Remove item?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("No"),
                          ),
                          TextButton(onPressed: () {
                            shoppingCartManager
                                .removeAllFromCart(shoppingCart[index].product);
                            Navigator.of(context).pop(true);
                          }, child: Text("Yes"),),
                        ],
                      );
                    },
                  );
                },
                key: UniqueKey(),
                child: ListTile(
                  title: Text(shoppingCart[index].product.name),
                  subtitle: Text("€" +
                      (shoppingCart[index].product.price *
                              shoppingCart[index].count)
                          .toString()),
                  leading: CircleAvatar(
                    child: Text(
                      "€" + shoppingCart[index].product.price.toString(),
                      style: TextStyle(fontSize: 15),
                      maxLines: 1,
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                },
                background: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        size: 50,
                      ),
                    ],
                  ),
                  color: Colors.red,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
