import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/new/aut_page.dart';
import '../Example/home.dart';

class MagePage extends StatelessWidget {
  const MagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return  Home();
          }else {
            return Auth_page();
          }
          },
      ),
    );
  }
}
