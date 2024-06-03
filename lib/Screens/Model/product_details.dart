class ProductModel {
  final String id;
  final String image_url;
  final String title;
  final dynamic price;
  final String description;

  ProductModel({
    required this.id,
    required this.image_url,
    required this.title,
    required this.price,
    required this.description,
  });

  // Optionally, you can add a factory method to create a ProductDetails object from a JSON map
  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      image_url: json['image_url'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
    );
  }

// Optionally, you can add a method to convert a ProductDetails object to a JSON map
// Map<String, dynamic> toJson() {
//   return {
//     'image_url': image_url,
//     'title': title,
//     'price': price,
//     'description': description,
//   };
// }
}
