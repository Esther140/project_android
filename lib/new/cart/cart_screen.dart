import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/new/cart/Product.dart';
import 'package:project/new/cart/cartcontroller.dart';

import 'catalogproducts.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body: CartProducts(),
      ),
    );
  }
}
class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
   CartProducts({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context,int index){
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                index: index,

              );
            }),
      ),
    );
  }
}
class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int index;
  const CartProductCard({
    Key? key, required this.controller, required this.product, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.title),
        Text(product.subtile),
        IconButton(onPressed: (){
          controller.removeProduct(product);
        }, icon: Icon(Icons.delete),)
      ],

    );

  }
}
