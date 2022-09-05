import 'package:get/get.dart';
import 'package:project/new/cart/firebase_db.dart';

import 'Product.dart';
class ProductController extends GetxController{

  final products = <Product>[].obs;
  @override
  void onInit(){
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}