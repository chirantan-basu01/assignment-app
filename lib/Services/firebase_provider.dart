import 'package:cloud_firestore/cloud_firestore.dart';
import '../Screens/Model/product_details.dart';

class FirebaseProvider {
  static Future<List<ProductModel>> getProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('product_details').get();

    List<Future<ProductModel>> futures = snapshot.docs.map((doc) async {
      return ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();

    return await Future.wait(futures);
  }
}
