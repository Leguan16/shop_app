class Product {
  String name;
  double price;
  String imageUrl;
  bool isFavorite = false;

  Product(this.name, this.price, this.imageUrl);

  setFavorite(bool favorite) {
    isFavorite = favorite;
  }
}