import 'package:flutter/material.dart';
import 'package:shop_app/domain/shoppingCartItem.dart';

class Order {
  DateTime date;
  List<ShoppingCartItem> items;

  Order(this.date, this.items);

  double getTotalPrice() {
    if (items.isNotEmpty) {
      return items
          .map((e) => e.product.price * e.count)
          .reduce((value, element) => value += element);
    }
    return 0.0;
  }

  List<Widget> getItemsAsList() {
    List<Widget> list = [];

    for (ShoppingCartItem item in items) {
      list.add(ListTile(
        title: Text(item.product.name),
        trailing: Text(item.count.toString() + " x €" + item.product.price.toString()),
      ));
    }


    return list;
  }
}