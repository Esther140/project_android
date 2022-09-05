import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String title;
  final String subtile;

  const Product({required this.title, required this. subtile});
  // static const List<Product> products=[
  //   Product(title:'BAnku', subtile:'STEW'),
  //   Product(title:'BAnku', subtile:'STEW')
  // ];
static Product fromSnapshot(DocumentSnapshot snap) {
  Product product = Product(
      title: snap['title'], subtile: snap['subtitle']);

  return product;
}}