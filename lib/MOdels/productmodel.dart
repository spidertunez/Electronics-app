class ProductModel {
  int id;
  int price;
  String description;
  String image;

  ProductModel(
      {required this.id,
      required this.price,
      required this.description,
      required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json["id"]),
      price: int.parse(json["price"]),
      description: json["description"],
      image: json["image"],
    );
  }
//
}

