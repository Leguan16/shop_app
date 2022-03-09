import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/providers/productManager.dart';

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
        title: Text("Edit Product"),
        actions: [IconButton(onPressed: submit, icon: Icon(Icons.save))],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: product == null ? "" : product?.name,
              validator: validateText,
              decoration: InputDecoration(
                hintText: "Enter a title",
                labelText: "Title",
              ),
              onSaved: (newValue) => title = newValue!,
            ),
            TextFormField(
              initialValue: product == null ? "" : product?.price.toString(),
              validator: validatePrice,
              decoration: InputDecoration(
                hintText: "Enter a price",
                labelText: "Price",
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              initialValue: product == null ? "" : product?.description,
              validator: validateText,
              decoration: InputDecoration(
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
                            ? Text("enter img URL")
                            : Image.network(
                                imageURL,
                                errorBuilder: (context, error, stackTrace) =>
                                    Text("Invalid URL"),
                              )),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: product == null ? "" : product?.imageUrl,
                    validator: validateText,
                    onChanged: (value) => setState(() {
                      imageURL = value;
                    }),
                    decoration: InputDecoration(
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
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (productManager.getProducts().contains(product)) {
        productManager.removeProduct(product!);
      }

      productManager.addProduct(Product(title, price, imageURL, description));
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
