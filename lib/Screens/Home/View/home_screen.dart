import 'package:assignment_product_list/Screens/ProductDetails/View/product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Services/firebase_provider.dart';
import '../../../Utils/Helper/screen_utils.dart';
import '../../Model/product_details.dart';
import '../Widgets/suggestions_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ProductModel>>? _products;

  @override
  void initState() {
    super.initState();
    _products = FirebaseProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: ScreenUtils().screenWidth(context) * 0.2,
                    child: Image.asset('assets/images/splash_screen.png'),
                  ),
                  const Icon(Icons.logout),
                ],
              ),
              const Divider(
                thickness: 1.0,
              ),
              Expanded(
                child: FutureBuilder<List<ProductModel>>(
                  future: _products,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final product = snapshot.data![index];
                              return SuggestionsItem(
                                image_url: product.image_url,
                                title: product.title,
                                price: "Rs: ${product.price.toString()}",
                                description: product.description,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                        productModel: product,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
