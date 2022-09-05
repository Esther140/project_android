import 'package:flutter/material.dart';
import 'package:project/Login.dart';
import 'package:project/new/signup.dart';
class Auth_page extends StatefulWidget {
  const Auth_page({Key? key}) : super(key: key);

  @override
  State<Auth_page> createState() => _Auth_pageState();
}

class _Auth_pageState extends State<Auth_page> {
  bool showLogInPage =true;
  void toggleScreens(){
    setState(() {
      showLogInPage =!showLogInPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLogInPage){
     return Login(showRegisterPage:toggleScreens , );
   }else{
     return signUp(showLoginPage:toggleScreens ,);
   }
  }
}
