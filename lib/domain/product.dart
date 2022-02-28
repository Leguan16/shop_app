class Product {
  String name;
  double price;
  String imageUrl;
  String description;
  final String path;
  bool isFavorite = false;


  Product(
      this.name, this.price, this.imageUrl, this.description, this.path);
}