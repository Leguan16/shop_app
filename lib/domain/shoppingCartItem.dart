import 'package:shop_app/domain/product.dart';

class ShoppingCartItem {
  Product product;
  int count;

  ShoppingCartItem(this.product, this.count);
}