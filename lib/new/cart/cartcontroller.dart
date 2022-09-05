import 'package:get/get.dart';

import 'Product.dart';
class CartController extends GetxController{
var _products ={}.obs;
void addProduct (Product product) {
  if (_products.containsKey(product)) {
    _products[product] += 1;
  } else {
    _products[product] = 1;
  }
  Get.snackbar(
    "Product added",
    "You ave added ${product.title+product.subtile} to cart",
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 2),

  );
}
void removeProduct(Product product){
  if(_products.containsKey(product)&&_products[product]==1){
    _products.remove((key, value) => key==product);

  }
}
get products => _products;
}