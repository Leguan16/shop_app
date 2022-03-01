import 'package:flutter/material.dart';

class ProductAddPage extends StatelessWidget {
  ProductAddPage({Key? key}) : super(key: key);

  static const route = "/product_manager/add";

  final _formKey = GlobalKey<FormState>();
  final imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter a title",
                labelText: "Title",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter a price",
                labelText: "Price",
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
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
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Text("enter img url"),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter a description",
                      labelText: "Description",
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
}
