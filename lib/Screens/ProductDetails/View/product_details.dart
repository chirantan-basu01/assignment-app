import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://www.dominos.co.in/files/items/Mexican_Green_Wave.jpg',
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'DOUBLE CHEESE MARGHERITA',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Price: Rs 100',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'This is a long description of the pizza. '
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Pellentesque elementum, purus vel tincidunt dignissim, metus odio condimentum nulla, '
                'sit amet efficitur sem nibh nec libero. Quisque non est ac neque egestas venenatis. '
                'Curabitur et dolor vitae nunc facilisis vehicula. Fusce tincidunt ligula in libero '
                'volutpat, a vestibulum orci venenatis. Suspendisse potenti. Proin at suscipit libero. '
                'Sed efficitur vestibulum velit, a tincidunt nulla dictum id. Suspendisse potenti. '
                'Aliquam erat volutpat. Nulla facilisi. In hac habitasse platea dictumst. Sed et lacinia '
                'nunc. Donec vestibulum dolor a malesuada tempor. Curabitur id magna sit amet lacus '
                'facilisis mollis. Vivamus tempor vehicula urna, et volutpat dolor vestibulum a.'
                'This is a long description of the pizza. '
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Pellentesque elementum, purus vel tincidunt dignissim, metus odio condimentum nulla, '
                'sit amet efficitur sem nibh nec libero. Quisque non est ac neque egestas venenatis. '
                'Curabitur et dolor vitae nunc facilisis vehicula. Fusce tincidunt ligula in libero '
                'volutpat, a vestibulum orci venenatis. Suspendisse potenti. Proin at suscipit libero. '
                'Sed efficitur vestibulum velit, a tincidunt nulla dictum id. Suspendisse potenti. '
                'Aliquam erat volutpat. Nulla facilisi. In hac habitasse platea dictumst. Sed et lacinia '
                'nunc. Donec vestibulum dolor a malesuada tempor. Curabitur id magna sit amet lacus ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
