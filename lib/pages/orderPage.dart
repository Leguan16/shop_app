import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orderManager.dart';
import 'package:shop_app/widgets/ShopDrawer.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const route = '/orders';

  @override
  Widget build(BuildContext context) {
    final OrderManager orderManager = Provider.of<OrderManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: ShopDrawer(),
      body: ListView.builder(
        itemCount: orderManager.getOrders().length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text("€" + orderManager.getOrders()[index].getTotalPrice().toString()),
            subtitle: Text(DateFormat.yMd().add_jms().format(orderManager.getOrders()[index].date)),

            children: orderManager.getOrders()[index].getItemsAsList(),
          );
        },
      ),
    );
  }
}
