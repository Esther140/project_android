import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_screen.dart';
import 'catalogproducts.dart';
class CataloScreen extends StatelessWidget {
  const CataloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("catalog"),),
      body:  CatalogProducts(),
        


floatingActionButton: FloatingActionButton(  onPressed: ()=>Get.to(()=> CartScreen()), child: Text(" cart")),
    );
  }
}
