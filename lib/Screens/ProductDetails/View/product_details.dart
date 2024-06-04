import 'package:flutter/material.dart';

import '../../Model/product_details.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                productModel.image_url,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Text(
                productModel.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Text(
                    "Rs: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    productModel.price.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),
              Text(productModel.description),
            ],
          ),
        ),
      ),
    );
  }
}
