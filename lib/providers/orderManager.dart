import 'package:flutter/cupertino.dart';
import 'package:shop_app/domain/order.dart';

class OrderManager with ChangeNotifier {
  final List<Order> _orders = [];

  void addOrder(Order order) {
    _orders.add(order);

    notifyListeners();
  }

  List<Order> getItems() {
    return [..._orders];
  }

}