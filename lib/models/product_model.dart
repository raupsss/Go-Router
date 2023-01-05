class Product {
  final String name;
  final String category;
  final int quantity;

  Product(this.name, this.category, this.quantity);

  static List<Product> products = [
    Product("Milk", "Food", 10),
    Product("Rice", "Food", 5),
  ];
}
