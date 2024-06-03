class ProductDetails {
  final String imageUrl;
  final String title;
  final double price;
  final String description;

  ProductDetails({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  // Optionally, you can add a factory method to create a ProductDetails object from a JSON map
  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      imageUrl: json['imageUrl'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
    );
  }

  // Optionally, you can add a method to convert a ProductDetails object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'description': description,
    };
  }


}
