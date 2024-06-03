import 'package:assignment_product_list/Screens/ProductDetails/View/product_details.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Helper/screen_utils.dart';
import '../Widgets/suggestions_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtils().screenWidth(context) * 0.2,
                child: Image.asset('assets/images/splash_screen.png'),
              ),
              const Divider(
                thickness: 1.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return SuggestionsItem(
                      image:
                          "https://www.dominos.co.in/files/items/Margherit.jpg",
                      title: "MARGHERITA",
                      price: "Rs 100",
                      description:
                          "A hugely popular margherita, with a deliciously tangy single cheese topping",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetails(),
                          ),
                        );
                      },
                    );
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
