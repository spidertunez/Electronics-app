class ProductModel {
  final double? id;
  final double? price;
  final String description;
  final String image;

  ProductModel({
    required this.id,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json["id"] as num?)?.toDouble(),
      price: (json["price"] as num?)?.toDouble(),
      description: json["description"] ?? '',
      image: json["image"] ?? '',
    );
  }
}
