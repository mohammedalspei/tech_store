class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final double? originalPrice;
  final String image;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.category,
    this.isFavorite = false,
  });
}