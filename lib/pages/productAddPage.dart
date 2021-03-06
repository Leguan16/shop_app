import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/domain/shoppingCartItem.dart';
import 'package:shop_app/providers/productManager.dart';
import 'package:shop_app/providers/shoppingCartManager.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({Key? key}) : super(key: key);

  static const route = "/product_manager/add";

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final _formKey = GlobalKey<FormState>();

  String title = "";
  String description = "";
  String imageURL = "";

  late double price;

  Product? product;

  @override
  Widget build(BuildContext context) {
    try {
      product = ModalRoute.of(context)!.settings.arguments as Product;
      //if(product != null) {
      imageURL = product!.imageUrl;
      //}
    } on Error {
      product = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        actions: [IconButton(onPressed: submit, icon: const Icon(Icons.save))],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: product == null ? "" : product?.name,
              validator: validateText,
              decoration: const InputDecoration(
                hintText: "Enter a title",
                labelText: "Title",
              ),
              onSaved: (newValue) => title = newValue!,
            ),
            TextFormField(
              initialValue: product == null ? "" : product?.price.toString(),
              validator: validatePrice,
              decoration: const InputDecoration(
                hintText: "Enter a price",
                labelText: "Price",
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              initialValue: product == null ? "" : product?.description,
              validator: validateText,
              decoration: const InputDecoration(
                hintText: "Enter a description",
                labelText: "Description",
              ),
              onSaved: (newValue) => description = newValue!,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: imageURL.isEmpty
                            ? const Text("enter img URL")
                            : Image.network(
                                imageURL,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Text("Invalid URL"),
                              )),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: product == null ? "" : product?.imageUrl,
                    validator: validateText,
                    onChanged: (value) => setState(() {
                      imageURL = value;
                    }),
                    decoration: const InputDecoration(
                      hintText: "Enter a image URL",
                      labelText: "Image URL",
                    ),
                    onSaved: (newValue) => imageURL = newValue!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  submit() {
    ProductManager productManager =
        Provider.of<ProductManager>(context, listen: false);

    ShoppingCartManager shoppingCartManager =
        Provider.of<ShoppingCartManager>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Product newProduct = Product(title, price, imageURL, description);

      productManager.addProduct(newProduct);

      if (product != null) {
        if (productManager.getProducts().contains(product)) {
          productManager.removeProduct(product!);
        }
        ShoppingCartItem? item =
            shoppingCartManager.removeAllFromCart(product!);

        if (item != null) {
          shoppingCartManager.addToCart(newProduct, count: item.count);
        }
      }

      Navigator.of(context).pop();
    }
  }

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    }

    return null;
  }

  String? validatePrice(String? value) {
    double? possiblePrice = double.tryParse(value!);

    if (possiblePrice == null) {
      return "invalid price";
    }

    price = possiblePrice;

    return null;
  }
}
