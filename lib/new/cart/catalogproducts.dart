import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/new/cart/cartcontroller.dart';
import 'package:project/new/cart/productcontroller.dart';

import 'Product.dart';
class CatalogProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
 CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context,int index){
        return CatalogProductcards(index: index,);
      }),
    );
  }
}
class CatalogProductcards extends StatelessWidget {
  final cartcontroller = Get.put(CartController());
  final ProductController  productController  = Get.find();
  final int index;
   CatalogProductcards({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Row(children:[
             Expanded(child: Text(productController.products[index].title)),
              Expanded(child: Text(productController.products[index].subtile),),
              IconButton(onPressed: (){
                cartcontroller.addProduct(productController.products[index]);
              }, icon: const Icon(Icons.add_circle_outline),)
            ],
        ),
      ),
    );
  }
}
