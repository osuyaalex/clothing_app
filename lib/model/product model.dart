class Product{
  String name;
  String imageUrl;
  int quantity;
  dynamic price;
  String selectedIcon;
  Product(this.name, this.imageUrl, this.quantity, this.price, this.selectedIcon);

  void increase(){
    quantity++;
  }
  void decrease(){
    quantity--;

  }
}