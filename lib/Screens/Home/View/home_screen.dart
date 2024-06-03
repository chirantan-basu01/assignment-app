import 'package:assignment_product_list/Screens/ProductDetails/View/product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Helper/screen_utils.dart';
import '../../Model/product_details.dart';
import '../Widgets/suggestions_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> _productsFuture;

  Future<List<ProductModel>> fetchProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();

    return snapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
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
                // child: ListView.builder(
                //   itemCount: 8,
                //   itemBuilder: (context, index) {
                //     return SuggestionsItem(
                //       image:
                //           "https://www.dominos.co.in/files/items/Margherit.jpg",
                //       title: "MARGHERITA",
                //       price: "Rs 100",
                //       description:
                //           "A hugely popular margherita, with a deliciously tangy single cheese topping",
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const ProductDetails(),
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ),

                child: FutureBuilder<List<ProductModel>>(
                  future: _productsFuture,
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
                                price: product.price,
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
