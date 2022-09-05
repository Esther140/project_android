import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:project/Example/food.dart';
import '../Login.dart';
import 'package:http/http.dart' as http;


class listorder extends StatefulWidget {
  @override
  _listorderState createState() => _listorderState();
}

class _listorderState extends State<listorder> {
  final fb = FirebaseDatabase.instance;
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  var l;
  var g;
  var k;
  List<String> selectedList = [];
  List<bool> checkedBoxValues = [
    false, false, false, false, false, false,false,
    false, false, false, false, false, false,false,
    false, false, false, false, false, false, false,
  ];


  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('Menu');

    return Scaffold(
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.indigo[900],
        onPressed: () {
           ;
        },
        child: const Text('submit')
      ),
      appBar: AppBar(
        title: const Text(
          'Menu',
          style:  TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
        // actions: [
        //   IconButton(
        //       onPressed: (){Navigator.pushReplacement(
        //         context, MaterialPageRoute(builder: (_) =>  Login(),),
        //       );
        //       },
        //       icon: const Icon(Icons.logout)
        //   )],

      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          var v =
          snapshot.value.toString(); // {subtitle: webfun, title: subscribe}

          g = v.replaceAll(
              RegExp("{|}|subtitle: |title: "), ""); // webfun, subscribe
          g.trim();

          l = g.split(','); // [webfun,  subscribe}]

          return GestureDetector(
            onTap: () {
              setState(() {
                k = snapshot.key;
              });
            },
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      value: checkedBoxValues[index],
                      onChanged: (value) {

                        setState(() =>
                        checkedBoxValues[index] = value!);
                        if(!selectedList.contains(l[index])){
                          selectedList.add(l[index]);
                        }else{
                          selectedList.remove(l[index]);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.indigo[100],
                      title: Text(
                        l[1],
                        // 'dd',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        l[0],
                        // 'dd',

                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),),
                ElevatedButton(onPressed: () {Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Orderfood()));}, child: Text("Make order"))
              ],
            )
            ,


          );
        },
      ),
    );
  }}
