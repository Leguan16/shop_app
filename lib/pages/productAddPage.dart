import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/providers/productManager.dart';

class ProductAddPage extends StatefulWidget {
  ProductAddPage({Key? key}) : super(key: key);

  static const route = "/product_manager/add";

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final _formKey = GlobalKey<FormState>();

  final imageUrlController = TextEditingController();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  late double price;

  @override
  Widget build(BuildContext context) {
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
              validator: validateText,
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter a title",
                labelText: "Title",
              ),
            ),
            TextFormField(
              controller: priceController,
              validator: validatePrice,
              decoration: InputDecoration(
                hintText: "Enter a price",
                labelText: "Price",
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: descriptionController,
              validator: validateText,
              decoration: InputDecoration(
                hintText: "Enter a description",
                labelText: "Description",
              ),
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
                        child: imageUrlController.text.isEmpty
                            ? Text("enter img URL")
                            : Image.network(
                                imageUrlController.text,
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
                    validator: validateText,
                    controller: imageUrlController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: "Enter a image URL",
                      labelText: "Image URL",
                    ),
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
    if (_formKey.currentState!.validate()) {
      Provider.of<ProductManager>(context, listen: false).addProduct(Product(
          titleController.text,
          price,
          imageUrlController.text,
          descriptionController.text));
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
