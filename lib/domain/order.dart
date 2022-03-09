import 'package:shop_app/domain/shoppingCartItem.dart';

class Order {
  DateTime date;
  List<ShoppingCartItem> items;

  Order(this.date, this.items);
}