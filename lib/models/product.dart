class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String image;
  final String description;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    this.isFavorite = false,
  });
}